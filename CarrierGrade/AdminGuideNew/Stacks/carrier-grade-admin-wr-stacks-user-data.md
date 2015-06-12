---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Customizing Guest Images with User Data"
permalink: /helion/openstack/carrier/admin/stacks/user-data/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Customizing Guest Images with User Data

You can provide bootstrap configuration for an instance at launch by including user data in the template. 

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

You can include user data by defining a UserData property for an instance. This sends configuration instructions to the instance at launch. For an example of user data, see the `CPUScale.yaml` template included with the Titanium
Server.

Normally, this requires `cloud-init` to be installed in the guest, because the user data is converted to MIME format and then interpreted by `cloud-init`. For instances that do not include `cloud-init`, you can bypass the MIME conversion
of user data by invoking a Wind River extension property and assigning the value 'RAW'. This allows the VM to retrieve the specified user data in unaltered format through a simple REST API call to the metadata server. The name of the property follows the convention for the associated resource type. For an AWS resource (for example, `AWS::EC2::Instance`), use `UserDataType`. For an OpenStack resource (for example, `OS::Nova::Server`), use `user_data_type`. The following code fragment shows the property used with an AWS resource.

	type : AWS::EC2::Instance
	. . .
	UserDataType: 'RAW'
	UserData:
		Fn::Base64:
		Fn::Replace:
			- 'AWS::StackName': {Ref: 'AWS::StackName'}
			'AWS::Region': {Ref: 'AWS::Region'}
			'AWS::AccessKey': {Ref: 'WebServerKeys'}
			'AWS::SecretKey': {"Fn::GetAtt": [WebServerKeys, SecretAccessKey]}
		- |
	. . .

**Note:** For a VM to access user data, it must have a DHCP-enabled interface on a tenant network that has a Neutron
router. Typically, this is the interface to the VM's `EXT` network or an internal network. The Neutron router
provides a route to the metadata server, which provides instances with access to user data.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----