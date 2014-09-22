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
 

You can use the following command using the EON Client CLI package in the UnderCloud:


* [Help Commands](#help)

* [API Command](#api-command)

* [vCenter Commands](#vcenter-commands)

* [Cluster Commands](#cluster-commands)

* [Compute Proxy Commands](#proxy-command)

* [Options Commands](#optional-commands)
 
##Help Commands{#help}

###Help

You can display the help of this program or one of its sub-programs.

   	`eon --help `


###Help Subcommand

You get two sets of arguments- Positional (mandatory) and Optional arguments(all mandatory fields are marked within *[Required]*).

   ` eon help <sub-command> `


You can use the following commands to view the help .


##API Command {#api-command}

### Bash-completion {#bash-completion}

Prints all of the commands and options to the standard output.

		eon bash-completion


##vCenter Commands{#vcenter-commands}

###List vCenters {#list-vcenters}

You can view the list of vCenters in your cloud environment. 


    eon vcenter-list 


###View vCenter details {#view-vcenter-details}

You can view the details of the specific vCenter. 

	eon vcenter-show <VCENTER_ID>


### Add vCenter {#add-vcenter}

You can add the vCenter to the EON database. You must enter all the arguments to add the vCenter, else you will be prompted for the same. 

	eon vcenter-add --name <VCENTER_NAME> --ip-address <VCENTER_IP> --username <VCENTER_USERNAME> --password <VCENTER_PASSWORD> --port <VCENTER_PORT> --proxy-config-file <VCENTER_PROXY_CONFIG_FILE>


**Note**: You can add only three vCenters.

 * &lt;VCENTER_NAME>: Name of the vcenter 
                        
 * &lt;VCENTER_IP>: IP address of the vcenter.
                         
 * &lt;VCENTER_USERNAME>: Username of the vcenter administrator. 
                       
 *  &lt;VCENTER_PASSWORD>: Password of the vcenter administrator.

 *  &lt;VCENTER_PORT>: Port of the vcenter. 

 * &lt;VCENTER&#095;PROXY&#095;CONFIG&#095;FILE>:  File location of the Proxy configuration.


### Update vCenter {#update-vcenter}

You can update the exisitng vCenter to the EON database. You must enter all the arguments to add the vCenter, else you will be prompted for the same. 

	eon vcenter-update [--name <VCENTER_NAME>] [--ip-address <VCENTER_IP>][--username <VCENTER_USERNAME>][--password <VCENTER_PASSWORD>][--port <VCENTER_PORT>]                       <VCENTER_ID>


### Delete vCenter {#delete-vcenter}

You can delete the vCenter from EON database.  

	eon vcenter-delete <VCENTER_ID>

In the vCenter you can import the cluster(s). One vCenter can have multiple cluster(s).

###List vswitch {#vswitch-list}        
You can view the list of vswitches of vCenter.

    eon vswitch-list <VCENTER_ID>


###View vswitch details {#vswitch-show}        

You can view the vswitch details. It displays the ID of vcenter and MOID of vswitch.

	 eon vswitch-show --vswitch-moid <VSWITCH_MOID> <VCENTER_ID>


### Host details {#host-details}

You can view the list of hosts of cluster details of the host when cluster moid is specified.

	 eon host-list --vcenter-id <VCENTER_ID> [--clusters <CLUSTER_MOIDS> [<CLUSTER_MOIDS> ...]]

##Cluster Commands {#cluster-command}

###List clusters {#list-clusters}

You can view the list of clusters available for the given vCenter. 

	eon cluster-list --vcenter-id <VCENTER_ID>


###View cluster details {#view-cluster-details}

You can view of the details of the specific cluster. 

	 eon cluster-show --vcenter-id <VCENTER_ID> --cluster-moid <CLUSTER_MOID>


###Import clusters {#import-cluster}

You can import the clusters in the EON database under the give vCenter. 

	 eon import-cluster --vcenter-id <VCENTER_ID> --cluster-name <CLUSTER_NAME> --cluster-moid <CLUSTER_MOID>


###Update a cluster {#cluster-update}

You can update the cluster details. 

	eon cluster-update --vcenter-id <VCENTER_ID> --cluster-moid <CLUSTER_MOID> --state <STATE>


###Unimport clusters {#unimport-clusters}

You can unimport the cluster(s) from the EON database under the give vCenter. To unimport  clusters, enter

	eon unimport-cluster --vcenter-id <VCENTER_ID> --cluster-moid <CLUSTER_MOID>


###Activate clusters {#activate-clusters}
You can activate the clusters using the following:

	 eon activate-clusters --vcenter-id <VCENTER_ID> --clusters <CLUSTER_MOIDS> [<CLUSTER_MOIDS> ...]


### Deactivate clusters {#deactivate-clusters}
You can deactivate clusters.   

 	eon deactivate-clusters --vcenter-id <VCENTER_ID> --clusters <CLUSTER_MOIDS> [<CLUSTER_MOIDS> ...]

            

##Compute Proxy Commands {#proxy-command}

###List of compute proxy {#compute-proxy-list}  

You can view the list of compute proxy.

		eon compute-proxy-list


### Restore proxy{#restore-proxy}       

Recreates the Compute Proxy virtual machine with a previously activated clusters.

		eon restore-proxy <VCENTER_ID>


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


##Required Options {#optional-arguments}
The following options must be supplied as arguments or as environment variables.

###OS username {#os-username}
Username of the keystone (OpenStack). Defaults to env[OS_USERNAME].
  
	--os-username OS_USERNAME
                        
 
###OS password{#os-password}
Password of the keystone (OpenStack).  Defaults to env[OS_PASSWORD].
	
	 --os-password OS_PASSWORD
                       
 
###OS tenant ID{#os-tenant-id}
Tenant identification of the OpenStack. Defaults to env[OS&#095;TENANT&#095;ID].

	--os-tenant-id OS_TENANT_ID
                                           
 
###OS authentication URL{#os-auth-url}
Authentication URL of OpenStack. Defaults to env[OS&#095;AUTH&#095;URL].
 
	 --os-auth-url OS_AUTH_URL

###OS authenticationtoken{#os-auth-token}
Authentication token of OpenStack. Defaults to env[OS&#095;AUTH&#095;TOKEN].

  	--os-auth-token OS_AUTH_TOKEN



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
