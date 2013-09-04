---
layout: default
title: "HP Cloud Services Ruby Fog Networking Examples"
permalink: /v13/bindings/fog/networking/
product: fog

---
#Ruby Fog Bindings Networking Examples

The HP Public Cloud provides networking support using two abstractions - [a model layer](#ModelLayer) and [a request layer](#RequestLayer). Both layers are detailed below.  The code samples on this page can be executed from within a Ruby console (IRB):

        irb

This page discusses the following topics:

* [Connecting to the Service](#ConnectingtotheService)<br>
**Model Layer Examples**
* [Network Operations](#ModelNetworks)
* [Subnet Operations](#ModelSubnets)
* [Port Operations](#ModelPorts)
* [Router Operations](#ModelRouters)
* [Security Group Operations](#ModelSecurityGroups)
* [Security Group Rules](#ModelSecurityGroupRules)
* [Floating IPs](#ModelFloatingIPs)
<br>
**Request Layer Examples**
* [Network Operations](#RequestNetworks)
* [Subnet Operations](#RequestSubnets)
* [Port Operations](#RequestPorts)
* [Router Operations](#RequestRouters)
* [Security Group Operations](#RequestSecurityGroups)
* [Security Group Rules Operations](#RequestSecurityGroupRules)
* [Floating IPs Operations](#RequestFloatingIPs)

##Connecting to the Service## {#ConnectingtotheService}

For information on connecting to the service, please see the [Connecting to the HP Cloud Service](/bindings/fog/connect) page.

##Network Operations (Model Layer)## {#ModelNetworks}

1. List networks:

        conn.networks

2. List network using a filter:

        conn.networks.all({"router:external"=>true})

3. Obtain a network by ID:

        conn.networks.get("network_id")

4. Create a network:

        conn.networks.create(:name => "My Slick Network")

5. Delete a network:

        conn.networks.get("network_id").destroy

##Subnet Operations (Model Layer)## {#ModelSubnets}

1. List subnets:

        conn.subnets

2. List subnets using a filter:

        conn.subnets.all({:gateway_ip => "12.0.0.1"})

3. Create a subnet:

        conn.subnets.create(
                :network_id => "network_id",
                :cidr => "12.0.3.0/24",
                :ip_version => 4,
                :name => "My Subnet Model 1"
                )

4. Obtain a subnet by ID:

        conn.subnets.get("subnet_id")

5. Assign a DNS server to a subnet:

        subnet = conn.subnets.get("subnet_id")
        subnet.dns_nameservers = ["dns_ip"]
        subnet.save

6. Delete a subnet:

        conn.subnets.get("subnet_id").destroy

##Port Operationss (Model Layer)## {#ModelPorts}

1. List ports:

        conn.ports

2. List ports using a filter:

        conn.ports.all({:mac_address => "mac_address"})

3. Create a port:

        conn.ports.create(
                :name => "Port Model 1",
                :network_id => "network_id"
                )

4. Obtain a port by ID:

        conn.ports.get("port_id")

5. Deletw a port:

        conn.ports.get("port_id").destroy

##Router Operations (Model Layer)## {#ModelRouters}

1. List routers:

        conn.routers

2. List routers using a filter:

        conn.routers.all({:name => "Router 1"})

3. Obtain a router by ID:

        router = conn.routers.get("router_id")

4. Create a router:

        router = conn.routers.create(
                :name => "Router Model 1",
                :admin_state_up => true
                )

5. Add a router interface using a subnet:

        network = router.add_interface("network_id", nil)
        conn.ports        # If you look at the ports, note that a new port is auto. created, the device_id is assigned to the router id, and the device_owner is updated

6. Remove a router interface using a subnet:

       network = router.remove_interface("id", nil)
       # Removing the interface also deletes the auto-created port

7. Add a router interface using a port:

        # Create a new port
        network = conn.ports.create(
                :name => "Port Model 1",
                :network_id => "network_id"
        )
        
        # Add a router interface using the port you created
        network = router.add_interface(nil, "port_id")
        
        # Port is updated with device_id and device_owner
        conn.ports.get("port_id")

8. Remove a router interface using a port:

        network = router.remove_interface(nil, "router_id")
        # after removing the interface, the associated port is deleted

9. Delete a router:

        network = router.destroy

##Security Group Operations (Model Layer)## {#ModelSecurityGroups}

1. List security groups:

        network = conn.security_groups

2. List security groups using a filter:

        network = conn.security_groups.all({:name => "My Security Group"})

3. Create a security group:

        network = conn.security_groups.create(
                :name => 'MySecurityGroup',
                :description => 'my security group description'
        )        
**Note:** That 2 security group rules are created by default for every new security group that is created; one 'ingress' and one 'egress' rule.

4. Obtain a security group by ID:

        network = conn.security_groups.get("security_group")

5. Delete a security group:

        network = conn.security_groups.get("security_group").destroy

##Security Group Rules Operations (Model Layer)## {#ModelSecurityGroupRules}

1. List security group rules:

        network = conn.security_group_rules

2. List security group rules using a filter:

        network = conn.security_group_rules.all({:direction => "ingress"})

3. Create a security group rule:

        network = conn.security_group_rules.create(
            :security_group_id => "secgrpid",
            :direction => 'ingress',
            :protocol => 'tcp',
            :port_range_min => 22,
            :port_range_max => 22,
            :remote_ip_prefix => '0.0.0.0/0'
        )

4. Obtain a security group by ID:

        network = conn.security_group_rules.get("server_id")

5. Delete a security group rule:

        network = conn.security_group_rules.get("SecurityGroupRule").destroy

##Floating IPs Operations (Model Layer)## {#ModelFloatingIPs}

1. List floating IPs:

        network = conn.floating_ips

2. List floating IPs using a filter:

        network = conn.floating_ips.all("fixed_ip_address" => "ip address")

3. Create a floating IP:

        network = conn.floating_ips.create(
        	:floating_network_id => "server_id"
        )

4. Obtain a floating IP by ID:

        network = conn.floating_ips.get("server_id")

5. Delete a floating IP:

        network = conn.floating_ips.get("server_id").destroy


##Network Operations (Request Layer)## {#RequestNetworks}

1. List networks:
2. List networks using a filter:
3. Obtain a network by ID:
4. Create a network:
5. Update a network:
6. Delete a network:

##Subnet Operations (Request Layer)## {#RequestSubnets}

1. List subnets:
2. List subnets using a filter:
3. Create a subnet:
4. Obtain a subnet by ID:
5. Update a subnet:
6. Assign a DNS server to a subnet:
7. Delete a subnet:

##Port Operations (Request Layer)## {#RequestPorts}

1. List ports:
2. List ports using a filter:
3. Obtain a port by ID:
4. Create a port:
5. Update a port:
6. Delete a port:

##Router Operations (Request Layer)## {#RequestRouters}

1. List routers:
2. List routers using a filter:
3. Obtain a router:
4. Create a router:
5. Update a router:
6. Delete a router:
7. Add a router interface using a subnet:
8. Remove a router interface using a subnet:
9. Add a router interface using a port:
10. Remove a router interace using a port:

##Security Group Operations (Request Layer)## {#RequestSecurityGroups}

1. List security groups:
2. List security groups using a filter:
3. Create a security group:
4. Obtain a security group by ID:
5. Delete a security group:


##Security Group Rules Operations (Request Layer)## {#RequestSecurityGroupRules}

1. List security group rules:
2. List security group rules using a filter:
3. Create a security group rule:
4. Obtain a security group rule by ID:
5. Delete a security group rule:


##Floating IPs Operations (Request Layer)## {#RequestFloatingIPs}

1. List floating IPs:
2. List floating IPs using a filter:
3. Create a floating IP:
4. Obtain a floating IP by ID:
5. Delete a floating IP:
