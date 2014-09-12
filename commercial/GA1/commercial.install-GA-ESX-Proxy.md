---
layout: default
title: "HP Helion OpenStack&#174; Edition: Deploy vCenter ESX compute proxy"
permalink: /helion/openstack/ga/install/esx/proxy/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/install/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-overview/">&#9650; UP</a> | <a href="/helion/openstack/install/esx/">NEXT &#9654;</a> </p>


# HP Helion OpenStack&#174; Deploy vCenter ESX compute proxy

The HP Helion OpenStack vCenter ESX compute proxy is.....

The general process for deploying the vCenter ESX compute proxy involves the following:

- Upload the genertated Nova-Compute proxy vm OVA as a template into the management cluster of the vCenter.
- Update Network information for the Nova-Compute proxy vm
- Get vCenter SSL certificate of the vCenter into Nova-Compute proxy vm.

To deploy vCenter ESX compute proxy into a cloud deployment, use the following steps.


## Prerequisites ##

- [Verify that the cloud is installed up and running](/helion/openstack/ga/install/esx/#verifying-your-installation).
- Verify that the network connection between overcloud controller and Nova-Compute proxy is operational. Ping the gateway of the ESX Network or try to login to the nova-compute proxy for ESX.
- Obtain access information, including credentials to the vCenter.
- Obtain the management cluster name of the vCenter in which Nova-Compute proxy VM will be provisioned.
- Obtain a list of compute clusters that will be managed by the Compute proxy VM.
- Obtain the network port group information of the vCenter to which the ESX compute proxy VM should be connected from the vCenter administrator. The portgroup name should be part of the ESX Network management.
- Assign network IP information in case of Nova-Compute proxy VM using static IP.

## Create a VM template in vCenter

Use the following steps to create a VM template in vCenter:

1. Create a directory `/ovsvapp` on any server in the Helion environment and upload `ovsvapp.tgz`. Extract the `ovsvapp.tgz` and locate the `hp-ovsvapp` directory. In the directory, locate  `overcloud_esx_ovsvapp.ova`. This is the OVSvAPP appliance.

2. Import the `overcloud-nova_compute_esx_proxy.ova` into the vCenter using the vSphere client: 

	a. In the vSphere Client, click **File -> Deploy OVF Template**.

	b. Follow the instructions in the wizard that displays to specify the data center, cluster, and node to install onto. Refer to the VMWare vSphere documentation, as needed.

	**Important**. You must enter `overcloud_vcenter_compute_proxy` as the name for the template.  

	A new VM, referred to here as OVF VM, appears in the left pane. 

3. Add a **CD-ROM** device to the OVF VM using the vCenter. 

	a. In the vSphere Client, right-click the OVF VM.

	b. Click **Edit Settings**.	

	c. Select the **Hardware** tab and click **Add**.

	d. Select **DVD/CD-ROM Drive**.

	e. Follow the instructions in the wizard that displays.

	Refer to the VMWare vSphere documentation, as needed.

5. Power on the OVF VM using vCenter. The default credentials to login to the OVF VM is `stack/stack`. 

6. Install the VMWare tools into the OVF VM: 
	
	a.In the vSphere Client, right-click the OVF VM.

	b. Select **Guest > Install/Upgrade VMware Tools**. 

7. Launch the OVF VM console to install the VMware Tools from command line terminal: 

	a. Right-click the OVF VM and select **Open Console**.

	b. Enter the following commands:

		mkdir /mnt/vmware-tools:
		mount /dev/cdrom/ /mnt/vmware-tools
		cp –rf /mnt/vmware-tools/VMwareTools-*.tar.gz /tmp/
		cd /tmp
		tar zxpf VMwareTools-*.tar.gz
		cd /vmware-tools-distrib
		./vmware-tools-install.pl

	Follow the instructions to continue the installation.

8. Remove the **CD-ROM** device from the OVF VM using vCenter. 

	a. In the vSphere Client, right-click the OVF VM.

	b. Click **Edit Settings**.	

	c. Select the **Remove the CD/DVD drive**.

	d. Select the **Hardware** tab.

	d. Remove the DVD/CD-ROM drive.

	Refer to the VMWare vSphere documentation, as needed.

9. Convert that VM into a template:

	a. In the vSphere Client, right-click the OVF VM.

	b. Click **Template**.	

	c. Select the **Convert to Template**.


## Deploy the proxy ## {#deploy}

Perform the following steps on the undercloud node using the [EON CLI]{deploy_cli} or [vSphere client]{deploy_ui}.

### Deploy the proxy using the CLI ### {deploy_cli}

To deploy the ESX compute proxy using the EON CLI on the undercloud node: 

1. Create a `compute_proxy.conf` file that includes the following:

		[vmware]
		# Details related to vCenter in which Compute Proxy VM will be created
		# 
		# Datacenter name
		datacenter=
		# Management Cluster name
		mgmt_cluster=
		# Shared datatstore name
		datastore=
		# SSL certificate file (cacert.pem) of vCenter
		cert_location=

		[network]

		# port group name which will attached to the proxy VM 
		# it will be management port group which will connect compute proxy VM
		# with your overcontrollers 
		
		port_group_name=

		[compute_proxy]
		# This section hold the values which will be used to configure proxy VM
		# 1) hostname -> should not have '_'	
		# 2) Network information of the vm
		# if usedhcp = False, provide values for ipaddr, netmask, gateway
		# if usedhcp = True, leave empty  ipaddr, netmask, gateway
		hostname=
		usedhcp=
		ipaddr=
		netmask=
		gateway=

	Where:

		datacenter= enter the name of the vCenter Server
		mgmt_cluster= enter the name of the vCenter Management Cluster
		datastore= enter the name of the shared datastore
		cert_location= enter the location of the `compute_proxy.conf` file
		port_group_name= enter the name of the management port group
		hostname= enter the name of the host name of the compute proxy
		usedhcp= enter `true` to use DHCP; enter `false` to specify values
		ipaddr= enter the compute proxy IP of the vCenter
		netmask= enter the compute proxy netmask
		gateway= enter the compute proxy gateway

2. Use the [HP EON servcie CLI](/helion/openstack/ga/services/eon/overview/) to deploy proxy VM. For details refer to the [EON CLI](/helion/openstack/ga/undercloud/eon/cli/ ).

		source /root/stackrc
		eon vcenter-add –name=<VCENTER_NAME> --ip-address=<VCENTER_IP_ADDRESS> --username=<VCENTER_USERNAME> --password=<VCENTER_PASSWORD> --port=<VCENTER_PORT> --proxy-config-file=<COMPUTE PROXY CONFIG FILE>
		eon import-cluster --vcenter-id=<VCENTER_ID> --cluster-moid=<CLUSTER_MOID> --cluster-name=<CLUSTER_NAME>
		eon activate-clusters <VCENTER_ID> --clusters <CLUSTER_MOIDS> [<CLUSTER_MOIDS> ...] 

	Where:

		VCENTER_NAME is the name for the vCenter Server
		VCENTER_IP_ADDRESS is the IP address of the vCenter Server
		VCENTER_USERNAME is the the username for the vCenter administrator
		VCENTER_PASSWORD is the the password for the vCenter administrator
		VCENTER_PORT is the vCenter Server Port
		COMPUTE PROXY CONFIG FILE
		VCENTER_ID
		CLUSTER_MOID
		CLUSTER_NAME
		VCENTER_ID

	A vCenter proxy VM named `hp_helion_vcenter_proxy` will be available in the specified vCenter.

### Deploy the proxy using the vSphere client {deploy_ui}

To deploy the ESX compute proxy using the vSphere client, see the [Register vCenter section](/helion/openstack/ga/undercloud/resource/esx#register-vcenter) of the Virtual Environments document.

## Enable SSL between vCenter and proxy VM ##

Use the following steps to configure SSL between vCenter and the proxy VM, using either the [CLI](#cli) or [vSphere client](#ui).

### Using the command-line ### {#cli}

1. Locate the root certificate from the vCenter server available at this location `C:\ProgramData\VMware\VMware VirtualCenter\SSL\cacert.pem`

2. Copy the certificate to the location specified in the `cert_location` value of the [`compute_proxy.conf`](#undercloud) file. 

2. Copy the certificate into the `/root/hp-vcenter-compute-proxy/input/cacert.pem`

3. Edit the [`compute_proxy.conf`](#undercloud) file to change the the host-name of the vCenter (Compulsory) instead of `ip-address`.

4. If DNS name resolution is not available add a `/etc/hosts` entry for the vCenter ip address.

### Using the vSphere client {#ui}

1. Get the root certificate from the vCenter server available at this location `C:\ProgramData\VMware\VMware VirtualCenter\SSL\cacert.pem`

2. Copy the contents of the certificate file into the text box provided for SSL certificates.

3. **REQUIRED** Provide the FQDN host-name of the vCenter instead of teh ip-address in text box.

## Next Steps

- Deploy the Open vSwitch vApp **(REQUIRED)**. 

	If you have not deployed the HP Virtual Cloud Networking's Open vSwitch vApp (OVSvApp), see the [Deploying and configuring OVSvApp for HP Virtual Cloud Networking (VCN) on ESX hosts](/helion/openstack/install/ovsvapp/) document for complete instructions.

	OVSvApp must be installed for HP Helion OpenStack environment to provision VMs in your VMware vCenter environment. Once deployed, OVSvApp appliance enables networking between the tenant Virtual Machines (VMs).

- Install DNS as a service (DNSaaS) (Optional).

	If you have not installed DNSaaS, see [DNSaaS Beta Installation and Configuration](/helion/openstack/install/dnsaas/).

	DNSaaS is our managed DNS service, based on the OpenStack Designate project, is engineered to help you create, publish, and manage your DNS zones and records securely and efficiently to either a public or private DNS server network.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
