---
layout: default
title: "HP Helion OpenStack&#174; Monitoring the Update"
permalink: /helion/openstack/update/monitor/101/
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
<p style="font-size: small;"> <a href="/helion/openstack/">&#9664; PREV | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/faq/">NEXT &#9654; </a></p>
-->
# HP Helion OpenStack&reg; Monitoring the Update

To assess the progress of HP Helion Cloud update, the progress utility provides an overview of the update status.    

This provides an option to get a snapshot of the current state or to monitor the update progress.


## View the current status

To get a snapshot of current status of HP Helion OpenStack update:

1. Log in the seed VM host.

		sudo su -

2. SSH to the seed VM.

		ssh root@192.0.2.1 

3. Run the following commands:

		cd /opt/stack/tripleo-ansible/update_helpers/
		./progress.sh

## Monitor the progress ## 

To get a snapshot of current status of HP Helion update:


1. Log in the seed VM host.

		sudo su -

2. SSH to the seed VM.

		ssh root@192.0.2.1 

3. Run the following commands:

		cd /opt/stack/tripleo-ansible/update_helpers/
		./progress.sh --refresh

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*


