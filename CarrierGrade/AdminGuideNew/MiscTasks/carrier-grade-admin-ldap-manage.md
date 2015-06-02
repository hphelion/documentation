---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Managing LDAP User Accounts"
permalink: /helion/openstack/carrier/admin/ldap/manage/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Managing LDAP User Accounts

Although the scope of operations for the LDAP user accounts is local, that is, they operate on the target host exclusively, management of these accounts operates at the cluster level. This means that operations such as password change, and addition or removal of users, are applied to the entire cluster. For example, a password change executed while logged into controller-0, is effective immediately on all other hosts in the cluster.

Centralized management is implemented using two LDAP servers, one running on each controller node. LDAP server synchronization is automatic using the native LDAP content synchronization protocol.
A set of LDAP commands is available to operate on LDAP user accounts. 
The commands are installed in the `/usr/local/sbin` directory, and are available to any user account in the sudoers list. Included commands are:

* lsldap
* ldapadduser
* ldapdeleteuser

Use the command option `--help` on any command to display a brief help message, as illustrated below.

	ldapadduser --help

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----