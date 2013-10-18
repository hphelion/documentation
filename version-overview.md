---
layout: default
title: "HP Cloud version 13.5 overview"
permalink: /version-overview/

---
# HP Cloud version 13.5 overview
HP Cloud Services bases our services on the open source cloud management project OpenStack. Our latest version of HP Cloud Compute runs the most recent version of OpenStack (Havana) that expands functionality and enhances the current capabilities of the existing services.  One of the most significant changes is the addition of our new networking capabilities based on the OpenStack Networking project Neutron with an SDN plugin from HP Networking. This new networking service provides enhanced network functionality and the ability to fine-tune and define your own virtual network.

In addition, you now have larger and more powerful instance types (sizes) to choose from--four times the size of the largest instances offered by most public clouds. And, our large, xlarge, and 2xlarge sizes are also offered in high memory versions. (See the [chart below](#sizes) for all available instance types.)

Since HP Cloud Compute version 13.5 is based on the latest code from the OpenStack community there are now separate Networking and Block Storage services with API endpoints independent from the HP Cloud Compute API.  In addition, the Image Management API is now exposed to users.  While you can continue to execute basic networking, block storage and image management commands through the HP Cloud Compute API, these newly exposed interfaces provide you even more control and allow you access to new advanced features. 

Finally, the new versions of these services will now be closely tracking upstream OpenStack. This means that HP Cloud Services will be releasing regular updates based on the latest tested and approved code submitted to OpenStack trunk, you'll always be working with the latest OpenStack code.

The sections below explain each piece of our service.

- [HP Cloud Compute](#Compute)
- [Availability Zones](#AZ)
- [Image Management](#Image)
- [Networking](#Network)
- [Block Storage](#BlockSt)

## HP Cloud Compute ## {#Compute}
Based on the OpenStack Nova project, the HP Cloud Compute service provides on-demand computing giving you the ability to provision and manage large clusters of instances (virtual machines). With the new version you have more flexibility to select the type of instance that meets the needs of your application without having to pay for additional resources.


###Instance types available### {#sizes}

| Size     | API Name            | RAM (GB) | # of Cores | Total HP CCUs | Disk Size |
| -------- | ------------------- | -------- | ---------- | ------------- | --------- |
| XS*      | standard.xsmall     | 1        | 1          | 1             | 20GB      |
| S        | standard.small      | 2        | 2          | 2             | 40GB      |
| M        | standard.medium     | 4        | 2          | 4             | 80GB      |
| L        | standard.large      | 8        | 4          | 8             | 160GB     |
| XL       | standard.xlarge     | 15       | 4          | 15            | 300GB     |
| 2XL      | standard.2xlarge    | 30       | 8          | 30            | 500GB     |
| 4XL      | standard.4xlarge**  | 60       | 12         | 60            | 900GB     |
| 8XL      | standard.8xlarge**  | 120      | 16         | 104           | 1800GB    |

**High memory versions**

| Size        | API Name         | RAM (GB) | # of Cores | Total HP CCUs | Disk Size |
| ----------- | ---------------- | -------- | ---------- | ------------- | --------- |
| High Mem-L  | highmem.large**  | 16       | 4          | 8             | 160GB     |     
| High Mem-XL | highmem.xlarge** | 30       | 4          | 15            | 300GB     |
| High Mem-2XL| highmem.2xlarge**| 60       | 8          | 30            | 500GB     |

*Running an extra small (XS) Windows instance requires a 30GB local disk. In order to run an XS Windows instance you must create a bootable block storage volume and run your Windows instance from this.

**New sizes/configurations

**Note:** An HP Cloud Compute Unit (CCU) is a unit of CPU capacity that describes the amount of compute power that a virtual core has available to it. Thus 6.5 CCUs are roughly equivalent to the minimum power of one logical core (a hardware hyper-thread) of an Intel&reg; 2012 Xeon&reg; 2.60 GHz CPU.

## Availability Zones ## {#AZ}
Each region--US East and US West--consists of three physically isolated availability zones in which you can create instances and/or block storage volumes. You can use resources spread across multiple availability zones to create an application with high availability.  When you work in a region, the following objects are region wide:

- Images
- Floating IPs
- Networking
- Security Groups
- SSH keys

If you start from the Management Console you can select the availability zone that you want your instance or volume to reside. You can also list and select availability zones from the API:

    $ nova availability-zone-list

    +----------+---------------+
    | Name     | Status        |
    +----------+---------------+
    | az1      | available     |
    | az2      | available     |
    | az3      | available     |
    +----------+---------------+
Using the API, you can also specify the availability zone when you create an instance or volume using `-availability_zone az#`

For example: `$ nova boot ... --availability-zone az1 ...`

If you don't specify an availability zone the compute or storage service automatically assigns one. So, if you do require redundancy for your virtual machines or volumes make sure to specify different availability zones for each.

**Important:** Volumes can only be attached to servers created in the same availability zone.

## Image Management ## {#Image}
With the new version of HP Cloud Compute the Image Management service, based on OpenStack Glance, is now exposed as a separate API endpoint. This provides for more control over images and we will be adding more functionality to this going forward.

## Networking ## {#Network}
HP Cloud v13.5 builds on the OpenStack Neutron service complemented with SDN technology from HP Networking to offer more robust networking capabilities and the ability to fine tune your network as needed. Spinning up a compute instance automatically configures

- A default network 
- A subnet
- A router connected to the subnet and externally to the Internet
- A security group with basic server options

Our [Networking API](/api/v13/networking/) or the [Management Console](/mc/compute/networks/) exposes a rich set of additional functionality including the ability to 

- Define and configure your own private Virtual L2 Networks
- Establish Virtual Private Network (VPN) connection to the networks you create 
- Specify IP address ranges and security group parameters that define the firewall rules for your instances
- Allocate and manage public floating IP addresses
- Connect to a specific network
- Connect an instance to more than one network

You also have the ability to set communication rules (security group rules) for both inbound and outbound traffic, create separate networks with their own IP address ranges, and control how servers connect to them.  As a region-wide service you have the ability to

- Use a single API endpoint per region 
- Connect networks in different Availability Zones to the same virtual L2 network
- Have your security groups span all Availability Zones in a region
- Map floating IP addresses to any Availability Zone in a region

## Block Storage ## {#BlockSt}
Block storage has always been available in the HP Cloud Compute service, but now HP Cloud provides it as a separate but integrated service based on OpenStack Cinder.  Block storage provides persistent, manageable volumes along with the ability to take a snapshot of a volume.   Bootable volumes can be created from images in the Image Management service and these bootable volumes can be used to create persistent instances.  The physical implementation of our storage solution is based on technology developed in HP labs and provides enterprise class volume availability.
