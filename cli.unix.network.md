---
layout: default
title: "UNIX CLI Network Examples"
permalink: /cli/unix/network/
product: unix-cli

---
# UNIX CLI Network Examples

This page gives you a few examples of how to perform various network tasks using the HP Cloud service.  This page discusses the following tasks:

* [Network Commands (Next Generation)](#NetworkCommands)
* [Subnet Commands (Next Generation)](#SubnetCommands)
* [Ports Commands (Next Generation)](#PortsCommands)
* [Router Commands (Next Generation)](#RouterCommands)
* [Security Group Commands](#SecurityGroupCommands)
* [Security Group Rule Commands](#SecurityGroupRuleCommands)
* [Addresses or Floating IP Commands](#AddressesorFloatingIPCommands)

Remember that you can get detailed help for any command or task with the following command:

    $ hpcloud help <TASK>

##Network Commands (Next Generation)## {#NetworkCommands}

The ability to list, add, update and delete networks is a next generation feature.  It may not be available everywhere.

Add a new network:

    $ hpcloud networks:add netty -u 
    Created network 'netty' with id '3136e453'.

List networks:

    $ hpcloud networks
      +----------+---------+--------+--------+-------------+-------------------+
      | id       | name    | status | shared | admin_state | subnets           |
      +----------+---------+--------+--------+-------------+-------------------+
      | 3136e453 | netty   | ACTIVE |        | up          |                   |
      | ca07e0fd | Ext-Net | ACTIVE |        | up          | ba5d9360          |
      | d1a803d8 | net2    | ACTIVE |        | up          | 552f58c5,c1fe3db3 |
      +----------+---------+--------+--------+-------------+-------------------+

Remove a network:

    $ hpcloud networks:remove netty 
    Removed network 'netty'.

##Subnet Commands (Next Generation)## {#SubnetCommands}

The ability to list, add, update and delete subnets is a next generation feature.  It may not be available everywhere.

Add a subnet:

    $ hpcloud subnets:add subby netty 100.1.1.1/32 -d
    Created subnet 'subby' with id '28adaad7'.

Listing subnets:

    $ hpcloud subnets
      +----------+-----------+------------+--------------+-------------+--------+-----------+------+
      | id       | name      | network_id | cidr         | nameservers | routes | gateway   | dhcp |
      +----------+-----------+------------+--------------+-------------+--------+-----------+------+
      | 552f58c5 | 127.1.0.0 | d1a803d8   | 127.1.0.0/24 |             |        | 127.0.0.1 | true |
      | 28adaad7 | subby     | d1a803d8   | 127.2.0.0/24 |             |        | 127.0.0.1 | true |
      +----------+-----------+------------+--------------+-------------+--------+-----------+------+

Update a subnet:

    $ hpcloud subnets:update subby -g 100.1.1.1
    Updated subnet 'subby'.

Remove a subnet:

    $ hpcloud subnets:remove subby
    Removed subnet 'subby'.

##Ports Commands (Next Generation)## {#PortsCommands}

The ability to list, add, update and delete ports is a next generation feature.  It may not be available everywhere.

Add a port:

    $ hpcloud ports:add puerto netty
    Created port 'puerto' with id 'bae8761f'.

Listing ports:

    $ hpcloud ports
      +----------+--------+------------+--------------------+-------------------+--------+-------------+--------------+--------------+
      | id       | name   | network_id | fixed_ips          | mac_address       | status | admin_state | device_id    | device_owner |
      +----------+--------+------------+--------------------+-------------------+--------+-------------+--------------+--------------+
      | bae8761f | puerto | 3136e453   | 552f58c5,127.1.0.1 | fa:16:3e:ba:64:5e | ACTIVE | up          | dhcpb3abdef0 | network:dhcp |
      +----------+--------+------------+--------------------+-------------------+--------+-------------+--------------+--------------+

Remove a port:

    $ hpcloud ports:remove puerto
    Removed port 'puerto'.

##Router Commands (Next Generation)## {#RouterCommands}

The ability to list, add, update and delete routers is a next generation feature.  It may not be available everywhere.

Add a router to a network:

    $ hpcloud routers:add routee -g netty
    Created router 'routee' with id 'edfb8af0'.

Listing routers:

    $ hpcloud routers
      +----------+--------+-------------+--------+----------+
      | id       | name   | admin_state | status | gateway  |
      +----------+--------+-------------+--------+----------+
      | edfb8af0 | routee | up          | ACTIVE | ca07e0fd |
      +----------+--------+-------------+--------+----------+

Add an router interface:

    $ hpcloud routers:interface:add routee puerto
    Created router interface 'routee' to 'puerto'.

Remove an router interface:

    $ hpcloud routers:interface:remove routee puerto
    Removed port interface 'routee' from 'puerto'.

Remove a router:

    $ hpcloud routers:remove routee
    Removed router 'routee'.

##Security Group Commands## {#SecurityGroupCommands}

To list security groups:

    $ hpcloud securitygroups
      +----------+---------+-------------+
      | id       | name    | description |
      +----------+---------+-------------+
      | 8998f1b2 | default | default     |
      | d4241424 | noo     | new         |
      +----------+---------+-------------+


To add a new security group:

    $ hpcloud securitygroups:add groupo "my sec group desciption"
    Created security group 'groupo'.

To remove an existing security group:

    $ hpcloud securitygroups:remove groupo
    Removed security group 'groupo'.

##Security Group Rule Commands## {#SecurityGroupRuleCommands}

To list rules for an existing security group:

    $ hpcloud securitygroups:rules foo
      +----------+----------+------+----------+-----------+------+----+
      | id       | source   | type | protocol | direction | from | to |
      +----------+----------+------+----------+-----------+------+----+
      | 2e6c0a89 |          | IPv6 | icmp     | egress    |      |    |
      | eaa02bf0 | 8998f1b2 | IPv6 | tcp      | egress    | 80   | 80 |
      +----------+----------+------+----------+-----------+------+----+


To add a new rule to an existing security group:

    $ hpcloud securitygroups:rules:add groupo icmp
    Created rule '1111' for security group 'groupo'.

    $ hpcloud securitygroups:rules:add groupo tcp -p 22..22
    Created rule '1112' for security group 'groupo'.

    $ hpcloud securitygroups:rules:add groupo tcp -p 80..80 -c "111.111.111.111/1"
    Created rule '1113' for security group 'groupo'.

    $ hpcloud securitygroups:rules:add groupo tcp -p 3389..3389 # Allow RDP
    Created rule '1113' for security group 'groupo'.

To remove an existing rule from a security group:

    $ hpcloud securitygroups:rules:remove groupo 1111
    Removed rule '1111' for security group 'groupo'.

##Addresses or Floating IP Commands## {#AddressesorFloatingIPCommands}

To list addresses:

    $ hpcloud addresses

To add or allocate a new address:

    $ hpcloud addresses:add
    Created a public IP address '10.11.12.13'.

To associate an existing address to an existing port:

    $ hpcloud addresses:associate "10.11.12.13" puerto
    Associated address '10.11.12.13' to server 'puerto'.

To disassociate an existing address from a port:

    $ hpcloud addresses:disassociate "10.11.12.13" 
    Disassociated address '10.11.12.13' from any server instance.

To remove or release an existing address:

    $ hpcloud addresses:remove "10.11.12.13"
    Removed address '10.11.12.13'.
