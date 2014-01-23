---
layout: default
title: "HP Cloud OS Release Notes"
permalink: /cloudos/moonshot/prepare/releasenotes/
product: cloudos

---

<a name="_top"> </a>

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/prepare/">&#9664; PREV | <a href="/cloudos/moonshot/prepare/">&#9650; UP</a> | <a href="/cloudos/moonshot/prepare/supportmatrix/">NEXT &#9654;</a> </p>

# HP Cloud OS Release Notes

This topic provides information about the HP Cloud OS 1.20 Sandbox release.

* [New and Updated in HP Cloud OS 1.20](#120features)
* [Recommendations for HP Cloud OS 1.20](#120recommendations)
* [For Further Information](#for-further-information)

##New and Updated in HP Cloud OS 1.20## {#120features}

**Simplified service delivery** &mdash; A simplified administration tool for the installation and management of an OpenStack infrastructure as a 
service cloud provides easier installation and configuration processes. The tool reduces manually intensive operational processes from hundreds 
of steps over multiple packages - to a single, simple, automated process.

**Enhanced lifecycle management with model-based infrastructure <br />topology** &mdash; Streamline IT operations and lower operational risk and costs 
by using automated deployment of applications on heterogeneous, hybrid cloud service environments:

* **Graffiti**:  Enables you to find cloud resources in a searchable directory based on their capabilities
* **Eve**:  Allows you to create multi-tier infrastructure topology models, thus enabling hybrid delivery
* **Focus**:  Enables you to manage lifecycles of multi-tier infrastructure topology models
* **Swift**:  Allows you to store large amounts of data efficiently, safely, and cheaply

**Important enhancements and updates** &mdash; This release of the HP Cloud OS software provides the following new and improved functionality:

* Lifecycle actions are now available against the running VMs
* New topology designer with deployment profiles
* UI enhancements to help with navigation
* New HP Cloud OS Distribution Network capability for updates and patching
* Latest OpenStack and security updates
* New support for multi-region compute within a single cloud environment
* Enhanced HP Cloud OS deployment model options for a Sandbox environment
* Various additional enhancements and software updates
* Web-hosted HP Cloud OS documentation 

<!-- Example:
**Larger compute instances for big data and high-performance computing** -  New larger instance types allow you to run big data, analytics, and high performance computing (HPC) workloads in the public cloud.  You can access instances with up to 120 GB of RAM and up to 16 virtual cores. The new instance types allow even greater flexibility to choose the virtual machine size that best fits your application's compute resource needs.
-->

##Recommendations for HP Cloud OS 1.20## {#120recommendations}

This section describes the HP recommendations for best performance, utility, and functionality with this software release. We have also provided information about some limitations and known issues for reference purposes.   

* [Best Practices](#best-practices) for optimal functionality and performance
* [Known Issues](#known-issues) and suggested operational alternatives with HP Cloud OS 1.20
* [OpenStack Community Issues](#openstack-community-issues)

###Best Practices### {#best-practices} 

HP recommends the following best practices for HP Cloud OS 1.20.

####OpenStack####

If you prefer to operate your system with the Cinder default values, limit your Cinder volume creation to a maximum capacity of 1200 volumes.  If you need to modify default configuration, follow this process:

1. Delete all volumes created through Eve or Cinder APIs - lvdisplay should not show any volumes for the Cinder volume group.
2. Execute the command `vgdisplay` to get the exact name of the volume group that is assigned to Cinder.
3. Execute the command `pvdisplay` to get the exact name of the physical disk used for the Cinder volume group.
4. Execute the command `vgremove cinder-volumes` to delete the Cinder volume group.
5. Execute the command `pvremove  /dev/loop0` to delete the Cinder physical disk.
6. Execute the command `pvcreate - metadatsize <enter metadata size> /dev/loop0` to create a Cinder physical disk with a new metadata size.
7. Execute the command `vgcreate cinder-volumes /dev/loop0` to create a same-name Cinder volume group to include the new physical disk.
    
####Provisioning####

For clean functioning, de-provision topologies that contain components of other topologies prior to de-provisioning the original topology.  For example, if you have provisioned two topologies:

Topology A: Containing subnet x, router y, and security group z <br />
Topology B: Also containing subnet x, router y, and security group z

In this scenario, be sure to de-provision Topology B, prior to de-provisioning Topology A.

###Known Issues### {#known-issues}

The following are known issues for HP Cloud OS 1.20.

####Installation####

In some situations, you may see the message `no server suitable for synchronization found Waiting for NTP server`. This message does not affect your installation or system functionality. After a few minutes, any unallocated notes are 
correctly displayed as `Not Allocated`.

####OpenStack####

* During the de-provisioning process, if the Cinder delete (remove) volume tasks fails and leaves the volume in the "in use" state, 
you can ensure the deletion of the volume with the following process:

    1. Stop the service using the volume with the command sequence:
        `service tgt stop`<br /> 
        `lvremove /dev/cinder-volumes/volume-078cd44b-7b39-4867-a1e9-78bb758ae0a7`<br /> <br /> 
    Where `078cd44b-7b39-4867-a1e9-78bb758ae0a7` is the volume ID, which you can find in the HP Cloud OS Administration Dashboard's Volumes tab.

    2. Remove the volume using the Cinder API or CLI: <br /> 
        `service tgt start` <br /> 
        `cinder force-delete 078cd44b-7b39-4867-a1e9-78bb758ae0a7` <br /> <br />
    The next set of example commands show which service is using certain volumes:<br />
    `dmsetup info -c /dev/cinder-volumes/volume-078cd44b-7b39-4867-a1e9-78bb758ae0a7`<br /> 
    `dmsetup remove --force -c /dev/cinder-volumes/volume-078cd44b-7b39-4867-a1e9-78bb758ae0a7`<br />
    `lsof /dev/cinder-volumes/volume-078cd44b-7b39-4867-a1e9-78bb758ae0a7`

* In the HP Cloud OS Administration Dashboard, if you experience a `Connection was reset` timeout error while creating an image of size 1.5 GB or larger, you can clear the situation with the following process:

    1. Open a WinSCP session to the Admin node.
    2. Upload the image file to the /tmp/ directory.
    3. Change the permission of the file to 777 (`chmod 777 /tmp/<image.name>`)
    4. Move the file to the tftpboot folder.
    5. Create the image pointing to the <nobr> URL `http://<admin.node.ip>:8091/<*image.name*>` </nobr>


####Provisioning####

* When you use Eve to provision a new subnet, in some cases the IP address space may overlap with an existing network, which can create an IP conflict with other machines on the existing network.  If you encounter this issue, you can create the subnet manually using the HP Cloud OS Administration Dashboard. Specify the exact IP range and reference the range in the topology binding.
* Under some networking conditions, Web proxy server connection problems can cause a provision or de-provision issue. To resolve this issue, execute your provision or de-provision task again.
* In this HP Cloud OS Sandbox release, job progress status reporting has not yet been implemented.
* When you use shared networks across a project, you may see the error message:<br /><nobr>`[com.hp.iaasc.eve.networksegment.openstack.NetworkSegmentServiceOpenStackQuantum:createPort:112]`</nobr><br /><nobr>`{"statusCode": 403, "message": "Tenant is forbidden to create port on the subnet(s): PrivSub ", "details": ""}`</nobr><br />`{"statusCode": 403, "message": "Tenant is forbidden to create port on the subnet(s): PrivSub ", "details": ""} at`.<br /> <nobr>Currently, Quantum prevents users from creating ports on the shared private network.</nobr> 
* When you are running on a virtual machine hosted on a KVM hypervisor, you may see the message: `No root file system, no root file system is defined`.  Verify that the virtual disk format is either IDE or SCSI before booting the VM with the HP Cloud OS Sandbox ISO media.
* If a volume group provisioning tasks fails and does not delete the created volume group, use the Terminate Topology or Delete Topology actions in the HP Cloud OS Administration Dashboard to remove the dangling provisioned resources.
* If there are more than eight concurrent topology provisioning requests submitted to HP Cloud OS at exactly the same time, you may see the error: `Cannot get a connection, pool error`.  To get the requests successfully submitted, follow this process:
    1. Log into the Admin node using the crowbar credentials. (See the Note below this list.)
    2. Add the line:<br /><nobr>`url: jdbc:postgresql://[ipaddress]/iaascdb:maxWaitForConnection: 1m`</nobr><br />to the file:<br /><nobr>`/opt/dell/chef/cookbooks/hp_cos_eve_100/templates/default/eve-requestworker.yml.erb`</nobr>
    3. To get the new configuration values pushed to the respective nodes, execute the command:<br /><nobr>`knife cookbook upload hp_cos_eve_100 -o /opt/dell/chef/cookbooks/ -V -k /etc/chef/webui.pem -u chef-webui`</nobr>
    4. Execute the following commands on the cloud controller node:<br />
        `chef-client`<br />
        `restart eve-api`<br />
        `restart eve-requestworker`   

**Note:** In the current release, the dashboards use pre-defined login credentials. These are not published in the web-hosted documentation. To get the pre-defined login credentials, refer to the readme file included in the same ZIP that contained the HP Cloud OS Sandbox ISO. 
If you have not already done so, see the ZIP on the <a href="https://cloudos.hpwsportal.com" target="codn">HP Cloud OS Distribution Network</a>. 
		
###Resolved Issues in Version 1.20## {#v120resolved}

The following issues have been resolved in HP Cloud OS 1.20.

####Cloud Utilities####

When you run `clean_projects` from `cloudutils`, it no longer generates any access error conditions. 

####OpenStack####

The default security group is now consistently displayed.

####User Interface####

You can now successfully delete a compute region.


###OpenStack Community Issues### {#openstack-community-issues}

The following two sections identify the known and resolved OpenStack community issues in HP Cloud OS 1.20.

####Known OpenStack Issues####

* Sometimes provision does not attach a volume for a Cirros image. It may take a long time to fail. Community issue [1099611](https://bugs.launchpad.net/cirros/+bug/1099611).
* The Keystone table grows unconditionally. By design, Keystone is not meant to flush the expired tokens on its own. In the Havana release, OpenStack provides an API to flush tokens during a scheduled job. Community issue [1032633](https://bugs.launchpad.net/ubuntu/+source/keystone/+bug/1032633).
* The Nova list response time is badly impacted by the number of active VM instances. Unfortunately, the transition from Project to Region to Cloud or other buttons always executes this command through nova-api and keeps waiting. Community issues [1160487](https://bugs.launchpad.net/nova/+bug/1160487) and [1176446](https://bugs.launchpad.net/nova/+bug/1176446).
* Volume creation fails randomly:  `Failed to create iscsi target for volume id:volume-<UUID>`.  Please ensure that your tgtd config file contains `include /var/lib/cinder/volumes/*`. Community issue [1191429](https://bugs.launchpad.net/bugs/1191429).
* Volume creation or deletion fails randomly with the message `Exception during message handling`. Community issue [1191431](https://bugs.launchpad.net/bugs/1191431).
* 60% of the launched instances fail to reach the metadata server due to high latency in its response time. The failure to reach the metadata server makes the launched instance unusable, because it cannot inject any key and does not perform the remaining operations related to security group block devices. Community issue [851159](https://bugs.launchpad.net/nova/+bug/851159). 
* Quantum requests too many tokens. Even when idle, a system can continue requesting tokens every second. This results in slower performance for Keystone's authentication and authorization process. Community issue [1191159](https://bugs.launchpad.net/quantum/+bug/1191159).
* Volume creation can fail with message details indicating `overLimit` or `The body of your request was too large for this server`. The likely cause is that the volume could not be created because there was not enough space in the volume group to fulfill the request. As an additional confirmation, check the Cinder-API log file for the following message: `Requested volume or snapshot exceeds allowed Gigabytes quota`.
* Provisioning can fail with the `internal error` message detail. The likely cause is out-of-disk space or memory issues.

####Resolved OpenStack Issues####

* When you provision from the HP Cloud OS Administration Dashboard and the space available is inadequate to create the volume, the dashboard still shows volume creations as successful – although it has failed in the background. Community issue [1188039](https://bugs.launchpad.net/cinder/+bug/1188039).
* A security group is used to grant accessibility to an instance, such as ping (ICMP) and SSH (TCP), by enabling the associated ports. The default security group provided for each project is pre-filled with two rules that are incorrectly specified.  Remove the provided rules. Add new rules as appropriate.

##For Further Information## {#for-further-information}

For additional related information on HP Cloud OS:

* [HP Cloud OS Documentation web site](/cloudos/moonshot/): Provides the topics listed in this section, including a technical overview, video tutorials, FAQs, installation and configuration steps, and more.
* [HP Cloud OS Platform and Software Support Matrix](/cloudos/moonshot/prepare/supportmatrix/): Information about platform support requirements for the HP Cloud OS core functions, including requirements for component products.
* [HP Cloud OS FAQs](/cloudos/moonshot/prepare/faqs/): Answers to frequently asked questions, including where you can download the HP Cloud OS ISO package.
* [HP Cloud OS Video Tutorials](/cloudos/moonshot/prepare/videos/): Videos from a range of HP experts to help you learn about HP Cloud OS and OpenStack.
* [HP Cloud OS Technical Overview](/cloudos/moonshot/prepare/overview/): Introduces the HP Cloud OS architecture, its components and services, and the HP Cloud OS relationship with OpenStack.
* [Install &amp; Configure Your Cloud](/cloudos/moonshot/install): A set of sequential topics that explain how to install and configure your cloud with HP Cloud OS.
* [HP Cloud OS Utilities](/cloudos/moonshot/manage/utilities/): Describes the HP Cloud OS utilities.
* [HP Cloud OS Troubleshooting](/cloudos/moonshot/manage/troubleshooting/): Advice to resolve issues you may encounter with HP Cloud OS.
* [HP Cloud OS Open Source and Third-Party Software License Agreements](/cloudos/moonshot/os-3rd-party-license-agreements/): License information regarding the HP Cloud OS product. This topic includes legal notices and the disclaimer for experimental software.
* HP Cloud OS Operational Dashboard Help: From the dashboard's top banner, the Help link opens topics about its user interface dialogs and options, including how to create your cloud. A [web-hosted copy](/cloudos/moonshot/manage/operational-dashboard/) of the Help is available. 
* HP Cloud OS Administration Dashboard Help: From the dashboard's top banner, the Help link opens topics about its user interface dialogs and options, including how to view, allocate, and manage all virtual resources within a cloud. A [web-hosted copy](/cloudos/moonshot/manage/administration-dashboard/) of the Help is available. 
* HP Cloud OS Release Notes (this topic): Information about the release's new features, recommendations, known issues, and resolved limitations.

**Note:** In the current release, the dashboards use pre-defined login credentials. These are not published in the web-hosted documentation. To get the pre-defined login credentials, refer to the readme file included in the same ZIP that contained the HP Cloud OS Sandbox ISO. 
If you have not already done so, see the ZIP on the <a href="https://cloudos.hpwsportal.com" target="codn">HP Cloud OS Distribution Network</a>. 

###Installation Notes### {#installation-notes}

Before installing the HP Cloud OS Sandbox release, read the [HP Cloud OS Platform and Software Support Matrix](/cloudos/moonshot/prepare/supportmatrix/) to ensure that your installation environment meets the minimum requirements.

The HP Cloud OS Sandbox installation deploys the HP Cloud OS Operational Dashboard (used to set up, configure, and install an HP cloud infrastructure) and the HP Cloud OS Administration Dashboard (used to create and manage cloud resources). 

When you are ready to install the HP Cloud OS Sandbox, see the Install category of the [HP Cloud OS documentation](http://docs.hpcloud.com/cloudos/moonshot/install/).

###Legal Notices and Disclaimer for Experimental Software### {#legal-notices-disclaimer}

See the [HP Cloud OS Open Source and Third-Party Software License Agreements](/cloudos/moonshot/os-3rd-party-license-agreements/).

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

