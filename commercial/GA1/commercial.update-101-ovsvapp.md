---
layout: default
title: "HP Helion OpenStack&#174;: Installation and Configuration"
permalink: /helion/openstack/update/ovsvapp/101/
product: commercial.ga

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/install/esx/">&#9664; PREV</a> | <a href="/helion/openstack/install-overview/">&#	9650; UP</a> | <a href="/helion/openstack/install/dnsaas/">NEXT &#9654;</a> </p>
-->
# HP Helion OpenStack&reg;: Updating OVSvApp on ESX hosts  

To update the OVSvApp from version 1.0 to version 1.01:

1. Make sure that DRS is enabled on the cluster on which 1.01 version of OVSvApp will be installed:

	a. In the vSphere client, select the cluster in the vSphere Client inventory.

	b. Right-click and select **Edit Settings**.

	c. In the left panel, select General, and make sure **Turn On vSphere DRS** is selected.

	d. Click **OK**.

	**Note:** DRS safeguards tenant VM traffic from being black-holed.

2. Disable vMotion from vSwitch properties. This won't let DRS to bring back VMs on the host when the host is brought back from maintenance mode as in Step 4.

	a. In the vSphere client, select the host in the vSphere Client inventory.

	b. On the **Configuration** tab, select **Networking**.  

	c. Click V**irtual Switch** to display the virtual switches for the host.
	
	d. Locate the virtual switch that has a VMkernel port group configured for vMotion, and click the **Properties** link.

	e. On the **Ports** tab, select the port group that is configured for vMotion and click **Edit**.

	f. On the **General** tab, clear the **Enabled** option for vMotion.

	g. Click **OK** to close the port group **Properties** dialog, and click **Close** to close the vSwitch **Properties** dialog. 

3. Place the ESX host on which the 1.01 version of OVSvApp will be installed into maintenance mode :

	In the vSphere Client, right click on the ESX host and select **Enter Maintenance mode**.

	All virtual machines on the host are migrated to different hosts when the host enters maintenance mode.

4. Exit maintenance mode.

	In the vSphere Client, right click on the ESX host and select **Exit Maintenance mode**.

5. Delete the OVSvApp appliance:

	a. Right-click the **OVSvApp VM**. 

	b. Select **Delete**.

6. On the controller, execute the following command to obtain the `ovsvapp_agent_id`.

		neutron agent-list 

	Note the ID.

7. On the controller, execute the following command to remove the entry from `neutron agent-list`.

		neutron agent-delete <ovsvapp_agent_id>

	**Where:**

	`<ovsvapp_agent_id>` is the OVSvApp ID obtained.

9. Install 1.01 version of OVSvApp VM on that ESX host using the `add_new_hosts` variable under the `new-host-addition` section in `ovs_vapp.ini` file

		add_new_hosts=True

10. Invoke the installer using the following commands:

		sudo su
		cd /hp-ovsvapp/src/installer/
		python invoke_vapp_installer.py

	The installation log file will be located at `/hp-ovsvapp/log/ovs_vapp.log`.

11. Re-enable vMotion on vSwitch properties of that ESX host.

	a. In the vSphere Client, right click on the ESX host.

	b. Click the **Configuration** tab.

	c. In the **Hardware** section, click **Networking**. 

	d. Click **Properties** for the virtual switch where a VMkernel port has been configured.

	e. In the dialog box that opens, select `vmkernel` in the **Ports** tab and click **Edit**. 

	f. Select **Enabled** next to vMotion.

	g. Click **OK**.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

