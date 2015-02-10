---
layout: default-devplatform
permalink: /als/v1/client/constructor
product: devplatform
title: "HP Application Lifecycle Service (ALS) Client Constructor Virtual Machine"

---

<!--UNDER REVISION-->

# HP Helion Development Platform: HP Application Lifecycle Service (ALS) Constructor Virtual Machine

The Constructor VM is a short-lived virtual machine that handles the provisioning of the Application Lifecycle Service (ALS) in an HP Helion OpenStack&reg; public or private cloud. it can also function in a destructor mode to simplify the tear-down of the ALS platform-as-a-system.

Nearly all management tasks for the Constructor VM (CVM) are easily performed from the Horizon web-based management console. 
Horizon performs a call to Nova with *cloud-init* configuration data to trigger the Helion ALS PaaS construction. The OpenStack&reg; metadata service is used to communicate ALS construction status back to the Horizon UI.

There are a few features and [troubleshooting](#troubleshooting) options, however, that cannot be managed from within Horizon. For example, it currently does not support [adding Service or DEA nodes](#growthnodes) to a system that is already in place. The CVM is also self-terminating by default, but this can be [overridden](#disable) from the command line to ensure that [log files](#logfile) are not lost.

1. [Download](#download) the Constructor Virtual Machine image.
2. [Generate a key pair](#keypair).
1. Choose the appropriate boot option:
	- [Use the Horizon wizard](#consoleboot) to pass in configuration values.
	- Use a [configuration file](#configfile).
	- Manual boot without a configuration file for Helion [private cloud](#privatecloud).
	- Manual boot without a configuration file for Helion [public beta](#publiccloud).

##Download the Image {#download}
The Constructor VM image is available for download with a free HP Helion OpenStack&reg; account. The default username is *debian*.

1. Log into your account and select Region: US East. You will need to [create an account](https://helion.hpwsportal.com/catalog.html#/Home/Show) if you do not already have one.
2. Log into **Horizon**.
3. Use the central pulldown menu to select the **US East** region.
3. Select the **Manage Services** panel and then **Activate Services**.
4. In the **US East** section, in the **Compute** row, use the pulldown to select **Image Management**.
5. In the list of available images, select **Public** images.
7. Find the image named *HP Helion Development Platform CE - Application Lifecycle Service Installer A.B.C.D* where A.B.C.D is the most recent version number. Do not select any version marked as "Deprecated".
8. Click the checkbox and then click **Launch** to download the most recent version.

## Generate a Key Pair {#keypair}
The image does not include a password; the virtual machine is booted with an associated SSH key. 

1. Log into your account and select Region: US East. You will need to [create an account](https://helion.hpwsportal.com/catalog.html#/Home/Show) if you do not already have one.
2. Log into **Horizon**.
3. Use the central pulldown menu to select the **US East** region.
4. Select the **Project** panel and then select the **Compute** sub-panel.
5. Select **Access & Security**.
6. Select **Key Pairs** tab and click **Create Key Pair**.
7. Provide a name and for the key pair and click **Create**.
8. When the key has been created, a download option will appear. Save the *keyPairName.pem* file in the Home directory or anywhere you can easily find it again. 

## Boot Options

### Using the Helion Console {#consoleboot}

### Boot the VM using the Configuration File {#configfile}

1. Perform a Nova call with cloud-init data. 
2. The CVM boots.
3. The */etc/rc.local* script runs and detects the cloud-init file.
5. The cloud-init JSON file is converted to ConfigFile format.
6. The *assemble.py* script runs using *cluster.conf*
4. A Message of the Day is displayed, providing additional instructions to the user.

Here is an example of the *cloud-init* file in JSON format used for Helion ALS PaaS construction. There are three sections of key-value pairs related to ALS (PaaS), Openstack (IaaS), and Control. The configuration file holds *cloud-init* data and provides it to the Constructor VM during the Nova boot process, 

<pre>
{
    "ALS": {
        "admin_email": "admin@example.com",
        "admin_org": "org1",
        "admin_password": "adminpass1",
        "cluster_title": "stack1", 
        "cluster_prefix": "s1",
        "dea_count": "1",
        "router_count": "0",
        "services": "mysql,rabbitmq",
        "services_on_core": "False",
        "upstream_proxy": "",
        "http_proxy": "",
        "https_proxy": ""
    },
    "OpenStack": {
        "auth_url": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v2.0",
        "az": "az1",
        "block_mount": "/block_storage",
        "core_size": "standard.small",
        "core_volume_size": "0",
        "dea_size": "standard.medium",
        "image_id": "d782c03d-9666-4639-a62f-53b376880120",
        "image_password": "stackato",
        "keypair_name": "keypair1",
        "network_id": "0ec616d0-872d-424b-ac27-3b5db55d7fa0",
        "region": "region-a.geo-1",
        "router_id": "ab5f7adf-e506-422f-b724-07b0010f1190",
        "router_size": "standard.medium",
        "service_size": "standard.medium",
        "service_volume_size": "0",
        "os_database_instance_id": "12345",
        "os_database_flavor_id": "1",
        "os_database_volume_size": "10",
        "tenant_id": "12345678901234", 
        "token": "HP_..."
    },
    "Control": {
        "delete_cluster": "False",
        "grow_cluster": "False",
        "delete_database": "False",
        "terminate_constructor": "True"
    }
}
</pre>

### Boot Without a Configuration File (Helion private cloud) {#privatecloud}

If no *cloud-init* data is provided to the Constructor VM during the Nova boot process, the Constructor VM will boot and display a message of the day (MOTD) that instructs the user to run a configuration script.

<pre>
##############################################################################
This virtual machine was specifically built to provision an HP Helion 
Development Platform ALS cluster within your HP Helion OpenStack account.  

The VM contains all the tools necessary to get started with the HP Helion 
Development platform, but you will need to provide some configuration data.  

Please enter the command below to get started:

python ./trial_configure.py

##############################################################################
</pre>

Note that the actual script command line may change depending on the user's environment (public cloud / helion / beta / etc.)

### Boot Without a Configuration File (for public beta) {#publiccloud}

##Creating Growth Configuration Files {#growthfiles}

Examples of options that can be added to the configuration file. The first example adds DEA nodes to the cluster. The second example adds more services.

###DEA growth configuration file example

NOTE: The *dea_count* value is the number of DEAs to be **added** in this growth mode; do not count any DEAs that already exist.

<pre>
[OpenStack]
auth_url = https://region-b.geo-1.identity.hpcloudsvc.com:35357/v2.0
username = 
password = 
tenant_id = 
region = region-b.geo-1
image_id = 
image_password = 
dea_size = standard.medium
service_size = standard.medium

[ALS]
cluster_prefix = growth
dea_count = 1
services = 

[Control]
grow_cluster = True
</pre>

###Service growth configuration file example

NOTE: The comma-separated values in the list of services contain only the services to be **added** in this growth mode. Do not list services that already exist.

<pre>
[OpenStack]
auth_url = https://region-b.geo-1.identity.hpcloudsvc.com:35357/v2.0
username = 
password = 
tenant_id = 
region = region-b.geo-1
image_id = 
image_password = 
dea_size = standard.medium
service_size = standard.medium

[ALS]
cluster_prefix = growth
dea_count = 0
services = filesystem,redis

[Control]
grow_cluster = True
</pre>

## Running the Helion ALS in the public cloud

* [Developer Trial Quick Start](http://docs.hpcloud.com/helion/devplatform/ALS-developer-trial-quick-start/)

This is an example of the ConfigParser file format options for the Quick Start Trial:

<pre>
[OpenStack]
auth_url = https://region-b.geo-1.identity.hpcloudsvc.com:35357/v2.0
username = 
password = 
tenant_id = 
region = region-b.geo-1
az = az1
keypair_name = 
network_id = 
image_id = 
image_password = 
core_size = standard.medium
router_size = standard.medium
dea_size = standard.medium
service_size = standard.medium
core_volume_size = 0
service_volume_size = 0
block_mount = /block_storage

[ALS]
cluster_title = 
cluster_prefix = 
router_count = 0
dea_count = 0
services = mysql
admin_email = admin@example.com
admin_password = 
admin_org = als
services_on_core = True
</pre>

##Troubleshooting {#troubleshooting}
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<th>Failure Condition</th><th>Description</th><th>Resolution</th></tr>
<tr><td>Error message when clicking the Create Cluster button in the Horizon dashboard.</td><td>Danger: An error occurred. Please try again later.</td><td>
The Database service is installed, but the API is not responding. Try loading the Database Instances tab in Horizon. If the Database Instances tab fails to load, repair the Database Service.</td></tr>
<tr><td>Error message when clicking the final button in the Create Cluster Wizard in the Horizon UI.</td><td>Danger: An error occurred. (or similar message)</td><td>1.  Try to boot an ALS Installer image (make sure you open up port 22 in the default security group first) in the Nova Instances tab. </br></br>
2. If the image doesn't boot, the image is broken (check the size) or Nova is broken.</br></br>
3. If the image boots and says it's running, try to SSH into it.  If you can't SSH, check the instance's console log in the Horizon Instances UI.  If you see a message about "unable to contact metadata server, falling back", the Nova Metadata service is broken.</br></br>
4. If you can SSH in successfully, re-try cluster setup; the cause may be intermittent failures in Horizon/Nova.</td></tr>
<tr><td>Failure in building cluster step</td><td>Cluster stays in BUILDING state for an extremely long time, or drops to ERROR state.</br></br>OR</br></br>The ALS installer log on  the Installer VM reports 'No route to host'.</td><td>1. Assign a floating IP to the constructor instance and try SSHing to it. </br></br>
2. If you can't SSH, check the instance's console log in the Horizon Instances UI. If you see a message about "unable to contact metadata server, falling back", the Nova Metadata service is broken.</br></br>
3. Boot a couple of other installer images or Debian images in the same network and try to ssh between them.  If you get the "No route to host" error message, Neutron networking is broken.</td></tr>
</table>

### JSON option to disable self-destruction {#disable}

Set this value to **FALSE**: if you're doing the boot with json config file (nova call boot). This prevents the CVM from self-destcuting for logging and troubleshooting purposes.

<pre>
"Control": {
	"terminate_constructor": "False"
}
</pre>

### Logfile location {#logfile}

For troubleshooting, look at the constructor **assemble.py** logfile, ssh into the Constructor VM and edit the following file:

	/tmp/assemble_log.txt