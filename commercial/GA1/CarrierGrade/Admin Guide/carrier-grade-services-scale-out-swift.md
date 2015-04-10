---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade: About Scale-out Object Storage (Swift)"
permalink: /helion/openstack/carrier/services/object/overview/scale-out-swift/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.0
product-version3: HP Helion OpenStack 1.0.1
product-version4: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Keshava HP, Sameer V, Binamra S


---
<!--UNDER REVIEW-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<a href="/helion/openstack/carrier/install/post-kvm/">&#9650; Post-Installation for KVM Hypervisor</a>

# HP Helion OpenStack&#174; Carrier Grade: About Scale-out Object Storage (Swift) 

HP Helion OpenStack Object Storage includes two starter Swift All-in-One servers that are deployed by the initial installation. The installer auto-configures a portion of the first device recognized by the operating system and assigns it to the Swift entities (account, container and object rings).

It is recommended to use these Starter servers as host for the following Swift services for scaled out Swift cluster:

1.	Swift Proxy 
2.	Swift Account
3.	Swift Container

You can also use the ringos utility to add additional drives to Swift Account and Container rings. For more details, see the [ringos](/helion/openstack/carrier/GA1/services/object/pyringos/) manual.

<!--
We recommend you use these Starter servers as Swift Proxy Servers for the scaled out Swift cluster. To do this, you can use the *ringos* utility to add additional drives on that server to the Swift Account and Container rings. 
-->
- [Step by step instructions for deploying additional Scale-out Object Storage (Swift) Nodes with HP Helion OpenStack](/helion/openstack/carrier/services/swift/deployment-scale-out/)

##Diagrams 

The HP Helion OpenStack scale-out Object Storage (Swift) architecture.

<a href="javascript:window.open('/content/documentation/media/swift_deployment-architecture-different-object-without-overcloud-controller-nodes.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack Scale-out (opens in a new window)</a>

The HP Helion OpenStack life-cycle diagram.

<a href="javascript:window.open('/content/documentation/media/swift-cluster-lifecycle.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Swift cluster lifecycle(opens in a new window) </a> 


##Storage Policies and Policy Zero

For containers created before the deployment of scale-out Swift, default policy is policy-0.  Policy-0 is used to store objects. However, a new storage policy (termed as policy-1) is configured as soon as you deploy a scale-out Swift and it becomes the new default policy. After the deployment of scale-out Swift, all new containers are mapped to the new storage policy and  objects associated to those containers are stored in the ring with policy-1. For more details on storage policy, see [OpenStack Swift overview policies](http://docs.openstack.org/developer/swift/overview_policies.html).

<!--
All containers must have a storage policy. If a policy is not explicitly specified, the default policy is applied.

For legacy containers created prior to the implementation of storage policies, you can use *Policy-0*.

- **Policy- 0.** Each policy has both a friendly, configurable ***name*** as well as an ***index*** or number. The policy with index number zero (0) maps to the Ring-0, which is present by default in all installations, is Policy-0. 

	**Note:** You can change the name of Policy-0, but do not change the index, as there must always be a Policy-0. 

- **Default policy.** The ***default*** policy can be any policy defined in the cluster. The default policy is automatically chosen when a container is created without a storage policy specified.

In other words, default means *create the container using this policy if no policy was specified* and Policy-0 means *apply the legacy policy to an existing container that does not have a specified policy*. Note that in the unique case where no other policies are defined, Policy-0 is also the default. -->







<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
