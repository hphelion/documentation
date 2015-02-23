---
layout: default
title: "HP Helion OpenStack&#174; Managing Security Groups"
permalink: /helion/commercial/1.1/dashboard/managing/security/groups/
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
<p style="font-size: small;"> <a href="/helion/commercial/1.1/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/1.1/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/1.1/ga1/">NEXT &#9654;</a> 
-->

# HP Helion OpenStack&#174; Managing Security Groups

You can [create your own security groups](#creategroups) or you can [edit the rules in an existing group](#editgroups) to suit your needs. 

### About Security Groups and Rules ###

Access to your instances is controlled by security groups which are a collection of inbound (ingress) and outbound (egress) rules about which sources, protocols and ports a server can send/receive traffic from. No traffic can be received by a server unless a security group rule explicitly allows it. 

A default security group is created automatically that contains six rules:

* Ingress IPv4 TCP Port 22: this is opening up port 22 for SSH</li>
* Egress IPv4 Any: this is a blanket rule to open up all outgoing traffic</li>
* Egress IPv6 Any: this is a blanket rule to open up all outgoing traffic</li>
* Ingress ICMP: this is a blanket rule that opens up all inbound ICMP traffic</li>
* Ingress IPv4 Any default: this is adding the &quot;default&quot; group to itself</li>
* Ingress IPv6 Any default: this is adding the &quot;default&quot; group to itself</li>

You can create your own security groups or you can change the default group to suit your needs. 

### Using CIDR to Control Traffic ### {#cidr}

Understanding how the CIDR field works is important to understanding how to control the access to your instances. If you use a CIDR of 0.0.0.0/0 then that is allowing traffic over the port you specified for all IP addresses. Here is how you can restrict access to a specific IP address:

* 0.0.0.0/0 - This would allow traffic across all IP addresses</li>
* 15.185.1.1/0 - This would still allow traffic across all IP addresses</li>
* 15.185.1.1/8 - This would restrict traffic to IP addresses starting with 15.x.x.x</li>
* 15.185.1.1/16 - This would restrict traffic to IP addresses starting with 15.185.x.x</li>
* 15.185.1.1/24 - This would restrict traffic to IP addresses starting with 15.185.1.x</li>
* 15.185.1.1/32 - This would restrict traffic to a single host with IP address 15.185.1.1</li>

### Create a security group ### {#creategroups}

To create a security group, do the following:

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/1.1/dashboard/login/).

2. Click the **Access &amp; Security** link on the **Project** dashboard **Compute** panel.

	The Access &amp; Security page is displayed with four tabs, **Security Groups**, **Key Pairs**, **Floating IPs**, and **API Access**. By default, **Security Groups** is the active tab. 

3. Click the **Security Groups** tab to activate it.

	The list of security groups is displayed in a table.

4. Click **Create Security Group**.

5. In the **Create Security Group** screen, enter a name for the group and, optionally, enter a description.

6.. Click **Create Security Group**.

	The new group is created with two rules that allow all traffic from an instance associated to the group.

7. You can use the following procedure to add ingress and egress rules to the security group as needed.

### Create security group rules ### {#editgroups}

To create security group rules, do the following:

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/1.1/dashboard/login/).

2. Click the **Access &amp; Security** link on the **Project** dashboard **Compute** panel.

	The Access &amp; Security page is displayed with four tabs, **Security Groups**, **Key Pairs**, **Floating IPs**, and **API Access**. By default, **Security Groups** is the active tab. 

3. Click the **Security Groups** tab to activate it.

	The list of security groups is displayed in a table.

4. For the security group for which you want to add rules, click **Manage Rules**.

5. In the **Add Rule** screen, use the fields to create a security rule:

	* **Rule** - Choose the type of rule you want to create.</li>
	* **Direction** - Ingress (inbound rule) or Egress (outbound rule).</li>
	* **Open Port** - Choose either Port or Port Range.</li>
	* **Port** - if you chose this option, enter the port number.</li>
	* **Port Range** - If you chose this option, enter your port range.</li>
	* **Remote** - Select either **CIDR** to specify an IP range or **Security Group** to allow a specific security group.
	* **CIDR** - If you chose this option, enter an IP range. For more information, see <a href="#cidr">Using CIDR to Control Traffic</a>.</li>
	* **Security Group** - if you chose this option, select the security group to allow access to and the IP version.
	Selecting a security group as the source will allow any other instance in that security group access to any other instance via this rule.

6. Click **Add**.

The security rule is added to the security group.

Once you make a change to the security group rules and save the change, the change you made will immediately go into effect for all instances using that security group.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
