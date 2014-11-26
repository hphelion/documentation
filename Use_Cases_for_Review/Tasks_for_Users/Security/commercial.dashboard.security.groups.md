---
layout: default
title: "HP Helion OpenStack&#174; Managing Security Groups"
permalink: /helion/commercial/dashboard/managing/security/groups/
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
<p style="font-size: small;"> <a href="/helion/commercial/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/ga1/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&#174; Managing Security Groups

You can <a href="#creategroups">create your own security groups</a> or you can <a href="#editgroups">edit the rules in an existing group</a> to suit your needs. </p>

### About Security Groups and Rules ###

Access to your instances is controlled by security groups which are a collection of inbound (ingress) and outbound (egress) rules about which sources, protocols and ports a server can send/receive traffic from. No traffic can be received by a server unless a security group rule explicitly allows it. </p>

A default security group is created automatically that contains six rules:</p>

* Ingress IPv4 TCP Port 22: this is opening up port 22 for SSH</li>
* Egress IPv4 Any: this is a blanket rule to open up all outgoing traffic</li>
* Egress IPv6 Any: this is a blanket rule to open up all outgoing traffic</li>
* Ingress ICMP: this is a blanket rule that opens up all inbound ICMP traffic</li>
* Ingress IPv4 Any default: this is adding the &quot;default&quot; group to itself</li>
* Ingress IPv6 Any default: this is adding the &quot;default&quot; group to itself</li>

You can create your own security groups or you can change the default group to suit your needs. </p>

### Using CIDR to Control Traffic ### {#cidr}

Understanding how the CIDR field works is important to understanding how to control the access to your instances. If you use a CIDR of 0.0.0.0/0 then that is allowing traffic over the port you specified for all IP addresses. Here is how you can restrict access to a specific IP address:</p>

* 0.0.0.0/0 - This would allow traffic across all IP addresses</li>
* 15.185.1.1/0 - This would still allow traffic across all IP addresses</li>
* 15.185.1.1/8 - This would restrict traffic to IP addresses starting with 15.x.x.x</li>
* 15.185.1.1/16 - This would restrict traffic to IP addresses starting with 15.185.x.x</li>
* 15.185.1.1/24 - This would restrict traffic to IP addresses starting with 15.185.1.x</li>
* 15.185.1.1/32 - This would restrict traffic to a single host with IP address 15.185.1.1</li>

### Create a security group ### {#creategroups}

To create a security group, do the following:</p>

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Access &amp; Security</strong> link on the <strong>Project</strong> dashboard <strong>Compute</strong> panel.</p>

	The Access &amp; Security page is displayed with four tabs, <strong>Security Groups</strong>, <strong>Key Pairs</strong>, <strong>Floating IPs</strong>, and <strong>API Access</strong>. By default, <strong>Security Groups</strong> is the active tab. </p>

3. Click the <strong>Security Groups</strong> tab to activate it.</p>

	The list of security groups is displayed in a table.</p>

4. Click <strong>Create Security Group</strong>.</p>

5. In the <strong>Create Security Group</strong> screen, enter a name for the group and, optionally, enter a description.</p>

6.. Click <strong>Create Security Group</strong>.</p>

	The new group is created with two rules that allow all traffic from an instance associated to the group.</p>

7. You can use the following procedure to add ingress and egress rules to the security group as needed.</p>

### Create security group rules ### {#editgroups}

To create security group rules, do the following:</p>

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Access &amp; Security</strong> link on the <strong>Project</strong> dashboard <strong>Compute</strong> panel.</p>

	The Access &amp; Security page is displayed with four tabs, <strong>Security Groups</strong>, <strong>Key Pairs</strong>, <strong>Floating IPs</strong>, and <strong>API Access</strong>. By default, <strong>Security Groups</strong> is the active tab. </p>

3. Click the <strong>Security Groups</strong> tab to activate it.</p>

	The list of security groups is displayed in a table.</p>

4. For the security group for which you want to add rules, click <strong>Manage Rules</strong>.</p>

5. In the <strong>Add Rule</strong> screen, use the fields to create a security rule:</p>

	* <strong>Rule</strong> - Choose the type of rule you want to create.</li>
	* <strong>Direction</strong> - Ingress (inbound rule) or Egress (outbound rule).</li>
	* <strong>Open Port</strong> - Choose either Port or Port Range.</li>
	* <strong>Port</strong> - if you chose this option, enter the port number.</li>
	* <strong>Port Range</strong> - If you chose this option, enter your port range.</li>
	* <strong>Remote</strong> - Select either <strong>CIDR</strong> to specify an IP range or <strong>Security Group</strong> to allow a specific security group.</p>
	* <strong>CIDR</strong> - If you chose this option, enter an IP range. For more information, see <a href="#cidr">Using CIDR to Control Traffic</a>.</li>
	* <strong>Security Group</strong> - if you chose this option, select the security group to allow access to and the IP version.</p>
	Selecting a security group as the source will allow any other instance in that security group access to any other instance via this rule.</p>

6. Click <strong>Add</strong>.</p>

The security rule is added to the security group.</p>

Once you make a change to the security group rules and save the change, the change you made will immediately go into effect for all instances using that security group.</p>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*