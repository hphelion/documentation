---
layout: default
title: "HP Helion OpenStack&#174; Creating Instance Snapshots"
permalink: /helion/commercial/dashboard/managing/snapshots/create/
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

# HP Helion OpenStack&#174; Creating an Instance Snapshot

A snapshot is a new image based on a running instance. That snapshot can be used as the base for new instances. </p>

### Creating a snapshot ###

To create a snapshot:</p>

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the <strong>Instances</strong> link on the <strong>Project</strong> dashboard <strong>Compute</strong> panel.</p>

3. In the <strong>Instances</strong> screen, for the instance you want to create a snapshot, click <strong>Create Snapshot</strong>.</p>

4. On the <strong>Create Snapshot</strong> tab, enter a name for the snapshot.</p>

5. Click <strong>Launch</strong> to launch the instance.</p>

	A snapshot image is created on the <strong>Images</strong> link.</p>

When you create a snapshot, by default the snapshot image can be used only with the current project and it can be deleted.</p>

You can [make the snapshot public](/helion/commercial/dashboard/managing/images/public/) for use in all projects in the domain and you can [protect the image](/helion/commercial/dashboard/managing/images/protect/) from being deleted. </p>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*