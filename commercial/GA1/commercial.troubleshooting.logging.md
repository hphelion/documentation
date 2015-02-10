---
layout: default
title: "HP Helion OpenStack&#174; Troubleshooting Logging"
permalink: /helion/openstack/services/troubleshooting/logging/
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


# HP Helion OpenStack&#174;  Troubleshooting Logging

HP Helion OpenStack&#174; is an OpenStack technology coupled with a version of Linux&reg; provided by HP. This topic describes all the known issues that you might encounter. To help you resolve these issues, we have provided possible solutions.

####Issue in Logging {#issue-in-logging}

The user needs to manually follow the below steps to re-configure Kibana for logging.

1. Log in to the undercloud and start screen session.
2. In the screen, start following command `sudo -u logstash /usr/bin/java -Xmx1g -Djava.io.tmpdir=/var/lib/logstash/ -jar /opt/logstash/logstash.jar agent -f /etc/logstash/conf.d -w 10 --log /var/log/logstash/logstash.log`
3. Press Control **&** '**a**', then '**c**' to create another shell.
4. In a new shell execute command `sudo -u logstash /usr/bin/java -Xmx1g -Djava.io.tmpdir=/var/lib/logstash/ -jar /opt/logstash/logstash.jar agent -f /etc/logstash/conf.d -w 10 --log /var/log/logstash/logstash.log`
5. Repeat steps from **3-4** two times
6. Press Control **&** '**a**' then '**d**' to detach.
 
**Note**: If node reboots repeat the step from **1-6**.

**EDIT**: Added `sudo -u logstash` at beginning of commands. 


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593;</a>


