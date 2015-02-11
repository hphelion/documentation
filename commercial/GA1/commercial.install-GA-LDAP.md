---
layout: default
title: "HP Helion OpenStack: Intergrating LDAP"
permalink: /helion/openstack/install/ldap/
product: commercial.ga
product-version1: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Michael B, 

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/helion/openstack/install/prereqs/#ldap">&#9650; Prerequisites </p> 

<!-- Based on https://wiki.hpcloud.net/display/csbu/Integrating+Keystone+with+LDAP+in+Helion+1.1 -->

# HP Helion OpenStack&reg;: Integrate the Identity Service (Keystone) with LDAP/AD 

The HP Helion OpenStack Identity service can use Lightweight Directory Access Protocol (LDAP) to integrate your organization's existing directory service and user account management processes. LDAP integration must be performed during the HP Helion OpenStack installation process.

Multiple authentication backends are supported, using Keystone Domain-Specific Configuration feature. Separate authentication domains can be created to authenticate users on single LDAP server with different filters, or on different LDAP servers.

The process for integrating LDAP involves the following steps:

- [Verify prerequisites](#pre)
- [Generate configuration files](#config)
- [Include the configuration files in the installation](#install)
- [Configure Horizon](#horizon)

## Prerequisites {#pre}
Before starting the integration, review the following prerequisites:

- LDAP server is up and running in a network accessible from the overcloud.


## Generate configuration files {#config}

The LDAP integration process requires two configuration files:

- [LDAP server connection settings](#connect)
- Keystone CA storage and signing key/certificate file


### LDAP connection settings {#connect}

Create overlcoud_keystone_ldap.json file which contains the LDAP server connection settings. 

It must be a well-formed, syntax-error free json file.

Section names, supported options and possible values are described in Openstack Identity Service documentation. Here are some most important:

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
	<td>group_id_attribute</td><td>(StrOpt) LDAP attribute mapped to group id.</td><td>cn</td><td>Cn</td>
	</tr>
	<tr>
	<td>group_name_attribute</td><td>(StrOpt) LDAP attribute mapped to group name.</td><td>cn</td><td>Cn</td>
	</tr>
	<tr>
	<td>group_objectclass</td><td>(StrOpt) LDAP objectclass for groups.</td><td>group</td><td>posixGroup</td>
	</tr>
	<tr>
	<td>group_tree_dn</td><td>(StrOpt) Search base for groups.</td><td>CN=Users,DC=example,DC=com</td><td>ou=groups,dc=hpswlabs,dc=apps,dc=hp,dc=com</td>
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
	<td>suffix</td><td>(StrOpt) LDAP server suffix</td><td>DC=example,DC=com</td><td>dc=example,dc=com</td>
	</tr>
	<tr>
	<td>url</td><td>(StrOpt) URL for connecting to the LDAP server.</td><td>ldap://localhost</td><td>ldap://localhost</td>
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
	<td>user_id_attribute</td><td>(StrOpt) LDAP attribute mapped to user id.</td><td>cn</td><td>Cn</td>
	</tr>
	<tr>
	<td>user_name_attribute</td><td>(StrOpt) LDAP attribute mapped to user name.</td><td>cn</td><td>Cn</td>
	</tr>
	<tr>
	<td>user_objectclass</td><td>(StrOpt) LDAP objectclass for users.</td><td>user</td><td>Person</td>
	</tr>
	<tr> 
	<td>user_tree_dn</td><td>(StrOpt) Search base for users.</td><td>CN=Users,DC=example,DC=com</td><td>ou=people,dc=example,dc=com</td>
	</tr>
	<tr>
	<td>user</td><td>(StrOpt) User BindDN to query the LDAP server.</td><td>CN=SomeLDAPUser,CN=Users,DC=example,DC=com</td><td>Not Required</td>
	</tr>
	<tr>
	<td>password</td><td>(StrOpt) Password for the BindDN to query the LDAP server.</td><td>password</td><td>Not Required</td>
	</tr>
	<tr>
	<td>use_tls</td><td>(BoolOpt) Enable TLS for communicating with LDAP servers.</td><td>False</td><td>False</td>
	</tr>
	<tr>
	<td>tls_req_cert</td><td>(StrOpt) Valid options for tls_req_cert are demand, never, and allow.</td><td>never</td><td>Never</td>
	</tr>
	<tr>
	<td>use_pool</td><td>(BoolOpt) Enable LDAP connection pooling.</td><td>True</td><td>True</td>
	</tr>
	<tr>
	<td>user_enabled_attribute</td><td>(StrOpt) LDAP attribute mapped to user enabled flag.</td><td>userAccountControl</td><td>Not required</td>
	</tr>
	<tr>
	<td>user_enabled_mask</td><td>(IntOpt) Bitmask integer indicating which bit represents the enabled value.  This is used when the LDAP server represents the variable `enabled` as a bit in an integer rather than as a Boolean.  A value of "0" indicates the mask is not used. When not set to "0", the typical value is "2".  This is typically used when `user_enabled_attribute = userAccountControl`.</td><td>2</td><td>Not required</td>
	</tr>
	<tr>
	<td>user_enabled_default</td><td>(StrOpt) Default value to enable users. This should match an appropriate int value if the LDAP server uses non-boolean (bitmask) values to indicate if a user is enabled or disabled. If this is not set to "True" the typical value is "512". This is typically used when `user_enabled_attribute = userAccountControl`.</td><td>512</td><td>Not required</td>
	</tr>
	<tr>
	<td>user_mail_attribute</td><td>(StrOpt) LDAP attribute mapped to user email.</td><td>userPrincipalName</td><td>Not required</td>
	</tr>
	</table>

See [Sample LDAP Server Connection Settings JSON File](/helion/openstack/install/connections-json/) for an example `overlcoud_keystone_ldap.json` file.

## Keystone CA storage and signing key/certificate files

LDAP server might require all connections to be secured though the TLS protocol. Additionally, Keystone may be instructed to validate LDAP server certificate against local CA certificate storage. 

To turn this feature on:

1. Set options use_tls, tls_req_cert and tls_cacertfile appropriately in overcloud_keystone_ldap.json file described above.

2. Create overcloud-env.json file with the following content:

		{
	        "parameters": {
	            "KeystoneCACertificate": "<CA Root Certificates converted to a single line>",
	            "KeystoneSigningCertificate": "<Keystone Signing Certificate converted to a single line>",
	            "KeystoneSigningKey": "<Keystone Signing Key converted to a single line>"
	        }
	    }

	The set of CA Root Certificates set mentioned above should contain root certificates for all LDAP servers, for which certificate validation set to "demand" or "allow".

3. Change `overcloud-env.json` file access permissions to `0600`:

		chmod 600 overcloud-env.json

Follow the steps described in the installation instructions to deploy the overcloud nodes.

[HP Helion OpenStack&reg;: Installation and Configuration for KVM Hypervisor](/helion/openstack/install/kvm/#startseed)

[HP Helion OpenStack&reg;: Installation and Configuration for ESX Hypervisor](/helion/openstack/install/esx/#startseed)

## Configure Horizon {#horizon}

After the installation is complete, perform the following tasks:

1. Use the use the Horizon dashboard to enable LDAP users to log in.

	Before a user can successfully login, the user must be assigned to a project. A user with admin privileges must create one or more projects and associate each user to a project.

2. Disable CRUD (Create/Update/Delete) operations on users for a read-only identity backend on all three overcloud controller nodes.

	a. Modify the `/opt/stack/venvs/openstack/lib/python2.7/site-packages/openstack_dashboard/local_settings.py` file to disallow editing of users and groups.

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

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593;</a>

----
