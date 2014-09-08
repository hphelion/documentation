---
layout: default
title: "HP Helion OpenStack&#174; Installation and Configuration"
permalink: /helion/openstack/ga/sirius-cli/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!---
<p style="font-size: small;"> <a href="/helion/openstack/support-matrix-beta/">&#9664; PREV</a> | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/prereqs/">NEXT &#9654;</a> </p>-->

# Configuring Your Storage Using Sirius
Once you complete the Undercloud and Overcloud installation, you can use Sirius client CLI package to configure your storage. The python-Siriusclient CLI package provides a http-client coupled command line tool for managing Sirius service. The client works with Keystone through the python-keystoneclient and thus requires OpenStack Keystone credentials to be sourced or augmented along with the command and is in line with other OpenStack clients.This service helps in configuring the storage devices such as StoreVirtual and StoreServ using Cinder as the backend.


You can use the following commands using the Sirius Client CLI package:

* [API Commands](#api-commands)

* [HP StoreVirual Commands](#storevirtual-commands)

* [HP StoreServ Commands](#storeserv-commands)

  
## API commands {#api-commands} ##

### Get block info ###


You can list the block storage details of API version. [**WHERE DO WE GIVE THIS COMMAND??????**]

	Sirius block-info

### Supported devices###

You can list the devices supported by Sirius API.

	Sirius supported-devices


## HP StoreVirtual commands {#storevirtual-commands}

### Register VSA cluster ###

You can register the VSA Cluster to Sirius database. This command requires all the arguments, else the user is prompted for the same.

	sirius register-vsa-cluster –name=<CLUSTER_NAME> --hostname=<CLUSTER_IP_ADDRESS>  --subnet=<SUBNET> --username=<USERNAME> --password=<PASSWORD> --port=<SSH_PORT>

### List VSA cluster 

You can list the clusters in VSA which are registered with Sirius.

	sirius vsa-cluster-list

### Show VSA cluster  ###

You can display the details of a particular cluster.

	sirius vsa-cluster-show <CLUSTER_ID>


### Update VSA cluster ###

You can update the VSA cluster in Sirius database. Only the CLUSTER_ID is  a mandatory argument.

	sirius update-vsa-cluster <CLUSTER_ID>  –name=<VCENTER_NAME> --ip-address=<VCENTER_IP_ADDRESS> --username=<VCENTER_USERNAME> --password=<VCENTER_PASSWORD> --port=<VCENTER_PORT> --status=<CLOUD_STATUS>

### Delete VSA cluster ###

You can unregister the specified VSA cluster from the Sirius database.

	sirius delete-vsa-cluster <CLUSTER_ID>

### Add VSA backend

You can add a VSA backend

    Sirius add-vsa-backend <BACKEND ID?>

 
## HP StoreServ commands ##

### Register StoreServ ###

You can register the StoreServ to Sirius.

	sirius register-storeserv --name <STORESERV_NAME> --hostname <STORESERV_IP> --username <USERNAME> --password <PASSWORD> --port <SSH_PORT> --san-ip <SAN_IP> --san-username <SAN_USERNAME> --san-password <SAN_PASSWORD> --device-type <DEVICE_TYPE>


**Note:** 

*Additional arguments*: --iscsi-ip <ISCSI_IP> [required for iSCSI type devices]


### List StoreServ  ###

You can list the StoreServ clusters registered with the Sirius database.

	sirius storeserv-list


### Show StoreServ  ###

You can display the details of a specific StoreServ.

 	sirius storeserv-show <STORESERV_ID> 



**Note:** 

*Optional argument* --cpg-list <true/false> [Setting this to 'true' displays the available CPGs for the given StoreServ]


### Update StoreServ ###

You can update the StoreServ details in Sirius.

	Sirius update-storeserv <STORESERV_ID>

**Note:**

*Optional Arguments*:   --name <STORESERV_NAME> --hostname <STORESERV_IP> --username <USERNAME> --password <PASSWORD> --port <SSH_PORT> --san-ip <SAN_IP> --san-username <SAN_USERNAME> --san-password <SAN_PASSWORD> --device-type <DEVICE_TYPE>

*Additional arguments*: --iscsi-ip <ISCSI_IP> [required for iSCSI type devices]

### Delete StoreServ ###

You can unregister the StoreServ from Sirius.

	Sirius delete-storeserv <STORESERV_ID>


### Add StoreServ Backend ###

You can add a StoreServ backend.

    Sirius add-storeserv-backend <BACKEND_ID?>

###List Backends###

 You can view the list of the backends registered to Sirius.

    Sirius backend-list
                        
###Show Backend

You can view the information about specific backend.

    Sirius backend-show        

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
