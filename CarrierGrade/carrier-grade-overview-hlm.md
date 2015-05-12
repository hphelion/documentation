---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Helion Lifecycle Management (HLM) Overview"
permalink: /helion/openstack/carrier/hlm/overview/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"><a href="/helion/openstack/carrier/overview/"> &#9664; HP Helion OpenStack Carrier Grade Overview | <a href="/helion/openstack/carrier/home/">&#9650; Documentation Home</a> | <a href="/helion/openstack/carrier/helion/overview/"> HP Helion OpenStack Overview &#9654;</a></p>

# HP Helion OpenStack&#174; Carrier Grade (Beta): Helion Lifecycle Management (HLM) Overview

<!-- From https://rndwiki2.atlanta.hp.com/confluence/display/cloudos/HLM+Command+Line+Interface -->

The hlm tool is driven, in part, by the metadata available to the configuration processor. The valid set of control planes, services, components, and nodes are part of this metadata. Also, every component and service will have a list of supported commands with names of the top-level playbooks associated with that action. Services are differentiated from components in the services*.json by creating a service as a logical component. Components of the service identify a logical component as their service.

When a command does not specify a target, the command applies to the entire cloud. Commands applying to the entire cloud, or to a control plane, will require the tool to invoke the playbooks for that command for all of the services configured for the specified target.

When a command is specified for which no metadata is available for the specified target (or entire cloud when no target is specified), the tool will list the set of commands that are available for the target. This is an error condition for the tool, but the listed actions will help the user correct the command.

When a target is specified for a command that does not take a target, the help for that command is printed. If a target is specified for a command taking a target where the specified target does not exist, the list of control planes and list of services accepting that command are printed. The display command can be used to list the nodes and components.

Depending upon implementation choices, some commands may not be driven from metadata. For instance, the commands 'define', 'generate', 'display', and 'provision' are candidates could be supported as part of the tool code.

Services:

<!-- From https://rndwiki2.atlanta.hp.com/confluence/display/cloudos/Kenobi+Service+Components -->

* Foundation IP-Cluster - HAProxy, keepaliveD, Corosync,
* Pacemaker
* Foundation AMQP - RabbitMQ (Mirrored Queues)
* Foundation Config - Ansible Processor
* Nova
* Icinga
* Ceilometer
* Cinder
* Glance
* Heat
* Horizon
* Keystone
* Nova
* Sherpa
* Swift
* Logging	Logstash
* Logging	ElasticSearch
* Logging	Kibana
* Monasca monitoring-as-a-service solution that integrates with OpenStacK
* Foundation Kafka 
* Foundation Zookeeper
* Foundation Storm
* Foundation InfluxDB


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----