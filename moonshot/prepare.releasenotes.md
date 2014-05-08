---
layout: default
title: "HP Cloud OS for Moonshot for Moonshot Release Notes"
permalink: /cloudos/moonshot/prepare/releasenotes/
product: moonshot
---


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- Binamra and Vandana: As you update this document for the next release, be sure to change the release number to 1.10 or whatever it becomes. 
The Release Notes is one of the few topics where we include the release number. 
In other topics, try to avoid specifying the release number unless absolutely necessary. --> 

<!-- Remember to also change the topic's title in moonshot/siteindex.md. -->


<p style="font-size: small;"> <a href="/cloudos/moonshot/prepare/">&#9664; PREV | <a href="/cloudos/moonshot/prepare/">&#9650; UP</a> | <a href="/cloudos/moonshot/prepare/supportmatrix/">NEXT &#9654;</a> </p>

# HP Cloud OS for Moonshot 1.10 Release Notes

This topic contains the following information about the HP Cloud OS for Moonshot 1.01 release:

* [Features in HP Cloud OS for Moonshot 1.10](#features)

* [Recommendations for HP Cloud OS for Moonshot 1.10](#recommendations)

* [For further information](#for-further-information)


##Features in HP Cloud OS for Moonshot 1.10## {#features}

**Optimized for Workloads** &mdash; HP Cloud OS for Moonshot is optimized to deliver and manage workloads on your HP Moonshot environment. It provides simple workload modeling with repeatable, consistent workload placement. This functionality allows you to optimally align workloads with your Moonshot resources for optimal resource utilization.

**Flexible and Open Architecture** &mdash; Powered by OpenStack&#174; technology, HP Cloud OS for Moonshot provides you a flexible, industry leading, vendor neutral and open source cloud architecture.

**Moonshot Management** &mdash; The Single Pane of Glass (SPOG) view with the Chassis Manager enhances your user experience by catering to three important aspects of Moonshot Management:
	
* Displaying an overall perspective of the datacenter, hosted servers and health of chassis in the Datacenter View

* Providing detailed information of individual chassis host and health status in the Single Chassis View

* Managing Server with options such as Power On/Off and Maintenance Mode

**Workload Management** &mdash; Enables you to deploy a composite service comprising of different applications and workloads in a user friendly manner. You can browse through HP's catalog of pre-tested and pre-crafted workloads download and publish them to the cloud,then launch them to get a running application infrastructure. You can do this without having to worry about the underlying technical details.


##Recommendations for HP Cloud OS for Moonshot 1.10## {#recommendations}

This section describes the HP recommendations for best performance, utility, and functionality with this software version. 
We have also provided information about some limitations and known issues for reference purposes. This section contains:

* [Recommendations for best functionality, performance and reliability](#best-practices) 

* [Known issues in 1.10 release](#known-issues) 

###Recommendations ### {#best-practices} 

HP recommends the following best practices for HP Cloud OS for Moonshot 1.10.

**Workloads**
	
 * For best functionality, access your Operational Dashboard and Baremetal instance console through Admin Network.

 * For best results, create your images using Disk Image Builder.

**Provisioning**

* For increased reliability, we recommend you allocate an adequate IP address range for the `nova_flat` network based on the number of instances planned for the given Cloud. For example, if the environment is going to have 40 instances, at least 120 IP addresses need to be defined in the DHCP allocation range. 


**Installation**

* To enable maximum reliability in the Cloud environment, do not select the controller nodes when performing a `Create Compute Region` action for a Moonshot (Standard) server. 

###Known issues in 1.10 release### {#known-issues}

The following are the known issues for HP Cloud OS for Moonshot 1.10.

####Installation####

* The `Create Compute Region` command may fail due to a `GET_SERVER_CERTIFICATE` verification failure. To resolve this issue, follow this process:

 1. In the Admin Node, edit the `/opt/dell/chef/cookbooks/hp_cos_apollo_100/recipes/server.rb` file.
	 
 2. Go to line 245 and add the -k switch.  Change the command `" curl  #(keystone_protocol...` to `" curl  -k #(keystone_protocol...`
    
 3. Execute this command:
 `knife cookbook upload -o /opt/dell/chef/cookbooks/ -V -k /etc/chef/webui.pem -u chef-webui`
	
 4. Remove and recreate the Cloud.

* The region size can only be extended.  To reduce the region, remove the cloud and create it again.

####Provisioning####

* After you de-provision a bulk node topology, the topology sometimes continues to display the `PROCESSING` state in the Administration Dashboard for a lengthy period of time. You can resolve this issue by increasing the timeout value of the IPMI driver: 
   
 1. Edit the file `/usr/share/pyshared/nova/virt/baremetal/MoonshotIPMI.py`

 2. Go to line 225 and change `timer.start(interval=1.0).wait()` to `timer.start(interval=30.0).wait()`
	
 3. Save the updated file and exit your text editor
	
 4. Execute the command `restart Nova-compute`

* Under some circumstances, after launching a workload profile in the Administration Dashboard, and then using the `Terminate Workload` action to deprovision, the workload topology continues to list the state as `Processing`.  To resolve this issue, in the `Deployed Workloads`tab select `Delete Workload`.

* For instances provisioned using Windows images created using the [Image Builder](/cloudos/moonshot/manage/image-builder/) document, the disk size of the instance is the same as the disk size specified during image creation process. You need to login using credentials provided as part of unattend file during image creation instead of OpenStack keypair.

<!--This needs to be rewritten; it's not very clear-->


####General####


* The `Edit Extra Specs` option appears enabled for Flavors. To ensure smooth functioning of the instance, retain the default settings. 

* When you display the nodes table in the `Nodes View` using Moonshot Management, the disk size for all discovered nodes is shown to be 500 GB, regardless of the physical disk capacity.

<!-- I'm still of the opinion that we should delete this item; there is no workaround, and what good does it do to tell the customer about it? -Doug -->

##For further information## {#for-further-information}

For additional information on HP Cloud OS for Moonshot:

* [HP Cloud OS for Moonshot Documentation web site](/cloudos/moonshot/): Provides the topics listed below, plus FAQs, video tutorials, and more.

* [Support Matrix](/cloudos/moonshot/prepare/supportmatrix/): Information about platform support requirements for the HP Cloud OS for Moonshot core functions, including requirements for component products.

* [Install & Configure Your Cloud](/cloudos/moonshot/install/): A set of sequential, connected topics that walk you through the installation and configuration process.

* [Operational Dashboard Help](/cloudos/moonshot/manage/operational-dashboard/): Contains topics about the Operational Dashboard user interface dialogs and options.

* [Administration Dashboard Help](/cloudos/moonshot/manage/administration-dashboard/): Contains topics about the Administration Dashboard user interface dialogs and options.

* [Utilities](/cloudos/moonshot/manage/utilities/): Describes the HP Cloud OS for Moonshot utilities.

* [Troubleshooting](/cloudos/moonshot/manage/troubleshooting/): Advice to resolve issues you may encounter with HP Cloud OS for Moonshot.

* [Building Images](/cloudos/moonshot/manage/image-builder/): Shows how to use the Disk Image Builder to create images for HP Cloud OS for Moonshot.

* [Backup and Restore](/cloudos/moonshot/manage/backup-process/): Describes how to backup and restore HP Cloud OS for Moonshot.

* [Related Topics](/cloudos/moonshot/related-topics/): Links to pertinent HP Moonshot System and OpenStack documentation.

###Legal Notices and Disclaimer### {#legal-notices-disclaimer}

See the [HP Cloud OS for Moonshot Open Source and Third-Party Software License Agreements](/cloudos/moonshot/os-3rd-party-license-agreements/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

