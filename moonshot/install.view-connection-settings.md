---
layout: default
title: "View Connection Settings"
permalink: /cloudos/moonshot/install/view-connection-settings/
product: moonshot

---


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/install/admin-node-prerequisites/">&#9664; PREV</a> | <a href="/cloudos/moonshot/install/">&#9650; 
UP</a> | <a href="/cloudos/moonshot/install/customize-networks/">NEXT &#9654;</a> </p>

# View Connection Settings

The <b>Environment</b> > <b>Connections</b> panel is informational only. The values are read only. With HP Helion Cloud OS for Moonshot environments, the values are already defined for you:

* Network mode: dual.  Dual mode means that all the connections have their own interfaces, where VLAN and bridge are off.

* Logical Interface values:
 * intf0 (admin)
 * intf1 (nova_flat)
 * intf2 (ipmi, public)
 
* Physical Interface values:
 * 1Gb (preferred) on 1st port
 * 1Gb (preferred) on 2nd port
 * 1Gb (preferred) on 3rd port
 
In this case, <b>1Gb (preferred) on 2nd port</b> means a one gigabit network for port 2, as enumerated by default from the server's BIOS or as overridden in the Server Types panel. The "preferred" tag suggests that if the NIC/port does not support 1Gb, HP Helion Cloud OS for Moonshot falls back to the next maximum speed supported by the NIC or port. 

## Next Step

Proceed to the [Customize Networks](/cloudos/moonshot/install/customize-networks/) topic.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
