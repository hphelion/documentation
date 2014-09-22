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

	<table style="text-align: left; vertical-align: top; width:650px;">
	<tr style="background-color: lightgrey; color: black;">
	<td><b> Username </b></td><td><b>Password</b></td><td><b> AD/LDAP Default values </b></td><td><b>OpenLDAP default values</b></td>
	</tr>
	<tr>
	<td>[identity]</td><td> </td><td> </td><td> </td>
	</tr>
	<tr>
	<td>driver</td><td>(StrOpt) Identity backend driver</td><td>keystone.identity.backends.ldap.Identity</td><td>keystone.identity.backends.ldap.Identity
	</tr>
	<tr>
	<td>[assignment]</td><td> </td><td> </td><td> </td>
	</tr>
	<tr>
	<td>driver</td><td>(StrOpt) Assignment backend driver</td><td>	keystone.assignment.backends.sql.Assignment</td><td>keystone.assignment.backends.sql.Assignment</td>
	</tr>
	<tr>
	<td>[ldap]</td><td> </td><td> </td><td> </td>
	</tr>
	<tr>
	<td>group_id_attribute</td><td>(StrOpt) LDAP attribute mapped to group id.</td><td>cn</td><td>cn</td>
	</tr>
	<tr>
	<td>group_name_attribute</td><td>(StrOpt) LDAP attribute mapped to group name.</td><td>cn</td><td>cn</td>
	</tr>
	<tr>
	<td>group_objectclass</td><td>(StrOpt) LDAP objectclass for groups.</td><td>group</td><td>posixGroup</td>
	</tr>
	<tr>
	<td>group_tree_dn</td><td>(StrOpt) Search base for groups.</td><td>CN=Users,DC=hpswlabs,DC=apps,DC=hp,DC=com</td><td>ou=groups,dc=hpswlabs,dc=apps,dc=hp,dc=com</td>
	</tr>
	<tr>
	<td>group_allow_create</td><td>(BoolOpt) Allow group creation in LDAP backend.</td><td>False</td><td>False</td>
	</tr>
	<tr>
	<td>group_allow_delete</td><td>(BoolOpt) Allow group deletion in LDAP backend.</td><td>False</td><td>False</td>
	</tr>
	<tr>
	<td>group_allow_update</td><td>(BoolOpt) Allow group update in LDAP backend.</td><td>False</td><td>False</td>
	</tr>
	<tr>
	<td>suffix</td><td>(StrOpt) LDAP server suffix</td><td>DC=hpswlabs,DC=apps,DC=hp,DC=com</td><td>dc=hpswlabs,dc=apps,dc=hp,dc=com</td>
	</tr>
	<tr>
	<td>url</td><td>(StrOpt) URL for connecting to the LDAP server.</td><td>ldap://10.1.5.221</td><td>ldap://10.1.5.208</td>
	</tr>
	<tr>
	<td>user_allow_create</td><td>(BoolOpt) Allow user creation in LDAP backend.</td><td>False</td><td>False</td>
	</tr>
	<tr>
	<td>user_allow_delete</td><td>(BoolOpt) Allow user deletion in LDAP backend.</td><td>False</td><td>False</td>
	</tr>
	<tr>
	<td>user_allow_update</td><td>(BoolOpt) Allow user updates in LDAP backend.</td><td>False</td><td>False</td>
	</tr>
	<tr>
	<td>user_id_attribute</td><td>(StrOpt) LDAP attribute mapped to user id.</td><td>cn</td><td>uid</td>
	</tr>
	<tr>
	<td>user_name_attribute</td><td>(StrOpt) LDAP attribute mapped to user name.</td><td>cn</td><td>uid</td>
	</tr>
	<tr>
	<td>user_objectclass</td><td>(StrOpt) LDAP objectclass for users.</td><td>user</td><td>person</td>
	</tr>
	<tr>
	<td>user_tree_dn</td><td>(StrOpt) Search base for users.</td><td>CN=Users,DC=hpswlabs,DC=apps,DC=hp,DC=com</td><td>ou=people,dc=hpswlabs,dc=apps,dc=hp,dc=com</td>
	</tr>
	<tr>
	<td>user</td><td>(StrOpt) User BindDN to query the LDAP server.</td><td>CN=Administrator,CN=Users,DC=hpswlabs,DC=apps,DC=hp,DC=com</td><td>Not Required</td>
	</tr>
	<tr>
	<td>password</td><td>(StrOpt) Password for the BindDN to query the LDAP server.</td><td>Passw0rd</td><td>Not Required</td>
	</tr>
	<tr>
	<td>use_tls</td><td>(BoolOpt) Enable TLS for communicating with LDAP servers.</td><td>False</td><td>False</td>
	</tr>
	<tr>
	<td>tls_req_cert</td><td>(StrOpt) Valid options for tls_req_cert are demand, never, and allow.</td><td>never</td><td>never</td>
	</tr>
	<tr>
	<td>use_pool</td><td>(BoolOpt) Enable LDAP connection pooling.</td><td>True</td><td>True</td>
	</tr>
	<tr>
	<td>user_enabled_attribute</td><td>(StrOpt) LDAP attribute mapped to user enabled flag.</td><td>userAccountControl</td><td>Not required</td>
	</tr>
	<tr>
	<td>user_enabled_mask</td><td>(IntOpt) Bitmask integer to indicate the bit that the enabled value is stored in if the LDAP server represents "enabled" as a bit on an integer rather than a boolean. A value of "0" indicates the mask is not used. If this is not set to "0" the typical value is "2". This is typically used when "user_enabled_attribute = userAccountControl".</td><td>2</td><td>Not required</td>
	</tr>
	<tr>
	<td>user_enabled_default</td><td>(StrOpt) Default value to enable users. This should match an appropriate int value if the LDAP server uses non-boolean (bitmask) values to indicate if a user is enabled or disabled. If this is not set to "True" the typical value is "512". This is typically used when "user_enabled_attribute = userAccountControl".</td><td>512</td><td>Not required</td>
	</tr>
	<tr>
	<td>user_mail_attribute</td><td>(StrOpt) LDAP attribute mapped to user email.</td><td>userPrincipalName</td><td>Not required</td>
	</tr>
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

