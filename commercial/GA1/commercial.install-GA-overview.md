---
layout: default
title: "HP Helion OpenStack&#174; Installation and Configuration"
permalink: /helion/openstack/ga/install/overview/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/support-matrix/">&#9664; PREV</a> | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/install/prereqs/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&#174; Installation Overview
This page provides an overview of the installation process

HP Helion OpenStack uses three linked installation phases to deploy a complete OpenStack cloud. <a href ="https://wiki.openstack.org/wiki/TripleO">TripleO</a> simulates the deployment of OpenStack by creating and configuring baremetal servers to successfully run a cloud deployment. 

* Seed: The seed VM is started as a VM from a specific seed VM image. It contains a number of self-contained OpenStack components that are used to deploy the undercloud. The seed deploys the undercloud by using Ironic baremetal driver to deploy a specific undercloud machine image.

* Undercloud: In a typical HP Helion OpenStack deployment, the undercloud is a baremetal server. The undercloud is a complete OpenStack installation, which is then used to deploy the overcloud.

* Overcloud: The overcloud is the end-user OpenStack cloud. In a typical HP Helion OpenStack deployment, the overcloud comprises several baremetal servers.

This rest of this page provides you with the following installation information:

* [Installation options](#installation-options)
* [About the installation process](#install-about)
* [Installation issues and troubleshooting](#install_issues)
* [Next Step](#next)
* [For more information](#info)

### Installation options {#installation-options}
With HP Helion OpenStack, you have two baremetal installation options depending on your system configuration.

* HP Helion OpenStack with a KVM hypervisor 

	HP Helion OpenStack supports KVM (Kernel-based Virtual Machine). With our KVM integration, you  can provision and manage an overcloud KVM cluster. One of these two add-ons is required for the [Volume Operations](/helion/openstack/ga/services/volume/overview/) service:

	- HP StoreVirtual VSA:
	
		[HP StoreVirtual VSA](http://www8.hp.com/us/en/products/data-storage/storevirtual-vsa.html) allows you to consolidate multiple storage nodes into pools of storage. The available capacity and performance is aggregated and made available to every volume in the cluster. 

	- HP 3PAR StoreServ

		HP 3PAR StoreServ is storage array (a physical device), which is integrated with HP Cloud OS to realize block storage of the cloud environment.

	[Learn how to to install and configure with a KVM hypervisor](/helion/openstack/install/kvm). 

* HP Helion OpenStack with a ESX hypervisor 

	HP Helion OpenStack supports VMWare ESX hypervisor. With our ESX integration, you can provision and manage an overcloud ESX cluster.

	- HP Virtual Cloud Networking (VCN) application support**

		HP Virtual Cloud Networking (VCN) application enables you to build a robust, multi-tenant networking infrastructure. Once deployed, the Open vSwitch vApp (OVSvApp) template enables networking between the tenant VMs provisioned on your ESX compute nodes.

	- HP Virtual Cloud Networking's Open vSwitch vApp (OVSvApp)
	
		The OVSvApp must be installed on each hypervisor in the HP Helion OpenStack environment to provision VMs in your VMware vCenter environment. 

	[Learn how to to install and configure with an ESX hypervisor](/helion/openstack/install/esx/).  

After installing HP Helion OpenStack, you have the option to install: 

- **HP Helion OpenStack DNS as a service (DNSaaS)**. Our managed DNS service, based on the Openstack Designate project, is engineered to help you create, publish, and manage your DNS zones and records securely and efficiently to either a public or private DNS server network.

	 [Learn how to install and configure HP Helion OpenStack DNSaaS](/helion/openstack/ga/install/dnsaas/) 

- **Lightweight Directory Access Protocol integration**

	 [Learn how to integrate LDAP](/helion/openstack/ga/install/ldap/) 


## About the installation process ## {#install-about}

The high-level process for installing HP Helion OpenStack involves the following:

1. Review the information in the [Support Matrix](/helion/openstack/ga/support-matrix/) and [Technical Overview](/helion/openstack/technical-overview/) for information on the hardware and software requirements and details.

2. Perform the necessary [Prerequisites](/helion/openstack/ga/install/prereqs)

3. Install onto a KVM or ESX hypervisor:

	
	- [Install onto a KVM hypervisor](/helion/openstack/ga/install/kvm/).

		Then, [configure HP StoreVirtual VSA for Block Storage](/helion/openstack/ga/install/vsa/) or [configure HP 3PAR StoreServ Storage](/helion/openstack/install/3par/). 

	- [Install onto an ESX hypervisor](/helion/openstack/ga/install/esx/).

		Then, [deploy the compute proxy on the ESX hosts](/helion/openstack/ga/install/esx/proxy/) and [deploy OVSvApp for HP Virtual Cloud Networking](/helion/openstack/ga/install/ovsvapp/).

4. Optionally, [install and configure DNSaaS support](/helion/openstack/ga/install/dnsaas/).

There are a few things you should be aware of before you begin your HP Helion OpenStack baremetal installation.

* Loading images is slow, so be patient.

* The seed must remain booted while the undercloud and overcloud are up.

* The `stackrc` and `tripleo_*_passwords` files contain credentials for the undercloud and the overcloud; you should ensure that they are securely stored separately from the seed.
 
    `/root/stackrc`

    `/root/tripleo/tripleo_*_passwords`

## Installation issues and troubleshooting {install_issues}

* When installing on HP ProLiant SL390s and HP ProLiant BL490d systems, the following error has occasionally occurred:

    `Fatal PCI Express Device Error PCI Slot ?
     B00/D00/F00`

     If you get this error, reset the system that experienced the error:

    1. Connect to the iLO using Internet Explorer:
        `https://<iLO IP address>`
    2. Navigate to Information / Diagnostics.
    3. Reset iLO.
    4. Log back into the iLO after 30 seconds.
    5. Navigate to Remote Console / Remote Console.
    6. Open the integrated remote console (.NET).
    7. Click Power switch / Press and Hold.
    8. Click Power switch / Momentary Press, and wait for the system to restart.

    The system should now boot normally.

* If the overcloud controller is rebooted (due to a power issue, hardware upgrade, and so forth), OpenStack compute tools such as `nova-list` might report that the VMs are in an ERROR state, rendering the overcloud unusable. To restore the overcloud to an operational state, follow the steps below:
 
  1. A user `root` on the overcloud controller must:
  
        A. Run the `os-refresh-config` scripts:

            # os-refresh-config

        B. Restart the `mysql` service:

            # service mysql restart

        C. Re-run the `os-refresh-config` scripts:

            # os-refresh-config

        D. Restart all Networking Operations (Neutron) services:

            # service neutron-dhcp-agent restart
            # service neutron-l3-agent restart
            # service neutron-metadata-agent restart
            # service neutron-openvswitch-agent restart
            # service neutron-server restart

  2. On each overcloud node, restart the neutron and nova services:
  
            $ sudo service neutron-openvswitch-agent restart
            $ sudo service nova-compute restart
            $ sudo service nova-scheduler restart
            $ sudo service nova-conductor restart


* The installer uses IPMI commands to reset nodes and change their power status. Some systems change to a state where the `Server Power` status as reported by the iLO is stuck in `RESET`. If this occurs, you must physically disconnect the power from the server for 10 seconds. If the problem persists after that, contact HP Support as there might be a defective component in the system.

* On the system on which the installer is run, the seed VM's networking is bridged onto the external LAN. If you remove HP Helion OpenStack, the network bridge persists. To revert the network configuration to its pre-installation state, run the following commands as user root: 

        # ip addr add 192.168.185.131/16 dev eth0 scope global
        # ip addr del 192.168.185.131/16 dev brbm
        # ovs-vsctl del-port NIC

        where
        * eth0 is the external interface
        * 192.168.185.131 is the IP address on the external interface - you should replace this with your own IP address.
        * The baremetal bridge is always called 'brbm'

* Before you install HP Helion Openstack's DNSaaS or if you want to use Heat with HP Helion OpenStack, you **must** modify the /etc/heat/heat.conf file on the overcloud controller as follows.

    **Important**: The installation of HP Helion OpenStack's DNSaaS fails if you do not make these modifications.

    1. Make sure the IP address in the following settings reflects the IP address of the overcloud controller, for example:
    
            heat_metadata_server_url = http://192.0.202.2:8000
            heat_waitcondition_server_url = http://192.0.202.2:8000/v1/waitcondition
            heat_watch_server_url = http://192.0.202.2:8003

        **Note**: You must have admin ssh access to the overcloud controller.

    2. Save the file.
    3. Restart the Heat-related services &ndash; heat-api, heat-api-cfn, heat-api-cloudwatch, and heat-engine.

    4. Ensure there are no Heat resources in an Error state, and then delete any stale or corrupted Heat-related stacks.

## Next Step ## {#next}

Prepare your environment for the installation, see [HP Helion OpenStack&#174; Installation: Prerequisites](/helion/openstack/ga/install/prereqs/).

## For more information ## {#info}

For more information on HP Helion OpenStack Community, see:

* [Before you begin](/helion/openstack/ga/install/prereqs/) 
* [Support matrix](/helion/openstack/ga/support-matrix/) 
* [FAQ](/helion/openstack/ga/faq/) 
* [Release notes](/helion/openstack/ga/release-notes/) 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
