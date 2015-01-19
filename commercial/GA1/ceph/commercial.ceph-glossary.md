---
layout: default
title: "HP Helion OpenStack&#174; Edition: HP Helion Ceph"
permalink: /helion/openstack/ceph-glossary/
product: commercial

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/esx/">NEXT &#9654;</a> </p>--->


#Glossary

* Cephx - The Ceph authentication protocol. Cephx operates like Kerberos, and it has no single point of failure.

* Ceph Stack - A collection of two or more components of Ceph.

* Ceph Node [ Node, Host ] - Any single machine or server in a Ceph System.

* cluster map - The set of maps comprising the monitor map, OSD map, PG map, MDS map and CRUSH map.

* RBD - The block storage component of Ceph.

* Ceph Block Storage - The block storage "product," service or capabilities when used in conjunction with librbd, a hypervisor such as QEMU or Xen, and a hypervisor abstraction layer such as libvirt.

* Ceph OSD - The Ceph OSD software, which interacts with a logical disk(OSD). Sometimes, Ceph users use the term "OSD" to refer to "Ceph OSD Daemon", though the proper term is "Ceph OSD".

* CRUSH - Controlled Replication Under Scalable Hashing. The algorithm Ceph uses to compute object storage locations.

* Epoch - Ceph maintains a history of each state change in the Ceph Monitors, Ceph OSD Daemons, and PGs. Each version of cluster element state is called an "epoch."

* Federated storage - A collection of autonomous storage resources with centralized management that provides rules about how data is stored, managed, and moved through the cluster. Multiple storage systems are combined and managed as a single storage pool.

* Object storage - A storage model focusing on data objects instead of file systems or disk blocks; objects have key/value pairs of metadata associated with them to give the data context. Typically accessed by a REST API, designed for massive scale, and using a wide, flat namespace.

* Ceph Object Gateway [ RADOS Gateway, RGW ] - The S3/Swift gateway component of Ceph.

* Ceph Metadata Server - MDS - The Ceph metadata software.

* Ceph Client - The collection of Ceph components which can access a Ceph Storage Cluster. These include the Ceph Object Gateway, the Ceph Block Device, the Ceph Filesystem, and their corresponding libraries, kernel modules, and FUSEs.

* Ceph Kernel Modules - The collection of kernel modules which can be used to interact with the Ceph System (e.g,. ceph.ko, rbd.ko).

* Ceph Client Libraries - The collection of libraries that can be used to interact with components of the Ceph System.

* PGs - Placement Group. A grouping of objects on an OSD; pools contain a number of PGs and many PGs can map to an OSD.

* Pools - Logical partitions for storing objects. Pools set ownership/access to objects, the number of object replicas, the number of placement groups, and the CRUSH rule set to use.

* RADOS - A Reliable, Autonomic Distributed Object Store. This is the core set of storage software that stores the user's data in a Ceph Cluster (MON+OSD).

* REST - Representational State Transfer is stateless, cacheable, layered client-server architecture with a uniform interface.

* CODN - Cloud OS Distribution Network