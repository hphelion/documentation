---
layout: page
permalink: /publiccloud/api/monitoring/
title: "HP Helion Public Cloud Monitoring API Specifications"
description: "HP Helion Public Cloud Monitoring API Specifications"
keywords: "monitoring, maas"
product: monitoring

---
<!--PUBLISHED-->
# HP Helion Public Cloud Monitoring API Specifications

**Date:** May 2014

**Document Version:** 2.0

**Note:** If you are using HP Helion v12.12, see the [Monitoring API v1.0]( /api/monitoring/).

## 1. Overview # {#Section1_}

This document describes the HP Helion Public Cloud Monitoring API v1.1, which allows you to monitor resources in HP Helion Public Cloud.

We will be referring to HP Helion Public Cloud Monitoring in this document as simply Monitoring.

### 1.1 API Maturity Level ## {#Section1_1}

**Maturity Level**: Public Beta 

**Version API Status**: The Monitoring Service v1.1 status is CURRENT, and the v1.0 status is DEPRECATED.

### 1.2 Document Revision History ## {#Section1_2}

|Doc. Version|Date|Description|
|:---------------|:-------|:--------------|
|0.1|01/17/2013|Initial draft|
|0.2|02/22/2013|Compute only release|
|0.3|02/28/2013|Added Volume metrics and cleanup|
|1.0|03/04/2013|Document 1.0 release|
|1.1|03/09/2013|API Keys desc and cleanup|
|1.2|04/25/2013|User defined metrics and cleanup|
|1.3|05/01/2013|Advanced alarm expressions and cleanup|
|1.3.1|05/06/2013|Cleanup|
|1.3.2|05/09/2013|Modified dimensions handling for user defined metrics and cleanup|
|1.3.3|05/13/2013|Namespace and dimension changes|
|1.3.4|05/22/2013|Timestamp and Subject optional for user defined metrics|
|1.3.5|05/24/2013|Zero value metrics change|
|1.4|07/11/2013|Rate based metrics|
|1.4.1|07/15/2013|Enhanced volume metrics|
|1.5|10/02/2013|Monitoring 1.1 API|
|1.6|11/06/2013|Notification address validation additions|
|1.7|12/01/2013|Metric querying|
|1.8|12/04/2013|Add name field to notification addresses, update HTTP headers sent in curl examples|
|1.9|12/18/2013|Monitoring level selection|
|1.9.1|02/04/2014|Revised entire document|
|2.0 | May 2014 | HP Helion updates |

## 2. Architecture View # {#Section2_}

Monitoring provides APIs for managing metric consumption endpoints, metric subscriptions, alarms, contact methods, and publishing user-defined metrics.

### 2.1 Overview ## {#ArchitectureOverview}

The Monitoring API provides a RESTful JSON interface for interacting with Monitoring and managing monitoring-related resources.

The API supports a number of operations. These include:

