---
layout: default
title: "HP Helion OpenStack&#174; Troubleshooting ESX and OVSvApp"
permalink: /helion/openstack/services/troubleshooting/esx/
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

<p style="font-size: small;"> <a href="/helion/openstack/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/reporting/overview/"> NEXT &#9654</a> </p> --->


# HP Helion OpenStack&#174;  Troubleshooting ESX and OVSvApp

HP Helion OpenStack&#174; is an OpenStack technology coupled with a version of Linux&reg; provided by HP. This topic describes all the known issues that you might encounter. To help you resolve these issues, we have provided possible solutions.

* [nova-manage service list does not list the compute service as running](#nova-compute)
* [Unable to login to vCenter proxy agent](#unable-login-vcenter)
* [Unable to backup volumes using Cinder backup](#unable-cinder-backup)
* [Failure of OVSvAPP deployment](#fails-ovsvapp)

###nova-manage service list does not list the compute service as running {#nova-compute}

**System Behavior/Message**

There can be multiple reason why nova-compute service is not listed or has a :) as status.

**Resolution**

To resolve the above issue verify the following:

1.	The ESX Management Network is able to reach the Helion Management Network.
2.	nova-compute service is running (os-svc-restart &#45;n nova-compute).
3.	Verify `/etc/nova/nova-compute.conf` has the right entries.
<br>
<hr>

### Unable to login to vCenter proxy agent {#unable-login-vcenter}

**System Behavior/Message**

 Unable to login to vCenter proxy agent through the console.

**Resolution** 

Users can login to the system using the user `heat-admin ` and the authorized key in the Seed VM.
<br><br>
<hr>

### Unable to backup volumes using Cinder backup {#unable-cinder-backup}

**System Behavior/Message**

 Unable to backup volumes using Cinder backup.

**Resolution**

Cinder-backup is not supported.
<br><br>
<hr>

###Failure of OVSvAPP deployment {#fails-ovsvapp}

**System Behavior/Message**

Failure of OVSvAPP deployment.

**Resolution**

Verify `tripleo/hp-ovsvapp/log/ovs_vapp.log` in the installer directory.

<br><br>
<hr>

**System Behavior/Message**

After reboot of Controller that has the VIP assigned, the hpvcn agent, nova-compute service, nova compute service in the proxy node and HCN agent in OVSvAPP needs to be restarted manually to resume normal operations.

**Resolution**

* To restart nova-compute, execute the following command in compute proxies

		# service nova-compute restart  

* To restart HP VCN agent, execute the following command in OVSvAPP vm's

		#service hpvcn-neutron-agent restart 
<br><br>
<hr>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593;</a>


