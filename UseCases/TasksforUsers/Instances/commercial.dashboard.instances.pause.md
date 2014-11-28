---
layout: default
title: "HP Helion OpenStack&#174; Pausing Instances"
permalink: /helion/commercial/dashboard/managing/instances/pause/
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

# HP Helion OpenStack&#174; Pausing and Un-pausing Instances

When a user <em>pauses</em> an instance, the instance  remains running, but, in a frozen state. The contents of the instance are stored in memory (RAM). Memory and vCPUs are not released.</p>

Users can suspend an instance, for example, in order to make a back up of an instance to prevent the instance  from being used during the process.</p>


**Note:** Pausing is different from <a href="/helion/commercial/dashboard/managing/instances/suspend/">suspending an instance</a>. Suspending stops the instance, stores the contents on the disk. the memory and vCPUs become available to create other instances.  
</p>

### Pause an instance ###

To pause an instance:</p>

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the <strong>Instances</strong> link on the <strong>Project</strong> dashboard <strong>Compute</strong> panel.</p>

3. In the <strong>Instances</strong> screen, for the instance you want to modify, click <strong>More &gt; Pause Instance</strong>.</p>
<p>The status of the instance reports <em>Paused</em>. </p>

4. Note that many of the commands on the <strong>More</strong> menu are not available for a paused instance.</p>

### Un-pause an instance ###

To unpause an instance:</p>

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the <strong>Instances</strong> link on the <strong>Project</strong> dashboard <strong>Compute</strong> panel.</p>

3. In the <strong>Instances</strong> screen, for the instance you want to modify, click <strong>More &gt; Resume Instance</strong>.</p>

	Note that all of the commands on the <strong>More</strong> menu are available.</p>

<p><a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*