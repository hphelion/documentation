---
layout: default
title: "HP Helion OpenStack Commercial Managing Domains"
permalink: /helion/commercial/dashboard/managing/domains/
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

# HP Helion OpenStack&#174;  Managing the Domain</h1>

A domain is a high-level container for the projects, users, and groups that define administrative boundaries for management of those entities. A domain can represent an individual, company, or operator-owned space.</p>

The admin user can use the dashboard to configure the domain by creating building blocks such as flavors and quotas, and managing availability zones and host aggregates.	</p>

### Managing flavors for a domain</h3>

A flavor defines the compute, memory, and storage capacity of a virtual server that users can launch. As an administrative user, you can create, edit, and delete flavors.</p>

Use the System panel on the Admin dashboard to:</p>

* [Create, modify, and delete flavors](/helion/commercial/dashboard/managing/flavors/)
* [Modify access to a flavor](/helion/commercial/dashboard/managing/flavors/access/)
</ul>

### Managing images for a domain ###

A virtual machine image is a single file which contains a virtual disk that has a bootable operating system installed on it.</p>

As an admin, you can determine if an image is available only in the current project or to all projects in the domain (public).</p>

* [Make an instance snapshot public](/helion/commercial/dashboard/managing/snapshots/public/)

### Managing Availability Zone and Host Aggregates for a domain</h3>

Host aggregates are a mechanism to further partition an availability zone. Host aggregates provide a mechanism to allow administrators to assign key-value pairs to groups of machines. </p>

Use the <strong>System</strong> panel in the <strong>Admin</strong> dashboard to modify the availability zones and aggregates for your domain.</p>

* [Create, modify, delete host aggregates](/helion/commercial/dashboard/managing/aggregates/)

<!-- not in Community
### Enabling and disabling services ###

Use the Admin dashboard to enable and disable services in a domain.
-->
<p><a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*