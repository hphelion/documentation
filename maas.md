---
layout: default
title: "HP Cloud Monitoring Overview"
permalink: /maas/
product: maas

---
# HP Cloud Monitoring Overview #

HP Cloud Monitoring provides you with a managed service that facilitates your monitoring of the health and other metrics for the resources in HP Cloud.

If you want to track the usage and performance of your cloud, monitoring is the service for you.

•	Brief overview

HP Cloud Monitoring is a managed service that monitors infrastructure, platform, and custom metrics to help ensure that workloads are operating at optimum levels. HP Cloud Monitoring provides fundamental performance management capabilities such as performance metrics, threshold-based alarms, and reliable notification delivery. HP Cloud Monitoring is an easy, scalable way to gain visibility into your workload’s performance and operational health.
Save time and money

Say goodbye to license fees, software upgrades, and physical infrastructure costs. HP Cloud Monitoring provides a scalable, managed monitoring service that provides users with the benefits of a traditional performance monitoring solution without the cost and complexity of managing a standalone monitoring infrastructure.
Optimize

Optimize workload performance and gain better insight into your HP Cloud resources. Uncover hidden bottlenecks, increase cloud capacity, or scale down your resources based on HP Cloud performance data.
Gain deeper insight

HP Cloud Monitoring is perfect for capacity planning and root cause analysis. Gain deeper insight into your workload when you analyze historical performance data that helps you identify key performance trends. HP Cloud Monitoring historical data allows you to quickly identify and resolve performance anomalies before they impact your workloads.
Single pane of glass

Are you already using a fantastic monitoring tool? Is the cloud just an extension of your organization’s overall deployment strategy? HP Cloud Monitoring has been designed to easily integrate with existing third party tools. Both our message queue and RESTful API endpoints can easily be integrated into most third party monitoring solutions

◦	best technical points


HP Cloud performance metrics

HP Cloud Monitoring offers a robust set of cloud service metrics that provide deep insight into workload performance and health.
Powerful alarms

Create alarms that evaluate many network, compute, and storage metrics. Combine multiple metrics under a single alarm or isolate root cause with a more granular approach.
Monitor almost anything

Custom metrics allow you to submit any performance data to HP Cloud Monitoring. Create alarms that evaluate both cloud resource and application-level metrics to gain better context and workload visibility.
Reliable notifications

Our highly available notification engine means you can rest assured that those critical notifications have been sent to the right responders. Multiple notification methods allow you to send critical alarms directly to the operations team’s mobile devices and your business owner’s inbox.
Metric query

HP Cloud Monitoring allows you to access previous performance metrics via our simple-to-use API. Historical performance metrics assist with capacity planning and are extremely valuable when determining root cause.
Metric stream

In addition to metrics access via API, HP Cloud Monitoring offers a high-performance managed message queue delivery endpoint. This option is perfect for transmitting large volumes of performance metrics into existing monitoring tools and helps customer achieve a “single pane of glass” experience

Feature Benefits

The following table describes road map features mapped to customer benefits. 

Feature
	

Customer Benefit

Thresholds
	

configure alerts to trigger notifications when threshold values have been exceeded.

Notifications
	

ability to send and receive direct and indirect notifications via SMS or email when a threshold has been exceeded enables rapid response times

Custom Metrics
	

track and view metrics from applications and other infrastructure in line with HPC metrics provides deeper insight into the entire stack

Compound Alarms
	

evaluate multiple metric data points under a single alarm to gain correlated awareness of potential workload impacts

Metric Calculations
	

improve metric usability and increase threshold value by providing calculated metric values such as utilization and summation data

Configurable Time Intervals
	

flexible reporting time intervals allow customers to receive more workload appropriate metrics

API Query 
	

aggregate and retrieve metrics via API

Data Retention
	

analyze historical performance data so that I can detect trends and more accurately plan my capacity

P/IaaS Metrics
	

visibility into  DBaaS, LBaaS, Nova, Bock, Swift, Glance, and other HPCS customer performance data. 
receive single point in time and time series data about compute instances providing customers with managed visibility into workload performance

Health Checks
	

configurable availability checks for HTTP, SMTP, DNS, SSH, etc that inform you about current service availability

Life Cycle Events
	

be notified when an instance fails or be able to see the health of an instance. Eventually autoscale and ELB

Console Support
	

visualize my metric, threshold, alert, and event data via a "single pane of glass"


## Advantages of using HP Cloud Monitoring ##
HP Cloud Monitoring provides usage and performance metrics about your cloud usage that are not easily accessed any other way. For instance, Swift object-store bandwidth consumption.

* [commentary]  We measure resources (compute, object-storage, block-storage, DBaaS, and soon others) from behind the scenes and have access to details that the user doesn’t.  We have a sort of “under the hood” view of how things are performing.

HP Cloud Monitoring is a managed service; it provides a prebuild framework for monitoring.  Just turn it on and go!

* [commentary] For a customer to create a near-equivalent to what we provide they would have to build and maintain a comparable system.  “Managed Services” are all the rage because I just say “turn it on” and then pay for it instead of building and maintain.

HP Cloud Monitoring monitors your resources even before you turn it on.  Details about resource performance can be retrieved after the fact.

* [commentary] This is actually a key differentiator between HP Cloud and Amazon.  Amazon doesn’t capture and store metrics until the customer says “turn them on”.  HP Cloud is always capturing and storing all of the metrics for everything we monitor.  Currently we advertise 2 weeks of retention, but internally we have 13 months.  Customers don’t have to remember to “turn it on” before they need it.
* A good example:  I get my monthly bill for Swift and it’s got more bandwidth than I thought it would.  The bill just has one number.  A customer could (currently only two weeks) go use HP Cloud Monitoring to pull up the past two weeks of bandwidth usage, by the minute, and see where the spike occurred.


## API ##
Do you need low-level, raw REST API access to HP Cloud Monitoring?  Take a look at the [Monitoring v1.1 API page](/api/v13/monitoring/).

## Bindings
If you are looking for an easier to use, language-specific way of using HP Cloud Monitoring, check out our [Bindings section](/bindings).

## CLI
Want scriptable access you can put in a cron job or something similar?  Go on over to our [CLI documentation](/cli).


