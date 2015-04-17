---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Create the VSD Node"
permalink: /helion/openstack/carrier/install/vsd-node/
product: carrier-grade
product-version1: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Michael B, 

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"><a href="/helion/openstack/1.1/technical-overview/">&#9664; Technical Overview</a> | <a href="/helion/openstack/1.1/install/overview/">&#9650; Installation Overview</a> | <a href="/helion/openstack/1.1/install/kvm">Installing on a KVM hypervisor &#9654;</a> OR <a href="/helion/openstack/1.1/install/esx"> Installing on an ESX hypervisor&#9654;</a> </p> 


# HP Helion OpenStack&#174; Carrier Grade (Alpha): Create the VSD Node

[HP Virtualized Services Directory (HP VSD)](http://www8.hp.com/us/en/products/networking-switches/product-detail.html?oid=7268885) (HP VSD) is a component of HP Distributed Cloud Networking.

There are three main components in the HP DCN solution: HP VSD, HP Virtualized Services Controller (HP VSC) and HP Virtual Routing and Switching (HP VRS).

The HP VSD is the policy and analytics engine for the HP DCN solution. All HP VSD components should be installed on 

**Note:** You can download the complete [HP Distributed Cloud Networking manuals](http://h20565.www2.hp.com/portal/site/hpsc/public/psi/home/?sp4ts.oid=7268885&ac.admitted=1429029354732.876444892.492883150#manuals), in needed.

Use the following steps to install the HP VSD node in the HP Helion OpenStack Carrier Grade cloud:

1. On the KVM host, change to the directory where you copied the installer files and locate the `Nuage-VSD-3.0.0_HP_r3.0-16-QCOW.tar.gz` file.

2. Run the following command to extract the installer files: 

		tar -zxvf Nuage-VSD-3.0.0_HP_r3.0-16-QCOW.tar.gz

	You should see `VSD-3.0.0_HP_r3.0_16.qcow2` file once you extract. 

3. Copy the `VSD-3.0.0_HP_r3.0_16.qcow2` file to the `var/lib/libvirt/images` directory.

4. Use the following commands to provision a VM for VSD:

		virsh define vsd.xml
		virsh autostart vsd
		virsh start vsd

5. Login to Console of VSD VM created.

6. For the eth0 device, configure static IP by editing the `/etc/sysconfig/network-scripts/ifcfg-eth0` file

		BOOTPROTO="static"
		IPADDR=10.10.10.10
		NETMASK=255.255.255.0
		GATEWAY=10.10.10.1

7. Restart Networking using the following command: 

		service network restart

8. Update `/etc/resolv.conf` file to add IP address of the DNS server.

	**Example:**
		nameserver     191.72.1.1

9. Add the VSD host name to the `/etc/hosts` file:

		127.0.0.1 locahost localhost.localdomain localhost4.localdomain4
		::1 locahost localhost.localdomain localhost6.localdomain6
		10.10.10.10 vsd.helion.cg

10. Reboot the VM.

11. Add the NTP server to the `/etc/ntp.conf` file and comment out any other servers listed.

12. Stop, synchronize and restart the NTP service using the following commands: 

		service ntpd stop
		ntpd -q
		service ntpd start

13. Use the `ntpq -p` command to make sure the NTP servers are listed.
 
16. Use the `ntpstat` command to Make sure that NTP is synchronized.

		ntpstat
		synchronised to NTP server (10.5.26.10) at stratum 2
		time correct to within 52 ms
		polling server every 1024 s

	**Important:** Run the Install Script only when the ntp server is syncronized.

17. Use the following command to install the VSD node:

		/opt/vsd/install.sh -x xmpp.<yourdomain> -t s -y

	The command output indicates the approximate time the installation might take.

When the installation is complete, a conformation message appears. 
 
## Verifing the installation

Verify that your HP VSD(s) are up and running by using the following command:

	service vsd status

## Configure VSD

You can use xrdp to connect to the gurst VM from the KVM host and launch the VSD dashboard to create required users and apply the required license.



1. Launch a web browser, such as Google Chrome.

2. Navigate to the IP address of the VSD:

		https://<VSD_IP_Address>:8443/

3. Log in with the default credentials:  

		User Name: Csproot 
		Password: csproot 
		Organization: csp 
		VSD Server : auto 

4. Create a user for Plugin Login: 

		Created user: OSadmin password: OSadmin 
		Granted Groups "CMS Group" 
		License: ( temp license info ) review DCN Bits and license setup Pending 

5. Apply the License

	a. From VSD Dashboard, click the **Open VSP Configuration** tab on the top right corner of the dashboard.  

	b. Click the **Licenses** tab and click **+**. 

	c. Copy and paste the license you received from HP Networks customer support representative into the field.


## Next step {#nextstep}

[Create the VSC Node](/helion/openstack/carrier/install/vsc-node/)

<!--
* [Installing and configuring on a KVM hypervisor](/helion/openstack/1.1/install/kvm)
* [Installing and configuring on an ESX hypervisor](/helion/openstack/1.1/install/esx/)
-->

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---
