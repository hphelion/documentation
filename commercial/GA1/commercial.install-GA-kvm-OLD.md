---
layout: default
title: "HP Helion OpenStack: Installation and Configuration"
permalink: /helion/openstack/ga/install/kvmold/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/helion/openstack/install/prereqs/">&#9664; PREV</a> | <a href="/helion/openstack/install-overview/">&#9650; UP</a> | <a href="/helion/openstack/install/vsa/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&reg;: Installation and Configuration for KVM Hypervisor

HP Helion Openstack allows you to manage the KVM hypervisor and provision virtual machines. 

It is important to read through this page before starting your installation. We also recommend that you review the [hardware and network configuration requirements](/helion/openstack/ga/install-overview/##installation-requirements) and the [support matrix](/helion/openstack/ga/support-matrix/), and learn about the [installation process and complete any required tasks](/helion/openstack/ga/install/prereqs/). 

The rest of this page explains the installation and configuration process for KVM. 

* [KVM deployment architecture](#deploy-arch)
* [Downloading the installation packages](#getinstall)
* [Installing HP StoreVirtual Virtual Storage Appliance](#vsa)
* [Installing HP Helion OpenStack](#install)
   * [Configuring proxy information](#proxy)
   * [Unpacking installation file](#unpackinstall)
   * [Installing the seed VM and building your cloud](#startseed)
* [Verifying your installation](#verifying-your-installation)
   * [Connecting to Horizon console](#connectconsole)
   * [Connecting to Monitoring UI](#monitoring)
* [Installing DNS as a service](#configure)
* [Next steps](#next-steps)


##KVM deployment architecture {#deploy-arch}

The following diagram depicts a simplified deployment scenario.

<a href="javascript:window.open('/content/documentation/media/commercial_kvm_network_architecture.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">KVM deployment of HP Helion OpenStack (opens in a new window)</a>

## Downloading the installation packages {#getinstall}
Before you begin, you must download the required HP Helion OpenStack installation packages:

<table style="text-align: left; vertical-align: top; width:650px;">
	
<tr style="background-color: lightgrey; color: black;">
	
<td><b> Installation package </b></td><td><b>File name</b></td>
<tr style="background-color: white; color: black;">
 <td>HP StoreVirtual VSA </td><td>HPStoreVirtual_VSA_11.5.tgz</td></tr>
	
<tr style="background-color: white; color: black;">
<td>HP Helion OpenStack </td><td>HPHelionOpenStack_June30.tgz</td></tr>
</td></tr>

<tr style="background-color: white; color: black;">
<td>HP Helion OpenStrack DNSaaS (Optional) </td><td>HP_dnsaas-installer_0.0.4b11.tar.gz</td></tr>
</td></tr>
</table>

1. Log in to your install system as root:

    `sudo su -`

2. Register and then log in to download the required installation packages from this site:

    [HP Helion OpenStack product installation](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221247%22%7D/Show)

For more details, refer to the [package download instructions](/helion/openstack/install/prereqs/#install-pkg) on the HP Helion OpenStack Installation: Before you begin page.
	
## Installing HP StoreVirtual Virtual Storage Appliance (VSA) {#vsa}
Before you install HP Helion OpenStack, [HP StoreVirtual VSA](https://docs.hpcloud.com/helion/openstack/ga/install/vsa/) must be installed and configured.

HP StoreVirtual VSA provides complete array functionality without an external array hardware, which:

* eliminates the need for external shared storage required to implement block storage feature
* uses scale-out, distributed clustering to provide a pool of storage with enterprise storage features and simple management at a reduced cost
<!--
Once you have completed the HP StoreVirtual VSA installation, you must have the following information available to complete the HP Helion OpenStack installation:

* VSA_API_URL
* VSA_USERNAME
* VSA_PASSWORD
* VSA_NAME
-->

See the [HP StoreVirtual VSA support](/helion/openstack/ga/install/vsa/) page for complete installation and configuration instructions.


## Installing HP Helion OpenStack {#install}
After you have installed HP StoreVirtual VSA, ensure you have met all the hardware requirements and have completed the required tasks before you begin your installation. The following sections walk you through:

* [Configuring proxy information](#proxy)
* [Unpacking installation file](#unpackinstall)
* [Installing the seed VM and building your cloud](#startseed)

**IMPORTANT:** During the installation process, **DO NOT RESTART** the system running the installer and seed VM. Restarting this system disrupts the baremetal bridge networking configuration and disables both the undercloud and overcloud. If the system is inadvertently restarted, you must initiate the installation process again.

### Configuring proxy information {#proxy}
Before you begin your installation, if necessary, configure the proxy information for your environment using the following steps:

1. Log in to your install system as root:

        sudo su -

2. Add the following lines to `/etc/environment`:

        export http_proxy=http://<web proxy IP/
        export https_proxy=http://web proxy IP/
        export no_proxy=localhost,127.0.0.1,<your 10.x IP address>
 

3. Log out and re-login to your baremetal server to activate the proxy configuration.

### Unpacking installation file ## {#unpackinstall}

1. Ensure you are logged into your install system as root; otherwise, log in as root:

        sudo su -

2. Create a directory named `work`:

         mkdir /root/work
         cd /root/work

3. Extract the kit to the `work` directory:

         tar zxvf /root/<baremetal kit name>.tgz

    This creates and populates a `tripleo/` directory within root's home directory.

4. The BRIDGE_INTERFACE must be set to the name of the device connected to the private network that connects all baremetal nodes. This private network is also where these nodes PXE boot. The installation script assumes this device name is `eth0`. If your device is NOT named `eth0`, then determine its name and set the environment variable as shown below:

        $ export BRIDGE_INTERFACE=<devicename>

    Two examples:

        $ export BRIDGE_INTERFACE=em1  
        $ export BRIDGE_INTERFACE=eth5


### Installing the seed VM and building your cloud ### {#startseed}
1. To start the seed VM installation, enter the following command:

        bash -x /root/work/tripleo/tripleo-incubator/scripts/hp_ced_start_seed.sh
    
    **Note**:The installation process takes approximately 10 minutes to complete.

    If the seed startup is successful, you should see a message similar to the following:

        "Wed Apr 23 11:25:10 IST 2014 --- completed setup seed"

2. To build the cloud, start by logging in to the seed VM. Run the following command from /root:

        ssh root@192.0.2.1 

    **Note**: It might take a few moments for the seed VM to become reachable. 

  
3. When prompted for host authentication, type `yes` to allow the ssh connection to proceed.

4. Ensure the information in the `baremetal.csv` file is correct and in the following format, and then upload to /root.

        <mac_address>,<ilouser>,<ilopassword>,<iloipaddress>,<#cpus>,<memory_MB>,<diskspace_GB>
     
    **Important**: There must be one entry in this file for each baremetal system you intend to install. For example, for a 7 baremetal system your file should look similar to this:

        78:e7:d1:22:5d:58,operator,password,192.168.11.1,12,32768,2048
        78:e7:d1:22:5d:10,operator,password,192.168.11.5,12,32768,2048
        78:e7:d1:22:52:90,operator,password,192.168.11.3,12,32768,2048
        78:e7:d1:22:5d:c0,operator,password,192.168.11.2,12,32768,2048
        78:e7:d1:22:5d:a8,operator,password,192.168.11.4,12,32768,2048
        78:e7:d1:22:52:9b,operator,password,192.168.11.6,12,32768,2048
        78:e7:d1:22:52:9e,operator,password,192.168.11.7,12,32768,2048  

    **Note:** For more information on creating this file, refer back to [Obtaining required information](/helion/openstack/install/prereqs/#req-info/).

5. [Optional] If you have installed the IPMItool, use it to verify that network connectivity from the seed VM to the baremetal servers in your baremetal.csv is working.

6. Manually power off each baremetal system specified in /root/baremetal.csv before proceeding with the installation. 
    
    **IMPORTANT:** Ensure that each system is configured in the BIOS to stay powered off in the event of being shutdown rather than automatically restarting.

7. Set the IP address of an NTP server accessible on the public interface for overcloud and undercloud hosts using the following commands, for example:

        $ export OVERCLOUD_NTP_SERVER=192.0.1.128
        $ export UNDERCLOUD_NTP_SERVER=192.0.1.128

8. The FLOATING_START, FLOATING_END, and FLOATING_CIDR variables control the range of IP addresses available for user VMs in the overcloud. You cannot have any active IP addresses within the Floating IP range. Complete the following steps to ensure the VSA IP does not land in this range.
    
     A. Since VSA uses 192.0.2.253, change the `FLOATING_END` to 192.0.2.200. If necessary, change the `FLOATING_START` and `FLOATING_CIDR` as well. Currently, the defaults are set as below and can be changed with the `export` command.

            $ export FLOATING_START=192.0.2.45
            $ export FLOATING_END=192.0.2.254
            $ export FLOATING_CIDR=192.0.2.0/24

     B. Ensure the VSA system IP address is on the same network.

     C. Ensure the Floating IP range does not include the IP addresses that have been used for systems running VSA.


     **IMPORTANT**: If the VSA IP is within the Floating IP range, the last step of the installation fails.


9. Set `OVERCLOUD_NeutronPublicInterface` and `UNDERCLOUD_NeutronPublicInterface` to the name of the interface that carries Neutron external traffic on your overcloud and undercloud. By default, it is `eth2`. The following example sets the value of the variable to `eth0`.

            $ export OVERCLOUD_NeutronPublicInterface=eth0
            $ export UNDERCLOUD_NeutronPublicInterface=eth0   

10. [Optional] You can configure a second network for API traffic and for the floating
IP pool by setting OVERCLOUD_NeutronPublicInterface to a physically configured VLAN. For example:

            $ export OVERCLOUD_NeutronPublicInterface=vlan101 (ID of physically configured VLAN)
            $ export NeutronPublicInterfaceIP=192.0.8.2/21
            $ export NeutronPublicInterfaceRawDevice=eth0
            $ export NeutronPublicInterfaceDefaultRoute=192.0.8.1
            $ export FLOATING_START=192.0.8.20
            $ export FLOATING_END=192.0.15.254
            $ export FLOATING_CIDR=192.0.8.0/21

11. [Optional] You should not set OVERCLOUD_COMPUTESCALE to a higher value than three as a limit of 7 nodes is enforced. If you do not specify a value, the value is derived based on the number of lines remaining in `/root/baremetal.csv` once the undercloud, overcloud controller, and overcloud swift nodes are removed.

    To set this variable:

    `$ export OVERCLOUD_COMPUTESCALE=3`

12. To enable HP StoreVirtual, update the tripleo/tripleo-incubator/scripts/configure_installer.sh file in the seed with the VSA cluster information. You must change the configuration based on your specifications, for example:

        export ENABLE_VSA="True"
        export VSA_API_URL="https://XXX.XXX.XXX.XXX:8081/lhos"
        export VSA_USERNAME="<user name>"
        export VSA_PASSWORD="<password>"
        export VSA_NAME="<cluster name>"
        export VSA_ISCSI_CHAP_ENABLED="False"
        export VSA_DEBUG="False"

    * **ENABLE_VSA** - Change to `True` to enable HP StoreVirtual VSA configuration. By default the value is `False`.
    
    * **VSA_URL** - Enter the IP address used to access your VSA cluster. 
    
    * **VSA_USERNAME** - Enter the cluster user name.
    
    * **VSA_PASSWORD** - Enter the cluster password.
    
    * **VSA_NAME** - Enter the name of the cluster.
    
    * **VSA&#95;ISCSI&#95;CHAP_ENABLED** - Change to `True` if you want to enable CHAP authentication.
    
    * **VSA_DEBUG** - By default the value is `False`; to enable debugging, change it to `True`.

13. To install and configure the undercloud and overcloud, run the following command from /root. 

    `bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh`

    If your installation is successful, a message similar to the following is displayed:

    `"HP - completed - Tue Apr 22 16:20:20 UTC 2014"`

**Note:** If `hp_ced_start_seed` fails to start the seed, you simply need to restart it (step 1) and then follow the rest of the steps.


## Verifying your installation

Once your installation is complete, you should ensure you can connect to your HP Helion OpenStack baremetal cloud.


### Connecting to Horizon console ### {#connectconsole}
Ensure you can access the overcloud Horizon dashboard. To do this, follow the steps below:

1. From the seed, export the undercloud passwords:

    `. /root/tripleo/tripleo-undercloud-passwords`

2. Export the undercloud users:

    `TE_DATAFILE=/root/tripleo/testenv.json . /root/tripleo/tripleo-incubator/undercloudrc`

3. Assign the overcloud IP address to a variable:

        OVERCLOUD_IP=$(nova list | grep "overcloud-controller" | awk ' { print $12 } ' | sed s/ctlplane=// )

4. Determine the overcloud controller IP from the output of step 3 using the following command. It is in the last line returned.
  
        echo ${OVERCLOUD_IP}

    If the optional second network was configured, the overcloud controller IP is the value set for NeutronPublicInterfaceIP.

5. Open the `/root/tripleo/tripleo-overcloud-passwords` file and make note of the demo user password.

6. From your install system, open a web browser and point to:

        http://<overcloud_IP>/

7. Log in to the overcloud Horizon dashboard as user `demo` with the password you obtained from the `/root/tripleo/tripleo-overcloud-passwords` file in the previous step.


**Note:** If you are unable to connect to the Horizon console, check your proxy settings to ensure that access to the controller VM is successfully redirected through a proxy.



### Connecting to Monitoring UI ### {#monitoring}

1. From the seed, run the following command:

        . /root/stackrc

2. Assign the undercloud IP address to a variable:

        UNDERCLOUD_IP=$(nova list | grep "undercloud" | awk ' { print $12 } ' | sed s/ctlplane=// )

3. Determine the undercloud IP from the output of step 2 using the following command. It is in the last line returned.
  
        echo ${UNDERCLOUD_IP}

4. From your install system, open a web browser and point to:

        http://<undercloud_IP>/icinga/

5. Log in as user 'icingaadmin' with password 'icingaadmin'.

## Installing DNS as a service (DNSaaS) {#configure}

Our managed DNS service, based on the OpenStack Designate project, is engineered to help you create, publish, and manage your DNS zones and records securely and efficiently to either a public or private DNS server network.

Installing HP Helion OpenStack DNSaaS is **optional**. Before you attempt the DNSaaS installation, you *must* have already installed HP Helion Openstack and verified that it is configured correctly and operational. 

Learn how to [install DNS as a service](/helion/openstack/install/dnsaas/).



## Next steps
* [Logging into the HP Helion OpenStack dashboards](/helion/openstack/ga/dashboard/login/)
* [How to use the HP Helion OpenStack dashboards](/helion/openstack/ga/dashboard/how-works/)
* [HP Helion OpenStack services overview](/helion/openstack/ga/services/overview/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
