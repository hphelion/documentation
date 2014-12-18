---
layout: default
title: "HP Helion OpenStack&#174; Central Logging Overview"
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


# HP Helion OpenStack&#174; Central Logging Overview

Centralized logging is based on [Logstash](http://logstash.net/), [Elasticsearch](http://www.elasticsearch.org/), and [Kibana Dashboard](http://www.elasticsearch.org/guide/en/kibana/current/_dashboard_schema.html) which is deployed in the undercloud server.

Centralized logging helps the administrator triage and troubleshoot the distributed cloud deployment from the undercloud. The user is not required to access the several remote server (SSH) to view the individual log files.

**Note:** Logging requires 4GB of disk space to make sure that all logging messages are retained. 

Centralised logging support has now been added for the following additional components:

- HAProxy
- syslog
- keepalived 