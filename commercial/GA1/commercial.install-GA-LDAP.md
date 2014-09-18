---
layout: default
title: "HP Helion OpenStack: Intergrating LDAP"
permalink: /helion/openstack/ga/install/ldap/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/helion/openstack/install-beta/prereqs/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/vsa/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&reg;: Integrating LDAP


## Prerequisites ## {#pre}

1 LDAP server is up and running in a network accessible from the overcloud.

2. The following users need to be created on the LDAP server and their passwords must be set in accordance with the current LDAP server policy.

<table style="text-align: left; vertical-align: top; width:650px;">
	
<tr style="background-color: lightgrey; color: black;">
<td><b> Username </b></td><td><b>Password</b></td>

<tr style="background-color: white; color: black;">
<tr><td>admin</td<td>SomeValidPassword</td></tr>
<tr><td>ceilometer</td<td>SomeValidPassword</td></tr>
<tr><td>cinder</td<td>SomeValidPassword</td></tr>
<tr><td>demo</td<td>SomeValidPassword</td></tr>
<tr><td>ec2</td<td>SomeValidPassword</td></tr>
<tr><td>glance</td<td>SomeValidPassword</td></tr>
<tr><td>heat</td<td>SomeValidPassword</td></tr>
<tr><td>neutron</td<td>SomeValidPassword</td></tr>
<tr><td>nova</td<td>SomeValidPassword</td></tr>
<tr><td>sherpa</td<td>SomeValidPassword</td></tr>
<tr><td>swift</td<td>SomeValidPassword</td></tr>
</table>

## Generate configuration files ## {#config}

Create the following two files:

1. tripleo-overcloud-passwords

	This file contains the password for all the services users created on the LDAP server. The password for each user should be the password that was specified when creating the user on the LDAP server.

		tripleo-overcloud-passwords file for openLDAP test server:

		VERCLOUD_ADMIN_PASSWORD=<password>
		OVERCLOUD_CEILOMETER_PASSWORD=<password>
		OVERCLOUD_CINDER_PASSWORD=<password>
		OVERCLOUD_DEMO_PASSWORD=<password>
		OVERCLOUD_EC2_PASSWORD=<password>
		OVERCLOUD_GLANCE_PASSWORD=<password>
		OVERCLOUD_HEAT_PASSWORD=<password>
		OVERCLOUD_NEUTRON_PASSWORD=<password>
		OVERCLOUD_NOVA_PASSWORD=<password>
		OVERCLOUD_SHERPA_PASSWORD=<password>
		OVERCLOUD_SWIFT_PASSWORD=<password>

		tripleo-overcloud-passwords file for AD-LDAP test server:

		OVERCLOUD_ADMIN_PASSWORD=Passw0rd
		OVERCLOUD_CEILOMETER_PASSWORD=Passw0rd
		OVERCLOUD_CINDER_PASSWORD=Passw0rd
		OVERCLOUD_DEMO_PASSWORD=Passw0rd
		OVERCLOUD_EC2_PASSWORD=Passw0rd
		OVERCLOUD_GLANCE_PASSWORD=Passw0rd
		OVERCLOUD_HEAT_PASSWORD=Passw0rd
		OVERCLOUD_NEUTRON_PASSWORD=Passw0rd
		OVERCLOUD_NOVA_PASSWORD=Passw0rd
		OVERCLOUD_SHERPA_PASSWORD=Passw0rd
		OVERCLOUD_SWIFT_PASSWORD=Passw0rd

	The file must end with a carriage return.  TripleO will add lines to the end of the file so if the carriage return is missing, new content will be added to the end of the last line and will be ignored.


