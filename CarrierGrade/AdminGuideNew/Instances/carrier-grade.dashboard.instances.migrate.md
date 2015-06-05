---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Resizing Instances"
permalink: /helion/commercial/carrier/dashboard/managing/instances/migrate/live/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Live Migrate an Instance

Users can live migrate an instance as needed.

Migration enables an administrator to move a virtual-machine instance from one compute host to another. This feature is useful when a compute host requires maintenance. Migration can also be useful to redistribute the load when many VM instances are running on a specific physical machine. 

Live migration requires almost no downtime and is useful when the instances must be kept running during the migration. For more information, see [Live Migration of Virtual Machines](/helion/commercial/carrier/dashboard/managing/instances/live/migrate/).

If you do not need to live migrate an instance, you can [cold migrate](/helion/commercial/carrier/dashboard/managing/instances/migrate/cold/) the instance instead.


## Migrate an instance on an hLinux server

Instances on hLinux servers can be migrated to another instance as follows.

To migrate an instance:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **Instances** link.

3. In the **Instances** screen, for the instance you want to migrate, click the arrow icon in the **Actions** menu and select **Migrate Instance**.

3. In the **Instances** screen, for the instance you want to migrate, click the arrow icon in the **Actions** menu and select **Live Migrate Instance**.

	Specify the target compute node for the migration. The default value is to auto-schedule the virtual machine following the current scheduling guidelines and constraints. Optionally, you can manually select the target compute node.

	Note that the set of available target compute nodes for the migration is still subject to the scheduler constraints from the virtual machine flavor and other systems options that might be in place.

4. Select **Disk Over Commit** to use the Overcommit feature. 

	Dick Overcommit allows you to overcommit CPU and RAM on compute nodes. This allows you to increase the number of instances you can have running on your cloud, at the cost of reducing the performance of the instances. The Compute service uses the following ratios by default:

	* CPU allocation ratio: 16:1
	* RAM allocation ratio: 1.5:1 

5. Select **Block Migration** to use the KVM live block migration feature where the instance is migrated over TCP and no local storage is required.

6. Click **Live Migrate Instance**.

## Migrate an instance on a Wind River Linux server

Instances on Wind River Linux servers can be migrated to a specific instance.

To migrate an instance:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **Instances** link.

3. In the **Instances** screen, for the instance you want to migrate, click the arrow icon in the **Actions** menu and select **Live Migrate Instance**.

	Specify the target compute node for the migration. The default value is to auto-schedule the virtual machine following the current scheduling guidelines and constraints. Optionally, you can manually select the target compute node.

	Note that the set of available target compute nodes for the migration is still subject to the scheduler constraints from the virtual machine flavor and other systems options that might be in place.

<p><a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>


----
