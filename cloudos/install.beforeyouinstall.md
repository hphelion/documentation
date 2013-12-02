---
layout: default
title: "Cloud OS Installation - Before You Install"
permalink: /cloudos/install/before-you-install/
product: cloudos

---

# Cloud OS Installation - Before You Install

Before you can start working in the HP Cloud OS Operational Dashboard, you must set up the VM guest and boot the Admin Node from the HP Cloud OS ISO. 

## Set Up the VM Guest

The Admin Node can only be installed on a virtual machine. Here are general guidelines for creating a virtual machine in an existing or a new hypervisor infrastructure:

1. Configure the hypervisor host's network. The host must provide connectivity to the Virtual Machine guest on an isolated private network to all the bare-metal nodes' port eth0. And, the guest must also have connectivity to a routable network for Internet access.

2. Create a virtual machine with the hardware configuration suggested in "Plan Server, Network and Storage Infrastructure for a Cloud" ( link ) . The following configuration must be
reviewed during this step:

 a. Ensure the guest's primary NIC is bridged or connected to the admin network and the second NIC is bridged or connected to a routable network for Internet access.

 b. For the disk configuration, the default Disk bus type/controller uses proprietary technology. Ensure you set that to the IDE/SCSI type.
 
 c. If your hypervisor is KVM, ensure the virt type is set to KVM.
 
3. Download the Cloud OS ISO to the host's local file system or data store.

4. Configure the VM guest to point to the ISO as a CD/DVD drive or install media ISO image. 

## Boot the Admin Node Using the HP Cloud OS ISO

To boot the Admin Node using the ISO:

1. Power ON the virtual machine and open up its console.

2. (Optional) Power DOWN the Admin Node VM, edit it to disconnect the ISO CD, then Power UP the VM.

The Operational Dashboard has been successfully installed on the Admin Node.

## Launch the Operational Dashboard

After you boot from the HP Cloud OS ISO, you are ready to launch the Operational Dashboard to set up the Admin
Node.

To launch the Operational Dashboard:

1. From the virtual machine client, open a browser that does not have a proxy set.

2. On the browser, enter http://192.168.124.10:9000 to launch the Operational Dashboard user interface. IMPORTANT: Use Google Chrome or Mozilla Firefox to access the Admin Node.

3. On the Environment tab, review the types of servers, connections, and networks in your environment.

## Next Step

Now proceed to the instructions where you will [set the Admin Node prerequisites](/cloudos/install/set-admin-node-prerequisites/).  




