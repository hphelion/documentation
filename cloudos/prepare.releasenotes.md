---
layout: default
title: "HP Cloud OS Release Notes"
permalink: /cloudos/prepare/releasenotes/
product: cloudos

---

<a name="_top"> </a>

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/prepare/">&#9664; PREV | <a href="/cloudos/prepare/">&#9650; UP</a> | <a href="/cloudos/prepare/supportmatrix/">NEXT &#9654;</a> </p>

# HP Cloud OS Release Notes

This topic contains the following information on the HP Cloud OS 1.20 Sandbox release:

* [New and Updated in HP Cloud OS 1.20](#120features)
* [Recommendations for HP Cloud OS 1.20](#120recommendations)
* [For Further Information](#for-further-information)

<!--Moving forward, there will be more bulleted items for each release-->



##New and Updated in HP Cloud OS 1.20## {#120features}

**Simplified service delivery** &mdash; A simplified administration tool for the installation and management of an OpenStack infrastructure as a 
service cloud provides easier installation and configuration processes. The tool reduces manually intensive operational processes from hundreds 
of steps over multiple packages - to a single, simple, automated process.

**Enhanced lifecycle management with model-based infrastructure topology** &mdash; Streamline IT operations and lower operational risk and costs 
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
* Well-organized HP Cloud OS documentation on [http://docs.hpcloud.com/cloudos/](/cloudos)
* An invitation to join the HP Cloud Community Forum, using the promo code "HP Cloud OS" &mdash; see [Connect on the HP Cloud Community Forum](/cloudos/community)

<!--Example:

**Larger compute instances for big data and high-performance computing** -  New larger instance types allow you to run big data, analytics, and high performance computing (HPC) workloads in the public cloud.  You can access instances with up to 120 GB of RAM and up to 16 virtual cores. The new instance types allow even greater flexibility to choose the virtual machine size that best fits your application's compute resource needs.
-->



##Recommendations for HP Cloud OS 1.20## {#120recommendations}

This section of the release notes describes the HP recommendations for best performance, utility, and functionality with this software version.   
We have also provided information about some limitations and known issues for reference purposes.  This section contains:

* [Best Practices](#best-practices) for optimal functionality and performance
* [Known Issues](#known-issues) and suggested operational alternatives with HP Cloud OS 1.20
* [OpenStack Community Issues](#openstack-community-issues)

<!-- NOTE TO JOHN: I would reword most of these to follow the "best foot forward" wording model that Margaret, Martin, et. alia asked me to take with the Public Cloud release notes. Take a look at https://docs.hpcloud.com/release-notes to see what I mean.  I reworked the three fixed issues to follow that style.  This leaves out considerable information; I will leave it to you as to whether to re-add that information--I don't think it's needed and would open us up to criticism, but it's your and JR's call.-->



###Best Practices### {#best-practices} 

HP recommends the following best practices for HP Cloud OS 1.20.

####OpenStack####

* If you prefer to operate your system with the Cinder default values, limit your Cinder volume creation to a maximum capacity of 1200 volumes.  If you need to modify default configuration, follow this process:

    1. Delete all volumes created through Eve or Cinder APIs - lvdisplay should not show any volumes for the Cinder volume group.
    2. Execute the command `vgdisplay` to get the exact name of the volume group that is assigned to Cinder.
    3. Execute the command `pvdisplay` to get the exact name of the physical disk used for the Cinder volume group.
    4. Execute the command `vgremove cinder-volumes` to delete the Cinder volume group.
    5. Execute the command `pvremove  /dev/loop0` to delete the Cinder physical disk.
    6. Execute the command `pvcreate – metadatsize &lt;enter metadata size> /dev/loop0` to create a Cinder physical disk with a new metadata size.
    7. Execute the command `vgcreate cinder-volumes /dev/loop0` to create a same-name Cinder volume group to include the new physical disk.
    
####Provisioning####

* For clean functioning, de-provision topologies that contain components of other topologies prior to de-provisioning the original topology.  For example, if you have provisioned two topologies:

> Topology A: Containing subnet x, router y, and security group z <br />
> Topology B: Also containing subnet x, router y, and security group z

In this scenario, be sure to de-provision Topology B, prior to de-provisioning Topology A.


###Known Issues### {#known-issues}

The following are the known issues for HP Cloud OS 1.20.

####Installation####

In some situations, you may see the message `no server suitable for synchronization found Waiting for NTP server`.  
This message does not affect your installation or system functionality. After a few minutes, any unallocated notes are 
correctly displayed as `Not Allocated`.

####OpenStack####

* If during the de-provisioning process the Cinder delete (remove) volume tasks fails and leaves the volume in the "in use" state, you can ensure the deletion of the volume with the following process:

    1. Stop the service using the volume with the command sequence:
        `service tgt stop 
        lvremove /dev/cinder-volumes/volume-078cd44b-7b39-4867-a1e9-78bb758ae0a7`
    Where `078cd44b-7b39-4867-a1e9-78bb758ae0a7` is the volume ID, which you can find in the HP Cloud OS Administration Dashboard, Volumes view.
    2. Remove the volume using the Cinder API or CLI:
        `service tgt start 
        cinder force-delete 078cd44b-7b39-4867-a1e9-78bb758ae0a7 `
    The following command examples show which service is using certain volumes:
    `dmsetup info -c /dev/cinder-volumes/volume-078cd44b-7b39-4867-a1e9-78bb758ae0a7 
    dmsetup remove --force -c /dev/cinder-volumes/volume-078cd44b-7b39-4867-a1e9-78bb758ae0a7 
    lsof /dev/cinder-volumes/volume-078cd44b-7b39-4867-a1e9-78bb758ae0a7`

* If you experience a connection timeout error `Connection was reset` when creating a image of size 1.5 GB or larger in the Administration Dashboard, you can clear the situation with the following process:

    1. Open a WinSCP session to the Administration node.
    2. Upload the image file to the /tmp/ directory.
    3. Change the permission of the file to 777 (chmod 777 /tmp/<image.name>)
    4. Move the file to the tftpboot folder.
    5. Create the image pointing to the URL `http://<admin.node.ip>:8091/<*image.name*>`


####Provisioning####

* Sometimes when you use Eve to provision a new subnet, the IP address space may overlap with an existing network and create an IP conflict with 
other machines on the existing network.  If you encounter this issue, you can create the subnet manually using the HP Cloud OS Administration 
Dashboard.  In the Dashboard, specify the exact IP range and reference the range in the topology binding.
* Under some networking conditions, Web proxy server connection problems can cause a provision or de-provision issue.  
Simply execute again your provision or de-provision task.
* In this Sandbox release, job progress status reporting has not yet been implemented.
* When you use shared networks across a project, you may get the error message:
    `[com.hp.iaasc.eve.networksegment.openstack.NetworkSegmentServiceOpenStackQuantum:createPort:112] {"statusCode": 403, "message": "Tenant is forbidden to create port on the subnet(s): PrivSub ", "details": ""}
{"statusCode": 403, "message": "Tenant is forbidden to create port on the subnet(s): PrivSub ", "details": ""}
     at`
* When you are running on a virtual machine hosted on a KVM hypervisor, you may see the message `No root file system, no root file system is defined`.  Verify that the virtual disk format is either IDE or SCSI before booting the VM with the HP Cloud OS Sandbox ISO media.
* If a volume group provisioning tasks fails and does not delete the created volume group, use the Terminate Topology or Delete Topology actions in the Administration Dashboard to remove the dangling provisioned resources.
* If there are more than eight concurrent topology provisioning requests submitted to Cloud OS at exactly the same time, you may see the error `Cannot get a connection, pool error`.  To get the requests successfully submitted, follow this process:
    1. Log into the Administration node using the crowbar credentials.
    2. Add the line `url: jdbc:postgresql://[ipaddress]/iaascdb:maxWaitForConnection: 1m` to the file `/opt/dell/chef/cookbooks/hp_cos_eve_100/templates/default/eve-requestworker.yml.erb` file.
    3. To get the new configuration values pushed to the respective nodes, execute the command `knife cookbook upload hp_cos_eve_100 -o /opt/dell/chef/cookbooks/ -V -k /etc/chef/webui.pem -u chef-webui`
    4. Execute the following commands on the cloud controller node:
        `chef-client
        restart eve-api
        restart eve-requestworker`     
		
###Resolved Issues in Version 1.20## {#v120resolved}

The following are resolved issues in version 1.20 of the HP Cloud OS software.

####Cloud Utilities####

* When you run `clean_projects` from `cloudutils`, it no longer generates any access error conditions. 

####OpenStack####

* The default security group is now consistently displayed.

####User Interface####

* You can now successfully delete a compute region.


###OpenStack Community Issues### {#openstack-community-issues}

The following are known open and fixed OpenStack community issues in version 1.20 of the HP Cloud OS software.

<!--JOHN: I didn't reword any of these, and I suggest you might want to go over them.-->

####Known OpenStack Issues####

* Sometimes provision does not attach a volume for a Cirros image, and it may take a long time to fail.
* The Keystone table grows unconditionally: by design, Keystone is not meant to flush the expired tokens on its own. In the Havana release, OpenStack provides an API to flush tokens during a scheduled job.
* The Nova list response time is badly impacted by the number of active VM instances: unfortunately, the transition from Project to Region to Cloud or other button always executes this command through nova-api and keeps waiting.
* Volume creation fails randomly:  `Failed to create iscsi target for volume id:volume-&lt;UUID>`.  Please ensure that your tgtd config file contains `'include /var/lib/cinder/volumes/*'`.
* Volume creation or deletion fails randomly. Exception during message handling.
* 60% of the launched instances fail to reach the metadata server due to high latency in its response time: The failure to reach the metadata server makes the launched instance unusable, because it cannot inject any key and does not perform the remaining operations related to  security group block devices etc. 
* Quantum requests too many tokens. Even when idle, a system can continue requesting tokens every second. This results in slower performance for Keystone's authentication/authorization process.
* Volume creation can fail with message details indicating `overLimit` or `The body of your request was too large for this server`. The likely cause is that the volume could not be created because there was not enough space in the volume group to fulfill the request. As an additional confirmation, check the Cinder-API log file for the following message `Requested volume or snapshot exceeds allowed Gigabytes quota`.
* Provisioning can fail with the `internal error` message detail. The likely cause is out-of-disk space or memory issues.


####Resolved OpenStack Issues####

* When you provision from the Administration Dashboard and the space available is inadequate to create the volume, the Administration Dashboard still shows volume creations as successful – although it has failed in the background.  (Community issue# [1188039](https://bugs.launchpad.net/cinder/+bug/1188039))
* A security group is used to grant accessibility to an instance, such as ping (ICMP) and SSH (TCP), by enabling the associated ports.  The default security group provided for each project is pre-filled with two rules that are incorrectly specified.  Remove the provided rules. Add new rules as appropriate.


##For Further Information## {#for-further-information}

<!--JOHN: I didn't insert any of the appropriate links, so you'll have to take care of that-->

For additional related information on HP Cloud OS:

* [HP Cloud OS Documentation web site](/cloudos/): Contains all of the documentation listed in the remainder of this section plus HP Cloud OS installation and configuration procedures, FAQs, tutorial videos, and more.
* [HP Cloud OS Platform and Software Support Matrix](/cloudos/prepare/supportmatrix/): Contains information about platform support requirements for HP Cloud OS core functions, with links to requirements for component products.
* [HP Cloud OS FAQs](/cloudos/prepare/faqs/): Answers to frequently asked questions, including where you can download the HP Cloud OS ISO package.
* [HP Cloud OS Video Tutorials](/cloudos/prepare/videos/): Videos from a range of HP experts to help you learn about HP Cloud OS and OpenStack.
* [HP Cloud OS Technical Overview](/cloudos/prepare/overview/): An introduction to the HP Cloud OS architecture, its components and services, and the HP Cloud OS relationship with OpenStack.
* [Install &amp; Configure Your Cloud](/cloudos/install): A set of sequential topics that explain how to install and configure your cloud with HP Cloud OS.
* [HP Cloud OS Utilities](/cloudos/manage/utilities/): Describes the HP Cloud OS utilities.
* [HP Cloud OS Troubleshooting](/cloudos/manage/troubleshooting/): Contains information to help you troubleshoot issues you may encounter with HP Cloud OS.
* [HP Cloud OS Open Source and Third-Party Software License Agreements](/cloudos/os-3rd-party-license-agreements/): Contains license information regarding the HP Cloud OS product. 
* HP Cloud OS Operational Dashboard Help: Online Help accessible via the HP Cloud OS Operational Dashboard, describing its user interface dialogs and options, including how to create your cloud.
* HP Cloud OS Administration Dashboard Help: Online Help accessible via the HP Cloud OS Administration Dashboard, describing its user interface dialogs and options, including how to view, allocate, and manage all virtual resources within a cloud.
* HP Cloud OS Release Notes: Contains a list of release contents and any known problems and workarounds (this document).


###Installation Notes###

Before installing the HP Cloud OS Sandbox release, read the [HP Cloud OS Platform and Software Support Matrix](/cloudos/prepare/supportmatrix/)to ensure that your installation environment meets the minimum requirements.

The HP Cloud OS Sandbox installation deploys the HP Cloud OS Operational Dashboard (used to set up, configure, and install an HP cloud infrastructure) and the HP Cloud OS Administration Dashboard (used to create and manage cloud resources). 

When you are ready to install the HP Cloud OS Sandbox, see the Install category of the HP Cloud OS Documentation web site.  The home page is [http://docs.hpcloud.com/cloudos/](http://docs.hpcloud.com/cloudos/).


<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


