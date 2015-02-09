---
layout: default
title: "HP Helion OpenStack&#174; Installation Prerequisites"
permalink: /helion/openstack/install/post-esx/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"><a href="/helion/openstack/install/esx"> &#9664; Installing on an ESX hypervisor </a> | <a href="/helion/openstack/install/overview/test/">&#9650; Installation Overview</a>  </p> 


# HP Helion OpenStack&#174;: Post-Installation for ESX Hypervisor

- Deploy vCenter ESX Compute Proxy **(REQUIRED)**

	The HP Helion OpenStack vCenter ESX compute proxy is a driver that enables the Compute service to communicate with a VMware vCenter server that manages one or more ESX hosts. The HP Helion OpenStack Compute service (Nova) requires this driver to interface with VMWare ESX hypervisor APIs.

	See [Deploy vCenter ESX compute proxy](/helion/openstack/install/esx/proxy/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---
