---
layout: default
title: "HP Helion OpenStack&#174; Creating Users"
permalink: /helion/commercial/dashboard/managing/users/create/
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

# HP Helion OpenStack&#174; Creating and Deleting Users

As an admin, you can [create](#createuser) and [delete](#deleteuser) users. </p>

### Create a user ### {#createuser}

To create a user:</p>

**Note:** At least [one project must exist](/helion/commercial/dashboard/managing/projects/) before you can create users.</p>

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the <strong>Users</strong> link on the <strong>Admin</strong> dashboard <strong>Identity</strong> panel.</p>

3. In the <strong>Users</strong> screen, click <strong>Create User</strong>.</p>

4. In the <strong>Create User</strong> screen, enter the following:</p>

	* User Name - Enter a name for the user. The user will need this name to log in.</li>
	* Email - Enter an email associated with this user.</li>
	* Password - Enter a password for the user. The user will need the password to log in.</li>
	* Confirm Password - Re-enter the password to confirm.</li>
	* Primary Project - Select a primary project for the user. The primary project is simply the first project the user is associated with.</li>
	* Role - Select a role for the user. The role determines many of the tasks that the user can perform.</li>

5. Click <strong>Create User</strong>.</p>

	The user is created and appears in the user list.</p>

### Delete a user ### {#deleteuser}

To delete a user:</p>

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the <strong>Users</strong> link on the <strong>Admin</strong> dashboard <strong>Identity</strong> panel.</p>

3. In the <strong>Users</strong> screen, for the user you want to deleite, click <strong>More &gt; Delete User</strong>.</p>

4. In the confirmation dialog that appears, click <strong>Delete User</strong>.</p>

	The user is removed and no longer available in the domain.</p>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*