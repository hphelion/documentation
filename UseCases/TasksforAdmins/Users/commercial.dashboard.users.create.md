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
<p style="font-size: small;"> <a href="/helion/commercial/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/ga1/">NEXT &#9654;</a> 
-->

# HP Helion OpenStack&#174; Creating and Deleting Users

As an admin, you can [create](#createuser) and [delete](#deleteuser) users. 

### Create a user ### {#createuser}

To create a user:

**Note:** At least [one project must exist](/helion/commercial/dashboard/managing/projects/) before you can create users.

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/1.1/dashboard/login/).

2. Click the Users link on the Admin dashboard Identity panel.

3. In the Users screen, click Create User.

4. In the Create User screen, enter the following:

	* User Name - Enter a name for the user. The user will need this name to log in.</li>
	* Email - Enter an email associated with this user.</li>
	* Password - Enter a password for the user. The user will need the password to log in.</li>
	* Confirm Password - Re-enter the password to confirm.</li>
	* Primary Project - Select a primary project for the user. The primary project is simply the first project the user is associated with.</li>
	* Role - Select a role for the user. The role determines many of the tasks that the user can perform.</li>

5. Click Create User.

	The user is created and appears in the user list.

### Delete a user ### {#deleteuser}

To delete a user:

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/1.1/dashboard/login/).

2. Click the Users link on the Admin dashboard Identity panel.

3. In the Users screen, for the user you want to deleite, click More &gt; Delete User.

4. In the confirmation dialog that appears, click Delete User.

	The user is removed and no longer available in the domain.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
