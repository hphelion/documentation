---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Deploying the HLM and DCN Clouds"
permalink: /helion/openstack/carrier/install/pb/hlm-cloud/
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

<p style="font-size: small;"><a href="/helion/openstack/carrier/install/pb/workarounds/">&#9664; HLM Post-Installation Tasks</a> | <a href="/helion/openstack/carrier/install/pb/overview/">&#9650; Installation Overview</a> | <a hrf="/helion/openstack/carrier/install/pb/verify/">Verifying the HLM and DCN Installation &#9654;</a></p> 

# HP Helion OpenStack&#174; Carrier Grade (Beta): Deploying the HLM and DCN Clouds 

At this point, the HLM VM is up and running.

Use the following steps to create three controller nodes, two compute nodes, a DCN Node and a VRS-G nodes.

Use the following steps:

1. Deploy and configure the cloud services using the following command:

		hdeploy <cloudname> 

	You can run this command from anywhere. This process might approximatley three hours to install all seven nodes in a baremetal setup with LDAP enabled.

When this command completes successfully, there are three controller nodes, two compute nodes, one DCN Node and one VRS-G nodes deployed as shown in the networking topology.

<a href="javascript:window.open('/content/documentation/media/CGH-architecture-beta.png','_self','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><img src="media/CGH-architecture-beta.png" width="750" /></a>
<br>Click to view larger image; click **Back** to return.


## Next Step

[Verify the Installation](/helion/openstack/carrier/install/pb/verify/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---
