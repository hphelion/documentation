---
layout: default
title: "HP Helion OpenStack&#174; Tracking masked IP addresses"
permalink: /helion/openstack/maskedIP/
product: commercial.ga

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
# HP Helion 1.0 OpenStack&#174;: Tracking masked IP addresses when using network address translation (NAT)

Network Address Translation (NAT), also known as floating IP addresses, is a technique malicious users employ to mask their originating IP address.  Using NAT, a malicious user can attempt a masked attack on resources in your HP Helion OpenStack cloud.  

As a result of this IP address masking, you may receive notification of abuse that appears to originate at an IP address which is part of your own IP address range. 

Once you have detected such malicious activity, and if you can determine the user's NAT address, you may be able to identify the actual IP address using one of the following methods. These methods allow lookup of the Nova VM associated with the source of the abusive network traffic. 

## Method 1

1. Log in to the HP Helion OpenStack Commercial dashboard as cloud admin.

2. Select the project you want to work with.

3. Click the **Access & Security** link on the **Project** dashboard **Compute** panel.
4. The **Access & Security** page is displayed with four tabs, **Security Groups**, **Key Pairs**, **Floating IPs**, and **API Access**. 

4. Click the **Floating IPs** tab.

5. In the list of floating IPs, locate the IP where the malicious activity originated from and note the instance that this IP is assigned to.

6. Click the name of the instance in the list.	The **Instance Details** page displays. Using this information, you can now see all the details of the compromised instance. You may choose to shut it down, contact the instance owner to investigate further, or both.

## Method 2

1. Log in to the Controller node

2. For each tenant, run the command:   (Using 16.103.148.249 as an example IP address)

        neutron floatingip-list | grep "16.103.148.249" 

	which produces output similar to the following:

        | dc56c9ce-b126-4553-85f4-9a92fd7e8c43 | 192.168.4.4      | 16.103.148.249      | 262e4206-9713-4088-a6e9-928de30afa82 |

3. Capture the **fixed-IP** (in the second column) (eg.. 192.168.4.4) and **tenant id**.

4. Log in to the Compute node.

5. Run ***nova list*** for the captured tenant id and fixed-ip address using the command:

        nova --os-tenant-id=<tenant-id> list | grep "192.168.4.4"
    
    Producing output similar to the following:

        | 47c06647-375e-4bd6-8714-d6841840bd56 | test1 | ACTIVE | None       | Running     | n1=192.168.4.4, 16.103.148.249 |

6. Capture the nova id and get the details of the VM using the command:

        nova  --os-tenant-id=<tenant-id> show 47c06647-375e-4bd6-8714-d6841840bd56

Which produces output similar to the following:

	    +--------------------------------------+-------------------------------+
	    | Property                             | Value                         |
	    +--------------------------------------+-------------------------------+
	    | status                               | ACTIVE                        |
	    | updated                              | 2014-06-26T01:41:05Z          |
	    | OS-EXT-STS:task_state                | None                          |
	    | OS-EXT-SRV-ATTR:host                 | icehousecompute               |
	    | key_name                             | None                          |
	    | image                                | tty-linux (503cd8f1-ae6c ...)   |
	    | hostId                               | 091ce2ae798d669b1ec9cc53 ...    |
	    | OS-EXT-STS:vm_state                  | active                        |
	    | OS-EXT-SRV-ATTR:instance_name        | instance-0000000f             |
	    | OS-SRV-USG:launched_at               | 2014-06-26T01:41:22.000000    |
	    | OS-EXT-SRV-ATTR:hypervisor_hostname  | icehousecompute.example.com   |
	    | flavor                               | m1.tiny (1)                   |
	    | id                                   | 47c06647-375e-4bd6-8714 ...     |
	    | security_groups                      | [{u'name': u'default'}]       |
	    | OS-SRV-USG:terminated_at             | None                          |
	    | user_id                              | e888a6ffca9249bf810f73 ...      |
	    | name                                 | test1                         |
	    | created                              | 2014-06-26T01:40:59Z          |
	    | tenant_id                            | 408806a339b340e88d1b1 ...       |
	      (etc)
	    | n1 network                           | 192.168.4.4, 16.103.148.249   |
	    | config_drive                         |                               |
	    +--------------------------------------+-------------------------------+
 
 Using this information, you can now see all the details of the malicious instance.  You may choose to shut it down, contact the instance owner to investigate further, or both. 

## Method 3
1. Log in to the Controller node

2. Run the command:

        ip netns | grep "qrouter"

    Which produces output similar to the following:

        qrouter-0fa45f02-6e89-4707-89f3-0f7c31cf03bf

3. Assuming 16.103.148.249 is the malicious IP address: for each ***qrouter***, run the command:

        ip netns exec qrouter-0fa45f02-6e89-4707-89f3-0f7c31cf03bf iptables -L -v -t nat | grep &ldquo;16.103.148.249&rdquo;

    Producing output similar to the following:

        0 0 DNAT  all -- any  any anywhere     16.103.148.249  to:192.168.4.2
        0 0 DNAT  all -- any  any anywhere     16.103.148.24   to:192.168.4.2
        0 0 SNAT  all -- any  any 192.168.4.2  anywhere        to:16.103.148.249

4. If the command returns any results, capture the fixed IP address, which is 192.168.4.2 in the above example (Look in the "to: " field of DNAT rows)

5. Log in to the Nova controller node

6. For each tenant/project, run the following command to search on fixed IP and floating IP:

        nova list | grep "192.168.4.2" | grep "16.103.148.249"

    Producing output similar to the following:

        | 2edf0570-8ed7-4cc4-a836-f4095d64534e | test2 | ACTIVE | None       | Running     | n1=192.168.4.2, 16.103.148.249 |

7. Get the details of the above instance using the command:

        nova show 2edf0570-8ed7-4cc4-a836-f4095d64534e

    Which produces output similar to the output in Step 6 of Method 2.

 Using this information, you can now see all the details of the malicious instance.  You may choose to shut it down, contact the instance owner to investigate further.  or both. 


 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
