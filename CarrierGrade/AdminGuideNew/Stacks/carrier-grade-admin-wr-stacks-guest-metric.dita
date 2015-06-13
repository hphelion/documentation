---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Reporting a Guest Metric"
permalink: /helion/openstack/carrier/admin/stacks/guest/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Reporting a Guest Metric

You can use the Orchestration (Heat) service to collect and report performance metrics from individual guest instances.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

To enable the guest to push information to Ceilometer heat-cfntools must be installed on the guest.

To send data to Ceilometer on the controller, the guest must have the correct controller IP address specified in the file `/etc/heat/heat.conf`.

**Caution:** If the controller IP address changes after an instance is launched (because the Titanium Server's external OAM network address has been manually reconfigured), the instance will be unable to send metrics. 

To update the controller IP address, restart the instance.

Ceilometer can accept data from meters that run directly on guest instances, integrating it with data from meters that run on the server and periodically query the instances. The data is pushed to the controller using CloudWatch and heat-cfntools.

Guest-based metrics can offload platform processors and improve real-time monitoring for services such as thresholding, alarms, CSV file generation, and heat triggers. This example draws on the sample file `CPUScale.yaml` to develop a guest-based metric that scales a service based on CPU usage.

To launch an example of guest-based performance monitoring from the web administration interface, see [Resource Scaling](/helion/openstack/carrier/admin/stacks/autoscale/). For more information about Ceilometer, see Resource Usage on page 82.

1. In the Parameters section, define any parameters to be used in the template.

The use of parameters is optional. You can use them as required to improve readability and modularity. This
example shows the parameters used in the remaining steps.

	Parameters
		...
		CustomMeterName:
			Description: Ceilometer meter to store
			Type: String
			Default: 'guest_cpu_avg'
		CustomMeterUnit:
			Description: Ceilometer meter unit
			Type: String
			Default: '%'
		MetricHighWaterMark:
			Description: Metric value that will trigger a scale out if exceeded
			Type: String
			Default: '60'
		MetricLowWaterMark:
			Description: Metric value that will trigger a scale in if below
			Type: String
			Default: '5'

2. Initialize the service with a script that takes a measurement and returns a result.

	In this example, drawn from the sample file CPUScale.yaml, the file /etc/cfn/get_cpu_load is created to retrieve the current CPU load average and perform an averaging calculation.

	AWS::CloudFormation::Init :
		config:
			files:
	. . .
				/etc/cfn/get_cpu_load:
					content:
						Fn::Base64:
							Fn::Replace:
						- 'AWS::StackName': {Ref: 'AWS::StackName'}
						- |
						#!/usr/bin/python
						# Get the 1 minute CPU load average and divide by num_cores
						import os
						num_cores = 1
						ncpus = os.sysconf("SC_NPROCESSORS_ONLN")
						if isinstance(ncpus, int) and ncpus > 0:
							num_cores = ncpus
						loadavg = os.getloadavg()[0]
						# convert to a percentage
						percent = (100 * float(loadavg)) / float(num_cores)
						print percent
					mode: '000700'
					owner: root
					group: root

3. Add a script that pushes the result to the Ceilometer service.

	/etc/cfn/send_guest_metrics:

		content:
			Fn::Base64:
				Fn::Replace:
				- 'METRIC_NAME': {Ref: 'CustomMeterName'}
					'METRIC_UNIT': {Ref: 'CustomMeterUnit'}
				- |
					#!/bin/sh
					METRIC=`/etc/cfn/get_cpu_load`
					/opt/aws/bin/cfn-push-stats --metric METRIC_NAME --value ${METRIC} --units METRIC_UNIT
			mode: '000700'
			owner: root
			group: root

4. Add a cron job to push the result at regular intervals.

	/etc/cron.d/cfn_cron:

			content:
				Fn::Base64:
					Fn::Replace:
						- 'AWS::StackName': {Ref: 'AWS::StackName'}
						- |
						* * * * * root /etc/cfn/send_guest_metrics
			mode: '000600'
			owner: root
			group: root

5. Define an alarm to take action if the pushed measurements meet specified criteria.

In this example, two alarms (OS::Ceilometer::Alarm) are defined. One is triggered if the average measurement over a given evaluation period exceeds a threshold. The other is triggered if the average measurement falls below a threshold. In each case, an action is defined to execute a scaling policy, defined separately in the template.

	CPUGuestAlarmHigh:
		Type: OS::Ceilometer::Alarm
		Properties:
			description: Scale-out if the 1 minute avg for the meter is above the threshold
			meter_name: {Ref: CustomMeterName}
			statistic: avg
			period: '60'
			evaluation_periods: '1'
			threshold: {Ref: MetricHighWaterMark}
			alarm_actions:
			- {"Fn::GetAtt": [ServerScaleOutPolicy, AlarmUrl]}
			#matching_metadata: {'metadata.user_metadata.groupname': {Ref:'WebServerGroup'}}
			comparison_operator: gt
	CPUGuestAlarmLow:
		Type: OS::Ceilometer::Alarm
		Properties:
			description: Scale-in if the 1 minute avg for the meter is below the threshold
			meter_name: {Ref: CustomMeterName}
			statistic: avg
			period: '60'
			evaluation_periods: '1'
			threshold: {Ref: MetricLowWaterMark}
			repeat_actions: True
			alarm_actions:
			- {"Fn::GetAtt": [ServerScaleInPolicy, AlarmUrl]}
			#matching_metadata: {'metadata.user_metadata.groupname': {Ref:'WebServerGroup'}}
			comparison_operator: lt

6. Define the scaling policies.

	ServerScaleOutPolicy:
		Type: AWS::AutoScaling::ScalingPolicy
		Properties:
			AdjustmentType: ChangeInCapacity
			AutoScalingGroupName: {Ref: WebServerGroup}
			Cooldown: '60'
			ScalingAdjustment: '1'
	ServerScaleInPolicy:
		Type: AWS::AutoScaling::ScalingPolicy
		Properties:
			AdjustmentType: ChangeInCapacity
			AutoScalingGroupName: {Ref: WebServerGroup}
			Cooldown: '60'
			ScalingAdjustment: '-1'


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----