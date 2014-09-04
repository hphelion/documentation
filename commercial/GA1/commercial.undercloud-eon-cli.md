 

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

The EON client CLI package provides a http-client coupled command line tool for managing Eon (Esx management) services.

**General Syntax of EON**


	eon <sub-command> [arguments]

	For example: eon vcenter-list --os-username=admin --os-password=admin _pass --os-tenant-name=admin  --os-auth-url=http://196.168.124.6:5000/v2.0/

##Lists of sub-commends
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

You can unimport the cluster(s) from the EON database under the give vCenter. to unimport the clusters, enter

	eon import-cluster --vcenter-id=<VCENTER_ID> --cluster-moid=<CLUSTER_MOID>


### Bash-completion {#bash-completion}

Prints all of the commands and options to stdout.

		eon bash-completion


###help {#help}              

Display help about this program or one of its subcommands.

	eon --help 

<br> OR<br>

		eon <subcommand>

##Optional commands

###Version

Shows the version number of the program and exit.

	eon [--version]


###debug

	eon [-d]
###verbose
Print more verbose output.

	eon  [-v]

###insecure 
Explicitly allow eonclient to perform "insecure" SSL (https) requests. The server's certificate will not be verified against any certificate authorities. This option should be used with caution.
 	eon   [-k]   


###Certificate
Path of certificate file to use in SSL connection. This file can optionally be prepended with the private key.

 	[--cert-file CERT_FILE]

###Keyfile
Path of client key to use in SSL connection. This option is not necessary if your key is prepended to your cert file.

           [--key-file KEY_FILE] 

###cs certificate
Path of CA TLS certificate(s) used to verifythe remote server's certificate. Without this option eon looks for the default system CA certificates.

		[--os-cacert <ca-certificate-file>]

###Timeout   
 Number of seconds to wait for a response.

	--timeout TIMEOUT 

###OS username
  --os-username OS_USERNAME
                        Defaults to env[OS_USERNAME].
 
 --os-password OS_PASSWORD
                        Defaults to env[OS_PASSWORD].
 
 --os-tenant-id OS_TENANT_ID
                        Defaults to env[OS_TENANT_ID].
 
 --os-tenant-name OS_TENANT_NAME
                        Defaults to env[OS_TENANT_NAME].
 
 --os-auth-url OS_AUTH_URL
                        Defaults to env[OS_AUTH_URL].
 
 --os-region-name OS_REGION_NAME
                        Defaults to env[OS_REGION_NAME].
 
 --os-auth-token OS_AUTH_TOKEN
                        Defaults to env[OS_AUTH_TOKEN].
  --eon-url EON_URL     Defaults to env[EON_URL].
 
 --eon-api-version EON_API_VERSION
                        Defaults to env[EON_API_VERSION] or 1
 
 --os-service-type OS_SERVICE_TYPE
                        Defaults to env[OS_SERVICE_TYPE].
 
 --os-endpoint-type OS_ENDPOINT_TYPE
                        Defaults to env[OS_ENDPOINT_TYPE].




<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
