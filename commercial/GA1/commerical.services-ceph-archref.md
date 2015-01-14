---
layout: default
title: "HP Helion OpenStack&#174; Ceph Architecture Reference"
permalink: /helion/openstack/services/object/ceph/archref/
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
<p style="font-size: small;"> <a href="/helion/openstack/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/swift/deployment-scale-out/"> NEXT &#9654</a> </p>
-->

# HP Helion OpenStack&reg;: Ceph Storage Architecture Reference  {#refarch}

At minimum, Ceph cluster includes one Admin node, one Monitor node (MON) and 3 Object Storage Daemons (OSD). The Monitor node can also coexist on the same Host as one of the OSD. Administrative and control operations are typically issued from Admin node. Note that there is also Metadata server node (MDS) stores metadata on behalf of the Ceph Filesystem (i.e., Ceph Block Devices and Ceph Object Storage do not use MDS). There is no need for a MDS node as HP as this current time does not support the Ceph Filesystem interface.

Communication Diagram from Helion OpenStack to Ceph Cluster
<img src="media/cephcomm.png">

Logical Reference Architecture Diagram for Ceph Cluster
<img src="media/cephlogicalarch.png">

Helion OpenStack with Ceph Cluster Deployment Example
<img src="media/cephcluster.png">

### Helion OpenStack with Ceph Cluster Deployment Example ### {#deployexample}

<img src="media/cephdeploy.png">


## For more information

[Ceph Architecture Reference](/helion/openstack/services/object/ceph/archref/)
[Ceph Integration Overview](/helion/openstack/services/object/ceph/overview/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----