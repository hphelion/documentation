---
layout: default
title: "HP Helion OpenStack&#174; Installation and Configuration"
permalink: /helion/openstack/install-beta/prereqs/
product: commercial

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/install-beta-overview/">&#9664; PREV</a> | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/kvm/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&#174; Beta Installation: Before you begin

Before you begin the installation process, take a few minutes to read this page because it contains information about:


* [Required tasks](#required-tasks)
   * [Obtaining a public key](#pub-key)
   * [Installing Debian/Ubuntu packages](#packages)
   * [Creating the baremetal.csv file](#req-info)
* [About the installation process](#install-notes)
   * [Downloading installation packages](#install-pkg)
   * [Installation issues and troubleshooting](#issues-and-troubleshooting)
* [For more information](#for-more-information)

## Required tasks 
On the installer system, ensure the following required tasks are completed before you begin the installation.

### Obtaining a public key ### {#pub-key}
On the system on which the install is running, user root must have a public key, for example:

    `/root/.ssh/id_rsa`
    `/root/.ssh/id_rsa.pub`

If user root does not have a public key, you can create one using the `ssh-keygen -t rsa -N ""` command.

### Installing Debian/Ubuntu packages ### {#packages}
Before starting the installation, you must first install the following required Debian/Ubuntu packages on the system running the installer:

* qemu
* openvswitch
* libvirt
* python-libvirt

Use the following command to install these packages:

  `$ sudo apt-get install -y libvirt-bin openvswitch-switch python-libvirt qemu-system-x86 qemu-kvm`

After you install the `libvirt` packages, you must reboot or restart `libvirt`:

    $ sudo /etc/init.d/libvirt-bin restart

### Creating the baremetal.csv file ### {#req-info}

During the installation process after the seed VM is installed, the installer script looks for information about the baremetal systems. Specifically, it looks for this information in a file called `baremetal.csv`. You must create this file before you begin the installation process, and then upload to the seed VM at the appropriate installation step. 

The `baremetal.csv` file must contain one entry for each of the seven baremetal systems; thus, the file must contain a minimum of 7 lines and maximum of 15 lines, and each line must contain the following information:

    `<mac_address>,<ilouser>,<ilopassword>,<iloipaddress>,<#cpus>,<memory_MB>,<diskspace_GB>`

For example: `78:e7:d1:22:5d:58,operator,password,192.168.11.1,12,32768,2048`

When creating this file, keep in mind the following:

* The IPMI user and password **must have** ADMINISTRATOR privilege; it is not sufficient to have OPERATOR privilege
* Memory must be at least 32 GB
* Disk size should be at least 2 TB
* The disk size specified should never exceed the physical disk size

**Important**: Make sure that the information specified is correct. If any node fails to install, you must restart the installation from the beginning.

## About the installation process ## {#install-notes}

There are a few things you should be aware of before you begin your HP Helion OpenStack baremetal installation.

* Loading images is slow, so be patient.

* The seed must remain booted while the undercloud and overcloud are up.

* The `stackrc` and `tripleo_passwords` files contain credentials for the undercloud and the overcloud; you should ensure that they are securely stored separately from the seed.
 
    `/root/stackrc`

    `/root/tripleo/tripleo_passwords`

### Downloading installation packages {#install-pkg}

The following packages are available to download from [HP Helion OpenStack product installation](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221247%22%7D/Show) web site. Register, and then log in to download the required packages.


<table style="text-align: left; vertical-align: top;">


<tr style="background-color: #C8C8C8; text-align: left; vertical-align: top;">
<th width=25%>File name</th>
<th width=30%>Description</th>
<th width=10%>Contents</th>
<th>Size</th>
<th width=10%>Required</th>
</tr>


<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>HPHelionOpenStack_BetaJune30.tgz </td>
<td> HP Helion OpenStack beta install package </td>
<td>Beta installation scripts and images </td>
<td> 5.3 GB </td>
<td> Yes </td>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>HPStoreVirtual_VSA_11.5.tgz</td>
<td>
HP StoreVirtual VSA package </td>
<td>HP_StoreVirtual_VSA_Installer_for_KVM.tgz</br></br>
CMC_11.5.01.0023.0_Installer_Linux.bin</br></br>
Linux ISO - hlinux-vsa-blaster-20140619.iso</br></br>
Automation scripts - pyVins.tgz</td>
<td> 1.8 GB</td>
<td>Yes - if you are using KVM hypervisor</td>
</tr>


<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td> HP_OVSvApp.zip
 </td>
<td> HP Virtual Cloud Networking (VCN) application package</td>
<td> OVS vApp ova file </br></br>Automation Scripts </td>
<td> 600 MB </td>
<td>Yes - if you are using ESX hypervisor </td>
</tr>


<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td> HP_dnsaas-installer_0.0.4b11.tar.gz
</td>
<td>HP Helion OpenStack DNSaaS package  </td>
<td> DNSaaS workload image </td>
<td> 2.5 GB </td>
<td>No - only if you require DNSaaS support</td>
</tr>

</table>


### Installation issues and troubleshooting 
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

* If the overcloud controller is rebooted (power issue, hardware upgrade, etc.), OpenStack compute tools such as `nova-list` report that the VMs are in an ERROR state, rendering the overcloud unusable. To restore the overcloud to an operational state, follow the steps below:
  1. As user root on the overcloud controller you must:
  
        A. Run the os-refresh-config scripts:

            # os-refresh-config

        B. Restart the mysql service:

            # service mysql restart

        C. Re-run the os-refresh-config scripts:

            # os-refresh-config

        D. Restart all neutron services:

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


* The installer uses IPMI commands to reset nodes and change their power status. Some systems change to a state where the "Server Power" status as reported by the iLO is stuck in the "RESET". If this occurs, you must physically disconnect the power from the server for 10 seconds. If the problem persists after that, contact HP Support as there might be a defective component in the system.

* On the system on which the installer is run, the seed VM's networking is bridged onto the external LAN. If you remove HP Helion OpenStack, the network bridge persists. To revert the network configuration to its pre-installation state, run the following commands as user root: 

        # ip addr add 192.168.185.131/16 dev eth0 scope global
        # ip addr del 192.168.185.131/16 dev brbm
        # ovs-vsctl del-port NIC

        where
        * eth0 is the external interface
        * 192.168.185.131 is the IP address on the external interface - you should replace this with your own IP address.
        * The baremetal bridge is always called 'brbm'

* Before you install the HP Helion Openstack DNSaaS or if you want to use Heat with HP Helion OpenStack, you **must** modify the /etc/heat/heat.conf file on the overcloud controller as follows.

    **Important**: The installation of the HP Helion OpenStack DNSaaS fails if you do not make these modifications.

    1. Make sure the IP address in the following settings reflects the IP address of the overcloud controller, for example:
    
            heat_metadata_server_url = http://192.0.202.2:8000
            heat_waitcondition_server_url = http://192.0.202.2:8000/v1/waitcondition
            heat_watch_server_url = http://192.0.202.2:8003

        **Note**: You must have admin ssh access to the overcloud controller.

    2. Save the file.
    3. Restart the Heat-related services &ndash; heat-api, heat-api-cfn, heat-api-cloudwatch, and heat-engine.

    4. Ensure there are no Heat resources in an Error state, and then delete any stale or corrupted Heat-related stacks.


## Next steps
* [Installing and configuring with a KVM hypervisor](/helion/openstack/install-beta/kvm)
* [Installing HP StoreVirtual VSA support](/helion/openstack/install-beta/vsa/)
* [Installing and configuring with an ESX hypervisor](/helion/openstack/install-beta/esx/)
* [Deploying and configuring OVSvApp for HP Virtual Cloud Networking (VCN) on ESX hosts](/helion/openstack/install-beta/ovsvapp/)
* [Installing and configuring DNSaaS support](/helion/openstack/install-beta/dnsaas/)
 
## For more information
For more information on HP Helion OpenStack, see:

* [Support matrix](/helion/openstack/support-matrix-beta/) 
* [FAQ](/helion/openstack/faq/) 
* [Release notes](/helion/openstack/release-notes/) 

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>