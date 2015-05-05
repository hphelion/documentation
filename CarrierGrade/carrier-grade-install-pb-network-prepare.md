---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Preparing the Network for Installation"
permalink: /helion/openstack/carrier/install/pb/network/prepare/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"><a href="/helion/openstack/carrier/install/pb/prereqs/">&#9664; Installation Prerequisites</a> | <a href="/helion/openstack/carrier/install/pb/overview/">&#9650; Installation Overview</a> | <a href="/helion/openstack/carrier/install/pb/hlm-vm/"> Create the HLM Virtual Machine &#9654;</a> </p> 



# HP Helion OpenStack&#174; Carrier Grade (Alpha): Preparing the Network for Installation 

Before installing HP Helion OpenStack Carrier Grade, you are responsible for preparing the network for all installations. 

1. On the KVM host, change to the `/root/infra-ansible-playbooks/roles/HLM-CFG/` directory.

		cd /root/infra-ansible-playbooks/roles/HLM-CFG/

2. Update `/root/infra-ansib1le-playbooks/group_vars/all` file to specify the location of your `libvirt` images folder. 

		imagelocation=<libvirt_images_folder_location>

3. Edit the `\ansible-playbooks\roles\HLM-PRE-REQ\defaults\main.yml` file to specify the KVM host primary interface IP under, in case of Static IP on KVM Host

4. Check hosts file under /root/infra-ansible-playbooks, make sure your hlm_kvm_host ip is correct

		[hlm_kvm_host]

		192.168.122.1

5. Create `br-ctl` bridge and virtual network by running:

		ansible-playbook -i hosts hlm-kvm-pre-req.yml

	This will drop an extra file under `/etc/network/`.  

6. Use the iLO console interface to perform one of the following:

	* If your KVM host has a DHCP IP, edit the `dhcpipinterface` file as needed, and save the file as `interfaces`.
	
	* If your KVM host has a STATIC IP, edit the `staticipinterface` file as needed, and save the file as `interfaces`.

7. Use the `ifconfig -a` command to output OVS bridge details. If the bridge is not present, execute the following commands to restart the bridge:

		ifdown br-ctl
		ifdown << yourinterface >>
		ifup br-ctl
		ifup << yourinterface >>

8. Run the following command to make sure `br-ctl` has the IP address that was earlier set to the primary interface.

		`ifconfig | more`

9. Reboot the setup.

10. Run the following command to make sure `br-ctl` has the IP address that was earlier set to the primary interface and primary interface does not have an IP address.

		`ifconfig | more`

11. Use the following command to view the results of the routing configuration:

		route -n
 
	The routing table should appear similar to the following:

	<img src="media/CGH-install-route-table.png" />

## Next Step

[Create the HLM Virtual Machine](/helion/openstack/carrier/install/pb/hlm-vm/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---


