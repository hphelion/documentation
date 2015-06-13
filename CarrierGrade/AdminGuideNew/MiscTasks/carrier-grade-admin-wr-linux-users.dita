---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Linux User Accounts"
permalink: /helion/openstack/carrier/admin/linux/users/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: All

authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/1.1/3rd-party-license-agreements/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/">&#9650; UP</a> | NEXT &#9654; </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Linux User Accounts

Linux user accounts are available on all hosts for administration, operation, and general hosting purposes. They have no relation with the cloud user tenant accounts created using the web management interface, the CLI commands, or the APIs.

You can log in remotely as a Linux user by using an SSH connection and specifying the OAM floating IP address as the target. This establishes a connection to the currently active controller. If the OAM floating IP address moves from one controller node to another, the SSH session is blocked. To ensure access to a particular controller regardless of its current role, specify the controller physical address instead.

### The `wrsroot` Account ###

This is a local, per-host, account created automatically when a new host is provisioned. On controller nodes, this account is available even before the config_controller script is executed.

The default initial password is wrsroot.

* The initial password must be changed immediately when you log in to controller-0 for the first time. For details, see the [HP Helion OpenStack Carrier Grade Installation Guide](/helion/openstack/carrier/install/pb/overview/).
* After five consecutive unsuccessful login attempts, further attempts are blocked for about five minutes.

Subsequent password changes must be executed on the active controller to ensure that they propagate to all other hosts in the cluster. Otherwise, they remain local to the host where they were executed, and are overwritten on the next reboot to match the password on the active controller.

From the wrsroot account, you can execute commands requiring different privileges.

* You can execute non-root level commands as a regular Linux user directly. If you do not have sufficient privileges to execute a command as a regular Linux user, you may receive a permissions error, or in some cases, the command may be reported as not found.

* You can execute root-level commands as the root user. To become the root user, use the sudo command to elevate your privileges, followed by the command to be executed. For example, to run the config_controller command as the root user:

		sudo config_controller

	If a password is requested, provide the password for the wrsroot account.

* You can execute OpenStack administrative commands as the Keystone admin user.

	Source the script `/etc/nova/openrc` while working on the active controller to acquire Keystone administrative privileges.

		source /etc/nova/openrc

	The system prompt changes to indicate the new acquired privileges.

## Local User Accounts

You can manage regular Linux user accounts on any host in the cluster using standard Linux commands. New accounts created on one host are not automatically propagated to other hosts.

Password changes are not enforced automatically on first login, and they are not propagated by the system (with the exception of the wrsroot account, for which passwords changed on the active controller are propagated to other hosts.) Any special considerations for these accounts, if any, must be configured manually.

Local user accounts can be added to the sudoers list using the visudo command. They can also source the `/etc/nova/openrc`  script to become OpenStack administrators when working on the active controller.

Backup and restore operations of home directories and passwords must be done manually. They are ignored by the system backup and restore utilities. For more information, See [Performing a System Data Backup](/helion/openstack/carrier/admin/backup/).

## LDAP User Accounts

You can create regular Linux user accounts using the HP Helion OpenStack Carrier Grade LDAP service. LDAP accounts are centrally managed; changes made on any host are propagated automatically to all hosts on the cluster.

In other respects, LDAP user accounts behave as any local user account. They can be added to the sudoers list, and can acquire OpenStack administration credentials when executing on the active controller.

LDAP user accounts share the following set of attributes:

* The initial password is the name of the account.
* The initial password must be changed immediately upon first login.
* Requirements for new passwords include:
	* to be at least eight characters long
	* to have at least one lowercase character
	* to differ in at least three characters from the previous password
	* not to be evidently trivial to guess, such as a2345678, or a reversed version of the old password
* Login sessions are logged out automatically after about 15 minutes of inactivity.
* The accounts block following five consecutive unsuccessful login attempts. They unblock automatically after a period of about five minutes.
* Home directories are created dynamically on first login. Note that home directories for local user accounts are created when the accounts are created.
* All authentication attempts are recorded on the file /var/log/auth.log of the target host.
* Home directories and passwords are backed up and restored by the system backup utilities.

The following LDAP user accounts are available by default on newly deployed hosts, regardless of their personality:

* **admin** - A cloud administrative account, comparable in purpose to the default admin account used in the web management interface.

	This user account operates on a restricted Linux shell, with very limited access to native Linux commands. However, the shell is preconfigured to have administrative access to OpenStack commands, including the available HP Helion OpenStack Carrier Grade CLI extensions.

* **operator** - A host administrative account. It has access to all native Linux commands and is included in the sudoers list.

	For increased security, the admin and operator accounts must be used from the console ports of the hosts; no SSH access is allowed.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----