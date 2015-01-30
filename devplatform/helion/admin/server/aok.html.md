---
layout: default-devplatform
permalink: /als/v1/admin/server/aok/
product: devplatform
title: "AOK Authentication Server"
---
<!--UNDER REVISION-->

#AOK Authentication Server {#aok-authentication-server}

AOK is Application Lifecycle Service's authentication management service (replacing Cloud Foundry's UAA Server). It issues tokens via OAuth2 for client applications such as the **helion** client and the Horizon Console. AOK can connect to other back-end SSO services such as LDAP by using different [*Strategies*](#aok-strategies).

- [End User Login: Web](#web)
- [End User Login: Client](#client)
-   [Strategies](#strategies)
-   [Configuration](#configuration)
-   [LDAP Groups](#ldap)
-   [Active Directory Example Settings](#activedir)
-   [User Management](#user-management)
-   [First Admin User Setup](#first-admin-user-setup)
-   [Regular LDAP User Setup](#regular-ldap-user-setup)

##End User Login: Web {#web}

Users log in to the web-based Horizon Management Console as they would with any other web application. The Horizon Console checks with the AOK endpoint (e.g. https://aok.helion.example.com) in the background.

##End User Login: Client {#client}

If the strategy has been changed to something other than **builtin** (see
[Strategies](#strategies)) then users connecting with the [ALS command-line client](/als/v1/user/client) should be aware that:

-   The user must enter identifiers in the format expected by the [strategy](#aok-strategies) used by AOK (e.g. username or email
    address).
-   When using an existing authentication token to log in as a second
    user (e.g. an admin connecting as another user), use the second
    user's username, **not** the identifier used by AOK's
    strategy.

These caveats also apply when using other Cloud-Foundry-compatible
clients.

## Strategies {#strategies}

The term **strategy** refers to the method used to authenticate users.
There are currently two supported strategies:

-   **builtin**: The default builtin strategy uses a local database of
    users and passwords to authenticate.

-   **ldap**: The ldap strategy authenticates using the LDAP server
    specified in [*kato config*](#aok-configuration). Any user that can
    successfully authenticate with the LDAP server will be allowed to
    use Application Lifecycle Service and will have a (non-admin) user account created for
    them automatically. The LDAP server must return an email address for
    the user to allow them to log in to Application Lifecycle Service. AOK will look for the
    email address under the **mail**, **email**, and **userPrincipalName** attributes.

LDAP groups are not currently supported as a visible construct in the Application Lifecycle Service.

The use key in the configuration controls the strategy that AOK will
use. This value must correspond exactly to one of the supported strategy
names.

##Configuration {#configuration}

To configure AOK, set the following keys in the AOK config using the [kato
config set](/als/v1/admin/reference/kato-ref/#kato-command-ref-config) commands:

-   strategy:

    -   use: set to either **builtin** (the default) or **ldap**. The **builtin** strategy requires no further modification. The **ldap** strategy requires setting options in the corresponding block below.

    -   ldap:

        -   host: hostname or IP of the LDAP server

        -   port: LDAP server port, typically 389

        -   method: plain, ssl, or tls

        -   base: list of domain components (e.g. 'dc=example, dc=com')

        -   uid: LDAP attribute name for the user name that will used in
            the login form. Active Directory (AD) is typically
            'sAMAccountName' or 'UserPrincipalName', while OpenLDAP is
            'uid'.

        -   email: the LDAP attribute containing the user's fully
            qualified email address. An email address attribute is
            necessary for AOK to work properly with the cloud
            controller. This may be a scalar attribute or an array of
            attributes to search. The default is shown. The first
            non-null attribute will be used (AOK will not validate that
            this is an email address). The default attributes are:

            -   mail
            -   email
            -   userPrincipalName

        -   bind\_dn: (optional) credentials for user lookup (e.g.
            'cn=Administrator,cn=Users,dc=example,dc=com'). LDAP servers
            that allow anonymous bind will not require this setting.

        -   password: (optional) default credentials for user lookup

        -   try\_sasl: (optional) when set to true attempts a SASL
            connection to the LDAP server

        -   sasl\_mechanims: (optional) 'DIGEST-MD5' or 'GSS-SPNEGO'

**Note**

An additional 'name\_proc' option in the 'ldap' block allows users to
enter email addresses instead of LDAP user names, matching the user name
entered with the format of the uid attributes. For example, value of
'sAMAccountName' in AD contains only the Windows user name. If your
users prefer using email to login, the following 'name\_proc' value will
trim the email string down to just the Windows login name:

    Proc.new {|name| name.gsub(/@.*$/,'')}

Value must be valid ruby code. Since the provided code will be accepting
arbitrary user input, administrators are urged to use this setting only
when absolutely necessary, and to check the code thoroughly for possible
security implications.

To see the default AOK configuration (default settings) run the
command:

    kato config get aok

Settings are nested as per the option list above. To set an option,
specify the full config path to that option. For example:

    kato config set aok strategy/ldap/base 'dc=yourdomain, dc=com'

To add an attribute to the 'email' array:

    kato config push aok strategy/ldap/email "ADMailAcct"

To set the entire array in one step, use the `--json` option:

    kato config set --json aok strategy/ldap/email '["mail","ADMailAcct", "email"]'


<!-- not supported in ALS
##LDAP Groups {#ldap}

With the LDAP strategy enabled, ALS can query LDAP groups to define which LDAP groups are authorized to use ALS and which LDAP groups get admin privileges.

###Groups for Authorization

To limit which LDAP groups get access to ALS, the following three options must be set in AOK's strategy/ldap settings:

- group\_query: The query to run to determine which groups a user belongs to (set in conjunction with group_attribute). For example:

		kato config set aok strategy/ldap/group_query '(&(objectClass=posixGroup)(memberUid=%{username}))'

	This queries for posixGroups that the user belongs to. %{username} is replaced with the value of the field specified by uid and %{dn} is replaced by the dn of the authenticated user.


- group\_attribute: The LDAP attribute to extract from the query above (requires a valid group_query setting). For example:

		kato config set aok strategy/ldap/group_attribute 'cn'
	
	This extracts the name of the group(s) returned by the group_query above if the group's 'cn' (common name) attribute contains its name.

- allowed\_groups: A list of LDAP groups that are allowed to access ALS. (requires **group\_attribute** and **group\_query** settings). For example:

		kato config set aok strategy/ldap/allowed_groups '["dev", "engineering"]'
	
	This would allow access to members of the 'dev' or 'engineering' groups only.

###Admin Groups

Members of certain LDAP groups can be granted admin accounts for ALS. This requires the following settings:

- group_query (as above)
- group_attribute (as above)
- admin_groups: A list of LDAP groups that get admin privileges. For example:

		kato config set aok strategy/ldap/admin_groups '["admins", "bosses"]'

	This command would automatically grant admin privileges to all members of the 'admins' and 'bosses' LDAP groups.

- allowed_groups is an option that can be specified if limiting regular-user-level access is also desired.
-->

##Active Directory Example Settings {#activedir}

The following example shows what a typical AOK configuration might look like for an Active Directory server. This configuration:

- connects an Active Directory host called 'ad.example.com'
- authenticates with the 'reader' account
- queries the 'group' object
- allows access to members of the 'developers' and 'admins' groups
- gives an admin account to each member of the 'admins' group

		use: ldap
		ldap:
		  host: directory.example.com
		  port: 389
		  method: plain
		  base: DC=directory,DC=example,DC=com
		  uid: sAMAccountName
		  email:
		  - mail
		  - email
		  - userPrincipalName
		  bind_dn: CN=reader,CN=admins,DC=example,DC=com
		  password: passwordhere
		  group_query: (&(objectCategory=group)(member=%{dn}))
		  group_attribute: cn
		  allowed_groups:
		  - developers
		  - admins
		  admin_groups:
		  - admins

See also [Searching Active Directory](http://msdn.microsoft.com/en-us/library/aa746468%28v=vs.85%29.aspx) (Microsoft Developer Network) and [Common LDAP Queries](https://www.google.com/support/enterprise/static/gapps/docs/admin/en/gads/admin/ldap.5.4.html) (Google Apps Directory Sync Administration Guide) for more information on creating *group_query*.


##User Management {#user-management}

When using AOK with any strategy other than **builtin**, users in Application Lifecycle Service will be created automatically for any user who successfully authenticates.

Administrators can still use the functions as before, but should be
aware of the following caveats:

-   Admins may manually create users if they wish. This may be useful if
    the admin wants to pre-assign users to groups in Application Lifecycle Service before
    those users have logged in for the first time. The admin must create
    the user with the same username that AOK will receive from the
    strategy.
-   Passwords set while creating users or using the password-change
    function will be disregarded - Application Lifecycle Service/AOK does not manage the
    external authentication systems.
-   Admins may delete users, but the user will be recreated if they log
    in again via AOK. If an admin wishes to prevent a user from using
    Application Lifecycle Service, the user's login credentials should be revoked in the
    external authentication system.

##First Admin User Setup {#first-admin-user-setup}

When setting up an Application Lifecycle Service system using AOK, complete the "Set Up First
Admin User" form shown by the web Management Console before configuring
LDAP authentication. This creates an administrative user, and changes
the password of the 'helion' user on the VM to match whatever was
entered in the form.

You may use either a temporary username (e.g. "firstuser") which will be
deleted later, or use the LDAP username you will ultimately use once AOK
is configured.

Once the first user has been created:

-   Log in to the micro cloud VM or Core node as the 'helion' user
    (with the password set previously)

-   [Configure AOK](#aok-configuration) to use LDAP

-   Set the `admin_user` key with the desired LDAP
    admin username:

        kato config set aok strategy/ldap/admin_user <username>

    This user will be granted admin privileges when logging in for the
    first time.

-   If you created a temporary admin user, delete it at this point.

## Regular LDAP User Setup {#regular-ldap-user-setup}

New users logging in to the Horizon Console for the first time using
LDAP authentication will not be a member of any organization (and won't
be able to do anything). An admin will have to add each user to an
organization after their initial login.