---
layout: default
title: "HP Cloud OS Eve Service Overview "
permalink: /cloudos/services/eve/overview/
product: compute
published: false
---
<!--PUBLISHED-->
# HP Cloud OS Eve Service Overview #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

Eve is the HP Cloud OS infrastructure topology provisioning service. Eve allows you to:

- Provision TOSCA-based infrastructure topology designs (composite, hybrid, and distributed).
- Separate topology creation and resource pool binding, for simpler, reusable topologies.
- Integrate via a plug-in model with Cloud API's (e.g., OpenStack Nova) for orchestrating provisioning.
- Create and configure network services such as virtual load-balancers and configuration management services.

Eve also provides a logical execution container for flexible deployment of web-scale, stateless, thread controlled, non-blocking coarse-grained services. 

This additional functionality in Eve allows you to:

- Retrieve the list of provisioning jobs
- Retrieve information about a specific provisioning job

TOSCA is a standard way to describe the topology of applications along with dependent environments, services and artifacts inside a single service template. TOSCA standard enables each customer to deploy and manage topologies against the capabilities offered by any cloud provider, regardless of the customer's infrastructure or service model. 

###Using the API to access Eve### {#API}
 
You can use a low-level, raw REST API access to HP Cloud OS Eve service. See .

###Using the CLI### {#cli}

You can use any of several command-line interface software to access HP Cloud OS Eve service. See .

###Using language bindings### {#bindings}

You can use any of several language bindings to access HP Cloud OS Eve service. See .


## For more information ##
Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/)
