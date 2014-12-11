---
layout: default
title: "HP Helion OpenStack&#174; Updating the Development-Platform Services"
permalink: /helion/openstack/update/devplatstop/101/
product: commercial.ga

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/">&#9664; PREV | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/faq/">NEXT &#9654; </a></p>
-->
# HP Helion OpenStack&reg; Stopping and Starting the Development Platform Services During the Upgrade Process

If you have installed [HP Helion Development Platform service](/helion/devplatform/), you need to take service control plane down before performing update on the overcloud. 

Since Dev-Platform services run the control plane in a clustered setup, we need to make sure that cluster is stopped in the correct order before updating the overcloud compute nodes. After the update is complete, you need to start the control plane using a command, which ensures the order for starting the cluster.

## Prerequisites

Before you begin, you can run a script to make sure all clusters are in healthy state. 

If this check fails, you must fix the cluster by manually logging into the target machines before running any of the update commands. If you run any of the update commands on a failed cluster, the cluster might enter a non-functional or non recoverable state of the corresponding Development Platform service at the end of the overcloud update. 

Before running pre-check command, set the correct value for Development Platform service, depending upon the service that you are targeting. Also set `ha_check=True` if you have installed corresponding service control plane in HA mode. 

**Note:** For Marketplace always set `ha_check=False`, as the Marketplace does not support HA mode.

To check the health of your clusters, on the server where the Development Platform service is installed, enter the following command:

		ansible-playbook -vvvv --extra-vars dev_plat_service=trove --private-key <path to SSH private key> --ha_check=True -u heat-admin -i plugins/inventory/dev_platform_heat.py playbooks/dev-platform/dev_platform_pre_check.yml

## Stopping Services ##

Use following command to stop the clusters. This command stops individual nodes in the cluster in a correct order. 

**Note:** By stopping the services, corresponding Development Platform service API will be unavailable until you start the services again after completing update on the overcloud.

To stop each Development Platform service, run the following command:

	ansible-playbook -vvvv --extra-vars dev_plat_service=trove --private-key <path to SSH private key> -u heat-admin -i plugins/inventory/dev_platform_heat.py playbooks/dev-platform/dev_platform_stop.yml

Where:

	dev_plat_service is the service that you are targeting.

<table>
	<tr>
	<th>Service</th><th>Value of dev_plat_service</th>
	</tr>
	<tr>
	<td>DBaaS</td><td>trove</td>
	<tr>
	<td>Marketplace</td><td>marketplace</td></tr>
	<tr>
	<td>DNSaaS</td><td>dnsaas</td></tr>
	</table>

	private-key is the full path to SSH private key

## Starting Services ##

After the overcloud update is complete, restart the services. 

Use following command to start each service in the cluster in a correct order. By successfully starting the clusters, you will be able to bring the corresponding Dev-Platform service into a functional state and the API can be used after this. 
Before running following command, set the correct value for dev_plat_service, depending upon the service that you are targeting.

		ansible-playbook -vvvv --extra-vars dev_plat_service=trove --private-key <path to SSH private key> -u heat-admin -i plugins/inventory/dev_platform_heat.py playbooks/dev-platform/dev_platform_start.yml

Where:

	dev_plat_service is the service that you are targeting.

<table>
	<tr>
	<th>Service</th><th>Value of dev_plat_service</th>
	</tr>
	<tr>
	<td>DBaaS</td><td>trove</td>
	<tr>
	<td>Marketplace</td><td>marketplace</td></tr>
	<tr>
	<td>DNSaaS</td><td>dnsaas</td></tr>
	</table>

	`private-key` is the full path to SSH private key

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----


