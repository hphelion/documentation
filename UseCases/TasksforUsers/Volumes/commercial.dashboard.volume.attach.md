---
layout: default
title: "HP Helion OpenStack&#174; Attaching and Detaching Volume Instances"
permalink: /helion/commercial/dashboard/managing/volume/attach/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/commercial/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/ga1/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&#174; Attaching and Detaching Volume Instances

After you've created one or more volumes, you can attach them to instances, one instance at a time.</p>

### Attach a volume to an instance ###

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the <strong>Compute</strong> tab on the dashboard <strong>Project</strong> panel.</p>

3. In the <strong>Compute</strong> panel, click <strong>Volumes</strong>.</p>

4. Select the volume to add to an instance and click <strong>Edit Attachments</strong>.</p>

5. In the <strong>Manage Volume Attachments</strong> dialog box, select an instance.</p>

6. Enter the name of the device from which the volume is accessible by the instance. (<strong>Note:</strong> The actual device name might differ from the volume name because of hypervisor settings.)</p>

7. Click <strong>Attach Volume</strong>.</p>

The dashboard shows the instance to which the volume is now attached and the device name. You can view the status of a volume in the Volumes tab of the dashboard. The volume is either Available or In-use. Now you can log in to the instance and mount, format, and use the disk.</p>

### Detach a volume from a VM instance ###

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the <strong>Compute</strong> tab on the dashboard <strong>Project</strong> panel.</p>

3. In the <strong>Compute</strong> panel, click <strong>Volumes</strong>.</p>

4. Select the volume you want to detach and click <strong>Edit Attachments</strong>.</p>

5. Click <strong>Detach Volume</strong> to confirm your changes.</p>

<p><a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*