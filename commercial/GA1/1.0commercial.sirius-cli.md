---
layout: default
title: "HP Helion OpenStack&#174; Installation and Configuration"
permalink: /helion/openstack/sirius-cli/
product: commercial.ga
product: commercial.ga
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.0
product-version3: HP Helion OpenStack 1.0.1
product-version4: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Sunitha K, Deepali V, Vandana S


---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!---
<p style="font-size: small;"> <a href="/helion/openstack/support-matrix-beta/">&#9664; PREV</a> | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/prereqs/">NEXT &#9654;</a> </p>-->

# HP Helion OpenStack&#174;: Configuring Your Storage Using Sirius
Once you complete the undercloud and overcloud installation, you can use the Sirius client CLI package to configure your storage. 

The python-Siriusclient CLI package provides a http-client coupled command line tool for managing the Sirius service. The client works with Keystone through the python-keystoneclient and thus requires OpenStack Keystone credentials to be sourced or augmented along with the command. This requirement is in line with other OpenStack clients. This service helps with configuring the storage devices such as StoreVirtual and StoreServ, which function as the backend for Cinder.

You can use the following commands using the Sirius Client CLI package in the undercloud. For a list of all available commands, use the [Help Commands](#help).

* [Help Command](#help)
* [API Commands](#api-commands)
* [HP StoreVirual Commands](#storevirtual-commands)
* [HP StoreServ Commands](#hp-storeserv-commands)
* [Required Options](#required-options)

##Help Commands<a name="help"></a>

###Help

You can display the help of this program or one of its sub-programs

	# sirius --help

### Help subcommand

You get two sets of arguments- Positional(mandatory) and Options (all mandatory fields are marked within [*Required*])

	# sirius help <sub-command>


## API Commands<a name="api-commands"></a>

### Get block info ###

You can list the block storage details of API version. 

	# Sirius block-info

### Bash completion

You can print all the commands and options to standard output

	# sirius bash-completion


### Supported devices###

You can list the devices supported by Sirius API.

	# sirius supported-devices


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## HP StoreVirtual Commands<a name="storevirtual-commands"></a>

### List StoreVirtual cluster 

You can list the clusters in StoreVirtual which are registered with Sirius.

	# sirius storevirtual-cluster-list

### Show StoreVirtual cluster  ###

You can display the details of a particular cluster.

	 # sirius storevirtual-cluster-show [--backend-name <CINDER_BACKEND_NAME>]<CLUSTER_ID>                              

### Register StoreVirtual cluster ###

You can register the StoreVirtual Cluster to Sirius database. This command requires all the arguments, else the user is prompted for the same.

	# sirius register-storevirtual-cluster -name=<CLUSTER_NAME> --hostname=<CLUSTER_IP_ADDRESS>  --subnet=<SUBNET> --username=<USERNAME> --password=<PASSWORD> --port=<SSH_PORT>


### Update StoreVirtual cluster ###

You can update the StoreVirtual cluster in Sirius database. Only the CLUSTER_ID is  a mandatory argument.

	# sirius update-storevirtual-cluster <CLUSTER_ID>  -name=<VCENTER_NAME> --ip-address=<VCENTER_IP_ADDRESS> --username=<VCENTER_USERNAME> --password=<VCENTER_PASSWORD> --port=<VCENTER_PORT> --status=<CLOUD_STATUS>

### Delete StoreVirtual cluster ###

You can unregister the specified StoreVirtual cluster from the Sirius database.

	# sirius delete-storevirtual-cluster <CLUSTER_ID>

### List StoreVirtual backend

Lists the StoreVirtual backends registered to Sirius

	# sirius storevirtual-backend-list [--format <JSON_FLAG>]

### Backend show                        
    
 Shows the information about specific backend

	# sirius backend-show [--format <JSON_FLAG>] <BACKEND_ID>        
                       
### Add StoreVirtual backend

You can add a StoreVirtual backend

    # sirius add-storevirtual-backend <BACKEND_ID>

### Delete StoreVirtual backend

Unregister StoreVirtual backend

    # sirius delete-storevirtual-backend <BACKEND_ID>
                        
<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>	

## HP StoreServ Commands<a name="hp-storeserv-commands"></a>


### List StoreServ  ###

You can list the StoreServ clusters registered with the Sirius database.

	# sirius storeserv-list


### Show StoreServ  ###

You can display the details of a specific StoreServ.

	# sirius storeserv-show [--cpg-list <CPG_LIST_FLAG>] <STORESERV_ID>

**Note:** 

*Optional argument* --cpg-list <true/false> [Setting this to 'true' displays the available CPGs for the given StoreServ]


### Register StoreServ ###

You can register the StoreServ to Sirius.

	# sirius register-storeserv --name <STORESERV_NAME> --hostname <STORESERV_IP> --username <USERNAME> --password <PASSWORD> --port <SSH_PORT> --san-ip <SAN_IP> --san-username <SAN_USERNAME> --san-password <SAN_PASSWORD> --device-type <DEVICE_TYPE>


**Note:** 

*Additional arguments*: --iscsi-ip &lt;ISCSI_IP> [required for iSCSI type devices]

For more than one iSCSI IP addresses, use a comma separated list . The ports can also be specified along with the IP addresses (separated by colon), if required. 

*Example:*

--iscsi-ip 10.1.2.200,10.1.2.100:3380,10.1.2.102




### Update StoreServ ###

You can update the StoreServ details in Sirius.

	# sirius update-storeserv <STORESERV_ID>

**Note:**

*Optional Arguments*:   --name <STORESERV_NAME> --hostname <STORESERV_IP> --username <USERNAME> --password <PASSWORD> --port <SSH_PORT> --san-ip <SAN_IP> --san-username <SAN_USERNAME> --san-password <SAN_PASSWORD> --device-type <DEVICE_TYPE>

*Additional arguments*: --iscsi-ip &lt;ISCSI_IP> [*required for iSCSI type devices]*

**Note**: Currently, CLI does not support the change of Device Type from **FC** to **ISCSI**. 

### Delete StoreServ ###

You can unregister the StoreServ from Sirius.

	# sirius delete-storeserv <STORESERV_ID>


### List CPG

You can list all the 3PAR CPGs registered with specific StoreServ

	# sirius cpg-list --storeserv-id <STORESERV_ID>

### Show CPG

Shows the details of specific 3PAR CPGs

    # sirius cpg-show --storeserv-id <STORESERV_ID> --cpg-id <CPG_ID> [--backend-name <CINDER_BACKEND_NAME>]  

**Options:**
 -storeserv-id  <STORESERV&#095;ID>  --- *ID of the StoreServ [Required]*.
 
 --cpg-id <CPG&#095;ID>    --- *ID of the StoreServ CPG to display detail [Required]*.
 
 --backend-name <CINDER&#095;BACKEND_NAME> ---- *Optional input to show the details in cinder backend format with specified backend name*.
                               

### Register CPG

You can register the 3PAR CPGs


    # sirius register-cpg --cpgs <CPG_UUID> [<CPG_UUID> ...] --storeserv-id <STORESERV_ID>
     
**Options:**
  --cpgs <CPG_UUID> [<CPG_UUID> ...]  -- *UUID(s) of the 3PAR StoreServ CPG(s) to be registered [Required]*.
  
--storeserv-id <STORESERV_ID>  --- *ID of the 3PAR StoreServ [Required]*.                    



### Delete CPG ###

You can unregister the 3PAR CPGs

	# sirius delete-cpg --storeserv_id <STORESERV_ID> --cpgs <CPG_ID> [<CPG_ID> ...]

**Options**:

  --storeserv_id <STORESERV&#095;ID> ---- *ID of the 3PAR StoreServ [Required]*.
  
  --cpgs <CPG&#095;ID> [<CPG_ID> ...] ---- *ID(s) of the 3PAR StoreServ CPG(s) to be unregistered [Required].*

                                 
###List backends###

 You can view the list of the backends registered to Sirius.

     # sirius storeserv-backend-list [--format <JSON_FLAG>]

                        
###Show backend

You can view the information about specific backend.

    # sirius backend-show [--format <JSON_FLAG>] <BACKEND_ID>


### Add StoreServ backend ###

You can add a StoreServ backend.

    # sirius add-storeserv-backend --storeserv-id <STORESERV_ID> --cpg-id <CPG_UUID> --backend-name <BACKEND_NAME>

###Delete Storeserv backend

You can unregister a Storeserv backend

 	# sirius delete-storeserv-backend <BACKEND_ID> [<BACKEND_ID> ...]
                         

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>   

## Required Options {#required-options}

The following options must be supplied as arguments or as environment variables.

<!---###Version

Shows the version number of the program and exit.

	# sirius [--version]


###debug
 Defaults to env[SIRIUSCLIENT_DEBUG].

	# sirius [-d]

###verbose
Print more verbose output.

	# sirius [-v]

###insecure 

Explicitly allow siriusclient to perform "insecure" SSL (https) requests. The server's certificate will not be verified against any certificate authorities. This option should be used with caution.
 	
    # sirius [-k]   


###Certificate

Path of the certificate file to be used in SSL connection. This file can optionally be prepended with the private key.

 	# [--cert-file CERT_FILE]

###Keyfile

Path of client key to use in SSL connection. This option is not necessary if your key is prepended to your cert file.

      # [--key-file KEY_FILE] 

###ca certificate

Path of CA TLS certificate(s) used to verify the remote server's certificate. Without this option sirius looks for the default system CA certificates.

		# [--os-cacert <ca-certificate-file>]

###Timeout   
 Number of seconds to wait for a response.

	 # --timeout TIMEOUT -->

###OS username

Username of the keystone (OpenStack). Defaults to env[OS_USERNAME].
  
	# --os-username OS_USERNAME
                        
 
###OS PASSWORD
Password of the keystone (OpenStack).  Defaults to env[OS_PASSWORD].
	
	# --os-password OS_PASSWORD
                       
 
###OS TENANT ID
Tenant identification of the OpenStack. Defaults to env[OS&#095;TENANT_ID].

    # --os-tenant-id OS_TENANT_ID
                        
 
<!---###OS TENANT NAME
Tenant name of the OpenStack. Defaults to env[OS&#095;TENANT_NAME].
		
	--os-tenant-name OS_TENANT_NAME-->

                        
 
###OS AUTH URL
Authentication URL of OpenStack. Defaults to env[OS&#095;AUTH_URL].
 
	# --os-auth-url OS_AUTH_URL
                        


<!---###OS REGION NAME
The region name of  OpenStack. Defaults to env[OS_REGION_NAME].

  	--os-region-name OS_REGION_NAME  -->
                        
 
###OS AUTH TOKEN
Authentication token of OpenStack. Defaults to env[OS&#095;AUTH_TOKEN].

    # --os-auth-token OS_AUTH_TOKEN
                       

<!---### Sirius URL  
 
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
 	
	--os-endpoint-type OS_ENDPOINT_TYPE  -->





<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
