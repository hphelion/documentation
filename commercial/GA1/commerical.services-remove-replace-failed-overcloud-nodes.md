---
layout: default
title: "HP Helion OpenStack&#174; Removing and replacing a failed Overcloud Controller"
permalink: /helion/openstack/removing/failedovercloud/101/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/">&#9664; PREV | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/faq/">NEXT &#9654; </a></p>
-->

#Remove and Replace a Failed OverCloud Controller

The 3 node OverCloud Controller cluster provide the highly available cloud control plane. For single point of failure, HOS allows you to recover any one of the OverCloud Controller node. 

If your deployed operating cloud incurs an irrecoverable hardware failure in one of the Controller Servers, you must do the following:

* de-commission the failed server
* add a new server into your cloud and redeploy the replacement Controller on it
* re-connect the replaced Controller into the 3 node Controller cluster


The following section provides the detailed instructions to replace a failed controller nodes.

* [Removing and replacing a failed management controller node](#removemgt)

* [Removing and replacing a failed controller1 node](#removecontroller1)

* [Removing and replacing a failed controller0 node](#removecontroller0)


## Removing and replacing a failed management controller node {#removemgt}

Perform the following steps to remove and replace the failed management controller node.

1. [Prepare to remove the node](#prepremovenode)
2. [Update the stack with the removed management controller node](#updatedremovemgt)
3. [Update the heat stack with a new management controller](#updatednewmgt)
4. [Remove the failed nodes from ironic](#removeironic)


**Note**: The following instructions are based on the default install and alteration of any of the commands or variables is not required, unless stated otherwise.

### Prepare to remove the node {#prepremovenode}

1. Login to seed

		ssh root@<seed_cloud_host_IP>

2. Execute the following command to set the required parameters and environment variables
 
		export TRIPLEO_ROOT=~root/tripleo
		export TE_DATAFILE=$TRIPLEO_ROOT/ce_env.json
		export PATH=$PATH:$TRIPLEO_ROOT/bin:$TRIPLEO_ROOT/tripleo-incubator/scripts
		source $TRIPLEO_ROOT/tripleo-incubator/undercloudrc
		OVERCLOUD_EXTRA_CONFIG=$(hp_ced_load_passthrough.sh -v -p overcloud -x overcloud-compute)

3. Remove the failed node from the rabbit cluster

		rabbitmqctl cluster_status # show the name of the failed controller
		rabbitmqctl forget_cluster_node <node> # the full rabbit name of the failed node as it appeared in the above output (including 'rabbit@..')

4. Execute the following command

		source ~root/tripleo/tripleo-incubator/undercloudrc
		# set the nova node id for use later
		failed_node_id=$(nova list --minimal | grep Mgmt | cut -d '|' -f 2)
		ironic_failed_node_id=$(ironic node-show --instance $failed_node_id | grep " uuid" | cut -f3 -d"|" | sed 's/\s//')

5. Execute the following command on both controller0 and controller1 to allow the cluster to shut down/restart by reducing the minimum size

		sed -i 's/-lt 3/-lt 2/' /opt/stack/os-config-refresh/post-configure.d/51-rabbitmq


### Update the stack with the removed management controller node {updatedremovemgt}

1. Edit `~/no-mgmt.env.json` and generate the necessary heat parameters.

		outfile=~/no-mgmt.env.json
		yaml=~root/tripleo/tripleo-heat-templates/overcloud-ce-no-mgmt.yaml
		env_in=~root/tripleo/overcloud-env.json
		params=$(sed -r -f - -n $yaml <<EOF
		/^Parameters/,/^Resources/ {
		    /^\s\s\w/ {
		        s/\s\s(.*):/\1/
		        /ExtraConfig/d
		        p
		    }
		}
		EOF
		)
		json_in=$(jq . $env_in)
		json_out='{"parameters":{}}'
		for p in $params; do
		    val=$(jq .parameters.${p} <<< $json_in)
		    json_out=$(jq ".parameters = .parameters + {\"${p}\": $val}" <<< $json_out )
		done
		jq . <<<$json_out > $outfile

2. Update the heat stack with the removed management controller node.

		heat stack-update -e ~/no-mgmt.env.json \
		-t 360 \
		-f $TRIPLEO_ROOT/tripleo-heat-templates/overcloud-ce-no-mgmt.yaml \
		-P "ExtraConfig=${OVERCLOUD_EXTRA_CONFIG}" \
		overcloud-ce-controller
		watch -d heat stack-list
	
	It takes several minutes to complete the update. On the completion of updates the management controller is removed from the heat configuration.

###Update the heat stack with a new management controller {updatednewmgt}

1. Edit `~/with-mgmt.env.json` to generate the necessary heat parameters.

		outfile=~/with-mgmt.env.json
		yaml=~root/tripleo/tripleo-heat-templates/trickle/overcloud-ce-controller
		env_in=~root/tripleo/overcloud-env.json
		params=$(sed -r -f - -n $yaml <<EOF
		/^Parameters/,/^Resources/ {
		    /^\s\s\w/ {
		        s/\s\s(.*):/\1/
		        /ExtraConfig/d
		        p
		    }
		}
		EOF
		)
		json_in=$(jq . $env_in)
		json_out='{"parameters":{}}'
		for p in $params; do
		    val=$(jq .parameters.${p} <<< $json_in)
		    json_out=$(jq ".parameters = .parameters + {\"${p}\": $val}" <<< $json_out )
		done
			jq . <<<$json_out > $outfile

2. Update the heat stack to provision a new management controller.

		heat stack-update -e ~/with-mgmt.env.json \
		-t 360 \
		-f $TRIPLEO_ROOT/tripleo-heat-templates/trickle/overcloud-ce-controller \
		-P "ExtraConfig=${OVERCLOUD_EXTRA_CONFIG}" \
		overcloud-ce-controller
		watch -d heat stack-list

	It takes several minutes to complete the update. When the overcloud-ce-controller stack status reaches UPDATE_COMPLETE, the stack is ready for use, with the replacement management controller node.

### Remove the failed nodes from ironic {#removeironic}

1. Execute the following command to remove the failed nodes from ironic.

		# show the failed node in ironic (using the failed_node_id variable from above)
		ironic node-show --instance $failed_node_id
		# remove the failed node from ironic, using the uuid
		ironic node-delete $ironic_failed_node_id

2.   Remove the nova service entries for the failed controller. Execute the following command on the new management node.

		# display service list for management controllers, including only the failed ones
		nova-manage service list | grep mgmt | grep XXX
		# set a variable to the failed host name from above
		failed_host=<name>
		# remove the failed node
		nova-manage service disable --service=nova-conductor --host=$failed_host
		nova-manage service disable --service=nova-cert --host=$failed_host
		nova-manage service disable --service=nova-scheduler --host=$failed_host
		nova-manage service disable --service=nova-consoleauth --host=$failed_host

3. Login to undercloud to remove the failed node from Icinga monitoring.

		 ssh heat-admin@<undercloud IP>
		cd /etc/check_mk/conf.d
		# when running the command below, replace <ip of failed controller> with the ip address
		rm <ip of failed controller>.mk
		# show the monitored hosts
		check_mk --list-hosts  

4. Execute the following command to restore minimum cluster size on both the controller nodes (Controller0 and Controller1)

		sed -i 's/${TOTAL_NODES} -lt 2/${TOTAL_NODES} -lt 3/' /opt/stack/os-config-refresh/post-configure.d/51-rabbitmq

 
##Removing and replacing a failed controller1 node {#removecontroller1}

Perform the following steps to remove and replace a failed controller1 node.




###Remove the failed controller1 node

1. Login to seed as root.

		sudo su -

2. Execute the following command on the management node

		sed -i 's/-lt 3/-lt 2/' /opt/stack/os-config-refresh/post-configure.d/51-rabbitmq

3. Execute the following command on the controller0

	sed -i 's/-lt 3/-lt 2/' /opt/stack/os-config-refresh/post-configure.d/51-rabbitmq

4.  Execute the following command to set the required parameters and environment variables. You can replace the `OVERCCLOUD_NTP_SERVER` with an NTP server of your choice.

		export OVERCLOUD_NTP_SERVER=16.110.135.123 # Use an NTP server appropriate for your environment
		export TRIPLEO_ROOT=~root/tripleo
		export TE_DATAFILE=$TRIPLEO_ROOT/ce_env.json
		export PATH=$PATH:$TRIPLEO_ROOT/bin:$TRIPLEO_ROOT/tripleo-incubator/scripts
		source $TRIPLEO_ROOT/tripleo-incubator/undercloudrc
		OVERCLOUD_EXTRA_CONFIG=$(hp_ced_load_passthrough.sh -v -p overcloud -x overcloud-compute)
		COMPUTESCALE=`cat ~/tripleo/ce_env.json | jq '.overcloud.computescale' | sed  -e "s/\"//g"`
		SOSWIFTPROXYSCALE=`cat ~/tripleo/ce_env.json | jq '.overcloud.soswiftproxyscale' | sed  -e "s/\"//g"`
		SOSWIFTSTORAGESCALE=`cat ~/tripleo/ce_env.json | jq '.overcloud.soswiftstoragescale' | sed  -e "s/\"//g"`
		SWIFTSTORAGESCALE=`cat ~/tripleo/ce_env.json | jq '.overcloud.swiftstoragescale' | sed  -e "s/\"//g"`
		VSASTORAGESCALE=`cat ~/tripleo/ce_env.json | jq '.overcloud.vsastoragescale' | sed  -e "s/\"//g"`

5. Generate a template with the removed controller0 and update the stack

		make -f Makefile-trickle -C /root/tripleo/tripleo-heat-templates overcloud-ce.yaml SWIFTSTORAGESCALE=$SWIFTSTORAGESCALE COMPUTESCALE=$COMPUTESCALE CONTROLSCALE=1 VSASTORAGESCALE=$VSASTORAGESCALE SOSWIFTSTORAGESCALE=$SOSWIFTSTORAGESCALE SOSWIFTPROXYSCALE=$SOSWIFTPROXYSCALE
		prep-for-trickle -z /root/tripleo/tripleo-heat-templates/trickle/overcloud-ce-controller stack-update -e /root/tripleo/overcloud-env.json -t 360 -f /root/tripleo/tripleo-heat-templates/overcloud-ce.yaml -P "ExtraConfig=${OVERCLOUD_EXTRA_CONFIG}" overcloud-ce-controller
		 
6. Verify the update completion

		watch -d heat stack-list

When the overcloud-ce-controller stack status reaches UPDATE_COMPLETE, the stack is ready for use, with the replacement management controller node.


### Provision the stack with a new controller1

1. Increase the number of controllers and run a stack-update.

		export OVERCLOUD_CONTROLSCALE=2
		cd ~root  
		bash tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud --skip-demo
When the stack reaches UPDATE_COMPLETE status, the replacement of the failed node is complete. 

2. After stack update is complete, run the following command on both controller0 and management controller. 

		sed -i 's/${TOTAL_NODES} -lt 2/${TOTAL_NODES} -lt 3/' /opt/stack/os-config-refresh/post-configure.d/51-rabbitmq




##Removing and replacing a failed controller0

Login to seed and perform the following steps to remove and replace a failed controller1 node.


###Remove the failed controller0 node {#removecontroller0}

1. Login to seed as root.

		sudo su -
2. Execute the following command on the controller0 node

		service rabbitmq-server stop


3. Execute the following command on the management controller node

		sed -i 's/-lt 3/-lt 2/' /opt/stack/os-config-refresh/post-configure.d/51-rabbitmq
		rabbitmqctl cluster_status
		rabbitmqctl forget_cluster_node <rabbit@..>'

(Above Check for controller0 name (Example: rabbit@... ) with cluster_status)

4. Execute the following command on the controller0

		sed -i 's/-lt 3/-lt 2/' /opt/stack/os-config-refresh/post-configure.d/51-rabbitmq
		mkdir -p /mnt/state/var/lib/boot-stack/
		touch /mnt/state/var/lib/boot-stack/init-openstack.ok


5. Execute the following command to set the required parameters and environment variables. You can replace the `OVERCCLOUD_NTP_SERVER` with an NTP server of your choice.

		export OVERCLOUD_NTP_SERVER=16.110.135.123 # Use an NTP server appropriate for your environment
		export TRIPLEO_ROOT=~root/tripleo
		export TE_DATAFILE=$TRIPLEO_ROOT/ce_env.json
		export PATH=$PATH:$TRIPLEO_ROOT/bin:$TRIPLEO_ROOT/tripleo-incubator/scripts
		source $TRIPLEO_ROOT/tripleo-incubator/undercloudrc
		OVERCLOUD_EXTRA_CONFIG=$(hp_ced_load_passthrough.sh -v -p overcloud -x overcloud-compute)
		COMPUTESCALE=`cat ~/tripleo/ce_env.json | jq '.overcloud.computescale' | sed  -e "s/\"//g"`
		SOSWIFTPROXYSCALE=`cat ~/tripleo/ce_env.json | jq '.overcloud.soswiftproxyscale' | sed  -e "s/\"//g"`
		SOSWIFTSTORAGESCALE=`cat ~/tripleo/ce_env.json | jq '.overcloud.soswiftstoragescale' | sed  -e "s/\"//g"`
		SWIFTSTORAGESCALE=`cat ~/tripleo/ce_env.json | jq '.overcloud.swiftstoragescale' | sed  -e "s/\"//g"`
		VSASTORAGESCALE=`cat ~/tripleo/ce_env.json | jq '.overcloud.vsastoragescale' | sed  -e "s/\"//g"`



6. Generate a template with the removed controller0 and update the heat stack

		make -f Makefile-trickle -C /root/tripleo/tripleo-heat-templates overcloud-ce.yaml SWIFTSTORAGESCALE=$SWIFTSTORAGESCALE COMPUTESCALE=$COMPUTESCALE CONTROLSCALE=1 VSASTORAGESCALE=$VSASTORAGESCALE SOSWIFTSTORAGESCALE=$SOSWIFTSTORAGESCALE SOSWIFTPROXYSCALE=$SOSWIFTPROXYSCALE
		cd /root/tripleo/tripleo-heat-templates/trickle
		sed -i 's/controller0/controller1/g' overcloud-ce-controller
		prep-for-trickle -z /root/tripleo/tripleo-heat-templates/trickle/overcloud-ce-controller stack-update -e /root/tripleo/overcloud-env.json -t 360 -f /root/tripleo/tripleo-heat-templates/overcloud-ce.yaml -P "ExtraConfig=${OVERCLOUD_EXTRA_CONFIG}" overcloud-ce-controller
		watch -d heat stack-list

When the stack reaches UPDATE_COMPLETE status, the replacement of the failed node is complete.


###Provision the stack with a new controller0

1. Set the number of controllers to two and update the stack

		export OVERCLOUD_CONTROLSCALE=2
		cd ~root 
		tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud --skip-demo

When the stack reaches UPDATE_COMPLETE status, the replacement of the failed node is complete. 


2. Once stack update is complete, execute the following command on controller1 and management controller:

		sed -i 's/${TOTAL_NODES} -lt 2/${TOTAL_NODES} -lt 3/' /opt/stack/os-config-refresh/post-configure.d/51-rabbitmq


3. On controller0, run the following:

		/etc/init.d/mysql stop
		/etc/init.d/mysql start


