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


<p style="font-size: small;"> <a href="/cloudos/moonshot/">&#9664; PREV | <a href="/cloudos/moonshot/">&#9650; UP</a> | <a href="/cloudos/moonshot/prepare/supportmatrix/">NEXT &#9654;</a> </p>

# HP Cloud OS for Moonshot 1.0 Release Notes

This topic contains the following information about the HP Cloud OS for Moonshot 1.0 release:

* [Features in HP Cloud OS for Moonshot 1.0](#features)

* [Recommendations for HP Cloud OS for Moonshot 1.0](#recommendations)

* [For further information](#for-further-information)

##Features in HP Cloud OS for Moonshot 1.0## {#features}

**Optimized Workloads** &mdash; HP Cloud OS for Moonshot provides optimized Cloud Workloads across cloud providers, with model-once and provision-anywhere capability. These features are combined with repeatable, consistent workload placements across diverse cloud deployment models. This functionality allows you and your customers to optimally align workloads with resources and improve resource utilization.

**Flexible and Open Architecture** &mdash; Powered by OpenStack&#174; technology, HP Cloud OS for Moonshot provides you a flexible, industry leading, vendor neutral and open source cloud architecture.

**Moonshot Management** &mdash; The Single Pane of Glass (SPOG) view with the Chassis Manager enhances your user experience by catering to three important aspects of Moonshot Management:
	
* Displaying an overall perspective of the datacenter, hosted servers and health of chassis in the Datacenter View

* Providing detailed information of individual chassis host and health status in the Single Chassis View

* Managing Server with options such as Power On/Off and Maintenance Mode

**Workload Management** &mdash; Enables you to deploy a composite service comprising of different applications and workloads in a user friendly manner. You can browse through HP's catalog of pre-tested and pre-crafted workloads download and publish them to the cloud, then launch them to get a running application infrastructure. You can do this without having to worry about the underlying technical details.


##Recommendations for HP Cloud OS for Moonshot 1.0## {#recommendations}

This section describes the HP recommendations for best performance, utility, and functionality with this software version. 
We have also provided information about some limitations and known issues for reference purposes. This section contains:

* [Recommendations for best functionality, performance and reliability](#best-practices)
 
* [Known issues in the 1.0 release](#known-issues) 

###Recommendations for best functionality, performance and reliability### {#best-practices} 

HP recommends the following best practices for HP Cloud OS for Moonshot 1.0.

**Workloads**
	
 * For best functionality, access your Operational Dashboard and Baremetal instance console through the Admin Network.
 
 * For best results, create your images using the Disk Image Builder.  See the [Building Images](/cloudos/moonshot/manage/image-builder/) topic. 

**Provisioning**

* For increased reliability, we recommend you allocate an adequate IP address range for the nova_flat network based on the number of instances planned for the given Cloud. For example, if the environment is going to have 40 instances, at least 120 IP addresses need to be defined in the DHCP allocation range. 

**Installation**

To enable maximum reliability in the Cloud environment, do not select the controller nodes when performing the <b>Create Compute Region</b> action for the Moonshot/Standard server. 



###Known issues in the 1.0 release### {#known-issues}

The following are the known issues for HP Cloud OS for Moonshot 1.0.

####Installation####

* The region size can only be extended.

* Create Region fails due to a GET_SERVER_CERTIFICATE verification failure. To resolve this issue, follow this process:

 1. In the Admin Node, edit the following file in the given path:
  
  `/opt/dell/chef/cookbooks/hp_cos_apollo_100/recipes/server.rb`
	 
 2. Go to line 245 and add the -k switch.  Change this command:
 
  `" curl  #(keystone_protocol...` to `" curl  -k #(keystone_protocol...`
    
 3. Execute this command:
 
  `knife cookbook upload knife cookbook upload -o /opt/dell/chef/cookbooks/ -V -k /etc/chef/webui.pem -u chef-webui`
	
 4. Remove the Cloud and create it again.

####Provisioning####

* After you de-provision a bulk node, the topology sometimes continues to display the "PROCESSING" state in the Administration Dashboard for a lengthy period of time. You can resolve this issue by increasing the timeout value of the IPMI driver: 
   
 1. Edit this file:
 
  `/usr/share/pyshared/nova/virt/baremetal/MoonshotIPMI.py`

 2. Go to line 225 and change `timer.start(interval=1.0).wait()` to `timer.start(interval=30.0).wait()`
	
 3. <b>Save</b> and <b>Exit</b>
	
 4. Execute the command:
 
  `restart Nova-compute`

* Under some circumstances, after launching a workload profile in the Administration Dashboard, and then using <b>Terminate Workload</b> to deprovision, the workload/topology continues to list the state as "Processing".  In the <b>Deployed Workloads</b> tab, selecting <b>Delete Workload</b> resolves the issue.

####General####

* Edit Network option is enabled in the Networks page in the Administration Dashboard. There is no impact on the functionality if you retain the default network settings. 

* Edit Extra Specs option is enabled for Flavors. This allows you to change the extra specs of the default flavor which will fail the instance. There is no impact on the functionality if you retain the default settings.

* When you display the nodes table using Moonshot Management, the disk sizes for all discovered nodes appear to be 500 GB.

##For further information## {#for-further-information}

For additional related information on HP Cloud OS for Moonshot:

* [HP Cloud OS for Moonshot documentation web site](/cloudos/moonshot/): Provides the topics listed below, plus FAQs, video tutorials, and more.

* [Install & Configure Your Cloud](/cloudos/moonshot/install): A set of sequential, connected topics that walk you through the installation and configuration process.

* [Support Matrix](/cloudos/moonshot/prepare/supportmatrix/): Information about platform support requirements for the HP Cloud OS for Moonshot core functions, including requirements for component products.

* [Operational Dashboard Help](/cloudos/moonshot/manage/operational-dashboard/): Contains topics about the Operational Dashboard user interface dialogs and options.

* [Administration Dashboard Help](/cloudos/moonshot/manage/administration-dashboard/): Contains topics about the Administration Dashboard user interface dialogs and options.

* [Utilities](/cloudos/moonshot/manage/utilities/): Describes the HP Cloud OS for Moonshot utilities.

* [Troubleshooting](/cloudos/moonshot/manage/troubleshooting/): Advice to resolve issues you may encounter with HP Cloud OS for Moonshot.

* [Disk Image Builder](/cloudos/moonshot/manage/image-builder/): Shows you how to use Disk Image Builder to create images for the HP Cloud OS for Moonshot.

* [HP Cloud OS for Moonshot Backup and Restore](/cloudos/moonshot/manage/backup-process/): Describes how to backup and restore HP Cloud OS for Moonshot.


###Legal Notices and Disclaimer### {#legal-notices-disclaimer}

See the [HP Cloud OS for Moonshot Open Source and Third-Party Software License Agreements](/cloudos/moonshot/os-3rd-party-license-agreements/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

