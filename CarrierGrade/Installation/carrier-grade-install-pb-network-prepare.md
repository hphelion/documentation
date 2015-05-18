---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Preparing the Network for Installation"
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



# HP Helion OpenStack&#174; Carrier Grade (Beta): Preparing the Network for Installation 

Before installing HP Helion OpenStack Carrier Grade, you are responsible for preparing the network for all installations. 

1. On the KVM host, change to the `/root/infra-ansible-playbooks/roles/HLM-CFG/` directory.

		cd /root/infra-ansible-playbooks/roles/HLM-CFG/

2. Create `br-pxe` bridge and virtual network by running:

		ansible-playbook -i hosts hlm-kvm-pre-req.yml

	This will create an extra file under `/etc/network/`.  


3. Verify the interfaces file has four networks: `br-bls`, `br-pxe`, `br-clm`, `br-dcm`.

4. Execute  the following command to make sure the `br-pxe` interface was assiged an IP address:

		ifconfig br-pxe

	Execute the following command if the `br-pxe` interface does not have in IP address:

		Ifdown br-pxe
		Ifdown << yourinterface >>
		Ifup br-pxe
		Ifup << yourinterface >>


5. Run the following command to make sure the `br-pxel` interface has the IP address that was earlier set to the primary interface:

		ifconfig | more

6. Reboot the setup.

7. Run the following command to make sure `br-pxe` has the IP address that was earlier set to the primary interface and primary interface does not have an IP address.

		`ifconfig | more`

8. Use the following command to view the results of the routing configuration:

		route -n
 
	The routing table should appear similar to the following:

	<img src="media/CGH-install-route-table.png" />

## Next Step

[Create the HLM Virtual Machine](/helion/openstack/carrier/install/pb/hlm-vm/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---


