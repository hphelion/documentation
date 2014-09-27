---
layout: default
title: "HP Helion OpenStack: Add and Remove Nodes"
permalink: /helion/openstack/ga/install/add/nodes/
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
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/prereqs/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/vsa/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&reg;: Add and Remove Nodes

This document describes the steps to Scale In Or Scale Out the VSA and Compute Nodes on an already installed Overcloud 
Prerequisite

Install Seed, undercloud and OverCloud using the EE Installer with USE_TRICKLE=1 which is default installation.
Scale Out Nodes
Scenario 1 - There are already pre-allocated empy baremetal nodes which were created during the first install and can be used for adding new nodes

    SSH to Seed VM

    Maintain the Scale Counts in environment variables file (env_vars) which is used during the initial installation (Big Bang Installation)

    To Scale Out vsa storage nodes, Update OVERCLOUD_VSA_STORAGESCALE to appropriale scale number.  For example - If there is already an existing VSA node, to add 1 more VSA node,
    export OVERCLOUD_VSA_STORAGESCALE=2

    To Scale Out vsa ao storage nodes, Update OVERCLOUD_VSA_AO_STORAGESCALE to appropriale scale number. For example - If there is already an existing VSA AO node, to add 1 more node,
    export OVERCLOUD_VSA_AO_STORAGESCALE=2

    To Scale Out compute nodes, Update OVERCLOUD_COMPUTESCALE  to appropriale scale number. For example - If there is already an existing Compute node, to add 1 more Compute node, 
    export OVERCLOUD_COMPUTESCALE=2

    Apply the configuration. Source the environment variables file updated in last Step. For example 
    source /root/env_vars

    Run the installer script
    bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud 2>&1 | tee update.log

    If because of some reason, the above command fails, try the alternative approach
    export OVERCLOUD_SCALE_NODES=1
    bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --skip-install-seed --skip-install-undercloud 2>&1 | tee update.log

Scenario 2 - User Adds a new baremetal which is not pre-allocated during the initial install.

On a BareMetal Install

    SSH to Undercloud VM

    Register the new baremetal in Ironic database. Replace the cpus, memory_mb,local_gb,ipmi_address, ipmi_password with your baremetal settings
    ironic node-create -d pxe_ipmitool -p cpus=12 -p memory_mb=98304 -p local_gb=1800 -p
    cpu_arch=amd64 -i ipmi_address=10.22.28.73 -i ipmi_username=admin -i
    ipmi_password=helion_001

    Create the ironic port for the ironic node created in previous step
    ironic port-create --address $MAC_ADDR --node_uuid $NODE_UUID
    Make the respective baremetal entry in /root/baremetal.csv which exists in Seed VM.
    Execute the Steps in Scenario 1

On a Virtual Install ( Only for Internal Use & Not for Customers )

    Create a new VM with the same properties as the existing VMs. For that copy the attached Scripts (create-vm.sh, configure-vm, vm.xml) on KVM Host and execute create_vm.sh. Change the name of the baremetal in create_vm.sh before executing.
    SSH to Undercloud VM

    Register the new baremetal in Ironic database. Replace the cpus, memory_mb, local_gb, ssh_address, ssh_username with your baremetal settings
    ironic node-create -d pxe_ssh -i ssh_virt_type=virsh  -i ssh_address=192.168.122.1  -i ssh_username=root -i
    ssh_key_filename=/mnt/state/var/lib/ironic/virtual-power-key -p cpus=1 -p
    memory_mb=8192 -p cpu_arch=amd64 -p local_gb=513

    Create the ironic port for the ironic node created in previous step
    ironic port-create --address $MAC_ADDR --node_uuid $NODE_UUID
    Make the respective baremetal entry in /root/baremetal.csv which exists in Seed VM.
    Execute the Steps in Scenario 1

Scale In  Nodes

    SSH to Undercloud VM

    Get the ID of the node to be deleted by executing
    nova list

    Get the Ironic Node UUID 
    ironic node-list | grep <node ID in last step>

    Get the MAC Address 
    ironic node-port-list <Ironic Node UUID>

    Get the heat stack to be deleted for the particular Node
    heat stack-list

    Delete the particular  Stack
    heat stack-delete <Stack to be Deleted>

    If the deleted  Node has gone bad and needs to be removed from ironic
    ironic node-delete <UUID from Step 3>

    Perform this Step only for Nova Compute Node 

    SSH to Controller0. Disable the particular Nova Compute on the Controller
    nova-manage service disable --service=nova-compute --host=<hostName of Compute Node>
    Remove the entry from /root/baremetal.csv which has the MAC Address retrieved in Step 4 ( Note: /root/baremetal.csv exists in Seed VM )
    Also reduce OVERCLOUD_VSA_STORAGESCALE/OVERCLOUD_VSA_AO_STORAGESCALE/OVERCLOUD_COMPUTESCALE in /root/env_vars(environment variables file) on the Seed VM, so that next time a node is added, the installer doesn't try to add the deleted node. (Note: /root/env_vars file exists in Seed VM)

Trouble Shooting

While adding VSA and compute nodes, sometimes the stack ovecloud_ce_controller is in UPDATE_IN_PROGRESS for a long time. Once the Critical defect  EEIN-42 - When updating an existing Cloud, trickle will call "stack-update" on stacks that have no changes is resolved, the issue will go away.

To troubleshoot, perform the following steps

    SSH to all 3 controllers

    Check the mysql service. If it is stopped, restart 
    service mysql restart

    Look into /var/log/upstart/os-collect-config.log. If it is stuck at restarting rabbitmq, kill all the rabbitmq instances 
    ps -ef | grep rabbitmq
    pkill -u rabbitmq

    Remove 
    rm -rf /mnt/state/var/lib/rabbitmq
    os-refresh-config

     


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

     