Sample `overcloud_keystone_ldap.json` configuration file for openLDAP server

	 {

     "keystone": {
         "config": [
             {
                 "section": "identity",
                 "values": [
                     {
                         "option": "driver",
                         "value": "keystone.identity.backends.ldap.Identity"
                     }
                 ]
             },
             {
                 "section": "assignment",
                 "values": [
                     {
                         "option": "driver",
                         "value": "keystone.assignment.backends.sql.Assignment"
                     }
                 ]
             },
             {
                 "section": "ldap",
                 "values": [
                     {
                         "option": "url",
                         "value": "ldap://10.1.5.208"
                     },
                     {
                         "option": "suffix",
                         "value": "dc=hpswlabs,dc=apps,dc=hp,dc=com"
                     },                   
                     {
                         "option": "user_tree_dn",
                         "value": "ou=people,dc=hpswlabs,dc=apps,dc=hp,dc=com"
                     },
                     {
                         "option": "user_objectclass",
                         "value": "person"
                     },
                     {
                         "option": "user_id_attribute",
                         "value": "uid"
                     },
                     {
                         "option": "user_name_attribute",
                         "value": "uid"
                     },                   
                     {
                         "option": "user_allow_create",
                         "value": "False"
                     },
                     {
                         "option": "user_allow_update",
                         "value": "False"
                     },
                     {
                         "option": "user_allow_delete",
                         "value": "False"
                     },                   
                     {
                         "option": "group_tree_dn",
                         "value": "ou=groups,dc=hpswlabs,dc=apps,dc=hp,dc=com"
                     },
                     {
                         "option": "group_objectclass",
                         "value": "posixGroup"
                     },
                     {
                         "option": "group_id_attribute",
                         "value": "cn"
                     },
                     {
                         "option": "group_name_attribute",
                         "value": "cn"
                     },                   
                     {
                         "option": "use_tls",
                         "value": "False"
                     }
                     {
                         "option": "tls_req_cert",
                         "value": "never"
                     },
                     {
                         "option": "use_pool",
                         "value": "True"
                     }
                 ]
             }
         ]
     }
	}