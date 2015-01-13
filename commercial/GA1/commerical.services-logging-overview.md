---
layout: default
title: "HP Helion OpenStack&#174; Centralized Logging Overview"
permalink: /helion/openstack/services/logging/overview/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


# HP Helion OpenStack&#174; Centralized Logging Overview

Because a typical HP Helion OpenStack cloud consists of multiple servers, locating a specific log from a specific server can be difficult.

The HP Helion OpenStack centralized logging feature collects logs on a central system, rather than leaving them scattered across the network. The administrator can use a single graphic interface to view log information.

Centralized logging helps the administrator triage and troubleshoot the distributed cloud deployment from the undercloud. The admin is not required to access the several remote servers (SSH) to view the individual log files.

Centralized logging consists of several components, based on Logstash, Elasticsearch, RabbitMQ, and Kibana.

* **Beaver** is a python daemon that takes information in log files and sends the content to logstash.

* **RabbitMQ** is a message broker for collection of logging data across nodes. 

* **logstash** is a log processing system for receiving, processing and outputting logs. logstash receives from Beaver, processes and enriches the data, then stores the data in Elasticsearch.  

* **Elasticsearch** is data store offering fast indexing and querying.  

* **Kibana** is a client-side JavaScript application to visualize the data in Elasticsearch through a web browser. Kibana enables you to create charts and graphs using the log data. 

At a high level, Beaver forwards JSON messages to RabbitMQ on the management controller node, where they will be received by Logstash, possibly filtered and saved into Elasticsearch. Users can use the Kibana interface to view and analyze the information, as described in the following figure:

<img src="media/centrallogging.png" size="75%">


**Note:** Logging requires 4GB of disk space to make sure that all logging messages are retained. 

In addition to each of the [HP Helion services](/helion/openstack/services/overview/), Centralized Logging also processed logs for the following components:

- HAProxy
- syslog
- keepalived 

The following table lists the types of logs collected by Centralized Logging and provides information on how the logs are maintained.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<th>Data name</th><th>Confidentiality</th><th>Integrity</th><th>
Availability</th><th>Backup?</th><th>Description</th></tr>
<tr style="background-color: white; color: black;">
<td>Log records</td><td>Restricted</td><td>High</td><td>Medium</td><td>No</td><td>Log records have a limited life, and are not archived. The log file on the local filesystem provides a fallback source of logging data (up to 20GB or 45 days) if the logging system fails.</td></tr>
<tr>
<td>Log metadata</td><td>Restricted</td><td>High</td><td>Medium</td><td>No</td><td>Elasticsearch indexes logged data to allow flexible searching.</td></tr>
<tr>
<td>Credentials</td><td>Confidential</td><td>High</td><td>Medium</td><td>No</td><td>Credentials for access to Elasticsearch and RabbitMQ are stored in configuration files owned by root with mode 0600.</td></tr>
</table>

Log rotation will happen daily or when the current logfile reaches 2GB, whichever happens sooner. The number of rotations held will be balanced to attempt to cap logs from all services at 200GB. Few rotations of the JSON log will be retained.


## Installation ## {#install}

Centralized Logging is automatically installed in the undercloud as part of the Helion OpenStack installation process. 

No specific configuration is required to use Centralized Logging. However, you can tune or configure the individual components as needed for your environment. Tuning and configuring these components is outside the scope of this document. 


### Kibana configuration ### {#kibana}

You can use the Kibana dashboards to view log data. Kibana is a tool developed to create tables, histograms, pie charts based on logs send to Elasticsearch by logstash. 

Kibana works directly to Elasticsearch from the browser, not through an intermediary. 

While creating Kibana dashboards is beyond the scope of this document, it is important to know that you can use the default Kibana dashboards or create custom dashboards. The dashboards are JSON files that you can modify or create new dashboards based on existing dashboards.

**Note:** Kibana is client-side software. To operate properly, the browser must be able to access port 81 on undercloud. 

### Logging into Kibana ## {#interface}

Because centralized logging is separate service from the Horizon dashboards, there is separate username/password authentication. By default, the HP Horizon dashboard username and password will not work with Kibana.

After installation, the Kibana username and password are stored on the undercloud in the `/opt/kibana/htpasswd.cfg` file. 

## For more information ##

For information the centralized logging components, use the following links: 

* [Logstash](http://logstash.net/) 
* [Elasticsearch](http://www.elasticsearch.org/)
* [RabbitMQ](http://www.rabbitmq.com/)
* [Kibana Dashboard](http://www.elasticsearch.org/guide/en/kibana/current/_dashboard_schema.html)

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----

