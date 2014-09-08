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

* [Optional Commands](#optional-commands)

  
## API commands {#api-commands} ##

### Get block info ###


You can list the block storage details of API version. [**WHERE DO WE GIVE THIS COMMAND??????**]

	Sirius block-info

### Supported devices###

You can list the devices supported by Sirius API.

	sirius supported-devices

### Bash Completetion

You can prints all the commands and options to standard output(stdout???)

	sirius bash-completion

##Help

You can display the help of this program or one of its sub-programs

	sirius help

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

    sirius add-vsa-backend <BACKEND ID?>

 


## HP StoreServ commands ##

### Register StoreServ ###

You can register the StoreServ to Sirius.

	sirius register-storeserv --name <STORESERV_NAME> --hostname <STORESERV_IP> --username <USERNAME> --password <PASSWORD> --port <SSH_PORT> --san-ip <SAN_IP> --san-username <SAN_USERNAME> --san-password <SAN_PASSWORD> --device-type <DEVICE_TYPE>


**Note:** 

*Additional arguments*: --iscsi-ip <ISCSI_IP> [required for iSCSI type devices]

register-cpg        Register the 3PAR CPGs


### List CPG

You can list all the registered 3PAR CPGs

	sirius cpg-list

### Show CPG

You can list the 3PAR CPGs

    sirius cpg-show           


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

	sirius update-storeserv <STORESERV_ID>

**Note:**

*Optional Arguments*:   --name <STORESERV_NAME> --hostname <STORESERV_IP> --username <USERNAME> --password <PASSWORD> --port <SSH_PORT> --san-ip <SAN_IP> --san-username <SAN_USERNAME> --san-password <SAN_PASSWORD> --device-type <DEVICE_TYPE>

*Additional arguments*: --iscsi-ip <ISCSI_IP> [required for iSCSI type devices]

### Delete StoreServ ###

You can unregister the StoreServ from Sirius.

	sirius delete-storeserv <STORESERV_ID>

### Delete CPG ###

You can unregister the 3PAR CPGs

	sirius delete-cpg          


### Add StoreServ Backend ###

You can add a StoreServ backend.

    sirius add-storeserv-backend <BACKEND_ID?>

###List Backends###

 You can view the list of the backends registered to Sirius.

    sirius backend-list
                        
###Show Backend

You can view the information about specific backend.

    sirius backend-show      

  
##Optional commands

###Version

Shows the version number of the program and exit.

	sirius [--version]


###debug
 Defaults to env[SIRIUSCLIENT_DEBUG].

	sirius [-d]

###verbose
Print more verbose output.

	sirius [-v]

###insecure 

Explicitly allow siriusclient to perform "insecure" SSL (https) requests. The server's certificate will not be verified against any certificate authorities. This option should be used with caution.
 	
    sirius [-k]   


###Certificate

Path of the certificate file to be used in SSL connection. This file can optionally be prepended with the private key.

 	[--cert-file CERT_FILE]

###Keyfile

Path of client key to use in SSL connection. This option is not necessary if your key is prepended to your cert file.

           [--key-file KEY_FILE] 

###ca certificate

Path of CA TLS certificate(s) used to verify the remote server's certificate. Without this option sirius looks for the default system CA certificates.

		[--os-cacert <ca-certificate-file>]

###Timeout   
 Number of seconds to wait for a response.

	--timeout TIMEOUT 

###OS username

Username of the keystone (OpenStack). Defaults to env[OS_USERNAME].
  
	--os-username OS_USERNAME
                        
 
###OS PASSWORD
Password of the keystone (OpenStack).  Defaults to env[OS_PASSWORD].
	
	 --os-password OS_PASSWORD
                       
 
###OS TENANT ID
Tenant identification of the OpenStack. Defaults to env[OS_TENANT_ID].

	--os-tenant-id OS_TENANT_ID
                        
 
###OS TENANT NAME
Tenant name of the OpenStack. Defaults to env[OS_TENANT_NAME].
		
	--os-tenant-name OS_TENANT_NAME

                        
 
###OS AUTH URL
Authentication URL of OpenStack. Defaults to env[OS_AUTH_URL].
 
	 --os-auth-url OS_AUTH_URL
                        


###OS REGION NAME
The region name of  OpenStack. Defaults to env[OS_REGION_NAME].

  	--os-region-name OS_REGION_NAME
                        
 
###OS AUTH TOKEN
Authentication token of OpenStack. Defaults to env[OS_AUTH_TOKEN].

  	--os-auth-token OS_AUTH_TOKEN
                       

### Sirius URL  
 
The Sirius URL. Defaults to env[SIRIUS_URL].
  
		--sirius-url SIRIUS_URL
  
 
###Sirius API VERSION
The API version of Sirius. Defaults to env[SIRIUS_API_VERSION] or 1

 	  --sirius-api-version SIRIUS_API_VERSION
                        
 
###OS SERVICE TYPE
The service type of OpenStack.Defaults to env[OS_SERVICE_TYPE].

 	--os-service-type OS_SERVICE_TYPE
                        
 
###OS ENDPOINT TYPE
The endpoint type of OpenStack. Defaults to env[OS_ENDPOINT_TYPE].
 	
	--os-endpoint-type OS_ENDPOINT_TYPE




<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
