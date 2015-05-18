---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): HLM Post-Installation Tasks"
permalink: /helion/openstack/carrier/install/pb/workarounds/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"><a href="/helion/openstack/carrier/install/pb/hlm-vm/">&#9664; Create the HLM Virtual Machine</a> | <a href="/helion/openstack/carrier/install/pb/overview/">&#9650; Installation Overview</a> | <a href="/helion/openstack/carrier/install/pm/hlm-cloud/"> Deploying the HLM and DCN Clouds &#9654;</a> </p> 



# HP Helion OpenStack&#174; Carrier Grade (Beta): HLM Post-Installation Tasks

After the HLM VM has been created, perform the following tasks before proceeding.

### Configuring the FND-FIN role for the DCN cloud

Comment following services in `~/<cloud-name>/clouds/<cloud-name>/001/stage/ansible /roles/FND-FIN/tasks/main.yml` before you run `hdeploy`

	neutron-l3-agent
	neutron-dhcp-agent
	neutron-metadata-agent
	neutron-plugin-openvswitch-agent

## Enable logging for the hdeloy - ansible-playbook

Copy the `ansible.cfg` to the `~/<cloud-name>/clouds/<cloud-name>/001/stage/ansible/` directory before executing `hdeploy`.

### Configure the LDP-CCN and LDP-CPN roles

To make sure that the LDP-CCN and LDP-CPN roles are created when LDAP integration is enabled.

Remove the double quotes in the `definition.json` file for the `ldap_enabled` variable. 

	"ldap_enabled": 1     

## Next Step

[Deploying the HLM and DCN Clouds](/helion/openstack/carrier/install/pm/hlm-cloud/)


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
