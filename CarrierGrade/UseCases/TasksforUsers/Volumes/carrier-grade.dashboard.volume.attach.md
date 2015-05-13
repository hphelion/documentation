---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Attaching and Detaching Volume Instances"
permalink: /helion/commercial/carrier/dashboard/managing/volume/attach/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Attaching and Detaching Volume Instances

After you've created one or more volumes, you can attach them to instances, one instance at a time.

You can view the status of a volume in the Volumes tab of the dashboard. The volume is either **Available** or **In-Use**. You can attach any volume that is available to an instance.

### Attach a volume to an instance ###

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Project** dashboard, then the **System** panel, then the **Volumes** link.

4. In the **Volumes** screen, for the volume you want to attach, click the arrow icon in the **Actions** menu and select **Edit Attchments**.

5. In the **Manage Volume Attachments** dialog box, select an instance.

6. Enter the name of the device from which the volume is accessible by the instance. (**Note:** The actual device name might differ from the volume name because of hypervisor settings.)

7. Click **Attach Volume**.

The dashboard shows the volume is In-Use and lists the instance to which the volume is now attached. You can now log in to the instance and mount, format, and use the disk. 

**Note:** Not all of the **Action** menu items are available for an attached volume.

### Detach a volume from a VM instance ###

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Project** dashboard, then the **System** panel, then the **Volumes** link.

4. In the **Volumes** screen, for the volume you want to detach, click the arrow icon in the **Actions** menu and select **Edit Attchments**.

5. Click **Detach Volume** to confirm your changes.

The dashboard shows the volume is available.

<p><a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>


----
