---
layout: default
title: "HP Helion OpenStack&#174; Kibana Service"
permalink: /helion/commercial/1.1/services/kibana/
product: commercial.ga
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Systems Administrator 
role2: Cloud Architect 
role3: Storage Administrator 
role4: Network Administrator 
role5: Service Developer 
role6: Cloud Administrator 
role7: Application Developer 
role8: Network Engineer 
authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/community/services/object/overview/">&#9664; PREV</a> | <a href="/helion/community/services/overview/">&#9650; UP</a> | <a href=" /helion/community/services/swift/deployment/"> NEXT &#9654</a> </p>-->


# HP Helion OpenStack&#174;: Kibana Overview

The Kibana service, which runs in the undercloud, is the user interface into the [centralized logging service](/helion/openstack/1.1/services/logging/overview/) that helps view logging data across the HP Helion OpenStack cloud.

Kibana is an open source (Apache Licensed), browser based analytics and search dashboard for ElasticSearch. 


### Connecting to the monitoring and logging interfaces ### {#connectmonitor}

To access the Kibana logging console: 

1. Launch a web browser on the seed cloud host to the following IP address, using the undercloud IP address from the end of the install:

		http://<undercloud IP>:81 

	**Example:**

		http://192.0.2.2:81

	If you did not retrieve the undercloud IP from the end of the install, enter the following command:

		. /root/tripleo/tripleo-undercloud-passwords
		TE_DATAFILE=/root/tripleo/ce_env.json . /root/tripleo/tripleo-incubator/undercloudrc
		OVERCLOUD_IP=$(heat output-show overcloud KeystoneURL | cut -d: -f2 | sed s,/,,g )
		echo $UNDERCLOUD_IP

2. Log in with the user name `kibana` and the password you obtained from the end of the install.

	If you did not retrieve the password:

	a. From the seed cloud host log in to the undercloud as super user:

		ssh heat-admin@<undercloud IP> 
		sudo su - 

	b. Enter the following command to display the password:

		cat  /root/work/tripleo/tripleo-undercloud-passwords

	Make note of the password.

For more information, see the [Kibana web site](http://www.elasticsearch.org/guide/en/kibana/current/_introduction.html).


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----

 



