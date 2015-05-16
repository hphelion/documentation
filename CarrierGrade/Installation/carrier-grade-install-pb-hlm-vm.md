---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Create the HLM Virtual Machine"
permalink: /helion/openstack/carrier/install/pb/hlm-vm/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"><a href="/helion/openstack/carrier/install/pb/network/prepare/">&#9664; Preparing the Network for Installation</a> | <a href="/helion/openstack/carrier/install/pb/overview/">&#9650; Installation Overview</a> | <a href="/helion/openstack/carrier/install/pb/hlm-vm/"> Create the HLM Virtual Machine &#9654;</a> </p> 



# HP Helion OpenStack&#174; Carrier Grade (Beta):  Create the HLM Virtual Machine

Helion Lifecycle Management (HLM) consists of the ongoing operations/maintenance as well as the initial deployment of the HP Helion OpenStack Carrier Grade system.

1. On the KVM host, change to the `/root/infra-ansible-playbooks/roles/HLM-CFG/` directory.

		cd /root/infra-ansible-playbooks/roles/HLM-CFG/

2. Execute the `setup_hlm_onBM.yml` file.

		ansible-playbook -i hosts setup_hlm_onBM.yml

3. Provision and configure your HLM VM.

		ansible-playbook -i hosts setup_hlm_onBM_ovs.yml

	This command also creates the VSD VM.

3. Use the following command to verify that the HLM VM has been created:

		virsh list

	The output should appear similar to the following image:

	<img src="/media/CGH-install-pb-hlm-node.png" />

4. Use the following command to launch a console session to the HLM VM: 

	virsh console hlm 

	Use the following credentials:

	* Username: `root`
	* Password: `cghelion`

	If the console does not launch, wait for a few minutes to allow the VM to fully boot up.

5. Use the console to obtain the IP address for the eth0 interface: 

		ifconfig eth0

7. Use the following command to exit the console:

		ctrl ]

## Next Step

[Create the HLM Virtual Machine](/helion/openstack/carrier/install/pb/hlm-vm/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---


