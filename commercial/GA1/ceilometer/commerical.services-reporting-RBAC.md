---
layout: default
title: "HP Helion OpenStack&#174; Metering Service (Ceilometer): Role Based Access Control (RBAC)"
permalink: /helion/openstack/services/reporting/RBAC/
product: commercial.ga
---
<!--UNDER REVISION-->

<script>
function PageRefresh {
onLoad="window.refresh"
}
PageRefresh();
</script>

#HP Helion OpenStack&#174; Metering Service (Ceilometer): Role Based Access Control (RBAC)

Role Base Access Control is a technique that limits access to resources based on a specific set of role(s) associated with each user's credentials.

Keystone has a set of users that are associated with each project. Each user has one or more roles. After a user has Authenticated with Keystone using a valid set of credentials, typically User Name and Password or Token, Keystone will augment that request with the Roles that are associated with that user. These roles are added to the Request Header under the X-Roles attribute and are presented as a comma-separated list.

- [Displaying All Users](#display_users)
- [Displaying All Roles](#display_roles)
- [Assigning a Role to a User](#assign_role)
- [Creating a New Role](#create_role)
- [Ceilometer Access Policies](#access_policies)
	- [New RBAC Policy File](#newfile)
	- [Applying Policies to Roles](#apply_policy)
	- [Writing a Policy](#write_policy)

##Displaying All Users {#display_users}

To discover the list of users available in the system, an administrator can run the following command using the Keystone command-line interface:

	keystone user-list
The output should resemble this response, which is a list of all the users currently available in this system.

	+----------------------------------+-----------------------------------------+----+
	|                id                |    name      | enabled |       email        |
	+----------------------------------+-----------------------------------------+----+
	| 1c20d327c92a4ea8bb513894ce26f1f1 |   admin      |   True  | admin.example.com  |
	| 0f48f3cc093c44b4ad969898713a0d65 | ceilometer   |   True  | nobody@example.com |
	| 85ba98d27b1c4c8f97993e34fcd14f48 |   cinder     |   True  | nobody@example.com |
	| d2ff982a0b6547d0921b94957db714d6 |    demo      |   True  |  demo@example.com  |
	| b2d597e83664489ebd1d3c4742a04b7c |    ec2       |   True  | nobody@example.com |
	| 99afb00e498a487eb83c96c9bd209586 |    gf1       |   True  |   gf@helion.com    |
	| 42d13c0df38a47989639b5fe99976f26 |    gf2       |   True  |   gf@helion.com    |
	| 2b95b2600dc741958eae15057ff7e89b |    gf3       |   True  |   gf@helion.com    |
	| 2bd85070ceec4b608d9f1b06c6be22cb |   glance     |   True  | nobody@example.com |
	| 0e9e2daebbd3464097557b87af4afa4c |    heat      |   True  | nobody@example.com |
	| 9f7fd03c90904d83ae73ef1b40a6baf0 |    jaq1      |   True  |   jaq@helion.com   |
	| 7a73e59a100342099c59278a392f582a |    jaq2      |   True  |   jaq@helion.com   |
	| 72e404eab90f41c6a181b9602e0fa777 |    jaq3      |   True  |   jaq@helion.com   |
	| b149fe9c5f0e421e8349efc52f4b0451 |    jaq4      |   True  |   jaq@helion.com   |
	| 0e54dab3c76349c5ab50f196a979b4c0 |    jaq5      |   True  |   jaq@helion.com   |
	| 0b466ddc2c0f478aa139d2a0be314467 |  neutron     |   True  | nobody@example.com |
	| 5cda1a541dee4555aab88f36e5759268 |    nova      |   True  | nobody@example.com |
	| 6ae85dff35e14c3d878c202b6277362f |   sherpa     |   True  | nobody@example.com |
	| 1cefd1361be8437d9684eb2add8bdbfa |   swift      |   True  | nobody@example.com |
	| f05bac3532c44414a26c0086797dab23 | user20141203213957|True| nobody@example.com |
	| 3db0588e140d4f88b0d4cc8b5ca86a0b | user20141205232231|True| nobody@example.com |
	+----------------------------------+-----------------------------------------+----+

##Displaying All Roles {#display_roles}
To see all the roles that are currently available in the deployment, an administrator can run the following command:
	
	keystone role-list
	
The output should resemble the following response:

	+----------------------------------+-------------------------------------+
	|                id                |                 name                |
	+----------------------------------+-------------------------------------+
	| 507bface531e4ac2b7019a1684df3370 |            ResellerAdmin            |
	| 9fe2ff9ee4384b1894a90878d3e92bab |               _member_              |
	| e00e9406b536470dbde2689ce1edb683 |                admin                |
	| aa60501f1e664ddab72b0a9f27f96d2c |           heat_stack_user           |
	| a082d27b033b4fdea37ebb2a5dc1a07b |               service               |
	| 8f11f6761534407585feecb5e896922f |            swiftoperator            |
	+----------------------------------+-------------------------------------+

##Assigning a Role to a User {#assign_role}

In this example, we want to add the role **ResellerAdmin** to the demo user who has the ID **d2ff982a0b6547d0921b94957db714d6**.

1. Determine which Project/Tenant the user belongs to.
 
		keystone user-get d2ff982a0b6547d0921b94957db714d6

	The response should resemble the following output:
 
		+----------+----------------------------------+
		| Property |              Value               |
		+----------+----------------------------------+
		|  email   |         demo@example.com         |
		| enabled  |               True               |
		|    id    | d2ff982a0b6547d0921b94957db714d6 |
		|   name   |               demo               |
		| username |               demo               |
		+----------+----------------------------------+ 	
 
1. We need to link the ResellerAdmin Role to a Project/Tenant. Determine which tenants are available on this deployment.

		keystone tenant-list

	The response should resemble the following output:

		+----------------------------------+-------------------------------+--+
		|                id                |        name       | enabled |
		+----------------------------------+-------------------------------+--+
		| 4a8f4207a13444089a18dc524f41b2cf |       admin       |   True  |
		| 00cbaf647bf24627b01b1a314e796138 |        demo       |   True  |
		| 8374761f28df43b09b20fcd3148c4a08 |        gf1        |   True  |
		| 0f8a9eef727f4011a7c709e3fbe435fa |        gf2        |   True  |
		| 6eff7b888f8e470a89a113acfcca87db |        gf3        |   True  |
		| f0b5d86c7769478da82cdeb180aba1b0 |        jaq1       |   True  |
		| a46f1127e78744e88d6bba20d2fc6e23 |        jaq2       |   True  |
		| 977b9b7f9a6b4f59aaa70e5a1f4ebf0b |        jaq3       |   True  |
		| 4055962ba9e44561ab495e8d4fafa41d |        jaq4       |   True  |
		| 33ec7f15476545d1980cf90b05e1b5a8 |        jaq5       |   True  |
		| 9550570f8bf147b3b9451a635a1024a1 |      service      |   True  |
		+----------------------------------+-------------------------------+--+

1. Now that we have all the pieces, we can assign the ResellerAdmin role to this User on the Demo project. 

		keystone user-role-add --user-id d2ff982a0b6547d0921b94957db714d6 --role-id 507bface531e4ac2b7019a1684df3370 --tenant-id 00cbaf647bf24627b01b1a314e796138

	This will produce no response if everything is correct.
1. Validate that the role has been assigned correctly. Pass in the user and tenant ID and request a list of roles assigned. 
 
		keystone user-role-list --user-id d2ff982a0b6547d0921b94957db714d6 --tenant-id 00cbaf647bf24627b01b1a314e796138

	Note that all members have the *\_member_* role as a default role in addition to any other roles that have been assigned. 
 
		+----------------------------------+---------------+----------------------------------+----------------------------------+
		|                id                |      name     |             user_id              | tenant_id             |
		+----------------------------------+---------------+----------------------------------+----------------------------------+
		| 507bface531e4ac2b7019a1684df3370 | ResellerAdmin | d2ff982a0b6547d0921b94957db714d6 | 00cbaf647bf24627b01b1a314e796138 |
		| 9fe2ff9ee4384b1894a90878d3e92bab |    _member_   | d2ff982a0b6547d0921b94957db714d6 | 00cbaf647bf24627b01b1a314e796138 |
		+----------------------------------+---------------+----------------------------------+----------------------------------+

##Creating a New Role {#create_role}

In this example, we will create a Level 3 Support role called **L3Support**.

1. Add the new role to the list of roles.
 
		keystone role-create --name L3Support

	The response should resemble the following output:
 
		+----------+----------------------------------+
		| Property |              Value               |
		+----------+----------------------------------+
		|    id    | 7e77946db05645c4ba56c6c82bf3f8d2 |
		|   name   |            L3Support             |
		+----------+----------------------------------+
2. Now that we have the new Role's ID, we can add that role to the Demo user from the previous example.
 
		keystone user-role-add --user-id d2ff982a0b6547d0921b94957db714d6 --role-id 7e77946db05645c4ba56c6c82bf3f8d2 --tenant-id 00cbaf647bf24627b01b1a314e796138


	This will produce no response if everything is correct.
1. Verify that the user Demo has both the ResellerAdmin and L3Support roles.
 
		keystone user-role-list --user-id d2ff982a0b6547d0921b94957db714d6 --tenant-id 00cbaf647bf24627b01b1a314e796138
4. 	The response should resemble the following output. Note that this user has the L3Support role, the ResellerAdmin role, and the default member role.

		+----------------------------------+---------------+----------------------------------+----------------------------------+
		|                id                |      name     |             user_id              |            tenant_id             |
		+----------------------------------+---------------+----------------------------------+----------------------------------+
		| 7e77946db05645c4ba56c6c82bf3f8d2 |   L3Support   | d2ff982a0b6547d0921b94957db714d6 | 00cbaf647bf24627b01b1a314e796138 |
		| 507bface531e4ac2b7019a1684df3370 | ResellerAdmin | d2ff982a0b6547d0921b94957db714d6 | 00cbaf647bf24627b01b1a314e796138 |
		| 9fe2ff9ee4384b1894a90878d3e92bab |    _member_   | d2ff982a0b6547d0921b94957db714d6 | 00cbaf647bf24627b01b1a314e796138 |
		+----------------------------------+---------------+----------------------------------+----------------------------------+


##Access Policies {#access_policies}
Before introducing RBAC, Ceilometer had very simple access control. There were two types of user: admins and users. Admins could access any API and perform any operation. Users could only access non-admin API and perform operations only on the Project/Tenant where they belonged.

### New RBAC Policy File {#newfile}
This is the policy file for Ceilometer without RBAC (*etc/ceilometer/policy.json*)
	
	{
	  "context_is_admin": "role:admin"
	}
With the RBAC-enhanced code it is possible to control access to each API command. The new policy file (*rbac_policy.json*) looks like this. 

	{
	    "context_is_admin": "role:admin",
	    "telemetry:get_samples": "rule:context_is_admin",
	    "telemetry:get_sample": "rule:context_is_admin",
	    "telemetry:query_sample": "rule:context_is_admin",
	    "telemetry:create_samples": "rule:context_is_admin",
	    "telemetry:compute_statistics": "rule:context_is_admin",
	    "telemetry:get_meters": "rule:context_is_admin",
	    "telemetry:get_resource": "rule:context_is_admin",
	    "telemetry:get_resources": "rule:context_is_admin",
	    "telemetry:get_alarm": "rule:context_is_admin",
	    "telemetry:query_alarm": "rule:context_is_admin",
	    "telemetry:get_alarm_state": "rule:context_is_admin",
	    "telemetry:get_alarms": "rule:context_is_admin",
	    "telemetry:create_alarm": "rule:context_is_admin",
	    "telemetry:set_alarm": "rule:service_role",
	    "telemetry:delete_alarm": "rule:context_is_admin",
	    "telemetry:alarm_history": "rule:context_is_admin",
	    "telemetry:change_alarm_state": "rule:context_is_admin",
	    "telemetry:query_alarm_history": "rule:context_is_admin"
	}
Note that the API action names are namespaced using the **telemetry:** prefix. This avoids potential confusion if other services have policies with the same name.

### Applying Policies to Roles {#apply_policy}
Copy the *rbac_policy.json* file over the *policy.json* file and make any required changes. 

#### Apply a policy to multiple roles
For example, the ResellerAdmin role could also be permitted to access **compute\_statistics**. This change would require the following changes in the *rbac_policy.json* policy file:

	{
	    "context_is_admin": "role:admin",
	    "i_am_reseller": "role:ResellerAdmin",
	    "telemetry:get_samples": "rule:context_is_admin",
	    "telemetry:get_sample": "rule:context_is_admin",
	    "telemetry:query_sample": "rule:context_is_admin",
	    "telemetry:create_samples": "rule:context_is_admin",
	    "telemetry:compute_statistics": "rule:context_is_admin or rule:i_am_reseller",
		...
	}
After a policy change has been made all the API services will need to be [restarted](/helion/openstack/services/reporting/components/#centralagent).

#### Apply a policy to a non-default role only
Another example: assign the L3Support role to the **get\_meters** API and exclude all other roles.

	{
	    "context_is_admin": "role:admin",
	    "i_am_reseller": "role:ResellerAdmin",
	    "l3_support": "role:L3Support",
	    "telemetry:get_samples": "rule:context_is_admin",
	    "telemetry:get_sample": "rule:context_is_admin",
	    "telemetry:query_sample": "rule:context_is_admin",
	    "telemetry:create_samples": "rule:context_is_admin",
	    "telemetry:compute_statistics": "rule:context_is_admin or rule:i_am_reseller",
	    "telemetry:get_meters": "rule:l3_support",
		...
	}
##Writing a Policy {#write_policy}
The Policy Engine capabilities are as expressible using a set of rules and guidelines.
For a complete reference, please see the [OSLO policy documentation](https://github.com/openstack/oslo-incubator/blob/master/openstack/common/policy.py).

Policies can be expressed in one of two forms: A list of lists, or a string written in the new policy language.

In the list-of-lists representation, each check inside the innermost list is combined with an **and** conjunction - for that check to pass, **all** the specified checks must pass. These innermost lists are then combined as with an **or** conjunction. 

As an example, take the following rule, expressed in the list-of-lists representation:
 
	[["role:admin"], ["project_id:%(project_id)s", "role:projectadmin"]]
In the policy language, each check is specified the same way as in the list-of-lists representation: a simple [a:b] pair that is matched to the correct class to perform that check.

- User's Role 

		role:admin
- Rules already defined on policy
	
		rule:admin_required

- Against a URL (URL checking must return TRUE to be valid)
 
		http://my-url.org/check 

- User attributes (obtained through the token: user_id, domain_id, project_id)
	
		project_id:%(target.project.id)s

- Strings 

		<variable>:'xpto2035abc'
		'myproject':<variable>


- Literals 

		project_id:xpto2035abc
		domain_id:20
		True:%(user.enabled)s

Conjunction operators are also available, allowing for more flexibility in crafting policies. So, in the policy language, the previous check in list-of-lists becomes:

	role:admin or (project_id:%(project_id)s and role:projectadmin)

The policy language also has the NOT operator, allowing for richer policy rules:

	project_id:%(project_id)s and not role:dunce

Attributes sent along with API calls can be used by the policy engine (on the right side of the expression), by using the following syntax:

	<some_value>:%(user.id)s

**Note**: two special policy checks should be mentioned; the policy check **@** will **always accept** an access, and the policy check **!** will **always reject** an access.
