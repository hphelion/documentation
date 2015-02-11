---
layout: default
title: "HP Helion OpenStack&#174; Managing AppArmor Profiles"
permalink: /helion/openstack/install/apparmor/
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

<!--
<p style="font-size: small;"> <a href="/helion/openstack/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/swift/deployment-scale-out/"> NEXT &#9654</a> </p>
-->

# HP Helion OpenStack&reg;: AppArmor Overview

The HP Helion OpenStack default installation includes AppArmor profiles as a tool for enhanced security for VMs running on KVM compute nodes. 

AppArmor profiles can modified, as needed, for your organization. However, the default profiles, as installed, have been configured to provide optimal protection for HP Helion OpenStack. All profiles are configured for *enforce* mode (for more information, see [AppArmor profile modes](#modes) below) and designed to mitigate hostile VMs exploiting hypervisor breakout attacks.

HP Helion OpenStack follows the [svirt model](http://wiki.apparmor.net/index.php/Libvirt ) to provide guest isolation. Every guest VM is locked down to be able to access only its own configuration files, disk files and volume devices.

You should not need to interact with these profiles. Modification instructions are beyond the scope of this document.

For more information on AppArmor and managing profiles, review the information in the [Ubuntu AppArmor Documentation](https://help.ubuntu.com/community/AppArmor) and the other links [below](#info). 

## About AppArmor

AppArmor is an effective and easy-to-use Linux application security system. AppArmor proactively protects the operating system and applications from external or internal threats, even zero-day attacks, by enforcing expected behavior and reducing the risk of even unknown application flaws being exploited. AppArmor security policies completely define what system resources individual applications can access, and with what privileges. 

AppArmor confinement is provided through profiles loaded into the kernel, typically on boot. 

### AppArmor profile modes ### {#modes}

AppArmor profiles can be in one of two modes: enforcement and notify. Profiles loaded in enforcement mode will result in enforcement of the policy defined in the profile as well as reporting policy violation attempts (either through syslog or auditd). Profiles in complain mode will not enforce policy but instead report policy violation attempts. 

<!-- info taken variously from the links below -->

## For more information {#info}

* [Ubuntu AppArmor overview](https://wiki.ubuntu.com/AppArmor)
* [Ubuntu AppArmor Documentation](https://help.ubuntu.com/community/AppArmor)
* [AppArmor Upstream Wiki](http://wiki.apparmor.net/index.php/Main_Page)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----