+ [Endpoint Operations](#ServiceEndpointOps) - The endpoint resource represents an endpoint from which metrics can be consumed.

+ [Endpoint Operations Details](#ServiceDetailsEndpoint)

+ [Subscription Operations](#ServiceSubscriptionOps) - The subscription resource represents a subscription to consume metrics.

+ [Subscription Operations Details](#ServiceDetailsSubscription)

+ [Notification Operations](#ServiceNotificationOps) - The notification method resource represents a method through which notifications can be sent.

+ [Notification Operations Details](#ServiceDetailsNotification)

+ [Notification Address Operations](#ServiceNotificationAddressOps) - The notification address resource represents validated address to which notifications can be sent.

+ [Notification Address Operations Details](#ServiceDetailsNotificationAddress)

+ [Alarm Operations](#ServiceAlarmOps) - The alarm resource identifies a particular metric scoped by namespace, type and dimensions, which should trigger a set of actions when the value of the metric exceeds a threshold.

+ [Alarm Operations Details](#ServiceDetailsAlarm)

+ [Metric Operations](#ServiceMetricsOps) - The metric resource allows the insertion of user defined metrics and querying of system and user defined metrics.

+ [Metrics Operations Details](#ServiceDetailsMetrics)

### 2.2 Examples ## {#Examples}

#### 2.2.1 High Level ### {#HighLevelExample}

There are 4 major functions possible with the Monitoring API resources:

* Message subscription - This allows AMQP message queue access to the current metric stream.
* Alarming - Sends a notification when a metric passes a threshold.
* Metric Post - Sends a metric to HP Monitoring.
* Metric Query - Queries all of the metrics sent to and/or captured by HP Monitoring.

**Note:** Access to these functions are also available through the [Console](https://horizon.hpcloud.com/) and it is the preferred method. You do NOT need to obtain an auth token when working from the console. However, when accessing the REST interface directly, you are required to include the auth token.

#### 2.2.2 Activating Your Account Example ### {#AccountActivation}

[Account Creation Details](#Accounts)

Before creating Alarms or Subscriptions, you must first get a valid auth token. Go to the above link and follow the actions listed.

#### 2.2.3 Setting Up a Subscription Example ### {#SubscriptionExample}

Subscriptions provides a continuous feed of monitoring metrics data.

[Endpoint Creation Details](#ServiceDetailsCreateEndpoint)

Subscriptions need a way to connect you to the RabbitMQ (AMQP) queue, so we need to create an endpoint.

From the above link, use the Curl Example, changing the X-Auth-Token to the auth token value. Save the returned json output. "uri", "amqp_username", "amqp_password", and "amqp_queue" are the required values for accessing the RabbitMQ (AMQP) queue. 

How to setup a queue connection is beyond the scope of this document. There are tutorials at [RabbitMQ](http://www.rabbitmq.com). There is a simple, limited AMQP client application at: [AMQP client](#SupportSoftwareAndOtherTools).

[Subscription Creation Details](#ServiceDetailsCreateSubscription)

From the above link, use the Curl Example, changing the X-Auth-Token to the auth token value. Change "endpoint_id" to the id value returned from the Endpoint call and "instance_id" with a valid compute instance ID that you own. The data feed should start soon after.

The metric json format (HP Helion Metrics JSON) received is the same format used for creating user defined metrics in 4.4.6.1 [Create a New Metric](#ServiceDetailsCreateMetric).

#### 2.2.4 Setting Up an Alarm Example ### {#AlarmExample}

Alarms send notifications when a metric value exceeds a user defined threshold.

[Notification Creation Details](#ServiceDetailsCreateNotification)

Alarms need a way in which to contact you, so we need to create a notification method and a notification method that the system is authorized to send alarm notifications to.

From the above link, use the Curl Example, changing the X-Auth-Token to the auth token value. Change "name" to your descriptive name, "type" with how you are to be accessed (this is a strict enumeration value, use only the values given in the Data Parameters section), and "address" with your email address or phone number. Save the returned json output.

[Alarm Creation Details](#ServiceDetailsCreateAlarm)

From the above link, use the Curl Example, changing the X-Auth-Token to the auth token value. Change "name" to a description of the alarm. Put into "alarm_actions" the notification method id you received above. For "expression" create something like the below expression, targeted towards a valid compute instance ID that you own (replace the instance_id value):

	max(hpcs.compute{metric_name=cpu_total_time, instance_id=42ff6820-7c86-11e2-b92a-0800200c9a67}) > 0
	
Since the cpu_total_time for an instance should always be over 0 after it's creation, this should evaluate to true. (Evaluations are done every 60 seconds.) A notification should then be sent out and the alarm will remain in the ALARM state.

[Alarm Creation Notification Address](#ServiceDetailsCreateAlarmAddress)

To avoid misuse of the notification system, alarm notifications will only be delivered to authorized addresses.  You may create alarms pointing at any address, but the system will only deliver notifications to verified addresses.  
To authorize a notification address use the [Create a new notification address](#ServiceDetailsCreateAddress) 
API call to create a new notification address, and then the [Validate received validation code for a specific notification address](#ServiceDetailsValidateAddress) API call.  You can verify that the notification address has been verified by using the [List all notification addresses](#ServiceDetailsListAddress) API call and noting the state of each notification address.  Addresses can have states in-progress, verified or timed out which indicate which particular part of the verification process they are in at the time of the API call.

#### 2.2.5 Posting a Metric Example ### {#MetricPostExample}

[Metric Post Details](#ServiceDetailsCreateMetric)

From the above link, create the json for the metric to be sent. The simplest metric example:

	{
		"namespace": "user_namespace"
		"value": 1.0
	}

Dimensions are optional and a missing timestamp is set to the current time. This metric will be stored for later query.

If you create a subscription with this namespace and no dimensions, you will have AMQP output of the metric when it is sent. If you create an alarm with this namespace, you can receive a notification.

#### 2.2.6 Metric Query Example ### {#MetricQueryExample}

[Metric Query Details](#ServiceDetailsGetMetrics)

From the above link, create a metric query. For querying the metric submitted in the previous section (replace start_time with a date/time close to current):

	namespace=user_namespace&statistics=avg&start_time=2013-11-01T12:00Z

### 2.3 Namespaces, Dimensions, and Metrics ## {#Namespaces}

The Monitoring API makes use of several metric related pre-defined constants throughout.

* Namespaces define the high-level logical partition to monitor.  This restricts what metrics will be used.

    **Note:** All namespaces starting with hpcs. are reserved by HP and cannot be used for user defined namespaces.

* Dimensions place restrictions on the namespace to further narrow what is monitored.

* A metric definition is the unique combination of the namespace plus the dimension keys. A metric is the entirety of the namespace, dimension keys, dimension values, timestamp, and value. 

#### 2.3.1 Namespace: User Defined ### {#NamespaceUserDefined}

**Required dimensions:** None

**Supported dimensions:** Any

**Note:** Dimensions must currently match exactly for subscriptions using user defined namespaces.

A user-defined namespace is a logical grouping of metrics for a customer that the customer defines. Performing a metric post call with a new namespace automatically creates the new namespace. The HP namespace (hpcs. prefixed namepaces) are restricted and cannot be used. Any other name can be used for a user defined namespace and there are no limits on the number that a customer can create.

See [Metrics Operations Details](#ServiceDetailsMetrics).

#### 2.3.2 Namespace: hpcs.compute ### {#NamespaceHpcsCompute}

**Required dimensions:** instance_id, which is the compute node unique instance id value.

**Supported dimensions:** instance_id, metric_name, device. The metrics tables below show the supported metric_name values. device is vda, vdb, etc for disk metrics and eth0, etc for network metrics. You should use all 3 supported dimensions for uniquely identifying a hpcs.compute metric definition.

**Gauge and delta metrics**

|Metric Name|Metric Type|Unit|Device|Description|
|:----------|:---|:---|:------|:----------|
|cpu_total_utilization|Gauge|Percent||Total percentage of CPU used for all cores|
|cpu_time|Delta|Nanoseconds||Delta CPU time used for all cores in nanoseconds|
|disk_read_ops|Delta|Operations|Disk Name|Delta of read requests from a disk|
|disk_write_ops|Delta|Operations|Disk Name|Delta of write requests from a disk|
|disk_read_bytes|Delta|Bytes|Disk Name|Delta of bytes read from a disk|
|disk_write_bytes|Delta|Bytes|Disk Name|Delta of bytes written to a disk|
|net_in_bytes|Delta|Bytes|Interface Name|Delta of receive bytes on a network interface |
|net_out_bytes|Delta|Bytes|Interface Name|Delta of transfer bytes on a network interface |
|net_in_dropped|Delta|Packets|Interface Name|Delta of receive packets dropped on a network interface|
|net_out_dropped|Delta|Packets|Interface Name|Delta of transfer packets dropped on a network interface|
|net_in_packets|Delta|Packets|Interface Name|Delta of receive packets on a network interface|
|net_out_packets|Delta|Packets|Interface Name|Delta of transfer packets on a network interface |
|net_in_errors|Delta|Errors|Interface Name|Delta of receive packet errors on a network interface|
|net_out_errors|Delta|Errors|Interface Name|Delta of transfer packet errors on a network interface|

**Counter metrics**

|Metric Name|Metric Type|Unit|Device|Description|
|:----------|:---|:---|:------|:----------|
|cpu_total_time|Counter|Nanoseconds||Total CPU time used in nanoseconds|
|disk_read_ops_count|Counter|Operations|Disk Name|Number of read requests from a disk|
|disk_write_ops_count|Counter|Operations|Disk Name|Number of write requests from a disk|
|disk_read_bytes_count|Counter|Bytes|Disk Name|Number of bytes read from a disk|
|disk_write_bytes_count|Counter|Bytes|Disk Name|Number of bytes written to a disk|
|net_in_bytes_count|Counter|Bytes|Interface Name|Number of receive bytes on a network interface |
|net_out_bytes_count|Counter|Bytes|Interface Name|Number of transfer bytes on a network interface |
|net_in_dropped_count|Counter|Packets|Interface Name|Number of receive packets dropped on a network interface|
|net_out_dropped_count|Counter|Packets|Interface Name|Number of transfer packets dropped on a network interface|
|net_in_packets_count|Counter|Packets|Interface Name|Number of receive packets on a network interface|
|net_out_packets_count|Counter|Packets|Interface Name|Number of transfer packets on a network interface |
|net_in_errors_count|Counter|Errors|Interface Name|Number of receive packet errors on a network interface|
|net_out_errors_count|Counter|Errors|Interface Name|Number of transfer packet errors on a network interface|

#### 2.3.3 Namespace: hpcs.volume ### {#NamespaceHpcsVolume}

**Required dimensions:** instance_id (compute instance id), disk, where disk has a typical value of 'vda' or 'vdb'

**Supported dimensions:** instance_id, metric_name, disk. The table below shows the supported metric_name values. You should use all 3 supported dimensions for uniquely identifying a hpcs.compute metric definition.

|Metric Name|Metric Type|Unit|Description|
|:----------|:---|:---|:----------|
|volume_read_ops|Delta|Operations|Read operations for volume attached to an instance|
|volume_write_ops|Delta|Operations|Write operations for volume attached to an instance|
|volume_read_bytes|Delta|Bytes|Read bytes for volume attached to an instance|
|volume_write_bytes|Delta|Bytes|Write bytes for volume attached to an instance|
|volume_read_time|Delta|Seconds|Read time spent for volume attached to an instance|
|volume_write_time|Delta|Seconds|Write time spent for volume attached to an instance|
|volume_idle_time|Delta|Seconds|Idle time spent for volume attached to an instance|

### 2.4 HP Helion Metrics JSON Format Schema ## {#MetricFormat}

+ namespace : string (64 char max)
+ dimensions : (optional) map<string (50 char max), string (300 char max)>
+ timestamp : (optional) long (unix time)
+ value : (scalar only) double 
+ time_values : (vector only) [[long, double]]

Namespace and dimension key names are restricted to these characters: a-z A-Z 0-9 . - \_. Dimension values currently have the same restriction but will soon support the full range of UTF-8 characters.

**Scalar format example**

	{
	  "namespace": "hpcs.compute",
	  "dimensions": {
	    "instance_id": "42ff6820-7c86-11e2-b92a-0800200c9a67",
 	    "metric_name": "disk_read_bytes",
 	    "device": "vda"
 	  },
 	  "timestamp": 123123123,
 	  "value": 123.0
	}
	
**Vector format example**

	{
	  "namespace": "hpcs.compute",
	  "dimensions": {
	    "instance_id": "42ff6820-7c86-11e2-b92a-0800200c9a67",
 	    "metric_name": "disk_read_bytes",
 	    "device": "vda"
 	  },
 	  "timestamp": 123123123,
 	  "time_values": [[123123123,123.0],[123123183,127.0]]
	}
	
**Aggregate format example**

	[
		{
		  "namespace": "hpcs.compute",
		  "dimensions": {
		    "instance_id": "42ff6820-7c86-11e2-b92a-0800200c9a67",
	 	    "metric_name": "disk_read_bytes",
 		    "device": "vda"
 		  },
 		  "timestamp": 123123123,
 		  "value": 123.0
		},
		 {
		   "namespace": "hpcs.compute",
		   "dimensions": {
		     "instance_id": "42ff6820-7c86-11e2-b92a-0800200c9a67",
 		     "metric_name": "disk_read_bytes",
 		     "device": "vda"
 		  },
 		  "timestamp": 123123123,
 		  "time_values": [[123123123,123.0],[123123183,127.0]]
		}
	]

### 2.5 Alarm Expressions ## {#AlarmExpressions}

The alarm expression syntax allows the creation of simple to complex alarms to handle a wide variety of needs. Alarm expressions are evaluated every 60 seconds.

An alarm expression is a boolean equation which if it evaluates to true with the incoming metrics, will then trigger a notification to be sent. 

Go to [Alarm](#ServiceDetailsAlarm) to see the REST interface.

**Syntax**

At the highest level, you have an expression, which is made up of one or more subexpressions, joined by boolean logic. Parenthesis can be used for separators in a BNF style format:

	expression
		: subexpression
		| '(' expression ')'
		| expression logical_operator expression

The logical_operators are:

* 'and' (also &&)
* 'or' (also ||)

Each subexpression is made up of several parts with a couple of options:

	subexpression
		: metric relational_operator threshold_value
		| function '(' metric ',' period ')' relational_operator threshold_value ('times' periods)?
		
The relational_operators are:

* 'lt' (also <)
* 'gt' (also >)
* 'lte' (also <=)
* 'gte' (also >=)

Threshold values are always in the same units as the metric that they are being compared to.

The first subexpression shows a direct comparison of a metric to a threshold_value, done every 60 seconds. For example:

	hpcs.compute{metric_name=cpu_total_utilization, instance_id=42ff6820-7c86-11e2-b92a-0800200c9a67} > 90

The second subexpression shows a function operation done on all collected metrics within a specific period and compared to a threshold_value, then triggered if it happens periods number of times. For example:

	avg(hpcs.compute{metric_name=cpu_total_utilization, instance_id=42ff6820-7c86-11e2-b92a-0800200c9a67}, 60) > 90 times 3
	
Note that period is the number of seconds for the measurement to be done on. They can only be in a multiple of 60. Periods is how many times in a row that this expression must be true before triggering the alarm. Both period and periods are optional and default to 60 and 1 respectively.

Functions work on all metric measurements during the period time frame.

+ min (returns the minimum of all the values)
+ max (returns the maximum of all the values)
+ sum (returns the sum of all the values)
+ count (returns the number of metric observations)
+ avg (returns the average of all the values)

The metric is a complex identifier that consists of a namespace and an optional set of dimensions.

	metric
		: namespace ('{' dimensions '}')?

*Metric example*
	
	hpcs.compute{metric_name=disk_read_ops, device=vda, instance_id=42ff6820-7c86-11e2-b92a-0800200c9a67}
	
	hpcs.compute{metric_name=cpu_total_utilization, instance_id=42ff6820-7c86-11e2-b92a-0800200c9a67}
	
	userspace{metric_name=usermetric}
	
	userspace
	
The first example shows a namespace of 'hpcs.compute', see [Namespaces](#Namespaces). The dimensions further qualifying the metric are 'metric_name=disk_read_ops', 'device=vda', and 'instance_id=42ff6820-7c86-11e2-b92a-0800200c9a67'. This fully describes where the metric comes from, what namespace it belongs to, and what metric type was measured.

The second example shows leaving out 1 of the dimensions.

The third example is for targeting a user defined namespace and metric name.

The fourth example is for targeting a user defined namespace and leaving the dimensions out entirely.
	
*Example with two subexpressions*

	( avg(hpcs.compute{metric_name=cpu_total_utilization, instance_id=42ff6820-7c86-11e2-b92a-0800200c9a67}) > 90 ) or ( avg(hpcs.compute{metric_name=disk_read_ops, device=vda, instance_id=42ff6820-7c86-11e2-b92a-0800200c9a67}, 120) > 1000 times 3 )
	
If the cpu_total_utilization is on average greater than 90 for a 60 second period for that instance then the alarm will trigger. If not that, then if the disk_read_ops for that same instance is on average greater than to 1000 for a 120 second period for 3 periods in a row, then the alarm will also trigger.

*User-defined metric example*

	count(userspace{metric_name=usermetric, instance_id=42ff6820-7c86-11e2-b92a-0800200c9a67}, 600) > 7 times 5

This example shows 1 subexpression. It does a count of how many times the user publishes a user defined metric in a 600 second period. If more than 7 occur in that period and this happens 5 times in a row, then the alarm will trigger.

### 2.6 Faults ## {#Faults}

When an fault occurs at request time, the system will return an HTTP error response code denoting the type of fault. The system will also return additional information about the fault in the body of the response.

**Fault Response**

JSON

	{  
		"fault_element": {
			"code": HTTP error code (integer),
			"message": "Fault information...",
			"details": "Fault Details...",
			"internal_code": "Internal error log code"
		}
	}

The error code is returned in the body of the response for convenience. The message section returns a human-readable message that is appropriate for display to the end user. The details section is optional and may contain extra information. The internal_code section is optional monitoring logging information to further identify the cause of the fault.

The root element of the fault (the fault_element value) may change depending on the type of fault. The following is a list of possible elements along with their associated HTTP error codes.

|Fault Element|HTTP Error Code|
|:------------|:--------------|
|bad_request|400|
|unauthorized|401|
|forbidden|403|
|not_found|404|
|conflict|409|
|unprocessable_entity|422|
|rate limited|429|
|server_error|500|
|service load balancers|503|

#### 2.6.1 HTTP Error Code 503 #### {#faults-errorcode03}
HTTP Error Code 503 indicates an internal system error has occurred. The Monitoring service uses load balancing and rate-limiting technologies to protect the core application servers operating the service. The 503 error indicates an internal, temporary failure in the load balancing/rate limiting components. The body of the response is different from the normal fault response of the service.

**Fault Response**

JSON
<pre>{ "fault" : {
   { "faultstring": "&lt;short description of error&gt;",
      "detail" : {
         "errorcode": "&lt;text error code&gt;"
}}}
</pre>
If you encounter this error, please retry the request. If the error persists or occurs at an unacceptable rate, please contact HP Customer Support and be sure to include in your report the full body of the response and the region and time you received this response.

### 2.7 Support Software and Other Tools ## {#SupportSoftwareAndOtherTools}

#### 2.7.1 AMQP Client Application ###

[https://github.com/egustafson/grabbit](https://github.com/egustafson/grabbit)

There are several different AMQP client applications available. The above link points to a simple command line application that is useful for debugging. It uses python with the pika module.

**Execution**

    grabbit.py -u username -p password -q queue -v vhost hostname

**Execution example**

    grabbit.py -u mon-55287769266623 -p OUMkab5w0GdE -q metrics-55287769266623 -v 55287769266623 region-a.geo-1.amqp-monaas.hpcloudsvc.com

The return json from creating an endpoint:

	{
      "endpoint": {
        "id": "612340f8-7a65-453e-b95e-9a13aaa51bbc",
        "links": [
          {
            "rel": "self",
            "href": "https://region-a.geo-1.monitoring-internal.hpcloudsvc.com/v1.1/endpoints/612340f8-7a65-453e-b95e-9a13aaa51bbc"
          }
        ],
        "uri": "amqp://region-a.geo-1.amqp-monaas.hpcloudsvc.com:5672/55287769266623",
        "meta": {
          "amqp_queue": "metrics-55287769266623",
          "amqp_username": "mon-55287769266623",
          "amqp_password": "OUMkab5w0GdE"
        }
      }
	}

## 3. Account-level View # {#Section3_}

Requests to the Monitoring API are required to present a valid token which must be obtained from the Identity service prior to making a Monitoring API request.

More information about the Identity service:

[Introduction to HP Helion Identity Service](https://community.hpcloud.com/article/identity-service-introduction)

[HP Helion Identity Service Overview](https://community.hpcloud.com/knowledge-base-categories/cloud-identity-service)

### 3.1 Accounts ## {#Accounts}

**Note:** Access to the Monitoring API functions are also available through the [Console](http://www.hpcloud.com/console) and it is the preferred method. You do NOT need to obtain an auth token when working from the [Console](https://horizon.hpcloud.com/). However when accessing the REST interface directly, you are required to include the auth token.

**Verifying Access**

Log into your cloud account from the [Console](https://horizon.hpcloud.com/) page. With the left side menu, go to Identity > Projects. From this page you can retrieve your Project Name. Username and password are the same as you use to log into the [Console](https://horizon.hpcloud.com/).

**Requesting a Token**

***Request URI***

*For West:*
	
	curl -i -X POST \
	https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/tokens \
	-H "Content-Type: application/json" -H "Accept: application/json"
	

*For East:*
	
	curl -i -X POST \
	https://region-b.geo-1.identity.hpcloudsvc.com:35357/v2.0/tokens \
	-H "Content-Type: application/json" -H "Accept: application/json"

***Request Body***

	{"auth": {"tenantName": "yourprojectname", "passwordCredentials": {"username": "yourusername", "password": "yourpassword"}}}

***Response Body***

	{
		"access": {
	  		"token": {
	    		"expires": "2012-04-05T04:28:29.405Z",
	    		"id": "HPAuth10_65f6a8e01d5437d6d628448c8411b862de878f622bfd8238df3a6433dd601fd1",
	    		"tenant": {
					"id": "123456789",
					"name": "tenant@domain.com"
				}
			},
			"user": {
			"id": "987654321",
			"name": "tenant@hp.com",
			"roles": [
			{
				...
			},
		},
		"serviceCatalog": [
			...
		{
             "name": "Monitoring",
             "type": "hpext:monitoring",
             "endpoints": [
                 {
                     "tenantId": "55287769244623",
                     "publicURL": "https://region-a.geo-1.monaas.hpcloudsvc.com/v1.1",
                     "publicURL2": "",
                     "region": "region-a.geo-1",
                     "versionId": "1.1",
                     "versionInfo": "https://region-a.geo-1.monaas.hpcloudsvc.com/v1.1",
                     "versionList": "https://region-a.geo-1.monaas.hpcloudsvc.com"
                 },
                 {
                     "tenantId": "55287769244623",
                     "publicURL": "https://region-b.geo-1.monitoring.hpcloudsvc.com/v1.1",
                     "publicURL2": "",
                     "region": "region-b.geo-1",
                     "versionId": "1.1",
                     "versionInfo": "https://region-b.geo-1.monitoring.hpcloudsvc.com/v1.1",
                     "versionList": "https://region-b.geo-1.monitoring.hpcloudsvc.com"
                 }
             ]
		}
	]
	}}

***Accessing Monitoring***

The endpoint for accessing the Monitoring API can be obtained from the service catalog returned in your authentication request.

	https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/
	https://region-b.geo-1.monitoring.hpcloudsvc.com/v1.1/

A request can then be made against resources at that endpoint by supplying the `access:token:id` from your authentication request as in your Monitoring API request header as an X-Auth-Token, for example:

    X-Auth-Token: HPAuth10_65f6a8e01d5437d6d628448c8411b862de878f622bfd8238df3a6433dd601fd1)

**Sample Request**

	> GET /v1.1/ HTTP/1.1
	> Host: 15.185.167.67:8779
	> Accept: application/json
	> Content-Type: application/json
	> X-Auth-Token: HPAuth10_65f6a8e01d5437d6d628448c8411b862de878f622bfd8238df3a6433dd601fd1

**Curl Example**

Replace `tenantName` with your Project ID value from the API Keys web page. Replace `username` and `password` with your credentials for logging in to HP Helion.

	$ curl -i -X POST \
	  https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/tokens \
	  -H "Content-Type: application/json" -H "Accept: application/json" \
	  -d '{"auth": {"tenantName": "yourprojectname", "passwordCredentials": {"username": "yourusername", "password": "yourpassword"}}}'

### 3.2 Regions and Availability Zones ## {#AccountsRegions}

**Regions**

* Region A West 13.5 (region-a.geo-1)
* Region B East 13.5 (region-b.geo-1)

## 4. REST API Specifications # {#Section4_}
The Monitoring API is implemented using a RESTful web service interface. All requests to authenticate and operate against the Monitoring API should be performed using SSL over HTTP (HTTPS) on TCP port 443.

### 4.1 Service API Operations ## {#Service}

**Hosts**

*US West*

* https://region-a.geo-1.monitoring.hpcloudsvc.com

*US East*

* https://region-b.geo-1.monitoring.hpcloudsvc.com

**BaseUri**: {Host}/v1.1

### Version Operations ## {#ServiceVersionOps}

| Resource | Operation                                          | HTTP Method | Path                            | JSON/XML Support? |
| :------- | :------------------------------------------------- | :---------- | :------------------------------ | :---------------- |
| Version | [List all versions](#ServiceDetailsListVersion) | GET | {Host}/ | Y/N |
| Version | [Get a specific version](#ServiceDetailsSpecificVersion) | GET | {Host}/*version_id* | Y/N |

### Endpoint Operations ## {#ServiceEndpointOps}

| Resource | Operation                                          | HTTP Method | Path                            | JSON/XML Support? |
| :------- | :------------------------------------------------- | :---------- | :------------------------------ | :---------------- |
| Endpoint | [Create a new endpoint](#ServiceDetailsCreateEndpoint) | POST | {BaseUri}/endpoints | Y/N |
| Endpoint | [List all endpoints](#ServiceDetailsListEndpoint) | GET | {BaseUri}/endpoints | Y/N |
| Endpoint | [Get a specific endpoint](#ServiceDetailsSpecificEndpoint) | GET | {BaseUri}/endpoints/*endpoint_id* | Y/N |
| Endpoint | [Delete a specific endpoint](#ServiceDetailsDeleteEndpoint) | DELETE | {BaseUri}/endpoints/*endpoint_id* | Y/N |
| Endpoint | [Reset the password for a specific endpoint](#ServiceDetailsResetPasswordEndpoint) | POST | {BaseUri}/endpoints/*endpoint_id*/reset-password | Y/N |

### Subscription Operations ## {#ServiceSubscriptionOps}

| Resource | Operation                                          | HTTP Method | Path                            | JSON/XML Support? |
| :------- | :------------------------------------------------- | :---------- | :------------------------------ | :---------------- |
| Subscription | [Create a new subscription](#ServiceDetailsCreateSubscription) | POST | {BaseUri}/subscriptions | Y/N |
| Subscription | [List all subscriptions](#ServiceDetailsListSubscription) | GET | {BaseUri}/subscriptions | Y/N |
| Subscription | [Get a specific subscription](#ServiceDetailsSpecificSubscription) | GET | {BaseUri}/subscriptions/*subscription_id* | Y/N |
| Subscription | [Delete a specific subscription](#ServiceDetailsDeleteSubscription) | DELETE | {BaseUri}/subscriptions/*subscription_id* | Y/N |

### Notification Method Operations ## {#ServiceNotificationOps}

| Resource | Operation                                          | HTTP Method | Path                            | JSON/XML Support? |
| :------- | :------------------------------------------------- | :---------- | :------------------------------ | :---------------- |
| Notification Method | [Create a new notification method](#ServiceDetailsCreateNotification) | POST | {BaseUri}/notification-methods | Y/N |
| Notification Method | [List all notification methods](#ServiceDetailsListNotification) | GET | {BaseUri}/notification-methods | Y/N |
| Notification Method | [Get a specific notification method](#ServiceDetailsSpecificNotification) | GET | {BaseUri}/notification-methods/*notification_method_id* | Y/N |
| Notification Method | [Delete a specific notification method](#ServiceDetailsDeleteNotification) | DELETE | {BaseUri}/notification-methods/*notification_method_id* | Y/N |

### Notification Address Operations ## {#ServiceNotificationAddressOps}

| Resource | Operation                                          | HTTP Method | Path                            | JSON/XML Support? |
| :------- | :------------------------------------------------- | :---------- | :------------------------------ | :---------------- |
| Notification Address | [Create a new notification address](#ServiceDetailsCreateAddress) | POST | {BaseUri}/notification-addresses | Y/N |
| Notification Address | [List all notification addresses](#ServiceDetailsListAddress) | GET | {BaseUri}/notification-addresses | Y/N |
| Notification Address | [Get a specific notification address](#ServiceDetailsSpecificAddress) | GET | {BaseUri}/notification-addresses/*notification_address_id* | Y/N |
| Notification Address | [Delete a specific notification address](#ServiceDetailsDeleteAddress) | DELETE | {BaseUri}/notification-addresses/*notification_address_id* | Y/N |
| Notification Address | [Validate received validation code for a specific notification address](#ServiceDetailsValidateAddress) | POST | {BaseUri}/notification-addresses/validate | Y/N |

### Alarm Operations ## {#ServiceAlarmOps}

| Resource | Operation                                          | HTTP Method | Path                            | JSON/XML Support? |
| :------- | :------------------------------------------------- | :---------- | :------------------------------ | :---------------- |
| Alarm | [Create a new alarm](#ServiceDetailsCreateAlarm) | POST | {BaseUri}/alarms | Y/N |
| Alarm | [List all alarms](#ServiceDetailsListAlarm) | GET | {BaseUri}/alarms | Y/N |
| Alarm | [Get a specific alarm](#ServiceDetailsSpecificAlarm) | GET | {BaseUri}/alarms/*alarm_id* | Y/N |
| Alarm | [Delete a specific alarm](#ServiceDetailsDeleteAlarm) | DELETE | {BaseUri}/alarms/*alarm_id* | Y/N | 

### Metrics Operations ## {#ServiceMetricsOps}

| Resource | Operation                                          | HTTP Method | Path                            | JSON/XML Support? |
| :------- | :------------------------------------------------- | :---------- | :------------------------------ | :---------------- |
| Metrics | [Create a new metric](#ServiceDetailsCreateMetric) | POST | {BaseUri}/metrics | Y/N |
| Metrics | [Create new aggregated metrics](#ServiceDetailsCreateMetrics) | POST | {BaseUri}/metrics/aggregate | Y/N |
| Metrics | [Get metric datapoints](#ServiceDetailsGetMetrics) | GET | {BaseUri}/metrics | Y/N |

### Metering Operations ## {#ServiceMeteringOps}

| Resource | Operation                                          | HTTP Method | Path                            | JSON/XML Support? |
| :------- | :------------------------------------------------- | :---------- | :------------------------------ | :---------------- |
| Metering | [Set the Monitoring Level](#ServiceDetailsSetMonitoringLevel) | POST | {BaseUri}/metering | Y/N |
| Metering | [Get the Monitoring Level](#ServiceDetailsGetMonitoringLevel) | GET | {BaseUri}/metering | Y/N |

### 4.2 Common Requests ## {#CommonRequests}

#### 4.2.1 Common Request Headers ### {#CommonRequestHeaders}

**Http standard request headers**

- *Accept*

    Internet media types that are acceptable in the response. Monitoring supports the media types application/xml and application/json.

- *Content-Length*
 
    The length of the request body in octets (8-bit bytes).

- *Content-Type* 

    The Internet media type of the request body. Used with POST and PUT requests. Must be either application/xml or application/json.

- *Host* 

    The domain name of the server hosting Monitoring.

**Non-standard request headers**

- *X-Auth-Token*

    HP Helion authorization token.

**Example**

	POST /v1.1/subscriptions HTTP/1.1
	Host: region-a.geo-1.monitoring.hpcloudsvc.com
	Content-Type: application/json
	Accept: application/json
	X-Auth-Token: HPAuth_2895c13b1118e23d977f6a21aa176fd2bd8a10e04b74bd8e353216072968832a
	Content-Length: 85

### 4.3 Common Responses ## {#CommonResponses}

#### 4.3.1 Common Response Headers ### {#CommonResponseHeaders}

**Http standard response headers**

- *Content-Length*

    The length of the response body in octets (8-bit bytes).

- *Content-Type*

    Internet media type of the response body.

- *Date*

    The date and time that the response was sent.

**Example**

	HTTP/1.1 200 OK
	Content-Length: 1135
	Content-Type: application/json; charset=UTF-8
	Date: Tue, 30 Oct 2012 16:22:35 GMT

### 4.4 Service API Operation Details ## {#ServiceDetails}

#### 4.4.1 Versions ### {#ServiceDetailsVersion}

Provides information about the supported Monitoring API versions.

##### 4.4.1.1 List All Versions ##### {#ServiceDetailsListVersion}
##### GET /

Lists all versions. 

**Request Data**

	GET / HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

|Attributes|Type|Description|
|:---------|:---|:----------|
|id|string|API version number.|
|rel|string|Relationship type.|
|href|string|Hypermedia reference.|
|status|string|Status of the API, if it is active and/or current.|
|updated|timestamp|Internal timestamp of when the API was released.|

JSON

	{  
	  "versions": [
	    {
	      "id": "1.0",
	      "links" : [
	        {
	          "rel": "self",
	          "href": "https://region-a.geo-1.monitoring.hpcloudsvc.com/1.0"
	        }
	      ],
	      "status": "DEPRECATED",
	      "updated": "1361977272958"
	    },
	    {
	      "id": "1.1",
	      "links" : [
	        {
	          "rel": "self",
	          "href": "https://region-a.geo-1.monitoring.hpcloudsvc.com/1.1"
	        }
	      ],
	      "status": "CURRENT",
	      "updated": "1361977272958"
	    }
	  ]
	}

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts).

	$ curl -i -X GET \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com \
	  -H "X-Auth-Token: ${Auth_Token}"

##### 4.4.1.2 Get a Specific Version #### {#ServiceDetailsSpecificVersion}
##### GET /{version_id}

Gets the details of a specific version identified by `{version_id}`.

**Request Data**

	GET /v1.1 HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

Common attributes described in [4.4.1.1 List All Versions](#ServiceDetailsListVersion).

JSON

	{  
	  "version": {
	    "id": "1.1",
	    "links" : [
	      {
	        "rel": "self",
	        "href": "https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1"
	      }
	    ],
	    "status": "CURRENT",
	    "updated": "2012-09-25T00:00:00Z"
	  }
	}

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 404 | Not Found | Requested resource cannot be found. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts).

	$ curl -i -X GET \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1 \
	  -H "X-Auth-Token: ${Auth_Token}"

#### 4.4.2 Endpoint ### {#ServiceDetailsEndpoint}

The endpoint resource represents an endpoint from which metrics can be consumed.

**Note:**

- The amqp_password is not retrievable after endpoint creation. If the password is lost, then the password reset operation must be performed.*
- Only one Endpoint can be created at a time per project.

##### 4.4.2.1 Create a New Endpoint #### {#ServiceDetailsCreateEndpoint}
##### POST /endpoints

Creates a new endpoint for metric consumption. AMQP and URI information needs to be retained for accessing the message queue.

**Request Data**

	POST /v1.1/endpoints HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

This call does not require a request body.

**Success Response**

	HTTP/1.1 201 Created
	Content-Type: application/json
	Content-Length: 337
	Location: /v1.1/endpoints/${endpoint_id}

**Status Code**

201 - Created

**Response Data**

|Attributes|Type|Description|
|:---------|:---|:----------|
|id|string|Return value id of the call.|
|rel|string|Relationship type.|
|href|string|Hypermedia reference.|
|uri|string|URI of the amqp router.|
|meta|array|Amqp router information.|
|amqp_password|string|Needed to access the amqp router.|
|amqp_username|string|Needed to access the amqp router.|
|amqp_queue|string|Needed to access the amqp router.|

JSON

	{
	  "endpoint": {
	    "id": "eabe9e32-6ce0-4a36-9750-df415606b44c",
	    "links": [
	      {
	        "rel": "self",
	        "href": "https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/endpoints/eabe9e32-6ce0-4a36-9750-df415606b44c"
	      }
	    ],
	    "uri": "amqp://region-a.geo-1.amqp-monitoring.hpcloudsvc.com:5672/385937540",
	    "meta": {
	      "amqp_password":"GnbV94wW3MF90",
	      "amqp_username": "385937540",
	      "amqp_queue": "metrics-67892236969703",
	    }
	  }
	}
	
**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 409 | Conflict | An endpoint for this project already exists. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts).

	$ curl -i -X POST \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/endpoints \
	  -H "X-Auth-Token: ${Auth_Token}"

##### 4.4.2.2 List All Endpoints #### {#ServiceDetailsListEndpoint}
##### GET /endpoints

Lists all endpoints. Password information is not present.

**Request Data**

	GET /v1.1/endpoints HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

Common attributes described in [4.4.2.1 Create a New Endpoint](#ServiceDetailsCreateEndpoint).

JSON

	{
	  "endpoints": [
	    {
	      "id": "eabe9e32-6ce0-4a36-9750-df415606b44c",
	      "links": [
	        {
	          "rel": "self",
	          "href": "https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/endpoints/eabe9e32-6ce0-4a36-9750-df415606b44c"
	        }
	      ],
	      "uri": "amqp://region-a.geo-1.amqp-monitoring.hpcloudsvc.com:5672/385937540"
	    },
	  ]
	}

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts).

	$ curl -i -X GET \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/endpoints \
	  -H "X-Auth-Token: ${Auth_Token}"

##### 4.4.2.3 Get a Specific Endpoint #### {#ServiceDetailsSpecificEndpoint}
##### GET /endpoints/${endpoint_id}

Gets the details of a specific endpoint identified by `${endpoint_id}`. Password information is not present.

**Request Data**

	GET /v1.1/endpoints/${endpoint_id} HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

Common attributes described in [4.4.2.1 Create a New Endpoint](#ServiceDetailsCreateEndpoint).

JSON

	{
	  "endpoint": {
	    "id": "eabe9e32-6ce0-4a36-9750-df415606b44c",
	    "links": [
	      {
	        "rel": "self",
	        "href": "https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/endpoints/eabe9e32-6ce0-4a36-9750-df415606b44c"
	      }
	    ],
	    "uri": "amqp://region-a.geo-1.amqp-monitoring.hpcloudsvc.com:5672/385937540",
	    "meta": {
	      "amqp_username": "385937540",
	      "amqp_queue": "metrics-67892236969703"
	    }
	  }
	}

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 404 | Not Found | Requested resource cannot be found. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts). Replace `${endpoint_id}` with the actual endpoint id.

	$ curl -i -X GET \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/endpoints/${endpoint_id} \
	  -H "X-Auth-Token: ${Auth_Token}"
	  
##### 4.4.2.4 Delete a Specific Endpoint #### {#ServiceDetailsDeleteEndpoint}
##### DELETE /endpoints/${endpoint_id}

Deletes a specific endpoint identified by `${endpoint_id}`.

**Request Data**

	DELETE /v1.1/endpoints/${endpoint_id} HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

204 - No Content

**Response Data**

This call does not provide a response body.

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 404 | Not Found | Requested resource cannot be found. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts). Replace `${endpoint_id}` with the actual endpoint id.

	$ curl -i -X DELETE \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/endpoints/${endpoint_id} \
	  -H "X-Auth-Token: ${Auth_Token}"

##### 4.4.2.4 Reset the Password for a Specific Endpoint #### {#ServiceDetailsResetPasswordEndpoint}
##### POST /endpoints/${endpoint_id}/reset-password

Resets the password for a specific endpoint identified by `${endpoint_id}`.

**Request Data**

	POST /v1.1/endpoints/${endpoint_id}/reset-password HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

|Attributes|Type|Description|
|:---------|:---|:----------|
|password|string|Newly created amqp_password|

	{
	  "password": "mEfOy34qJV"
	}

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 404 | Not Found | Requested resource cannot be found. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts). Replace `${endpoint_id}` with the actual endpoint id.

	$ curl -i -X POST \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/endpoints/${endpoint_id}/reset-password \
	  -H "X-Auth-Token: ${Auth_Token}"
	  
#### 4.4.3 Subscription ### {#ServiceDetailsSubscription}

The subscription resource represents a subscription to consume metrics.

**Note:** Only AMQP basicConsume functionality is allowed. You cannot create queues or exchanges.

##### 4.4.3.1 Create a New Subscription #### {#ServiceDetailsCreateSubscription}
##### POST /subscriptions

Creates a new subscription to consume metrics.

**Request Data**

	POST /v1.1/subscriptions HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	Content-Type: application/json
	Accept: application/json
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

|Attributes|Type|Description|
|:---------|:---|:----------|
|endpoint_id|string|The id of an endpoint to subscribe to or view.|
|namespace|string|The namespace of the metrics to receive. See [Namespaces](#Namespaces).|
|dimensions|dictionary|The dimensions of metrics to receive. May be empty for user defined namespaces. See [Dimensions](#Namespaces).|

JSON

	{
	  "subscription": {
	    "endpoint_id": "eabe9e32-6ce0-4a36-9750-df415606b44c",
	    "namespace": "hpcs.compute",
	    "dimensions": {
	      "instance_id": "31ff6820-7c86-11e2-b92a-0800200c9a66"
	    }
	  }
	}

**Success Response**

	HTTP/1.1 201 Created
	Content-Type: application/json
	Content-Length: 337
	Location: /v1.1/subscriptions/${subscription_id}

**Status Code**

201 - Created

**Response Data**

|Attributes|Type|Description|
|:---------|:---|:----------|
|id|string|Return value id of the call.|
|rel|string|Relationship type.|
|href|string|Hypermedia reference.|
|endpoint_id|string|The id of an endpoint to subscribe to or view.|
|namespace|string|The namespace of the metrics to receive. See [Namespaces](#Namespaces).|
|dimensions|dictionary|The dimensions of metrics to receive. See [Dimensions](#Namespaces).|

JSON

	{
	  "subscriptions": {
	    "id": "cdace7b4-8bea-404c-848c-860754a76fb7",
	    "links": [
	      {
	        "rel": "self",
	        "href": "https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/subscriptions/cdace7b4-8bea-404c-848c-860754a76fb7"
	      }
	    ],
	    "endpoint_id": "eabe9e32-6ce0-4a36-9750-df415606b44c",
	    "namespace": "hpcs.compute",
	    "dimensions": {
	      "instance_id": "31ff6820-7c86-11e2-b92a-0800200c9a66"
	    }
	    "meta": {}
	  }
	}

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 409 | Conflict | A Subscription for this combination of endpoint_id, namespace, and dimension already exists for this project. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts). Replace the values for `endpoint_id`, `namespace`, `instance_id`.

	$ curl -i -X POST \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/subscriptions \
	  -H "X-Auth-Token: ${Auth_Token}" -H "Content-Type: application/json" -H "Accept: application/json" \
	  -d '{"subscription": {"endpoint_id": "4d159ef6-0b6a-439b-a5bf-07459e1005b8", "namespace": "hpcs.compute", "dimensions": {"instance_id": "31ff6820-7c86-11e2-b92a-0800200c9a66"}}}'

##### 4.4.3.2 List All Subscriptions #### {#ServiceDetailsListSubscription}
##### GET /subscriptions

Lists all subscriptions.

**Request Data**

	GET /v1.1/subscriptions HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

Common attributes described in [4.4.3.1 Create a New Subscription](#ServiceDetailsCreateSubscription).

JSON

	{
	  "subscriptions": [
	    {
	      "id": "cdace7b4-8bea-404c-848c-860754a76fb7",
	      "links": [
	        {
	          "rel": "self",
	          "href": "https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/subscriptions/cdace7b4-8bea-404c-848c-860754a76fb7"
	        }
	      ],
	      "endpoint_id": "36351ef0-3ff3-11e2-a25f-0800200c9a66",
	      "namespace": "hpcs.compute",
	      "dimensions": {
	        "instance_id": "31ff6820-7c86-11e2-b92a-0800200c9a66"
	      }
	    },
	    {
	      "id": "abce9e32-6ce0-4a36-9750-df415606babc",
	      "links": [
	        {
	          "rel": "self",
	          "href": "https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/subscriptions/abce9e32-6ce0-4a36-9750-df415606babc"
	        }
	      ],
	      "endpoint_id": "3d713b90-3ff3-11e2-a25f-0800200c9a66",
	      "namespace": "hpcs.compute",
	      "dimensions": {
	        "instance_id": "42ff6820-7c86-11e2-b92a-0800200c9a67"
	      }
	    }
	  ]
	}

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts).

	$ curl -i -X GET \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/subscriptions \
	  -H "X-Auth-Token: ${Auth_Token}"

##### 4.4.3.3 Get a Specific Subscription #### {#ServiceDetailsSpecificSubscription}
##### GET /subscriptions/${subscription_id}

Gets the details of a specific subscription identified by ${subscription_id}.

**Request Data**

	GET /v1.1/subscriptions/${subscription_id} HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

Common attributes described in [4.4.3.1 Create a New Subscription](#ServiceDetailsCreateSubscription).

JSON

	{
	  "subscription": {
	    "id": "eabe9e32-6ce0-4a36-9750-df415606b44c",
	    "links": [
	      {
	        "rel": "self",
	        "href": "https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/subscriptions/eabe9e32-6ce0-4a36-9750-df415606b44c"
	      }
	    ],
	    "endpoint_id": "36351ef0-3ff3-11e2-a25f-0800200c9a66",
	    "namespace": "hpcs.compute",
	    "dimensions": {
	      "instance_id": "31ff6820-7c86-11e2-b92a-0800200c9a66"
	    },
	    "meta": {}
	  }
	}

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 404 | Not Found | Requested resource cannot be found. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts). Replace `${subscription_id}` with the actual subscription id.

	$ curl -i -X GET \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/subscriptions/${subscription_id} \
	  -H "X-Auth-Token: ${Auth_Token}"

##### 4.4.3.4 Delete a Specific Subscription #### {#ServiceDetailsDeleteSubscription}
##### DELETE /subscriptions/${subscription_id}

Deletes a specific subscription identified by ${subscription_id}.

**Request Data**

	DELETE /v1.1/subscriptions/${subscription_id} HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

204 - No Content

**Response Data**

This call does not provide a response body.

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 404 | Not Found | Requested resource cannot be found. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts). Replace `${subscription_id}` with the actual subscriptions id.

	$ curl -i -X DELETE \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/subscriptions/${subscription_id} \
	  -H "X-Auth-Token: ${Auth_Token}"

#### 4.4.4 Notification Method ### {#ServiceDetailsNotification}

The notification method resource represents a method through which notifications can be sent.

**Note:** SMS is currently only supported for US customers.

##### 4.4.4.1 Create a New Notification Method #### {#ServiceDetailsCreateNotification}
##### POST /notification-methods

Creates a new notification method through which notifications can be sent when an alarm is triggered.

**Request Data**

	POST /v1.1/notification-methods HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	Content-Type: application/json
	Accept: application/json
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

|Attributes|Type|Description|
|:---------|:---|:----------|
|name|string (250)|A descriptive name.|
|type|enumeration|The type of notification method (SMS, EMAIL).|
|address|string (100)|The address / number to notify.|

JSON

	{
	  "notification_method": {
	    "name": "Joe's Email",
	    "type": "EMAIL",
	    "address": "joe@mail.com"
	  }
	}

**Success Response**

	HTTP/1.1 201 Created
	Content-Type: application/json
	Content-Length: 337
	Location: /v1.1/notification-methods/${notification_method_id}

**Status Code**

201 - Created

**Response Data**

|Attributes|Type|Description|
|:---------|:---|:----------|
|id|string|Return value id of the call.|
|rel|string|Relationship type.|
|href|string|Hypermedia reference.|
|name|string|A descriptive name.|
|type|string / enumeration|The type of notification method (SMS, EMAIL).|
|address|string|The address / number to notify.|

JSON

	{
	  "notification_method": {
	    "id": "acb8ad2b-6ce0-4a36-9750-a78bc7da87a2",
	    "links" : [
	      {
	        "rel": "self",
	        "href": "https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/notification-methods/acb8ad2b-6ce0-4a36-9750-a78bc7da87a2"
	      }
	    ],
	    "name": "Joe's Email",
	    "type": "EMAIL",
	    "address": "joe@mail.com"
	  }
	}

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts). Replace the values for `name`, `type`, and `address`.

	$ curl -i -X POST \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/notification-methods \
	  -H "Content-Type: application/json" -H "Accept: application/json" \
	  -H "X-Auth-Token: ${Auth_Token}" \
	  -d '{"notification_method": {"name": "Joe'\''s Email", "type": "EMAIL", "address": "joe@mail.com"}}'

##### 4.4.4.2 List All Notification Methods #### {#ServiceDetailsListNotification}
##### GET /notification-methods

Lists all notification methods.

**Request Data**

	GET /v1.1/notification-methods HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

Common attributes described in [4.4.4.1 Create a New Notification Method](#ServiceDetailsCreateNotification).

JSON

	{
	  "notification_methods": [
	    {
	      "id": "eabe9e32-6ce0-4a36-9750-df415606b44c",
	      "links" : [
	        {
	          "rel": "self",
	          "href": "https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/notification-methods/eabe9e32-6ce0-4a36-9750-df415606b44c"
	        }
	      ],
	      "name": "Joe's Email",
	      "type": "EMAIL",
	      "address": "joe@mail.com"
	    },
	    {
	      "id": "acb8ad2b-6ce0-4a36-9750-a78bc7da87a2",
	      "links" : [
	        {
	          "rel": "self",
	          "href": "https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/notification-methods/acb8ad2b-6ce0-4a36-9750-a78bc7da87a2"
	        }
	      ],
	      "name": "Joe's Phone",
	      "type": "SMS",
	      "address": "+12063823454"
	    }
	  ]
	}

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts).

	$ curl -i -X GET \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/notification-methods \
	  -H "X-Auth-Token: ${Auth_Token}"

##### 4.4.4.3 Get a Specific Notification Method #### {#ServiceDetailsSpecificNotification}
##### GET /notification-methods/${notification_method_id}

Gets the details of a specific notification method identified by `${notification_method_id}`.

**Request Data**

	GET /v1.1/notification-methods/${notification_method_id} HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

Common attributes described in [4.4.4.1 Create a New Notification Method](#ServiceDetailsCreateNotification).

JSON

	{
	  "notification_method": {
	    "id": "eabe9e32-6ce0-4a36-9750-df415606b44c",
	    "links" : [
	      {
	        "rel": "self",
	        "href": "https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/notification-methods/eabe9e32-6ce0-4a36-9750-df415606b44c"
	      }
	    ],
	    "name": "Joe's Email",
	    "type": "EMAIL",
	    "address": "joe@mail.com"
	  }
	}

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 404 | Not Found | Requested resource cannot be found. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts). Replace `${notification_method_id}` with the actual notification-method id.

	$ curl -i -X GET \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/notification-methods/${notification_method_id} \
	  -H "X-Auth-Token: ${Auth_Token}"

##### 4.4.4.4 Delete a Specific Notification Method #### {#ServiceDetailsDeleteNotification}
##### DELETE /notification-methods/${notification_method_id}

Deletes a specific notification method identified by `${notification_method_id}`.

**Request Data**

	DELETE /v1.1/notification-methods/${notification_method_id} HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

204 - No Content

**Response Data**

This call does not provide a response body.

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 404 | Not Found | Requested resource cannot be found. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts). Replace `${notification_method_id}` with the actual notification-method id.

	$ curl -i -X DELETE \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/notification-methods/${notification_method_id} \
	  -H "X-Auth-Token: ${Auth_Token}"

#### 4.4.5 Notification Address ### {#ServiceDetailsNotificationAddress}

In order to avoid misuses of the notification system, the Monitoring API requires that email and SMS addresses be validated before notifications are sent. The notification address resource represents validated address to which notifications can be sent. Notifications destined for addresses which have not been validated will not be
delivered.

**Note:** SMS is currently only supported for US customers.

Validation of notification addresses is a two step process:

1. Create a new notification address by [sending a POST command to the /notification-addresses resource](#ServiceDetailsCreateAddress).
2. Taking the validation code delivered to the new address and [sending a POST command to the /notification-addresses/validate resource](#ServiceDetailsValidateAddress).

The validation code sent by the monitoring notification API is not returned by the POST command in step 1 above. Rather it is used to prove that the sender of the API command has access to the notification address.

##### 4.4.5.1 Create a New Notification Address #### {#ServiceDetailsCreateAddress}
##### POST /notification-addresses

Creates a new notification address through which notifications can be sent when an alarm is triggered.

**Note:** A status code of 400 will be returned if the notification address could not be validated. Addresses of type EMAIL the address should be deliverable by a standards-confirming SMTP server. For addresses of type SMS the address should be in the E.164 format for international telephone numbers. This requires a leading + (plus sign) followed by the country code, then the regional number.

**Request Data**

	POST /v1.1/notification-addresses HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	Content-Type: application/json
	Accept: application/json
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

|Attributes|Type|Description|
|:---------|:---|:----------|
|type|enumeration|The type of notification address (SMS, EMAIL).|
|address|string (100)|The address / number to verify.|
|name|string (100)|A textual description of the address.|

JSON

	{
	  "notification_address": {
	    "type": "EMAIL",
	    "address": "joe@mail.com",
        "name": "Joe's email"
	  }
	}

**Success Response**

	HTTP/1.1 201 Created
	Content-Type: application/json
	Content-Length: 337
	Location: /v1.1/notification-addresses/${notification_addresses_id}

**Status Code**

201 - Created

**Response Data**

|Attributes|Type|Description|
|:---------|:---|:----------|
|id|string|Return value id of the call.|
|rel|string|Relationship type.|
|href|string|Hypermedia reference.|
|type|string / enumeration|The type of notification address (SMS, EMAIL).|
|address|string|The address / number to notify.|
|name|string|The textual description of the address.|

JSON

	{
	  "notification_address": {
	    "id": "ada28363-a4dc-4bda-85f4-fd37dea6f543",
	    "links" : [
	      {
	        "rel": "self",
	        "href": "https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/notification-address/ada28363-a4dc-4bda-85f4-fd37dea6f543"
	      }
	    ],
	    "type": "EMAIL",
        "state": "in-progress",
	    "address": "joe@mail.com",
        "name": "Joe's email"
	  }
	}

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts). Replace the values for `type` and `address`.

	$ curl -i -X POST \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/notification-addresses \
	  -H "Content-Type: application/json" -H "Accept: application/json" \
	  -H "X-Auth-Token: ${Auth_Token}" \
	  -d '{"notification_address": {"type": "EMAIL", "address": "joe@mail.com", "name": "Joe email"}}'

##### 4.4.5.2 List All Notification Addresses #### {#ServiceDetailsListAddress}
##### GET /notification-addresses

Lists all notification addresses.

**Request Data**

	GET /v1.1/notification-addresses HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

Common attributes described in [4.4.5.1 Create a New Notification Address](#ServiceDetailsCreateAddress).

JSON

	{
	  "notification_addresses": [
	    {
	      "id": "ada28363-a4dc-4bda-85f4-fd37dea6f543",
	      "links" : [
	        {
	          "rel": "self",
	          "href": "https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/notification-addresses/ada28363-a4dc-4bda-85f4-fd37dea6f543"
	        }
	      ],
	      "type": "EMAIL",
          "state": "in-progress",
	      "address": "joe@mail.com",
          "name": "Joe's email"
	    },
	    {
	      "id": "d6f1f349-0832-492b-8117-32c81497eba0",
	      "links" : [
	        {
	          "rel": "self",
	          "href": "https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/notification-addresses/d6f1f349-0832-492b-8117-32c81497eba0"
	        }
	      ],
	      "type": "SMS",
	      "state": "verified",
	      "address": "+12063823454",
          "name": "Joe's SMS"
	    }
	  ]
	}

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts).

	$ curl -i -X GET \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/notification-addresses \
	  -H "X-Auth-Token: ${Auth_Token}"

##### 4.4.5.3 Get a Specific Notification Address #### {#ServiceDetailsSpecificAddress}
##### GET /notification-addresses/${notification_addresses_id}

Gets the details of a specific notification address identified by `${notification_addresses_id}`.

**Request Data**

	GET /v1.1/notification-addresses/ HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

Common attributes described in [4.4.5.1 Create a New Notification Address](#ServiceDetailsCreateAddress).

JSON

	{
	  "notification_address": {
	    "id": "ada28363-a4dc-4bda-85f4-fd37dea6f543",
	    "links" : [
	      {
	        "rel": "self",
	        "href": "https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/notification-addresses/ada28363-a4dc-4bda-85f4-fd37dea6f543"
	      }
	    ],
	    "type": "EMAIL",
        "state": "verified",
	    "address": "joe@mail.com",
        "name": "Joe's email"
	  }
	}

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 404 | Not Found | Requested resource cannot be found. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts). Replace `${notification_addresses_id}` with the actual notification-addresses id.

	$ curl -i -X GET \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/notification-addresses/${notification_addresses_id} \
	  -H "X-Auth-Token: ${Auth_Token}"

##### 4.4.5.4 Delete a Specific Notification Address #### {#ServiceDetailsDeleteAddress}
##### DELETE /notification-addresses/${notification_addresses_id}

Deletes a specific notification address identified by `${notification_addresses_id}`.

**Request Data**

	DELETE /v1.1/notification-addresses/${notification_addresses_id} HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

204 - No Content

**Response Data**

This call does not provide a response body.

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 404 | Not Found | Requested resource cannot be found. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts). Replace `${notification_addresses_id}` with the actual notification-addresses id.

	$ curl -i -X DELETE \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/notification-addresses/${notification_addresses_id} \
	  -H "X-Auth-Token: ${Auth_Token}"

##### 4.4.5.6 Validate a Specific Notification Address #### {#ServiceDetailsValidateAddress}
##### POST /notification-addresses/validate

Validate an address by passing the validation code sent by the monitoring service to the address as the result of a notification address request. Knowledge of the value of the validation code implies that the project has access to the address and is willing to accept notifications from the monitoring service.

**Request Data**

	POST /v1.1/notification-addresses/validate HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	Content-Type: application/json
	Accept: application/json

**Data Parameters**

|Attributes|Type|Description|
|:---------|:---|:----------|
|validation_code|string|The validation code delivered to the notification address as a result of a notification address request.|

JSON

	{
	  "validation_code": "123456789"
	}

**Success Response**

**Status Code**

204 - No Content

**Response Data**

This call does not provide a response body.

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 404 | Not Found | Requested resource cannot be found. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

	$ curl -i -X POST \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/notification-addresses/validate \
	  -H "Content-Type: application/json" -H "Accept: application/json" -d '{"validation_code": "1234567890"}'

#### 4.4.6 Alarm ### {#ServiceDetailsAlarm}

The alarm resource identifies a particular metric scoped by namespace, metric type, and dimensions, which should trigger a set of actions when the value of the metric exceeds a threshold as determined by an expression. Alarm polling is done once every 60 seconds.

**Note:** See [Alarm Expressions](#AlarmExpressions) for how to write the expression.

**State Lifecycle**

|State|Definition|
|:----|:---------|
|UNDETERMINED|The state of the alarm cannot be determined. An alarm starts in this state and can re-enter this state if it doesn't receive metric values for a while|
|OK|The threshold is not passed, no notification is sent|
|ALARM|The threshold has been passed, a notification has been sent|

##### 4.4.6.1 Create a New Alarm #### {#ServiceDetailsCreateAlarm}
##### POST /alarms

Creates a new alarm.

**Request Data**

	POST /v1.1/alarms HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	Content-Type: application/json
	Accept: application/json
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

|Attributes|Type|Description|
|:---------|:---|:----------|
|name|string (250)|A descriptive name.|
|expression|string|An expression, which if true, triggers a notification to be sent. See [Alarm Expressions](#AlarmExpressions) for how to write an expression.|
|alarm_actions|array|Methods through which notifications (notification id) should be sent when transitioning to an ALARM state.|

JSON

	{
	  "alarm": {
	    "name": "Disk exceeds 1k operations per measurement period",
	    "expression": "avg(hpcs.compute{metric_name=disk_read_ops, device=vda, instance_id=31ff6820-7c86-11e2-b92a-0800200c9a66}) >= 1000",
	    "alarm_actions": [
	      "036609b0-3d6b-11e2-a25f-0800200c9a66",
	      "1221dba0-3d6b-11e2-a25f-0800200c9a66"
	    ]
	  }
	}

**Success Response**

	HTTP/1.1 201 Created
	Content-Type: application/json
	Content-Length: 337
	Location: /v1.1/alarms/${alarm_id}

**Status Code**

201 - Created

**Response Data**

|Attributes|Type|Description|
|:---------|:---|:----------|
|id|string|Return value id of the call.|
|rel|string|Relationship type.|
|href|string|Hypermedia reference.|
|name|string|A descriptive name.|
|expression|string|An expression, which if true, triggers a notification to be sent. See [Alarm Expressions](#AlarmExpressions) for how to write an expression.|
|state|string|The alarm state. See State Lifecycle above.|
|alarm_actions|array|Methods through which notifications (notification id) should be sent when transitioning to an ALARM state.|

JSON

	{
	  "alarm": {
	    "id": "eabe9e32-6ce0-4a36-9750-df415606b44c",
	    "links": [
	      {
	        "rel": "self",
	        "href": "https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/alarms/eabe9e32-6ce0-4a36-9750-df415606b44c"
	      }
	    ],
	    "name": "Disk exceeds 1k operations per measurement period",
	    "expression": "avg(hpcs.compute{metric_name=disk_read_ops, device=vda, instance_id=31ff6820-7c86-11e2-b92a-0800200c9a66}) >= 1000",
	    "state": "UNDETERMINED",
	    "alarm_actions": [
	      "036609b0-3d6b-11e2-a25f-0800200c9a66",
	      "1221dba0-3d6b-11e2-a25f-0800200c9a66"
	    ]
	  }
	}

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 409 | Conflict | An Alarm for this combination of values already exists for this project. |
| 422 | Unprocessable Entity | The metric json contained errors. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts). Replace the values for `name`, `expression`, `alarm_actions`.

	$ curl -i -X POST \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/alarms \
	  -H "Content-Type: application/json" -H "Accept: application/json" \
	  -H "X-Auth-Token: ${Auth_Token}" \
	  -d '{"alarm": {"name": "Disk exceeds 1k operations per measurement period", "expression": "avg(hpcs.compute{metric_name=disk_read_ops, device=vda, instance_id=31ff6820-7c86-11e2-b92a-0800200c9a66}) >= 1000", "alarm_actions": ["036609b0-3d6b-11e2-a25f-0800200c9a66", "1221dba0-3d6b-11e2-a25f-0800200c9a66"]}}'

##### 4.4.6.2 List All Alarms #### {#ServiceDetailsListAlarm}
##### GET /alarms

Lists all alarms.

**Request Data**

	GET /v1.1/alarms HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

Common attributes described in [4.4.6.1 Create a New Alarm](#ServiceDetailsCreateAlarm).

JSON

	{
	  "alarms": [
	    {
	    "id": "eabe9e32-6ce0-4a36-9750-df415606b44c",
	    "links": [
	      {
	        "rel": "self",
	        "href": "https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/alarms/eabe9e32-6ce0-4a36-9750-df415606b44c"
	      }
	    ],
	    "name": "Disk exceeds 1k operations per measurement period",
	    "expression": "avg(hpcs.compute{metric_name=disk_read_ops, device=vda, instance_id=31ff6820-7c86-11e2-b92a-0800200c9a66}) >= 1000",
	    "state": "OK",
	    }
	  ]
	}

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts).

	$ curl -i -X GET \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/alarms \
	  -H "X-Auth-Token: ${Auth_Token}"

##### 4.4.6.3 Get a Specific Alarm #### {#ServiceDetailsSpecificAlarm}
##### GET /alarms/${alarm_id}

Gets the details of a specific alarms identified by `${alarm_id}`.

**Request Data**

	GET /v1.1/alarms/${alarm_id} HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

Common attributes described in [4.4.6.1 Create a New Alarm](#ServiceDetailsCreateAlarm).

JSON

	{
	  "alarm": {
	    "id": "eabe9e32-6ce0-4a36-9750-df415606b44c",
	    "links": [
	      {
	        "rel": "self",
	        "href": "https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/alarms/eabe9e32-6ce0-4a36-9750-df415606b44c"
	      }
	    ],
	    "name": "Disk exceeds 1k operations per measurement period",
	    "expression": "avg(hpcs.compute{metric_name=disk_read_ops, device=vda, instance_id=31ff6820-7c86-11e2-b92a-0800200c9a66}) >= 1000",
	    "state": "OK",
	    "alarm_actions": [
	      "036609b0-3d6b-11e2-a25f-0800200c9a66",
	      "1221dba0-3d6b-11e2-a25f-0800200c9a66"
	    ]
	  }
	}

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 404 | Not Found | Requested resource cannot be found. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts). Replace `${alarm_id}` with the actual alarm id.

	$ curl -i -X GET \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/alarms/${alarm_id} \
	  -H "X-Auth-Token: ${Auth_Token}"

##### 4.4.6.4 Delete a Specific Alarm #### {#ServiceDetailsDeleteAlarm}
##### DELETE /alarms/${alarm_id}

Deletes a specific alarm identified by `${alarm_id}`.

**Request Data**

	DELETE /v1.1/alarms/${alarm_id} HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

This call does not require a request body. 

**Success Response**

**Status Code**

204 - No Content

**Response Data**

This call does not provide a response body.

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 404 | Not Found | Requested resource cannot be found. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts). Replace `${alarm_id}` with the actual alarm id.

	$ curl -i -X DELETE \ 
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/alarms/${alarm_id} \
	  -H "X-Auth-Token: ${Auth_Token}"

#### 4.4.7 Metrics ### {#ServiceDetailsMetrics}

The metrics resource allows the insertion of user defined metrics.

##### 4.4.7.1 Create a New Metric #### {#ServiceDetailsCreateMetric}
##### POST /metrics

Creates a new metric.

**Request Data**

	POST /v1.1/metrics HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	Content-Type: application/json
	Accept: application/json
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

|Attributes|Type|Description|
|:---------|:---|:----------|
|namespace|string (64)|User defined namespace (cannot conflict with a reserved namespace). See [Namespaces](#Namespaces).|
|dimensions|dictionary|(Optional) The dimensions of metrics to receive (each dimension type can only be used once in this call). User defined metrics do not require dimensions. See [Dimensions](#Namespaces).|
|timestamp|integer (long)|(Optional) Unix format timestamp for the message. This must be within 2 minutes into the future or 2 weeks into the past of the current UTC time. If not included, the current UTC time is inserted.|
|value|double|Metric value. Must be between 8.515920e-109 and 1.174271e+108 or zero.|
|time_values|[ [ long, double ] ]|Use instead of the value field to give a list of timestamp / value pairs.|

JSON

The HP Helion Metrics JSON format is used for publishing new user defined metrics and for receiving all metrics from a subscription.

***Scalar Metric***

	{
		"namespace": "user_namespace"
		"dimensions": {
		  "metric_name": "user_metric",
		  "instance_id": "31ff6820-7c86-11e2-b92a-0800200c9a66"
		},
		"timestamp": 123123123,
		"value": 123.0
	}
	
***Vector Metric***

	{
		"namespace": "user_namespace"
		"dimensions": {
		  "metric_name": "user_metric",
		  "instance_id": "31ff6820-7c86-11e2-b92a-0800200c9a66"
		},
		"timestamp": 123123123,
		"time_values": [
		  [1366128488, 123.0], [1366128504, 0.0], [1366128494, 234.0]
		]
	}		

**Success Response**

**Status Code**

204 - No Content

**Response Data**

This call does not provide a response body.

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 409 | Conflict | The namespace name conflicts with a reserved namespace. |
| 422 | Unprocessable Entity | The metric json contained errors. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace '${Auth_Token}' with the token returned from section [Accounts](#Accounts). Replace the values for 'namespace', 'type', 'dimensions', 'timestamp'.

	$ curl -i -X POST \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/metrics \
	  -H "Content-Type: application/json" -H "Accept: application/json" \
	  -H "X-Auth-Token: ${Auth_Token}" \
	  -d '{"namespace": "user_namespace", "dimensions": {"metric_name": "user_metric", instance_id": "31ff6820-7c86-11e2-b92a-0800200c9a66"}, "timestamp": 123123123, "value": 123}'
	 
##### 4.4.7.2 Create New Aggregated Metrics #### {#ServiceDetailsCreateMetrics}
##### POST /metrics/aggregate

Creates several new metrics with one call. Vector aggregate metrics can also be created.

**Note:** Aggregate metrics are split into scalar metrics internally.

**Request Data**

	POST /v1.1/metrics/aggregate HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	Content-Type: application/json
	Accept: application/json
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

Common attributes described in [4.4.7.1 Create a New Metric](#ServiceDetailsCreateMetric).

JSON

The HP Helion Metrics JSON format is used for publishing new user defined metrics and for receiving all metrics from a subscription.

***Scalar Aggregate Metric***

	[
		{
			"namespace": "user_namespace",
			"dimensions": {
			  "metric_name": "user_metric",
			  "instance_id": "31ff6820-7c86-11e2-b92a-0800200c9a66"
			},
			"timestamp": 123123123,
			"value": 123.0
		},
		{
			"namespace": "user_namespace",
			"dimensions": {
			  "metric_name": "user_metric2",
			  "instance_id": "423f6820-7c86-11e2-b92a-0800200c9bb7"
			},
			"timestamp": 123123123,
			"value": 127.0
		}
	]
	
**Success Response**

**Status Code**

204 - No Content

**Response Data**

This call does not provide a response body.

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 409 | Conflict | The namespace name conflicts with a reserved namespace. |
| 422 | Unprocessable Entity | The metric json contained errors. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts). Replace the values for `namespace`, `type`, `dimensions`, `timestamp`.

	$ curl -i -X POST \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/metrics \
	  -H "Content-Type: application/json" -H "Accept: application/json" \
	  -H "X-Auth-Token: ${Auth_Token}" \
	  -d '[{"namespace": "user_namespace", "dimensions": {"metric_name": "user_metric", instance_id": "31ff6820-7c86-11e2-b92a-0800200c9a66"}, "timestamp": 123123123, "value": 123},{"namespace": "user_namespace", "dimensions": {"metric_name": "user_metric2", instance_id": "423f6820-7c86-11e2-b92a-0800200c9bb7"}, "timestamp": 123123123, "value": 127}'
	  
##### 4.4.7.3 Get metric datapoints #### {#ServiceDetailsGetMetrics}
##### GET /metrics

Gets a set of metric datapoints for a time range. Datapoints are aggregated by statistic for individual time periods over a broader time range.

**Request Data**

	GET /v1.1/metrics?${query_parameters} HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

| Attributes | Required | Type | Default Value | Valid Values | Example Value | Description |
| :-----------| :-----------| :-----------| :-----------| :-------| :-------| :-------|
| namespace|Y|string|||user_namespace|The namespace to get metric datapoints by.|
| dimensions|Y|comma separated key/value pairs|||metric_name:user_metric,instance_id:392633|The dimensions to get metric datapoints by.|
| statistics|Y|comma separated statistics||avg, sum, min, max, count|avg,sum|The statistics to aggregate datapoints by.|
| start_time|Y|ISO 8601 date/time|||2013-11-01T12:00Z|The start time to query metric datapoint by.|
| end_time|N|ISO 8601 date/time|Current time||2013-11-02T12:00Z|The end time to query metric datapoints by.|
| period |N|seconds|300||600|The time period to aggregate datapoints by.|

**Success Response**

**Status Code**

200 - OK

**Response Data**

JSON

    [
       {
         "dimensions": {
           "metric_name": "user_metric",
           "instance_id": "31ff6820-7c86-11e2-b92a-0800200c9a66"
         },
         "datapoints": {
           "timestamp": [13543534, 13543594, 13543654],
           "avg": [12, 13, 14],
           "min": [2, 3, 4],
           "max": [20, 21, 22]
          }
       }
    ]

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.      |
| 403 | Forbidden | Disabled or suspended user making the request or requested operation is forbidden. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts). Replace the query section with your specific query. Keep in mind that the command line may interpret '&' or '?' as a shell operation, so you'll likely need to use single quotes around that section.

	$ curl -i -X GET \
	  'https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/metrics?namespace=user_namespace&dimensions=metric_name:user_metric,instance_id:31ff6820-7c86-11e2-b92a-0800200c9a66&statistics=avg&start_time=2013-11-01T12:00Z&end_time=2013-11-02T12:00Z&period=300' \
	  -H "X-Auth-Token: ${Auth_Token}" 

#### 4.4.8 Metering ### {#ServiceDetailsVersion}

Changes settings for support and billing. Premium support gives access to a higher resolution data rate.

##### 4.4.8.1 Set the Monitoring Level #### {#ServiceDetailsSetMonitoringLevel}
##### POST /metering

Set the Monitoring Level to either "basic" or "premium"; basic is assumed if nothing is set.

**Request Data**

	POST /v1.1/metering?${setting}=${value} HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

|Attributes|Type|Description|
|:---------|:---|:----------|
|setting|string|Currently only "monitoring_level"|
|value|string|Either "basic" or "premium"|

**Success Response**

**Status Code**

200 - OK

**Response Data**

JSON

	{  
	  "setting": "monitoring_level",
	  "value": "basic"
	}

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts). Keep in mind that the command line may interpret '?' as a shell operation, so you'll likely need to use single quotes around that section.

	$ curl -i -X POST \
	  'https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/metering?monitoring_level=premium' \
	  -H "X-Auth-Token: ${Auth_Token}"

##### 4.4.8.2 Get the Monitoring Level #### {#ServiceDetailsGetMonitoringLevel}
##### GET /metering

Get the Monitoring Level; basic monitoring level is assumed if nothing is explicitly set.

**Request Data**

	GET /v1.1/metering HTTP/1.1
	Host: https://region-a.geo-1.monitoring.hpcloudsvc.com
	X-Auth-Token: ${Auth_Token}

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

Common attributes described in [4.4.8.1 Create a New Metric](#ServiceDetailsSetMonitoringLevel).

JSON

	{  
	  "setting": "monitoring_level",
	  "value": "basic"
	}

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 500 | Server Error | The server encountered a problem while processing the request. |

**Curl Example**

Replace `${Auth_Token}` with the token returned from section [Accounts](#Accounts).

	$ curl -i -X GET \
	  https://region-a.geo-1.monitoring.hpcloudsvc.com/v1.1/metering \
	  -H "X-Auth-Token: ${Auth_Token}"
