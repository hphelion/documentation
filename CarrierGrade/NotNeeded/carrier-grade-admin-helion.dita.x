<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE topic
  PUBLIC "-//OASIS//DTD DITA Topic//EN" "http://docs.oasis-open.org/dita/v1.1/OS/dtd/topic.dtd" ><topic xml:lang="en-us" id="topic2061">
<title>HP Helion <tm tmtype="reg">OpenStack</tm> Carrier Grade (Beta): Administering the HP Helion <tm tmtype="reg">OpenStack</tm> Region</title>
<prolog>
<metadata>
<othermeta name="layout" content="default"/>
<othermeta name="product-version" content="HP Helion Openstack"/>
<othermeta name="product-version" content="HP Helion Openstack 1.1"/>
<othermeta name="role" content="All"/>
<othermeta name="role" content="Paul F"/>
<othermeta name="product-version1" content="HP Helion Openstack"/>
<othermeta name="product-version2" content="HP Helion Openstack 1.1"/>
</metadata>
</prolog>
<body>
<p>
<!--UNDER REVISION-->
 <!--./CarrierGrade/Admin_Guide/carrier-grade-admin-helion.md-->
 <!--permalink: /helion/openstack/carrier/admin/helion/--></p>
<p>Use the following links for information on administrative tasks you can perform in the HP Helion <tm tmtype="reg">OpenStack</tm> region:</p>
<section id="swift"> <title>Post-Installation Configuration</title>
<p>After HP Helion <tm tmtype="reg">OpenStack</tm> Carrier Grade is installed and operational, you can perform any of the following configurations, as needed.</p>
<!--
- [Integrating LDAP](/helion/openstack/carrier/services/identity/integrate-ldap/)
- [Tracking masked IP addresses when using network address translation](/helion/openstack/carrier/maskedIP/)
- [Configuring your network securely](/helion/openstack/carrier/install/security/)
- [Removing and Replacing a Failed Overcloud Controller](/helion/openstack/carrier/removing/failedovercloud/)
- [High Availability (HA)](/helion/openstack/carrier/high-availability/)
- Installing and Configuring DNSaaS](/helion/openstack/carrier/install/dnsaas/)
- [Backing Up and Restoring HP Helion <tm tmtype="reg">OpenStack</tm>

-->
</section>
<section id="swift"> <title>Object Storage (Swift) Deployment</title>
<p>Review the following topics related to Object Storage (Swift) deployment:</p>
<ul>
<li>
<xref href="../../CarrierGrade/ServicesOverviews/carrier-grade-services-object-overview.dita" >Object Storage (Swift) overview</xref>
</li>
<li>
<p>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-scale-out-swift.dita" >Scaling up or Expanding the Object Storage (Swift) Deployment overview</xref>
</p>

<ul>
<li>Scale up or expand 

<ul>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment.dita" >Deploy New  Object Storage (Swift)</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-provision-swift-node.dita" >Add New Storage Servers</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-expand-swift-cluster.dita" >Extend a Object Storage (Swift) Cluster</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-add-disk-storage-node.dita" >Add a New Scale-out Object Node</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-add-proxy-node.dita" >Add a New Scale-out Proxy Node</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-add-disk-scale-out-object-ring.dita" >Add a Disk to a Scale-out Object Ring</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-add-disk-account-container.dita" >Add a Disk to an Account and Container Ring</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-add-disk-starter-object-ring.dita" >Add a Disk to the Starter Object Ring</xref>
</li>
</ul>
</li>
</ul>
</li>
<li>
<p>Shrink or scale down</p>

<ul>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-shrink-swift-cluster.dita" >Shrink Object Storage (Swift) Cluster</xref> 

<ul>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-shrink-remove-exisitng-disk.dita" >Remove a disk from an Object Node</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-shrink-remove-proxy-node.dita" >Remove a Proxy Node</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-shrink-remove-scale-out-object-storage-node.dita" >Removing a scale-out Object Storage Node</xref>
</li>
</ul>
</li>
</ul>
</li>
<li>
<p>Monitor</p>

<ul>
<li>
<p>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-swift-cluster.dita" >Monitor Object Storage (Swift) cluster</xref>
</p>

<ul>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-swift-disk.dita" >Monitor Disk Usage</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-replica-swift-status.dita" >Replication Status using Icinga</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-health-check.dita" >Service Health Check</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-health-swift-services.dita" >Check Health Services</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-swift-proxy-health-checks.dita" >Object Storage (Swift) Proxy Health Check</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-swift-network-interface.dita" >Network Interface Card</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-swift-mount-points.dita" >Mount Points</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-disk-drive(s).dita" >Disk Drives</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-swift-network-access-ping.dita" >Network Access (Ping)</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-swift-drive-audit.dita" >Drive Audit</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-swift-file-ownership.dita" >File Ownership</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-diagnosis-disk-health-hpssacli.dita" >Monitoring Disk Drives in Object Storage Using hpssacli Utility</xref>
</li>
</ul>
</li>
</ul>
</li>
<li>
<p>
<xref href="../../CarrierGrade/ServicesOverviews/carrier-grade-services-object-pyringos.dita" >Ringos Tool Overview</xref>
</p>
</li>
</ul>
</section>
<section id="services"> <title>HP Helion <tm tmtype="reg">OpenStack</tm> Services</title>
<ul>
<li>
<xref href="../../CarrierGrade/Overview/carrier-grade.services-overview.dita" >Services Overview</xref>
</li>
<li>
<xref href="../../CarrierGrade/ServicesOverviews/carrier-grade-services-compute-overview.dita" >Compute Services Overview</xref>
</li>
<li>
<xref href="../../CarrierGrade/ServicesOverviews/carrier-grade-services-horizon-overview.dita" >Horizon Service Overview</xref>
</li>
<li>
<xref href="../../CarrierGrade/ServicesOverviews/carrier-grade-services-orchestration-overview.dita" >Orchestration Service Overview</xref>
</li>
<li>
<xref href="../../CarrierGrade/ServicesOverviews/carrier-grade-services-metering-overview.dita" >Metering Service Overview</xref>
</li>
</ul>
<p>
  <xref type="section" href="#topic2061"> Return to Top </xref>
</p>
<!-- ===================== horizontal rule ===================== -->
</section>
</body>
</topic>
