---
layout: default
title: "HP Helion OpenStack&#174;: DNSaaS Beta Installation and Configuration"
permalink: /helion/openstack/install-beta/dnsaas/
product: commercial

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/install-beta/ovsvapp/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/related-links/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&#174;: DNSaaS Beta Installation and Configuration
This page explains how to install and configure DNS as a service (DNSaaS) for HP Helion OpenStack beta. It is important to read through this page before starting your installation.  No matter which hypervisor you use, our managed DNS service, based on the Openstack Designate project, is engineered to help you create, publish, and manage your DNS zones and records securely and efficiently to either a public or private DNS server network.


**IMPORTANT**: 
Installing HP Helion OpenStack DNSaaS is **optional**. Before you attempt the DNSaaS installation, you *must* have already [installed HP Helion Openstack beta](/helion/openstack/install-beta/) and verified that it is configured correctly and operational. After you have verified your HP Helion OpenStack beta installation, download the DNSaaS installer image from the [HP Helion OpenStack product installation](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221247%22%7D/Show) web site. 

The rest of this page explains the installation and configuration process for DNSaaS. 

* [Prerequisites](#prerequisites)
* [Installing DNS as a Service](#installing-dns-as-a-service)
   * [Extracting the DNSaaS tarball and uploading the image to glance](#extract)
   * [Creating the DNSaaS configuration file](#config)
   * [Installing and configuring DNSaaS](#installing-and-configuring-dnsaas)
   * [Registering the service with Keystone](#registering-the-service-with-keystone)
* [Configuring the DNS service](#configuring-the-dns-service)
* [For more information](#for-more-information)

##Prerequisites
Before you install the HP Helion Openstack DNSaaS, you must modify the /etc/heat/heat.conf file on the overcloud controller as follows.

**Important**: The installation of the HP Helion OpenStack DNSaaS fails if you do not make these modifications.

1. Make sure the IP address in the following settings reflects the IP address of the overcloud controller, for example:
    
        heat_metadata_server_url = http://192.0.202.2:8000
        heat_waitcondition_server_url = http://192.0.202.2:8000/v1/waitcondition
        heat_watch_server_url = http://192.0.202.2:8003

    **Note**: You must have admin ssh access to the overcloud controller.
2. Save the file.
3. Restart the Heat-related services &ndash; heat-api, heat-api-cfn, heat-api-cloudwatch, and heat-engine.
4. Ensure there are no Heat resources in an Error state, and then delete any stale or corrupted Heat-related stacks.


After you have modified the `/etc/heat/heat.conf` file and before you start the installation process, ensure that you have:

* Obtained the following cloud admin Keystone credentials ("Admin Credentials"):
    * Username
    * Password
    * Tenant/project name
    * An SSH key installed in Nova
    * Networking in this tenant should be pre-configured
* Obtained credentials of the user+tenant where the service is to be deployed ("Target Credentials"):
    * This user should have the "admin" and "_member_" (or member) roles. (The "admin" role should not be required, but, for whatever reason, HP Helion OpenStack Heat fails to delete the users it creates without this.)
    * Username
    * Password
    * Tenant/project name
    * Minimum acceptable quotas:
      * 15 instances
      * 30 VCPUs
      * 61440 MB RAM
      * 600 GB disk
      * 15 floating IPs
* Obtained credentials for the user+tenant used to validate end user tokens ("Service Credentials"):
    * This user should be in the "service" tenant, and have the "admin" and "_member_" (or member) roles, and be called "designate"
    * Username
    * Password
    * Tenant/project name
* A generated SSH key for accessing the service VMs
* A Neutron external network ID
* A chosen backend driver and its prerequisites:
    * PowerDNS (self-hosted)
      * A domain name for the nameservers ("Nameserver FQDNs")
      * For example, if your nameservers are to be ns1.mycompany.com., you will need the "mycompany.com." domain.
    * DynECT (3rd party)
      * An active service contract with DynECT
      * Knowledge of the FQDNs for all DynECT nameservers allocated to your account ("Nameserver FQDNs")
      * API credentials for DynEXT
         * Customer name
         * Username
         * Password

##Installing DNS as a Service

**IMPORTANT** 

Before proceeding with the install, validate that you have met all prerequisites, which include:

* Gathering the required information
* Creating the necessary users/projects
* Ensuring the users/projects have the appropriate roles
* Ensuring the projects have sufficient quota allocations

Failure to meet these prerequisites results in a failed install.

###Extracting the DNSaaS tarball and uploading the image to glance {#extract}

1. On the HP Helion OpenStack installer system, extract the DNSaaS tarball using the following command:

        $ tar xfz dnsaas-installer_0.0.4b11.tar.gz

2. Upload the DNSaaS installer image to Glance using Admin Credentials:

        $ glance image-create --human-readable --progress --is-public False --disk-format qcow2 --container-format bare --name "dnsaas-installer_0.0.4b11" --file dnsaas-installer_0.0.4b11/dnsaas-installer_0.0.4b11.qcow2

3. Boot the installer VM with the following command:

    **Note:** If you have multiple networks available in the tenant where the installer is being booted, you must tell `nova` which network to use with "--nic net-id=<NETWORK UUID>"

        $ nova boot --poll --flavor m1.small --image dnsaas-installer_0.0.4b11 --key-name <admin ssh key name> dnsaas-installer

    If successful, you will see the following:

        Instance building... 100% complete
        Finished

4. Create a floating IP and attach it to the installer VM using the following commands:

        $ nova floating-ip-create <pool name>
        $ nova add-floating-ip dnsaas-installer <ip address>

5. If not already enabled, allow SSH connectivity to the installer VM:

        $ nova secgroup-add-rule default tcp 22 22 0.0.0.0/0

6. Verify SSH connectivity to the installer VM:

        $ ssh hlinux@<ip address>

###Creating the DNSaaS configuration file {#config}
Before you begin the installation, you must create a configuration file. You can do this by modifying the sample configuration file included with the DNSaaS installer files.

1. Copy the sample configuration file to your home directory:

        $ cp /etc/dnsaas-installer/dnsaas-installer.conf.sample ~/dnsaas-installer.conf

2. Edit your copy of the configuration file with the required changes:
 
        $ nano dnsaas-installer.conf


    A. DEFAULT section:
    * auth_url &mdash; Keystone auth URL
    * admin_project_name &mdash; Admin project name
    * admin_username &mdash; Admin Username
    * target_project_name &mdash; Project name where the service is installed
    * target_username &mdash; Username used to deploy and run the service
    * target_region_name &mdash; Region name to deploy the service in
    
    B. designate section:
    * ssh_public_key &mdash; The SSH public key to be installed on the instances for management access
    * ntp_server &mdash; An IP or DNS name for an NTP server to sync time with
    * ext_net_id &mdash; The Neutron external network ID
    * database_root_password &mdash; Password for the database root user
    * database_designate_password &mdash; Password for the database designate user
    * database_powerdns_password &mdash; Password for the database powerdns user
    * messaging_root_password &mdash; Password for the messaging root user
    * messaging_designate_password &mdash; Password for the messaging designate user
    * keystone_host &mdash; Hostname or IP address of Keystone endpoint.
    * service_project &mdash; Project name for a user with permission to validate Keystone tokens
    * service_user &mdash; Username for a user with permission to validate Keystone tokens
    * service_password &mdash; Password for a user with permission to validate Keystone tokens
    * backend_driver &mdash; Backend driver to use (powerdns, dynect)

    C. If you select DynECT you also must set the following options in the designate section:
    * dynext_customer_name &mdash; Customer name provided by Dyn
    * dynext_username &mdash; Username provided by Dyn
    * dynext_password &mdash; Password provided by Dyn

3. Ensure your configuration file is correct by running the installer validation command:

        $ dnsaas-installer --admin-password <Admin User Password> --target-password <Target User Password> validate

###Installing and configuring DNSaaS
1. After you validate the configuration file, run the DNSaaS installer:

        $ dnsaas-installer --admin-password <Admin User Password> --target-password <Target User Password> install


2. Once the installation in finished, verify that the API and Nameservers are online using the endpoints supplied by the installer. From the installer VM, execute the following commands:

        $ curl http://<API ENDPOINT>:9001/
          {
            "versions": [
              {
                "id": "v1",
                "status": "CURRENT"
              }
            ]
          }
 
        $ dig @<NAMESERVER ENDPOINT> example.com | grep status
          ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 37351

#### Registering the service with Keystone
You do not have to immediately register the DNS service in Keystone; however, if you choose to execute the following command to register the DNS service and endpoint:

    $ dnsaas-installer --admin-password <Admin User Password> --target-password <Target User Password> keystone-registration

####Configuring the DNS service
You must perform an initial configuration step to communicate the names of the servers that serve DNS to Designate. Please ensure you have a valid set of admin credentials in the standard `OS_*` environment variables before proceeding.

For the "Nameserver FQDNs" gathered during the prerequisites step, issue a `server-create` command for each name to add the server:


    $ designate server-create --name ns1.example.com.

##For more information
For more information, see:

* [HP Helion Public Cloud DNS API Specifications](https://docs.hpcloud.com/api/dns/)
* [Designate DNSaaS services for OpenStack cloud](https://wiki.openstack.org/wiki/Designate)

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

