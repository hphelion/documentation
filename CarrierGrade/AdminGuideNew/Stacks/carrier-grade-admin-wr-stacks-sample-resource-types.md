---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Supported Heat Resource Types"
permalink: /helion/openstack/carrier/admin/stacks/resource-types/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Supported Heat Resource Types

The HP Helion OpenStack Carrier Grade implementation of Heat has been tested with most commonly-used resource types.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

The following resource types have been tested for use with HP Helion OpenStack Carrier Grade.

* AWS::AutoScaling::AutoScalingGroup
* AWS::AutoScaling::LaunchConfiguration
* AWS::AutoScaling::ScalingPolicy
* AWS::CloudFormation::Stack
* AWS::EC2::Instance
* AWS::EC2::NetworkInterface
* AWS::IAM::AccessKey
* AWS::IAM::User
* OS::Ceilometer::Alarm
* OS::Cinder::Volume
* OS::Cinder::VolumeAttachment
* OS::Glance::Image
* OS::Heat::AccessPolicy
* OS::Heat::InstanceGroup
* OS::Neutron::FloatingIP
* OS::Neutron::FloatingIPAssociation
* OS::Neutron::Net
* OS::Neutron::Port
* OS::Neutron::ProviderNet
* OS::Neutron::ProviderNetRange
* OS::Neutron::QoSPolicy
* OS::Neutron::Router
* OS::Neutron::RouterGateway
* OS::Neutron::RouterInterface
* OS::Neutron::SecurityGroup
* OS::Neutron::Subnet
* OS::Nova::Flavor
* OS::Nova::KeyPair
* OS::Nova::Server
* OS::Nova::ServerGroup
* OS::SysInv::HostInterface

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----