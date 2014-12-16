---
layout: default-devplatform
permalink: /als/v1/client/constructor
product: devplatform
title: "HP Application Lifecyle Service (ALS) Client Constructor Virtual Machine"

---

<!--UNDER REVISION-->

#HP Application Lifecyle Service (ALS) Client Constructor Virtual Machine

The Constructor VM is a short-lived virtual machine that handles the provisioning of the Helion ALS services in a Helion public or private cloud.

By default the Constructor VM is self-terminating, but this can be overridden for debugging purposes.

The Constructor VM can also function in a destructor mode, to simplify the tear-down of the Helion ALS PaaS system.

##Downloading the VM Image
The Constructor VM image is available in **US East** only and is labeled:

```
HP Helion Development Platform CE - Application Lifecycle Service Installer A.B.C.D
```
where A.B.C.D is the release designation.

The default username is *debian*. The image does not include a password; the virtual machine is booted with an associated SSH key. 

##The Constructor VM boot process
There are multiple options for the initial boot of the Constructor VM.

###Nova Boot with cloudinit Data

1. nova call with cloudinit data
2. VM boots
3. /etc/rc.local script runs
4. cloudinit file is detected
5. cloudinit JSON is converted to ConfigFile format
6. assemble.py is run using cluster.conf
4. Message of the day is displayed instruction

### Nova boot without cloudinit data (Helion private cloud or public beta)

If no clould-init data is provided to the Constructor VM duing the Nova boot process, the Constructor VM will boot, and display a message of the day (motd), instructing the user to run a trial configuration script.

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

##Managing the Constructor VM from the Horizon Dashboard

OpenStack Horizon has been extended with a panel to communicate with the Constructor VM.  

Horizon performs a call to Nova with cloud-init configuration data for the Helion ALS PaaS construction. The OpenStack metadata service is used to communicate ALS construction status communication back to the Horizon UI.

Note that the Horizon UI currently does not support Service or DEA growth options.  Access these growth options via the command line using the ConfigParser file format.


##Creating the cloud-init Configuration File
###JSON configuration file example

Here is an example of the cloud-init JSON format used for Helion ALS PaaS construction.  There are three sections of key-value pairs related to ALS (PaaS), Openstack (IaaS), and Control.

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

###DEA growth configuration file example

NOTE: The *dea_count* value is the number of DEAs to be **added** in this growth mode; do not count any DEAs that already exist.

<pre>
[OpenStack]
auth_url = https://region-b.geo-1.identity.hpcloudsvc.com:35357/v2.0
username = ????????
password = ????????
tenant_id = ????????
region = region-b.geo-1
image_id = ????????
image_password = ????????
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
username = ????????
password = ????????
tenant_id = ????????
region = region-b.geo-1
image_id = ????????
image_password = ????????
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



* http://docs.hpcloud.com/helion/devplatform/ALS-developer-trial-quick-start/

This is an example of the ConfigParser file format options for trial:

<pre>
[OpenStack]
auth_url = https://region-b.geo-1.identity.hpcloudsvc.com:35357/v2.0
username = ????????
password = ????????
tenant_id = ????????
region = region-b.geo-1
az = az1
keypair_name = ????????
network_id = ????????
image_id = ????????
image_password = ????????
core_size = standard.medium
router_size = standard.medium
dea_size = standard.medium
service_size = standard.medium
core_volume_size = 0
service_volume_size = 0
block_mount = /block_storage

[ALS]
cluster_title = ????????
cluster_prefix = ????????
router_count = 0
dea_count = 0
services = mysql
admin_email = admin@example.com
admin_password = ????????
admin_org = als
services_on_core = True
</pre>

##Troubleshooting
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<th>Failure Condition</th><th>Description</th><th>Resolution</th></tr>
<tr><td>Error message when clicking the Create Cluster button in the Horizon dashboard.</td><td>Danger: An error occurred. Please try again later.</td><td>
The Database service is installed, but the API is not responding. Try loading the Database Instances tab in Horizon. If the Database Instances tab fails to load, repair the Database Service.</td></tr>
<tr><td>Error message when clicking the final button in the Create Cluster Wizard in the Horizon UI.</td><td>Danger: An error occurred. (or similar message)</td><td>1.  Try to boot an ALS Installer image (make sure you open up port 22 in the default security group first) in the Nova Instances tab. </br></br>
2. If the image doesn't boot, the image is broken (check the size) or Nova is broken.</br></br>
3. If the image boots and says it's running, try to SSH into it.  If you can't SSH, check the instance's console log in the Horizon Instances UI.  If you see a message about "unable to contact metadata server, falling back", Nova Metadata service is broken.</br></br>
4. If you can SSH in successfully, re-try cluster setup, you're looking at possible intermittent failures in Horizon/Nova.</td></tr>
<tr><td>Failure in building cluster step</td><td>Cluster stays in BUILDING state for an extremely long time, or drops to ERROR state.</br></br>OR</br></br>The ALS installer log on  the Installer VM reports 'No route to host'.</td><td>1. Assign a floating IP to the constructor instance and try SSHing to it. </br></br>
2. If you can't SSH, check the instance's console log in the Horizon Instances UI. If you see a message about "unable to contact metadata server, falling back", Nova Metadata service is broken.</br></br>
3. Boot a couple of other Installer images or Debian images in the same network and try to ssh between them.  If you get the "No route to host" error message, Neutron networking is broken.</td></tr>
</table>

### JSON option to disable self-destruction

Set this value to **FALSE**:

<pre>
"Control": {
	"terminate_constructor": "False"
}
</pre>

### Logfile location

To look at the constructor **assemble.py** logfile, ssh into the Constructor VM and edit the following file:

	/tmp/assemble_log.txt


## Related Documentation

* [Development Platform Overview](http://docs.hpcloud.com/helion/devplatform/)
* [ALS Overview](http://docs.hpcloud.com/als/v1/)
* [Installing ALS](http://docs.hpcloud.com/helion/devplatform/install/#install-als)
* [Wizard-Based Cluster Creation](http://docs.hpcloud.com/als/v1/admin/#wizard-based-cluster-creation)
* [Developer Trial Quick Start](http://docs.hpcloud.com/helion/devplatform/ALS-developer-trial-quick-start/)

