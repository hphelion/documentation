---
layout: default
title: "HP Helion OpenStack&#174; 1.1: Mapping Backend to Volume Type"
permalink: /helion/openstack/carrier/map/volumetype/
product: commercial.ga
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Systems Administrator 
role2: Cloud Architect 
role3: Storage Administrator 
role4: Network Administrator 
role5: Service Developer 
role6: Cloud Administrator 
role7: Application Developer 
role8: Network Engineer 
authors: Michael B, Paul F

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/1.1/install-beta/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/1.1/install-beta/esx/">NEXT &#9654;</a> </p> -->


# HP Helion OpenStack&#174; 1.1: Mapping Backend to Volume Type
[See the Helion OpenStack 1.0 version of this page](/helion/openstack/map/volumetype/)

You can use the Cinder backend, create a volume type and associate it with this backend using the Horizon Overcloud dashboard, or the Cinder CLI. The following sections explains how to create a Volume Type and map it to a given backend for Cinder using the Overcloud Horizon dashboard.


The page covers the following topics:
 
* [Before you begin](#before-you-begin)

* [Create a volume type](#create-volume-type)

* [Associate the volume type to a backend](#associate-the-volume-type)


##Before you begin {#before-you-begin}

Before you start working with volume types, ensure that the following prerequisites have been fulfilled:

1. HP Helion Cloud is deployed.

2. The cloud is created and the Cinder service is up and running.

## Create volume type {#create-volume-type}

To create a volume type using the Overcloud dashboard, do the following:

1. Log into the Overcloud Horizon dashboard.<br /> The Overcloud dashboard displays with the options in the left panel.  

2. From the left panel, click the **Admin** tab and then click the  **Volumes** tab to display the Volumes page. 


3. Click **Create Volume Type** to display a dialog box.


	<a href="javascript:window.open('/content/documentation/media/create-volumetype2.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Create Volume Type Dialog Box (opens in a new window)</a>


4. Enter the name of the volume type.

5. Click **Create Volume Type**.<br />The newly created volume displays in the Volumes page.

### Extra specifications options ###

The following Cinder Volume Type extra-specs options enable control over the VSA storage provisioning type (thin or full) and specify protection for backend volumes:

    hplh:provisioning thin or full
    hplh:data_pl r-0 or r-5 or r-10-2 or r-10-3 or r-10-4 or r-6
    
For example:

    hplh:provisioning thin
    hplh:data_pl r-5 
	volume_backend_name MyVolumeBackend

The protection level options enable different data protection configurations.  Supported data protection options are:

- `r-0 ` (RAID 0) provides the best data capacity and processing performance, but offers no data protection (no fault tolerance) in the event of a failure.

- `r-5` (RAID 5) consists of three or more physical disk drives in an array. Stores parity data across all drives. If one drive fails, the remaining drives use the parity data to allow the array to continue to operate until the failed drive is replaced. If more than one drive fails, the array fails.

- `r-10-2` (RAID 10+2) stripes and mirrors data across four or more disks.

- `r-10-3` (RAID 10+3) stripes and mirrors data across five or more disks.

- `r-10-4` RAID 10+4) stripes and mirrors data across six or more disks.

- `r-6` (RAID 6) is based on and extends RAID5. It requires a minimum of four drives and creates multiple parity sets such that the array can function with up to two drives failing at the same time.

## Associate the volume type to a backend {#associate-the-volume-type}

To map a volume type to a backend, do the following:

1. Log into the Overcloud Horizon dashboard.<br /> The Overcloud dashboard displays with the options in the left panel.

2. From the left panel, click the **Admin** tab and then click the **Volumes** tab to display the Volumes page. 

3. Click **View Extra Specs** displayed against the volume type which you want to associate to the backend.<br /> The **Create Volume Type Extra Specs** dialog box displays.

	<a href="javascript:window.open('/content/documentation/media/view-extra-specs-hos-1.1.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">View Extra Specs Option (opens in a new window)</a>

	<a href="javascript:window.open('/content/documentation/media/volume-extra-specs.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"> Create Volume Type Extra Specs Dialog Box (opens in a new window)</a>

<!--Binamra can you replace the illo above with fred2? -->

4. In the **Key** box, enter *volume&#095;backend_name*. This is the name of the key used to specify the storage backend when provisioning volumes of this volume type.

5. In the **Value** box, enter the name of the backend to which you want to associate the volume type. For example:*FC_backend01*.

6. Click **Create** to create the extra volume type specs.


**Note**: Once the volume type is mapped to the backend, you can create volumes.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----

