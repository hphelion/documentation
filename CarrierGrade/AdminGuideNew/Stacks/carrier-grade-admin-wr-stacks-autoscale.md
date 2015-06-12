---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Resource Scaling (Autoscaling)"
permalink: /helion/openstack/carrier/admin/stacks/autoscale/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: All

authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/1.1/3rd-party-license-agreements/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/">&#9650; UP</a> | NEXT &#9654; </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Resource Scaling (Autoscaling)

You can use the Orchestration (Heat) service to reassign stack resources automatically to meet changing conditions.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

You can define and monitor performance thresholds for metrics such as memory usage or CPU activity, and then add or remove resources when the thresholds are crossed. This allows you to make efficient use of the hardware in the cluster, by allocating resources only when they are needed, and assigning them where they are most required.

Wind River Linux supports two types of scaling:

* In/Out - This type of scaling (also known as horizontal scaling) adds or removes instances as needed.
* Up/Down - This type of scaling (also known as vertical scaling) increases or decreases resources (for example, vCPUs) for individual instances as needed. For more about up/down scaling, see [Scaling Virtual Machine Resources](/helion/commercial/carrier/dashboard/managing/instances/scaling/).

Performance metrics can be collected and reported from the Wind River Linux servers, or by the guests using guest
metrics. For more information about guest metrics, see Reporting a Guest Metric](/helion/commercial/carrier/dashboard/managing/instances/guest/).


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----