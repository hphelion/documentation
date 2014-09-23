---
layout: default
title: "HP Helion OpenStack&#174;: DNSaaS Installation and Configuration"
permalink: /helion/openstack/ga/install/dnsaas/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/install/ovsvapp/">&#9664; PREV</a> | <a href="/helion/openstack/install-overview/">&#9650; UP</a> | <a href="/helion/openstack/related-links/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&#174;: DNSaaS Installation and Configuration


This page explains how to install and configure DNS as a service (DNSaaS) for HP Helion OpenStack. It is important to read through this page before starting your installation. Our managed DNS service, based on the OpenStack Designate project, is engineered to help you create, publish, and manage your DNS zones and records securely and efficiently to either a public or private DNS server network. This service can supports any hypervisor.


- [Prerequisites](#preq)
- [Creating Prerequisite Credentials](#credentials)
- [Sherpa CSU "Publication" and Booting the Installer VM](#publication)
- [Installing and configuring DNSaaS](#configure")
- [Configure the Overcloud Load Balancer for DNSaaS](#configovercloud)
- [Registering the service with Keystone](#keyreg)
- [More information](#moreinfo)

##Prerequisites<a name="preq"></a>

* HP Helion OpenStack Installation
* DNSaaS Installer Image - See DNSaaS Cloud OS Releases
* Credentials of the user+tenant where the service is to be deployed ("Target Credentials"):
	* This user should have the "admin" and "_member_" (or member) roles.
		* (The "admin" role should not be required, but, for whatever reason, Helion OpenStack Heat will fail to delete the users it creates if this role is not created)

	* Username
	* Password
	* Tenant/Project Name

* Credentials for the user+tenant used to validate end user tokens ("Service Credentials"):•This user should be in the "service" tenant, and have the "admin" and "_member_" (or member) roles, and be called "designate"
	* Username
	* Password
	* Tenant/Project Name
* A generated SSH Key for accessing the Service VMs
* A chosen backend driver:
* PowerDNS (self hosted) 
    
	A domain name for the nameservers ("Namsever FQDNs"). For example, if your nameservers are to be ns1.mycompany.com., you will need the "mycompany.com." domain.

* Microsoft DNS (self hosted)
	* At least one Microsoft DNS server installed and configured
	* Knowledge of the FQDNs for all MS DNS servers to be used ("Namsever FQDNs")

* DynECT (3rd Party)

	* An active service contract with DynECT
	* Knowledge of the FQDNs for all DynECT nameservers allocated to your account ("Namsever FQDNs")
		* For the "helion-qa" Dynect account:•ns1.p13.dynect.net.
			* ns2.p13.dynect.net.
			* ns3.p13.dynect.net.
			* ns4.p13.dynect.net.
	* API credentials for DynEXT
		* Customer Name
		* Username
		* Password

* Akamai (3rd Party)

	* An active service contract with Akamai
	* Knowledge of the FQDNs for all Akamai nameservers allocated to your account ("Namsever FQDNs")
	* API credentials for Akamai•Username
	* Password

<!--
## Uploading script to Sherpa (do we need to upload the DNaaS script to sherpa) ??
-->
## Creating Prerequisite Credentials <a name="credentials"></a>

You must create Target and Service credentials.

For Target credentials, you should create tenant and username.


* Create tenant
		
		$ keystone tenant-create --name dnsaas --description "DNSaaS Service" 

* Create username

		$ keystone user-create --name dnsaas --tenant dnsaas --email dnsaas@example.com --pass password

* Add role (this role is added for user)

		$ keystone user-role-add --user dnsaas --tenant dnsaas --role admin

Once Target credentials are successfully created you can create service credentials.

* Create Service credentials

		$ keystone user-create --name designate --tenant service --email designate@example.com --pass password

 
## Sherpa CSU "Publication" and Booting the Installer VM<a name="publication"></a>

Before proceeding with the install ensure that you have met all the prerequisites: gathering the required information, creating the necessary users/projects and ensuring the users/projects have the appropriate roles. Failure to do so will result in an unsuccessful installation.

###Publish CSU contents

1. Login to the Overcloud's Horzon using **Target Credentials**. 
2. Click **Admin** Tab in the left panel.<br> The tab displays an option in the left panel.
3. Click **Other** and then select **Updates and Extensions** to open the Updates and Extensions page.
3. Select the appropriate build from the list  and click **Install**. Install dialog box is displayed.
4.Click **Install**. It will take several minutes for the status of the Build to proceed from Installing to Installed.


###Boot the installer VM

1. Login to OverCloud Horizon using **Target Credentials**.
2. Click **Project** and then select Compute to  open the Images page.
3. Select the image file from the list and click **Launch**. For example: select  **dnsaas-installer_0.1.0b12** to launch this image.

	a. Set the instance name to **dnsaas-installer**, or similar.

	b.Set the instance flavor to **m1.small**
	
	c.Select an appropriate SSH keypair
	
	d.Select the **default-net** network, if not automatically populated.

	e.Click **Launch** to launch the VM

4. Find the just-launched VM in the list, click "Associate Floating IP"
	
    a. Select/Create a Floating IP. Ensure that you remember the IP.
	
	b. Click **Associate**.

5. Click **Project** and then select Compute to  open the Images page.
6. Navigate to "Project" -> "Compute" -> "Access and Security"
6. Find the "default" security group, click "Manage Rules"

	a. Click "Add Rule"

	b. Set the port to "22"

	c.Optionally, restrict the CIDR from which SSH connections should be allowed.

	d.Click "Add

##Installing and configuring DNSaaS<a name="configure"></a>

1. SSH to install VM

		$ ssh debian@<Floating IP Address associated with the Installer VM above>

Note: Before you begin the installation, you must create a configuration file. You can do this by modifying the sample configuration file included with the DNSaaS installer files.
 
2. Copy the sample configuration file to your home directory:

        $ cp /etc/dnsaas-installer/dnsaas-installer.conf.sample ~/dnsaas-installer.conf

2. Edit your copy of the configuration file with the required changes:
 
        $ nano dnsaas-installer.conf
		
	 A. DEFAULT section:
    * auth_url &mdash; Keystone auth URL
    * target_project_name &mdash; Project name where the service is installed
    * target_username &mdash; Username used to deploy and run the service
    * target_region_name &mdash; Region name to deploy the service in
    
    B. Designate section:
    * ssh_public_key &mdash; The SSH public key to be installed on the instances for management access
    * ntp_server &mdash; An IP or DNS name for an NTP server to sync time with
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

   	C. If you select MSDNS (Microsoft DNS Server) you will also need to set the following options in the designate section:

	* msdns_servers: A comma separated list of the Microsoft DNS servers short hostnames
	* messaging_access_cidr: A CIDR to allow inbound access from the Microsoft DNS servers


	D. If you select DynECT you must set the following options in the designate section:
    * dynext_customer_name &mdash; Customer name provided by Dyn
    * dynext_username &mdash; Username provided by Dyn
    * dynext_password &mdash; Password provided by Dyn


	E. If you select Akamai you must set the following options:
	* designate Section:•dynext_customer_name: Customer name provided by Dyn
	* dynext_username: Username provided by Dyn
	* dynect_password: Password provided by Dyn



3. Ensure your configuration file is correct by running the installer validation command:

      $ dnsaas-installer --target-password <Target User Password> validate

After you validate the configuration file, run the DNSaaS installer:

       $ dnsaas-installer --target-password <Target User Password> install

4.Once the installation in completed, verify that the API and Nameservers are online using the endpoints supplied by the installer. From the installer VM, execute the following commands:

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


##Configure the Overcloud Load Balancer for DNSaaS<a name="configovercloud"></a>

 You must configure HAProxy before you configure the OverCloud Load Balance for DNaaS.

1. To configure HAProxy use the following command: 

	$ dnsaas-installer --target-password <Target User Password> haproxy

The HA Proxy configuration file will be displayed as the sample below:
	
	2014-09-17 23:31:05.670       INFO HAProxy configuration
	### START HAPROXY CONFIG
	listen designate
	  bind 0.0.0.0:9001
	  mode tcp
	  balance source
	  option tcpka
	  option tcplog
	   
	  server 10.22.171.32 10.22.171.32 check inter 2000 rise 2 fall 5
	  server 10.22.171.22 10.22.171.22 check inter 2000 rise 2 fall 5
	  server 10.22.171.21 10.22.171.21 check inter 2000 rise 2 fall 5
	### END HAPROXY CONFIG


Once HAProxy is configured, SSH to all three OverCloud controller. Perform the following steps on each controller node:

2.SSH OverCloud as root

	ssh root@<IP address of OverCloud>

3.vi `paas.cfg` to edit the configuration file 

 	/etc/haproxy/manual/paas.cfg

4 Paste the HA Proxy configuration file, which is generated in step 1, at the end of the `pass.cfg` file

5 Save the `pass.cfg` file.

		:wq!

6.Reload HA Proxy

		service haproxy reload 

7.Open the Designate API port in the firewall and run the following command:

   a. Run `iptables -I INPUT 1 -p tcp -m tcp --dport 9001 -j ACCEPT`

   b. Run `iptables-save > /etc/iptables/iptables` 


## Registering the service with Keystone<a name="keyreg"></a>
You  can register the DNS service and endpoint as a user or an admin. 

You do not have to immediately register the DNS service in Keystone; however, if you choose to register the DNS service and endpoint execute the following command:
 
* Admin

		$ dnsaas-installer --admin-password <Admin User Password> --target-password <Target User Password> keystone-registration
 
* User
 
		dnsaas-installer --target-password <Target User Password> keystone-registration

###Initial Service Configuration

You must perform an initial configuration step to communicate the names of the servers that serve DNS to Designate. Please ensure you have a valid set of admin credentials in the standard OS_* environment variables before proceeding.

For the "Nameserver FQDNs" gathered during the [prerequisites](#preq) step, issue a `server-create` command for each name to add the server:
 
	$ designate server-create --name ns1.example.com.

For example :

For the HP Helion QA DynECT account:

	designate server-create --name ns1.p13.dynect.net.


##For more information<a name="moreinfo"></a>
For more information, see:

* [HP Helion Public Cloud DNS API Specifications](https://docs.hpcloud.com/api/dns/)
* [Designate DNSaaS services for OpenStack](https://wiki.openstack.org/wiki/Designate)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*


