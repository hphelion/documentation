---
layout: default-devplatform
permalink: /als/v1/admin/reference/groups/
---
<!--PUBLISHED-->

Managing Groups, Users & Limits (DEPRECATED)[](#managing-groups-users-limits-deprecated "Permalink to this headline")
===================================================================================================================
[Managing Groups, Users & Limits (DEPRECATED)](#)
    -   [Basic Group Management](#basic-group-management)
    -   [Limits](#limits)
        -   [Group-Level Limits](#group-level-limits)
        -   [User-Level Limits](#user-level-limits)
    -   [Managing Users and Groups](#managing-users-and-groups)
        -   [Importing/Exporting](#importing-exporting)



##* Warning *

Application Lifecycle Service Groups have been **replaced** by [*Organizations and
Spaces*](/als/v1/user/deploy/orgs-spaces/#orgs-spaces). The following
information applies to Application Lifecycle Service 2.10.x releases and is included to
provide context for admins migrating to Application Lifecycle Service 3.0.

Application Lifecycle Service users can be assigned to specific groups, and each group can
have a set of limits assigned to it regarding apps, services, and memory
usage.

To see commands related to groups, use the `helion help` command or see the [*Command
Reference*](/als/v1/user/reference/client-ref/#command-ref-client).

You can also manage groups, users, and limits in the [*Management
Console*](/als/v1/user/console/#management-console). Users and
groups have different limit settings. Applications pushed into groups
have that application's limits applied to that group's limits.

Basic Group Management[](#basic-group-management "Permalink to this headline")
-------------------------------------------------------------------------------

To create a new group:

    $ helion groups create developers
    Creating New Group: OK

**Note**

Group names cannot contain spaces.

To delete a group:

    $ helion groups delete managers
    Deleting Group: OK

For a list of all groups and members:

    $ helion groups

    +------------+-------------------------+
    | Group      | Members                 |
    +------------+-------------------------+
    | developers | user1@mydomain.com      |
    | managers   |                         |
    +------------+-------------------------+

Limits[](#limits "Permalink to this headline")
-----------------------------------------------

### Group-Level Limits[](#group-level-limits "Permalink to this headline")

A group can have a number of limits set for it:

    $ helion limits developers --mem 2048 --services 5 --apps 2 --appuris 5 --sudo true
    Updating Group Limits: OK

`--mem` sets the amount of memory allowed in
megabytes. Can also be specified in gigabytes in the format
`--mem 2G`.

`--services` sets the number of services allowed.

`--apps` sets the number of apps allowed.

`--appuris` sets the number of app URIs allowed.

`--sudo` sets whether or not the `sudo` command can be used. Use `true` or
`false`. The default setting is `false`.

To view the current limits for a group:

    $ helion limits developers

    +----------+-------+
    | Limit    | Value |
    +----------+-------+
    | mem      | 2048  |
    | services | 5     |
    | apps     | 2     |
    | appuris  | 5     |
    | sudo     | true  |
    +----------+-------+

### User-Level Limits[](#user-level-limits "Permalink to this headline")

A user can have limits set specifically without the use of a group:

    $ helion limits user1@mydomain.com --mem 2048 --services 5 --apps 2 --appuris 5 --sudo true
    Updating Group Limits: OK

`--mem` sets the amount of memory allowed in
megabytes. Can also be specified in gigabytes in the format
`--mem 2G`.

`--services` sets the number of services allowed.

`--apps` sets the number of apps allowed.

`--appuris` sets the number of app URIs allowed.

`--sudo` sets whether or not the `sudo` command can be used. Use `true` or
`false`. The default setting is `false`.

Use `helion limits` to see limits on the user
level:

    $ helion limits user1@mydomain.com

    Group: user1@mydomain.com
    +----------+-------+
    | Limit    | Value |
    +----------+-------+
    | mem      | 2048  |
    | services | 10    |
    | apps     | 12    |
    | appuris  | 4     |
    | sudo     | true  |
    +----------+-------+

Managing Users and Groups[](#managing-users-and-groups "Permalink to this headline")
-------------------------------------------------------------------------------------

Users can be added to one or more groups. To add a user to a group:

    $ helion groups add-user developers user1@mydomain.com
    Adding User To Group: OK

View the users that are part of a group with this command:

    $ helion groups users developers

    +-------------------------+
    | Member                  |
    +-------------------------+
    | user1@mydomain.com      |
    +-------------------------+

To remove a user from a group:

    $ helion groups delete-user developers user1@mydomain.com
    Removing User From Group: OK

### Importing/Exporting[](#importing-exporting "Permalink to this headline")

To import a list of system users, or export a list of the current users
for migration to a new system, log in to the micro cloud VM or core node
as the 'helion' user and run the [*kato data
users*](/als/v1/admin/reference/kato-ref/#kato-command-ref-data-users) command.

The `kato data users export` command generates CSV
file with the following columns:

    email,isadmin,groups

Using the `--include-password-hashes` option adds
bcrypt password hashes in a `passwordhash` column:

    email,passwordhash,isadmin,groups

The `kato data users import` will accept CSV files
with the following columns. The header row is required:

    email,password,isadmin,groups

Alternatively:

    email,passwordhash,isadmin,groups

The `isadmin` and `groups`
columns are both optional. The `password` or
`passwordhash` columns must be provided when adding
new users, but are optional if you are updating existing users with new
`isadmin` or `group` values.
Password hashes must be in bcrypt format (as exported with
`--include-password-hashes`).

A `--dry-run` option is available if you would like
to test the import/export before actually running it.