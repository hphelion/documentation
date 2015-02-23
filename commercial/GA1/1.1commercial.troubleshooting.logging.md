---
layout: default
title: "HP Helion OpenStack&#174; Troubleshooting Logging"
permalink: /helion/openstack/1.1/services/troubleshooting/logging/
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

<p style="font-size: small;"> <a href="/helion/openstack/1.1/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/1.1/services/reporting/overview/"> NEXT &#9654</a> </p> --->


# HP Helion OpenStack&#174;  Troubleshooting Logging

HP Helion OpenStack&#174; is an OpenStack technology coupled with a version of Linux&reg; provided by HP. This topic describes all the known issues that you might encounter. To help you resolve these issues, we have provided possible solutions.

<!-- Removed per DOCS-851
## Issue in Logging {#issue-in-logging}

The user needs to manually follow the below steps to re-configure Kibana for logging.

1. Log in to the undercloud and start screen session.
2. In the screen, start following command 

	`sudo -u logstash /usr/bin/java -Xmx1g -Djava.io.tmpdir=/var/lib/logstash/ -jar /opt/logstash/logstash.jar agent -f /etc/logstash/conf.d -w 10 --log /var/log/logstash/logstash.log`

3. Press Control **&** '**a**', then '**c**' to create another shell.

4. In a new shell execute command 

	`sudo -u logstash /usr/bin/java -Xmx1g -Djava.io.tmpdir=/var/lib/logstash/ -jar /opt/logstash/logstash.jar agent -f /etc/logstash/conf.d -w 10 --log /var/log/logstash/logstash.log`

5. Repeat steps from **3-4** two times

6. Press Control **&** '**a**' then '**d**' to detach.
 
**Note**: If node reboots repeat the step from **1-6**.

**EDIT**: Added `sudo -u logstash` at beginning of commands. 
-->

## Logs can fill undercloud node

Logs are stored in one index per day in the Elasticsearch database but are not rotated.

Because logs are not rotated, the logs can accumulate and consume significant space on the undercloud.

Use the following command to view information on log storage: 

	curl http://localhost:9200/_cat/indices?v

The output of the command is similar to the following:

	health index pri rep docs.count docs.deleted store.size pri.store.size
	yellow logstash-2015.02.10 5 1 33758082 0 16.5gb 16.5gb
	yellow logstash-2015.02.11 5 1 27471823 0 13.6gb 13.6gb


You can delete older data using following command:
curl -X http://localhost:9200/[index name]

## The number of logstash processes might not be sufficient

On larger installations, logstash may not be able to process logs as they are produced. In this case unprocessed logs are stored in RabbitMQ queue and this queue is increasing. 

To check size of queue, use the following command: 

	rabbitmqctl list_queues | grep logs

The output of the command is similar to the following:

	logstash-queue 0

If the queue is more than zero, wait a few minutes and run command again. If the size has increased, logs are not being processed quickly enough and the number of logstash processes should be increased. 

To increase logstash processes:

1. Stop logstash using command

	service logstash stop

2. In the `/etc/default/logstash` file, find the `LS_NUM_INSTANCES` line and change the value to a larger number. 

3. Restart logstash using the following command 

	service logstash start

In approximately 15 minutes logstash starts processing. Re-check the queue size to make sure the queue size is reducing. 

## Contacting Customer Service ## {#sos}

If you need further assistance, contact [HP Customer Support](http://www.hpcloud.com/about/contact). 

Before contacting HP Customer Support, [run the `run-sosreport` command](/helion/openstack/1.1/services/troubleshooting/#sos) on the affected system. 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593;</a>


