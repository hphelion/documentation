---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Cold Migrate an Instance"
permalink: /helion/commercial/carrier/dashboard/managing/instances/migrate/cold/
product: carrier-grade

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/commercial/carrier/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/carrier/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/carrier/ga1/">NEXT &#9654;</a></p> -->

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Cold Migrate an Instance

Users can migrate or live migrate an instance as needed.

Migration enables an administrator to move a virtual-machine instance from one compute host to another. This feature is useful when a compute host requires maintenance. Migration can also be useful to redistribute the load when many VM instances are running on a specific physical machine. 

Cold migration causes the instance to be shut down for a period of time to be moved to another hypervisor. In this case, the instance recognizes that it was rebooted.

* Live migration. Almost no downtime. Useful when the instances must be kept running during the migration. For more information, see [Live Migration of Virtual Machines](/helion/commercial/carrier/dashboard/managing/instances/live/migrate/).

## Migrate an instance on an hLinux server

Instances on hLinux servers can be migrated

To migrate an instance:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **Instances** link.

3. In the **Instances** screen, for the instance you want to migrate, click the arrow icon in the **Actions** menu and select **Migrate Instance**.

4. In the **Confirm Migrate Instance** screen, select **Migrate Instance**. 



## Migrate an instance on a Wind River Linux server

Instances on Wind River Linux servers can be migrated

To migrate an instance:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **Instances** link.

3. In the **Instances** screen, for the instance you want to migrate, click the arrow icon in the **Actions** menu and select **Cold Migrate Instance**.

4. In the **Confirm Cold Migrate Instance** screen, select **Cold Migrate Instance**. 

The migrated instance is listed.

<p><a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>
