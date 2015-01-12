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

Centralized logging helps the administrator triage and troubleshoot the distributed cloud deployment from the undercloud. The user is not required to access the several remote server (SSH) to view the individual log files.

Centralized logging is based on [Logstash](http://logstash.net/), [Elasticsearch](http://www.elasticsearch.org/), and [Kibana Dashboard](http://www.elasticsearch.org/guide/en/kibana/current/_dashboard_schema.html) which is deployed in the undercloud server.

* **Beaver** is an MIT licensed python daemon that takes information in log files and sends the content to logstash.

* **logstash** is a tool for receiving, processing and outputting logs. logstash receives from Beaver, processes and enriches the data, then stores the data in Elasticsearch.  

* **Elasticsearch** works seamlessly with Logstash to collect, parse, index, and search logs

* **Kibana** is a tool to visualize the data in Elasticsearch. Kibana enables you to create charts and graphs using the log data.

At a high level, Beaver forwards JSON messages to RabbitMQ on the management controller node, where they will be received by Logstash, possibly filtered and saved into Elasticsearch. Users can use the Kibana interface to view and analyze the information, as described in the following figure:

<img src="media/centrallogging.png">


**Note:** Logging requires 4GB of disk space to make sure that all logging messages are retained. 

Centralised logging support has now been added for the following additional components:

- HAProxy
- syslog
- keepalived 


Log rotation will happen daily or when the current logfile reaches 2GB, whichever happens sooner. The number of rotations held will be balanced to attempt to cap logs from all services at 200GB. Few rotations of the JSON log will be retained.


## Installation ## {#install}

Centralized Logging is automatically installed as part of the Helion OpenStack installation process.



### Kibana configuration ### {#kibana}

Kibana is a tool developed to create nice graphs based on logs send to elasticsearch by logstash. It makes use of the excellent facetted queries as provided by elasticsearch to create tables, histograms, pie charts and even maps with geo points. Kibana is a purely javascript based, so client side, application connecting to the rest interface of elasticsearch. Using the interface you can create lots of different charts presenting data coming out of elasticsearch. the charts are constructed using the forms provided by Kibana.

A Kibana dashboard is just a json document.

you can copy one of the examples in the kibana folder. Especially the logstash.json sample is a good start to see what is possible. Another way to start from an existing dashboard is to export a dashboard that you have created using the interface. 

Kibana 3 talks directly to Elasticsearch from the browser. This means that your browser communicates directly with Elasticsearch, not via an intermediary. 

Custom dashboards
http://www.elasticsearch.org/overview/

pre-designed dashboards or update these dashboards in real-time for on-the-fly data analysis.

## Logging interface ## {#interface}

The User would log into this Kibana dashboard and use it to search logs for events he wants to know. Logging system is separate service to Horizon, so there is separate authentication – data is stored on undercloud node in file /opt/kibana/htpasswd.cfg. Kibana dash board is client side software, so to operate properly browser must be able to access port 81 on undercloud. 

I think customer need to know about how to authenticate, that extra port must be open and of course that interface runs on undercloud. In future some logs will be removed from database, so this info should be documented as well.

