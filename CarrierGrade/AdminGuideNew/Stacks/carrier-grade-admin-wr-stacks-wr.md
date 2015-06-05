---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Wind River Linux Extensions to Heat"
permalink: /helion/openstack/carrier/admin/stacks/wr/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Wind River Linux Extensions to Heat

Several extensions to Heat are included with  Wind River Linux.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

The  Wind River Linux Extensions are compatible with both HOT format and CFN format:

* [Multiple NIC Support](#nic)
* [Simplified Network Interface Configuration](#iface)
* [Simplified VM Instance Naming](#naminmg)
* [Support for Server Groups](#support)
* [Improved Metrics Communication](#metrics)
* [Relaxed Requirements for Passing User Data](#pass)
* [Improved User Access to Stacks](#access)
* [Greater Control over Resource Allocations](#control)
* [Additional Heat Resources](#add)


## Multiple NIC Support ## {#nic}

When launching a VM instance initially or in an autoscaling stack, you can specify multiple network interfaces. The open-source version of Heat allows only a single network interface to be specified at launch.

The syntax for the extension is as follows:
	...
	LaunchConfig:
		Type: AWS::AutoScaling::LaunchConfiguration
		Properties
			...
			NetworkInterfaces: [
				{DeviceIndex: "0", vif-model: "virtio", NetworkId: { Ref:PublicNetId } },
				{DeviceIndex: "1", vif-model: "avp", NetworkId: { Ref:InternalNetId } }

As the example shows, this extension also adds the ability to specify a different `vif-model` for each interface. In
addition, a new avp option is introduced, supporting the use of optimized AVP device drivers.

The valid `vif-model` values are as follows:

<table style="text-align: left; vertical-align: top; width:650px;">
<tr>
<td>avp</td><td>Accelerated Virtual Port</td></tr>
<tr>
<td>e1000</td><td>Intel e1000 Emulation</td></tr>
<tr>
<td>ne2k_pci</td><td>NE2000 Emulation</td></tr>
<tr>
<td>pcnet</td><td>AMD PCnet/PCI Emulation</td></tr>
<tr>
<td>rtl8139</td><td>Realtek 8139 Emulation</td></tr>
<tr>
<td>virtio</td><td>VirtIO Network</td></tr>
<tr>
<td>pci-passthrough</td><td>PCI Passthrough Device</td></tr>
</table>

## Simplified Network Interface Configuration ## {#iface}

You can specify a network interface for a server or instance resource directly, without the need to define and then
reference an `AWS::EC2::NetworkInterface` resource. In addition, you can specify the network using `NetworkName`,
`NetworkId`, `SubNetName`, or `SubNetId`.

	PDN_Gateway-1:
		Type: AWS::EC2::Instance
		Properties:
			ImageId: 'cirros'
			InstanceType: 'm1.tiny'
			NetworkInterfaces: [
				{ DeviceIndex: "0", NetworkName: 'public-net0' }

	PDN_Gateway-2:
		Type: AWS::EC2::Instance
		Properties:
			ImageId: 'cirros'
			InstanceType: 'm1.tiny'
			NetworkInterfaces: [
				{ DeviceIndex: "0", NetworkId: '1d9a8765-a7e7-46b6-abd0-0e2f7985778a' }

	PDN_Gateway-3:
		Type: AWS::EC2::Instance
		Properties:
		ImageId: 'cirros'
		InstanceType: 'm1.tiny'
		NetworkInterfaces: [
			{ DeviceIndex: "0", SubNetName: 'public-subnet0' }

	PDN_Gateway-4:
		Type: AWS::EC2::Instance
		Properties:
		ImageId: 'cirros'
		InstanceType: 'm1.tiny'
			NetworkInterfaces: [
				{ DeviceIndex: "0", SubNetId: 'dfa64673-6a75-4f8a-9c74-1a7578113c31' }

## Simplified VM Instance Naming ## {#naminmg}


The Titanium Server introduces minor changes to the OpenStack VM naming convention to make Heat-generated names more user-friendly.

**For a static resource**, launched VM instances are named using the name attribute of the `OS::Nova::Server` structure (without including the `<StackTemplateName>`).

	Serving_Gateway:
		Type: OS::Nova::Server
		Properties:
			name : 'Serving_Gateway'
			image : 'cirros'
			flavor: 'm1.tiny'

	heat stack-create -f <file> EPC
	nova list

	+--------------------------------------+-----------------+--------+-...
	| ID | Name | Status | ...
	+--------------------------------------+-----------------+--------+-...
	| 581b3495-3cf1-4410-9587-5cf04fccfed2 | Serving_Gateway | ACTIVE | ...
	+--------------------------------------+-----------------+--------+-...

**For an autoscaling resource**, launched VM instances are named using the pattern: `<StackTemplateName>-<AutoScalingGroupName>-<LaunchConfigName>-<ScalingInstanceNum>`.

	Scalable_GW:
		Type: AWS::AutoScaling::AutoScalingGroup
		Properties:
			AvailabilityZones: {'Fn::GetAZs': ''}
			Name: 'Scaling_GW'
			LaunchConfigurationName: {Ref: LaunchConfig}
			MinSize: {Ref: VRC-MinClusterSize}
			MaxSize: {Ref: VRC-MaxClusterSize}

	ServerScaleOutPolicy:
	...
	ServerScaleInPolicy:
	...
	ComputeAlarmHigh:
	...
	ComputeAlarmLow:
	...
	
	LaunchConfig:
		Type: AWS::AutoScaling::LaunchConfiguration
		Name: 'DP_Engine'
		Properties:
			ImageId: 'cirros'
			InstanceType: 'm1.tiny'
			...

	heat stack-create -f <file> EPC
	nova list
	+--------------------------------------+----------------------------
	+--------+-...
	| ID | Name |
	Status | ...
	+--------------------------------------+----------------------------
	+--------+-...
	| 581b3495-3cf1-4410-9587-5cf04fccfed2 | EPC-Scaling_GW-DP_Engine-0 |
	ACTIVE | ...
	| 67df4321-ac22-498a-bff2-b376f2aa6d2b | EPC-Scaling_GW-DP_Engine-1 |
	ACTIVE | ...
	+--------------------------------------+----------------------------
	+--------+-...

## Support for Server Groups ## {#support} 

You can create Server Groups and add VM Instances to them.
The syntax for adding a Server Group Resource is as follows:
	...
	resources:
	...
	my_server_group:
		type: OS::Nova::ServerGroup
		properties:
			policy: 'anti-affinity'
			group_size: 4
			best_effort: False...

For a static resource, the syntax for specifying a Server Group in a `OS::Nova::Server` definition is as follows:

	cirros_server1:
		type: OS::Nova::Server
		properties:
			name: cirros1
			image: 'cirros'
			flavor: 'm1.tiny'
			scheduler_hints:
				group: {get_resource: my_server_group }

For a static resource, the syntax for specifying a Server Group in an `AWS::EC2::LaunchConfiguration` definition is
as follows:

	Cirros_Server1:
		Type: AWS::AutoScaling::AutoScalingGroup
		Properties:
			AvailabilityZones: {'Fn::GetAZs': ''}
			LaunchConfigurationName: {Ref: LaunchConfig}
			MinSize: {Ref: VRC-MinClusterSize}
			MaxSize: {Ref: VRC-MaxClusterSize}
	
	ServerScaleOutPolicy:
		...
	ServerScaleInPolicy:
		...
	ComputeAlarmHigh:
		...
	ComputeAlarmLow:
		...
	LaunchConfig:
		Type: AWS::AutoScaling::LaunchConfiguration
		Properties:
		ImageId: 'cirros'
		InstanceType: 'm1.tiny'
		NovaSchedulerHints: [{Key: 'group', Value: {Ref: my_server_group }}]
		...

**Note:** This example uses AWS autoscaling resources and CFN format, but autoscaling is not limited to CFN templates. You can use AWS resources and OS (OpenStack) resources in any combination in either CFN or HOT templates.

##Improved Metrics Communication ## {#metrics}

Wind River Linux addresses reliability issues with the OpenStack Havana implementation of cfn-push-stats, ensuring that guest instances can successfully pass Ceilometer metrics to the Controller.

## Relaxed Requirements for Passing User Data ## {#pass}

The property `UserDataType` is a Wind River Linux template extension that you can use to pass user data to an instance even if the instance does not have `cloud-init` installed. For more information, see [Customizing Guest Images with User Data](/helion/openstack/carrier/admin/stacks/user-data).

## Improved User Access to Stacks ## {#access}

Stacks can be created, modified, or deleted by admin or non-admin users.

## Greater Control over Resource Allocations ## {#control}

When creating a network resource using OS::Neutron::Net, you can use a depends_on attribute to ensure that the
requirements of other resources are given priority before the resource is created. The attribute takes another resource
as an argument. In the following example, it is used to specify that the resource external_network must be created
before internal_network is created.

	internal_network:
		type: OS::Neutron::Net
		properties:
			name: { get_param: INTERNALNET }
			depends_on: { get_resource: external_network }
			shared: false
			tenant_id: {get_param: TENANT_ID}

## Additional Heat Resources ## {#add}

In addition to the standard OpenStack resources available for Heat templates, you can use the following resources:

`OS::SysInv::HostInterface` - Defines a host L2 interface (ethernet or LAG), including the physical ports, network type (oam, mgmt, data, or infra), and connectivity to provider networks.

`OS::Glance::Image` - Defines a virtual machine image registered with the Glance image service.

`OS::Nova::Flavor` - Defines a set of resources (memory, vCPUs, and so on) for use when defining virtual machines.

`OS::Nova::ServerGroup` - Defines a set of instances that share the same attributes (such as compute-node-affinity). For additional information, see Support for Server Groups on page 184.

`OS::Neutron::ProviderNet` - Defines a provider network.

`OS::Neutron::ProviderNetRange` - Defines a segmentation range for a provider network.

`OS::Neutron::QoSPolicy` - Defines a packet scheduling weight that can be referenced by a tenant network (OS::Neutron::Net).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
