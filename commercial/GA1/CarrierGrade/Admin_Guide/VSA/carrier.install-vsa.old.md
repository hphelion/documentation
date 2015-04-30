---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Installing HP StoreVirtual VSA"
permalink: /helion/openstack/carrier/install/vsa/old/
product: carrier-grade
product-version1: HP Helion OpenStack Carrier Grade
role1: Storage Administrator
role2: Storage Architect
authors: Michael B, Paul F

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"><a href="/helion/openstack/1.1/install/vsa/overview/">&#9664; Installing HP StoreVirtual VSA Overview </a> | <a href="/helion/openstack/carrier/install/vsa/deploy/">Deploying HP StoreVirtual VSA Storage Sytems &#9654;</a></p>


# HP Helion OpenStack&#174; Carrier Grade (Alpha): Installing HP StoreVirtual VSA

This page provides detailed instructions on deployment of HP StoreVirtual VSA Storage Nodes, and their configuration as Cinder backend. It covers the following topics:


Use the following steps to install HP StoreVirtual VSA in your HP Helion OpenStack Carrier Grade cloud.

1. On the KVM host, change to the directory where your cloud is installed. 

2. Go to the folder where cloud is created.

3. Change Directory to services/cinder/blocks/

	This folder contains a `cinder_conf_default.sample` file. 

4. Copy that file to `cinder_conf_default` using any standard method, such as the `cp` command:

		cp cinder_conf_default.sample cinder_conf_default

5.  Modify the `cinder_conf_default` with values based on your environment. 

	The parameters in file are as follows. If required more parameters can be added to this file.

		hplefthand_username = <username>
		hplefthand_password = <password>
		hplefthand_clustername = <Cluster Name>
		hplefthand_api_url = https://<Iscsi Virtual IP address>/lhos

6. Run the following command to copy the parameters in the `cinder_conf_default` to the `cinder.conf` file in the `CND-SVC` role.

		hcfgproc

The next time the `CND-SVC` role is implemented, the role will have the StoreVirtual Information.



## Next Step {#next-steps}

[Deploying HP StoreVirtual VSA Storage Sytems](/helion/openstack/carrier/install/vsa/deploy/)


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----

