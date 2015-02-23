---
layout: default
title: "HP Helion OpenStack&#174; Metering Service (Ceilometer): API Extensions"
permalink: /helion/openstack/1.1/services/reporting/APIextensions/
product: commercial.ga
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
Role1: Systems Administrator 
Role2: Data Center Architect 
Role3: Cloud Administrator 
Role4: Net Ops Engineer 
Role5: NOC Engineer 
Role6: Network Administrator
Writer: Jayme P

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


# HP Helion OpenStack&#174; Metering Service (Ceilometer): API Extensions
APIs can be extended to provide additional functionality.

HP has created and added a Health-Check API for the Ceilometer Reporting API. This Health-Check provides more response options when assessing the availability and healthiness of the Ceilometer service.
 

##Health Check API

Currently the HA Proxy (Load Balancer) can validate that there is IP/HTTP connectivity with the service. If connected, it is safe to assume that it is alive; however, this assumption is not a guarantee that the service is actually functional. It could be alive but completely unable to retrieve data or perform write operations. This API extension further assesses the health of the service beyond the basic connectivity check.

**Operations**

The usual **HEAD** request only checks for basic IP/HTTP connectivity. The **GET** request performs a full round-trip connectivity check all the way to the database and back.
<table>
<tr><td width="120"></td><td>Successful Response</td><td>Error Response</td><td>Take Action</td></tr>
<tr><td>HEAD /v2/health</td><td>204 No Content</td><td>404 Not Found, 500 Internal Server Error</td><td>Verify that the Ceilometer Reporting API are up and running.</td></tr>
<tr><td>GET /v2/health</td><td>200 OK</td><td>404 Not Found, 500 Internal Server Error, 503 Service Unavailable</td><td>Verify that the Ceilometer Reporting API are up and running and there is connectivity with the back-end.</td></tr>
</table>

**Errors**

<table>
<tr><td width="120"></td><td>Error Response</td><td>Explanation</td></tr>
<tr><td>HEAD /v2/health</td><td>404 Not Found</td><td>The API cannot be reached; not even the basic system is up and running.</td></tr>
<tr><td>HEAD /v2/health</td><td>500 Internal Server Error </td><td>The API has been reached but it failed to perform its operation. The service is highly compromised. </td></tr>
<tr><td>GET /v2/health</td><td>404 Not Found</td><td>The API cannot be reached; not even the basic system is up and running</td></tr>
<tr><td>GET /v2/health</td><td>500 Internal Server Error</td><td>The API has been reached but it failed to perform its operation. The service is highly compromised. </td></tr>
<tr><td>GET /v2/health</td><td>503 Service Unavailable</td><td>The API has been reached but the back-end connectivity is unavailable or compromised. The service cannot successfully perform its operations. </td></tr>
</table>