2. overcloud_keystone_ldap.json

	This file contains the LDAP server connection settings.  The content of the file will be transparently propagated in /etc/keystone/keystone.conf on each of the overcloud controller node. Therefore, it must be a well-formed, syntax-error free json file.

	The following options must be set with proper values to provide integration with the LDAP server:

	<tr style="background-color: white; color: black;">
	<tr><td>admin</td<td>SomeValidPassword</td></tr>

		Name
    	
    Description
    	
    AD/LDAP Default Values
    	
    OpenLDAP Default Values
    [identity]
    driver	(StrOpt) Identity backend driver.	keystone.identity.backends.ldap.Identity	keystone.identity.backends.ldap.Identity
    [assignment]
    driver	(StrOpt) Assignment backend driver.	keystone.assignment.backends.sql.Assignment	keystone.assignment.backends.sql.Assignment
    [ldap]
    group_id_attribute	(StrOpt) LDAP attribute mapped to group id.	cn	cn
    group_name_attribute	(StrOpt) LDAP attribute mapped to group name.	cn	cn
    group_objectclass	(StrOpt) LDAP objectclass for groups.	group	posixGroup
    group_tree_dn	(StrOpt) Search base for groups.	CN=Users,DC=hpswlabs,DC=apps,DC=hp,DC=com	ou=groups,dc=hpswlabs,dc=apps,dc=hp,dc=com
    group_allow_create	(BoolOpt) Allow group creation in LDAP backend.	False	False
    group_allow_delete	(BoolOpt) Allow group deletion in LDAP backend.	False	False
    group_allow_update	(BoolOpt) Allow group update in LDAP backend.	False	False
    suffix	(StrOpt) LDAP server suffix	DC=hpswlabs,DC=apps,DC=hp,DC=com	dc=hpswlabs,dc=apps,dc=hp,dc=com
    url	(StrOpt) URL for connecting to the LDAP server.	ldap://10.1.5.221	ldap://10.1.5.208
    user_allow_create	(BoolOpt) Allow user creation in LDAP backend.	False	False
    user_allow_delete	(BoolOpt) Allow user deletion in LDAP backend.	False	False
    user_allow_update	(BoolOpt) Allow user updates in LDAP backend.	False	False
    user_id_attribute	(StrOpt) LDAP attribute mapped to user id.	cn	uid
    user_name_attribute	(StrOpt) LDAP attribute mapped to user name.	cn	uid
    user_objectclass	(StrOpt) LDAP objectclass for users.	user	person
    user_tree_dn	(StrOpt) Search base for users.	CN=Users,DC=hpswlabs,DC=apps,DC=hp,DC=com	ou=people,dc=hpswlabs,dc=apps,dc=hp,dc=com
    user	(StrOpt) User BindDN to query the LDAP server.	CN=Administrator,CN=Users,DC=hpswlabs,DC=apps,DC=hp,DC=com	Not Required
    password	(StrOpt) Password for the BindDN to query the LDAP server.	Passw0rd	Not Required
    use_tls	(BoolOpt) Enable TLS for communicating with LDAP servers.	False	False
    tls_req_cert	(StrOpt) Valid options for tls_req_cert are demand, never, and allow.	never	never
    use_pool	(BoolOpt) Enable LDAP connection pooling. 	True	

    True
    user_enabled_attribute	(StrOpt) LDAP attribute mapped to user enabled flag.	userAccountControl	Not required
    user_enabled_mask	(IntOpt) Bitmask integer to indicate the bit that the enabled value is stored in if the LDAP server represents "enabled" as a bit on an integer rather than a boolean. A value of "0" indicates the mask is not used. If this is not set to "0" the typical value is "2". This is typically used when "user_enabled_attribute = userAccountControl".	2	Not required
    user_enabled_default	(StrOpt) Default value to enable users. This should match an appropriate int value if the LDAP server uses non-boolean (bitmask) values to indicate if a user is enabled or disabled. If this is not set to "True" the typical value is "512". This is typically used when "user_enabled_attribute = userAccountControl".	512	Not required
    user_mail_attribute	(StrOpt) LDAP attribute mapped to user email.	userPrincipalName	Not required

	</table>
 

Sample overcloud_keystone_ldap.json configuration file for openLDAP server
 Expand source


Sample overcloud_keystone_ldap.json configuration file for AD server
 Expand source

 
Step 2: Installation

On the seed VM, perform the following:

1. Copy the tripleo-overcloud-password file to the /root/tripleo folder.

		scp tripleo-overcloud-passwords root@192.0.2.1:/root/tripleo/tripleo-overcloud-passwords

2. Copy the overcloud_keystone_ldap.json file to the /root/tripleo/hp_passthrough folder.

		scp overcloud_keystone_ldap.json root@192.0.2.1:/root/tripleo/hp_passthrough/overcloud_keystone_ldap.json

Follow the steps described on the Quick Start Install wiki page to deploy the overcloud nodes.

## Configuring Horizon ## {#horizon}

1. Enable LDAP user login.

	Before a user can successfully login, they must assigned to a project.  Therefore a user with admin privileges must create one or more projects and associate each user to a project.

2. Disable CRUD (Create/Update/Delete) operations on users for a read-only identity backend on all three overcloud controller nodes.

	a. Determine the location of local_settings.py

	In the file `/etc/apache2/sites-available/horizon.conf`, look for the path associated with `DocumentRoot`. In that path, replace `static` with `local`.  This will be the folder that contains the file `local_settings.py`.

	For example,
 
		<VirtualHost *:80>    
		WSGIScriptAlias / /opt/stack/venvs/openstack/lib/python2.7/site-packages/openstack_dashboard/wsgi/django.wsgi    
		WSGIDaemonProcess horizon user=horizon group=horizon processes=3 threads=10 home=/opt/stack/venvs/openstack python-path=/opt/stack/venvs/openstack:/opt/stack/venvs/openstack/lib/python2.7/site-packages/    
		WSGIApplicationGroup %{GLOBAL}
		
		SetEnv APACHE_RUN_USER horizon    
		SetEnv APACHE_RUN_GROUP horizon    
		WSGIProcessGroup horizon
		
		DocumentRoot /opt/stack/venvs/openstack/lib/python2.7/site-packages/openstack_dashboard/static    
		Alias /static /opt/stack/venvs/openstack/lib/python2.7/site-packages/openstack_dashboard/static    
		Alias /media /opt/stack/venvs/openstack/lib/python2.7/site-packages/openstack_dashboard/static
		
		....

	Using the above sample horizon.conf file, the path to `local_settings.py` is `/opt/stack/venvs/openstack/lib/python2.7/site-packages/openstack_dashboard/local`.

	b. Modify local_settings.py to disallow editing of users and groups.

	Change
		OPENSTACK_KEYSTONE_BACKEND = {
			'name': 'native',
			'can_edit_user': True,
			'can_edit_group': True,
			'can_edit_project': True,
			'can_edit_domain': True,
			'can_edit_role': True
	
	to

		OPENSTACK_KEYSTONE_BACKEND = {
			'name': 'native',
			'can_edit_user': False,
			'can_edit_group': False,
			'can_edit_project': True,
			'can_edit_domain': True,
			'can_edit_role': True


	c. Restart apache.

		service apache2 restart

 

 