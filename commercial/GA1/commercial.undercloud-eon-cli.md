 

---
layout: default
title: "HP Helion OpenStack&#174; Command Line Interface- EON"
permalink: /helion/openstack/ga/undercloud/eon/cli/
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
<p style="font-size: small;"> <a href="/helion/openstack/services/compute/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/imaging/overview/"> NEXT &#9654</a> </p>

-->

#Command Line Interface- EON 

The EON client CLI package provides a http-client coupled command line tool for managing Eon (ESX management) services.

The Following sections lists the sub-commands and mandatory commands that can be used.

* [Mandatory commands](#mandatory-commands)
* [Lists of sub-commands](#lists-of-commands)


**General Syntax of EON**


	eon <sub-command> [arguments]

	For example: eon vcenter-list --os-username=admin --os-password=admin _pass --os-tenant-name=admin  --os-auth-url=http://196.168.124.6:5000/v2.0/


##Mandatory commands {#mandatory-commands}

The user need to provide the input for the following commands. These are mandatory command, if fail to provide an input the user is prompted to enter the desired input.

* [Version](#version)
* [Debug](#debug)
* [Verbose](#verbose)
* [Insecure](#insecure)
* [Certificate](#certificate)
* [Keyfile](#keyfile)
* [CS certificate](#cs-certificate)
* [Timeout](#timeout)
* [OS username](#os-username)
* [OS password](#os-password)
* [OS tenant ID](#os-tenant-id)
* [OS tenant NAME](#os-tenant-name)
* [OS authentication URL](#os-auth-url)
* [OS region name](#os-region-name)
* [OS authentication token](#os-auth-token)
* [EON URL](#eon-url)
* [EON API version](#eon-api-version)
* [OS service type](#os-service-type)
* [OS endpoint type](#os-endpoint-type)


###Version {#version}

Shows the version number of the program and exits.

	eon [--version]


###Debug {#debug}
Defaults to env[EONCLIENT_DEBUG].
	
	eon [-d]

OR

	eon [--debug]

###Verbose{#verbose}
Print more verbose output.

	eon  [-v]

OR

	eon [--verbose]

###Insecure {#insecure}
Explicitly allow eonclient to perform "insecure" SSL (https) requests. The server's certificate is not verified against any certificate authorities. This option should be used with caution.
 			
	eon   [-k]   

OR

	eon [--insecure]        

###Certificate{#certificate}
Path of certificate file to use in SSL connection. This file can optionally be prepended with the private key.

 	eon [--cert-file CERT_FILE]

###Keyfile{#keyfile}
Path of client key to use in SSL connection. This option is not necessary if your key is prepended to your cert file.

           [--key-file KEY_FILE] 

###CS certificate {#cs-certificate}
Path of CA TLS certificate(s) used to verifythe remote server's certificate. Without this option eon looks for the default system CA certificates.

		[--os-cacert <ca-certificate-file>]

###Timeout{#timeout}   
 Number of seconds to wait for a response.

	--timeout TIMEOUT 

###OS username {#os-username}
Username of the keystone (OpenStack). Defaults to env[OS_USERNAME].
  
	--os-username OS_USERNAME
                        
 
###OS password{#os-password}
Password of the keystone (OpenStack).  Defaults to env[OS_PASSWORD].
	
	 --os-password OS_PASSWORD
                       
 
###OS tenant ID{#os-tenant-id}
Tenant identification of the OpenStack. Defaults to env[OS_TENANT_ID].

	--os-tenant-id OS_TENANT_ID
                        
 
###OS tenant name{#os-tenant-name}
Tenant name of the OpenStack. Defaults to env[OS_TENANT_NAME].
		
	--os-tenant-name OS_TENANT_NAME

                        
 
###OS authentication URL{#os-auth-url}
Authentication URL of OpenStack. Defaults to env[OS_AUTH_URL].
 
	 --os-auth-url OS_AUTH_URL
                        


###OS region name{#os-region-name}
The region name of  OpenStack. Defaults to env[OS_REGION_NAME].

  	--os-region-name OS_REGION_NAME
                        
 
###OS authenticationtoken{#os-auth-token}
Authentication token of OpenStack. Defaults to env[OS_AUTH_TOKEN].

  	--os-auth-token OS_AUTH_TOKEN
                       

###EON URL {#eon-url} 
 The EON URL. Defaults to env[EON_URL].
  
		--eon-url EON_URL
  
 
###EON API version {#eon-api-version}
The API version of EON. Defaults to env[EON_API_VERSION] or 1

 	--eon-api-version EON_API_VERSION
                        
 
###OS service type {#os-service-type}
The service type of OpenStack.Defaults to env[OS_SERVICE_TYPE].

 	--os-service-type OS_SERVICE_TYPE
                        
 
###OS endpoint type {#os-endpoint-type}
The endpoint type of OpenStack. Defaults to env[OS_ENDPOINT_TYPE].
 	
	--os-endpoint-type OS_ENDPOINT_TYPE
                       


###Example of mandatory commands

		   eon [--version] [-d] [-v] [-k] [--cert-file CERT_FILE]
           [--key-file KEY_FILE] [--os-cacert <ca-certificate-file>]
           [--ca-file OS_CACERT] [--timeout TIMEOUT]
           [--os-username OS_USERNAME] [--os-password OS_PASSWORD]
           [--os-tenant-id OS_TENANT_ID] [--os-tenant-name OS_TENANT_NAME]
           [--os-auth-url OS_AUTH_URL] [--os-region-name OS_REGION_NAME]
           [--os-auth-token OS_AUTH_TOKEN] [--eon-url EON_URL]
           [--eon-api-version EON_API_VERSION]
           [--os-service-type OS_SERVICE_TYPE]
           [--os-endpoint-type OS_ENDPOINT_TYPE]




##Lists of sub-commends {#lists-of-commands}
Using command line (sub-commands), you can do the following:

* [Add vCenter](#add-vcenter)
* [List vCenters](#list-vcenter)
* [View vCenter](#view-vcenter-details)
* [Update vCenter](#update-vcenter)
* [Delete vCenter](#delete-vcenter)
* [List clusters](#list-clusters)
* [View cluster details ](#view-cluster-details)
* [Cluster update](#cluster-update)
* [Host details](host-details)
* [Import clusters](#import-clusters)
* [Unimport clusters](#unimport-clusters)
* [Bash-completion](#bash-completion)
* [Help](#help)


### Add vCenter {#add-vcenter}

You can add the vCenter to the EON database. You must enter all the arguments to add the vCenter, else you will be prompted for the same. 

	eon vcenter-add –name=<VCENTER_NAME> --ip-address=<VCENTER_IP_ADDRESS> --username=<VCENTER_USERNAME> --password=<VCENTER_PASSWORD> --port=<VCENTER_PORT>

**Note**: You can add only three vCenters.

###List vCenters {#list-vcenters}

You can view the list of vCenters in your cloud environment. 


    eon vcenter-list [argument]


###View vCenter details {#view-vcenter-details}

You can view the details of the specific vCenter. 

	eon vcenter-show <VCENTER_ID>


### Update vCenter {#update-vcenter}

You can update the exisitng vCenter to the EON database. You must enter all the arguments to add the vCenter, else you will be prompted for the same. 

	eon vcenter-update <VCENTER_ID> –name=<VCENTER_NAME> --ip-address=<VCENTER_IP_ADDRESS> --username=<VCENTER_USERNAME> --password=<VCENTER_PASSWORD> --port=<VCENTER_PORT>

### Delete vCenter {#delete-vcenter}

You can delete the vCenter from EON database.  

	eon vcenter-delete <VCENTER_ID>

In the vCenter you can import the cluster(s). One vCenter can have multiple cluster(s).

###List clusters {#list-clusters}

You can view the list of clusters available for the given vCenter. 

	eon cluster-list <VCENTER_ID>

###View cluster details {#view-cluster-details}

You can view of the details of the specific cluster. 

	eon cluster-show --vcenter-id=<VCENTER_ID> --cluster-moid=<CLUSTER_MOID>

### Cluster update {#cluster-update}

You can update the cluster details. 

	eon cluster-update

### Host details {#host-details}

You can view the list of hosts of cluster details of the host when cluster moid is specified.

	 eon host-list <VCENTER_ID> --cluster-moid=<CLUSTER_MOID>

###Import clusters {#import-cluster}

You can import the clusters in the EON database under the give vCenter. 

	eon import-cluster --vcenter-id=<VCENTER_ID> --cluster-moid=<CLUSTER_MOID> --cluster-name=<CLUSTER_NAME>

###Unimport clusters {#unimport-clusters}

You can unimport the cluster(s) from the EON database under the give vCenter. To unimport  clusters, enter

	eon unimport-cluster --vcenter-id=<VCENTER_ID> --cluster-moid=<CLUSTER_MOID>


### Bash-completion {#bash-completion}

Prints all of the commands and options to the standard output.

		eon bash-completion


###help {#help}              

Display help about this program or one of its subcommands.

	eon --help 

<br> OR<br>

		eon <subcommand>




<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
