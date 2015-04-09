---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade: Administrators Guide"
permalink: /helion/openstack/carrier/siteindex/
product: commercial.ga
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: All

authors: Paul F

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/openstack/1.1/3rd-party-license-agreements/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/">&#9650; UP</a> | NEXT &#9654; </p>
-->

# HP Helion OpenStack&#174; 1.1: Administrators Guide



- [Release Notes](/helion/openstack/1.1/release-notes/) 
- [FAQs](/helion/openstack/1.1/faq/)  
- [Technical overview](/helion/openstack/1.1/technical-overview/)
- [Troubleshooting](/helion/openstack/1.1/services/troubleshooting/)

## Post-Installation Configuration ## {#swift}

After HP Helion OpenStack Carrier Grade is installed and operational, you can perform any of the following configurations, as needed.

- [Integrating LDAP](/helion/openstack/1.1/services/identity/integrate-ldap/)
- [Installing and Configuring DNSaaS](/helion/openstack/1.1/install/dnsaas/)
- [Backing Up and Restoring HP Helion OpenStack](/helion/openstack/1.1/backup.restore/)
- [Tracking masked IP addresses when using network address translation](/helion/openstack/1.1/maskedIP/)
- [Configuring your network securely](/helion/openstack/1.1/install/security/)
- [Removing and Replacing a Failed Overcloud Controller]( /helion/openstack/1.1/removing/failedovercloud/)
- [High Availability (HA)](/helion/openstack/1.1/high-availability/)


## Object Storage (Swift) Deployment ## {#swift}

Review the following topics related to Object Storage (Swift) deployment:

- [Object Storage (Swift) overview](/helion/openstack/1.1/services/object/overview/)
- [Scaling up or Expanding the Object Storage (Swift) Deployment overview](/helion/openstack/1.1/services/object/overview/scale-out-swift/)

	- Scale up or expand 
		- [Deploy New  Object Storage (Swift)](/helion/openstack/1.1/services/swift/deployment-scale-out/)
		- [Add New Storage Servers](/helion/openstack/1.1/services/swift/provision-nodes)
		- [Extend a Object Storage (Swift) Cluster](/helion/openstack/1.1/services/object/swift/expand-cluster/)
		- [Add a New Scale-out Object Node](/helion/openstack/1.1/services/swift/deployment/add-disk-object-node/)
		- [Add a New Scale-out Proxy Node](/helion/openstack/1.1/services/swift/deployment/add-proxy-node/)
		- [Add a Disk to a Scale-out Object Ring](/helion/openstack/1.1/services/swift/deployment/add-disk-scale-out/)
		- [Add a Disk to an Account and Container Ring](/helion/openstack/1.1/services/swift/deployment/add-disk-account-container/)
		- [Add a Disk to the Starter Object Ring](/helion/openstack/1.1/services/swift/deployment/add-disk-starter/)

- Shrink or scale down

	- [Shrink Object Storage (Swift) Cluster](/helion/openstack/1.1/services/object/swift/shrink-cluster/) 
		- [Remove a disk from an Object Node](/helion/openstack/1.1/services/swift/deployment/remove-existing-disk/)
		- [Remove a Proxy Node](/helion/openstack/1.1/services/swift/deployment/remove-proxy-node/)
		- [Removing a scale-out Object Storage Node](/helion/openstack/1.1/services/swift/deployment/remove-scale-out-object-node/)
	
- Monitor

	- [Monitor Object Storage (Swift) cluster]( /helion/openstack/1.1/services/object/swift/Monitor-cluster/)

		* [Monitor Disk Usage]( /helion/openstack/1.1/services/object/swift/Monitor-disk/)
		* [Replication Status using Icinga](/helion/openstack/1.1/services/object/swift/replica-status/)
		* [Service Health Check](/helion/openstack/1.1/services/object/swift/health-check/)
		* [Check Health Services](/helion/openstack/1.1/services/object/swift/health-swift-services/)
		* [Object Storage (Swift) Proxy Health Check]( /helion/openstack/1.1/services/object/swift/monitor-swift-proxy-health-checks/)
		* [Network Interface Card](/helion/openstack/1.1/services/object/swift/monitor-speed-of-NIC/)
		* [Mount Points](/helion/openstack/1.1/services/object/swift/mount-points/)
		* [Disk Drives](/helion/openstack/1.1/services/object/swift/disk-drive/)
		* [Network Access (Ping)](/helion/openstack/1.1/services/object/swift/monitor-network-access-ping/)
		* [Drive Audit]( /helion/openstack/1.1/services/object/swift/monitor-swift-drive-audit/)
		* [File Ownership](/helion/openstack/1.1/services/object/swift/file-ownership/)
		* [Monitoring Disk Drives in Object Storage Using hpssacli Utility](/helion/openstack/1.1/services/swift/diagnosis-disk-health/hpssacli/)

- [Ringos Tool Overview](/helion/openstack/1.1/GA1/services/object/pyringos/)



## HP Helion OpenStack Services ## {#services}

- [Services Overview](/helion/openstack/1.1/services/overview/)
- [Compute Services Overview](/helion/openstack/1.1/services/compute/overview/)
- [DNS Service Overview](/helion/openstack/1.1/services/dns/overview/)
- [DVR Service Overview](/helion/openstack/1.1/services/dvr/overview/)
- [EON Service Overview](/helion/openstack/1.1/services/eon/overview/)
- [Horizon Service Overview](/helion/openstack/1.1/services/horizon/overview/)
- [Identity Operations Service Overview](/helion/openstack/1.1/services/identity/overview/)
- [Image Operations Service Overview](/helion/openstack/1.1/services/imaging/overview/)
- [Ironic Service Overview](/helion/openstack/1.1/services/ironic/overview/)
- [Networking Operations Service Overview](/helion/openstack/1.1/services/networking/overview/)
- [Object Operations Service Overview](/helion/openstack/1.1/services/object/overview/)
- [Orchestration Service Overview](/helion/openstack/1.1/services/orchestration/overview/)
- [Metering Service Overview](/helion/openstack/1.1/services/reporting/overview/)
- [Ceph Service Overview]( /helion/openstack/1.1/services/ceph/)
- [Sherpa Service Overview](/helion/openstack/1.1/services/sherpa/overview/)
- [Sirius Service Overview](/helion/openstack/1.1/services/sirius/overview/)
	- [Sirius CLI Workflow](/helion/openstack/1.1/sirius/cli/workflow)
	- [Configuring Your Storage Using Sirius](/helion/openstack/1.1/sirius-cli/)
- [Tripleo Service Overview](/helion/openstack/1.1/services/tripleo/overview/)
- [Volume Operations Service Overview](/helion/openstack/1.1/services/volume/overview/)

<!-- Not in 1.01
- [Eve Service Overview](/helion/openstack/1.1/services/eve/overview/)
- [Focus Service Overview](/helion/openstack/1.1/services/focus/overview/)
- [Reporting Service Overview](/helion/openstack/1.1/services/reporting/overview/) -->





<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----
