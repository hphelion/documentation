---
layout: default
title: "HP Cloud Networking:  VPN multi-site configuration guide"
permalink: /compute/vpn-multisite/
product: compute
categories: neutron
tags: networking neutron vpn

---
# HP Cloud Networking:  VPN multi-site configuration guide {#top}

Once you have set up your initial VPN connection, you can extend your network to your different private sites. This guide provides you the basic steps to configure a VPN Virtual Machine (instance) and establish a secure connection between private sites to your HP Cloud VPN.

For this procedure, we assume that you have an active HP Cloud account with a VPN instance set up (see the [VPN Quick Start Guide](http://docs.hpcloud.com/compute/vpn-quickstart) to set up the initial VPN instance).

While you can set up your compute instance and VPN using any Linux OS, for the purpose of this guide, we use an Ubuntu instance and strongSwan IPsec. This configuration has been tested, but you can use this guide as a basis for connecting your sites to your HP Cloud VPN.

This guide covers the following:

- [Collect network and security information](#netsecinfo)
- [Define IPsec and IKE proposals](#defineipsecike)
- [Configure the VPN for the IKE and IPsec proposals](#configvpn)
- [Establish a connection with your HP Cloud VPN](#connect)
- [Troubleshoot and verify connections](#trouble)
- [For further information](#info)

##Collect network and security information## {#netsecinfo}

Before proceeding, collect network and security information on both sides for the VPN connection you are trying to establish.

We recommend that you compile the information in a spreadsheet to have handy when you need to input the data.

Collect the following information for each RIGHT remote network:

- Router Public IP Address
- Router Private Subnet
- Client system behind NAT
- Router IKE Proposal
- Router IPsec Proposal
- Router IPsec Policy
- Router support Perfect Forward Secrecy (PFS)
- Router support Dead Peer Detection (DPD)
- Router Shared Secret/Certificates
- Router ACL

Collect the following information for the LEFT VPC network:

- VPN instance Floating IP Address
- VPCs Private Subnet
- VPN VM behind NAT
- VPN IKE Proposal
- VPN IPsec Proposal
- VPN IPsec Policy
- VPN support PFS
- VPN support DPD 

##Define IPsec and IKE proposals## {#defineipsecike}
 
Define the IPsec and IKE proposals in their routers. A router can support both IKEv1 and IKEv2.

**Note:** IKEv1 is supported in most router platforms, so this configuration provides only information about how to configure the IKEv1.
 
The output below provides information about the IKE proposal and the IPsec proposal, with details about the authentication algorithm, encryption algorithm, perfect forward secrecy, shared secret, and using the main mode or aggressive mode.   

**Note:** Each location can have different IKE and IPsec proposals. Adjust the configuration at the VPC end (Left side) to adopt all the proposals as needed. 

For simplicity, assume that all routers you will connect use the IKE and IPsec proposals defined below.

	Virtual Private Cloud

	VPN Connection Configuration
	A VPN Connection consists of a pair of Security Associations (SAs).
	===============================================================================
	
	#1: Internet Key Exchange Configuration

	Configure the IKE SA as follows
	- Authentication Method    : Pre-Shared Key
	- Pre-Shared Key           : “abcd” 
	- Authentication Algorithm : sha1
	- Encryption Algorithm     : aes-128-cbc
	- Lifetime                 : 28800 seconds
	- Phase 1 Negotiation Mode : main
	- Perfect Forward Secrecy  : Diffie-Hellman Group 2
	
	#2: IPsec Configuration
	
	Configure the IPsec SA as follows:
	- Protocol                 : esp
	- Authentication Algorithm : hmac-sha1-96
	- Encryption Algorithm     : aes-128-cbc
	- Lifetime                 : 3600 seconds
	- Mode                     : tunnel
	- Perfect Forward Secrecy  : Diffie-Hellman Group 2
	
	IPsec Dead Peer Detection (DPD) will be enabled on the AWS Endpoint. We recommend configuring DPD on your endpoint as follows:
	- DPD Interval             : 10
	- DPD Retries              : 3

back to the [top](#top)

##Configure the VPN for the IKE and IPsec proposals## {#configvpn}

This section uses strongSwan to configure the IKE and IPsec proposals from the previous section.

**Note:** Make sure you have configured your VPN Gateway instance according to the ["VPN Quick Start Guide"](http://docs.hpcloud.com/compute/vpn-quickstart).

###strongSwan configuration files

1.	SSH into the VPN instance on your VPC using your Public IP Address and ssh keys. 
**Note:** Use either a Windows client with PuTTY or a Linux client with ssh to access your VPN instance shell (see the [VPN Quick Start Guide](http://docs.hpcloud.com/compute/vpn-quickstart)).
2.	Once logged in, run the following command to see the *IPsec.conf* file in the strongSwan configuration files.

	ls IPsec* strongswan*

strongSwan creates three configuration files during installation:

- IPsec.conf
- IPsec.secrets
- strongswan.conf

These files are in the /etc/ directory of the installation file as well as a folder called IPsec.d that contains subfolders such as *cacerts*, *certs*, *private, crl*, etc., which can store the certificates and keys used for authentication. 

*/etc/IPsec.d/cacerts* – Holds the CA certificate.
*/etc/IPsec.d/certs* – Holds the Host certificates.
*/etc/IPsec.d/private* – Holds the private keys.
*/etc/IPsec.d/crl* – Holds the certification revocation list.

####IPsec.conf file

Before looking into the configuration options of this file, familiarize yourself with some of the key configuration attributes.  When configuring the VPC VPN instance, always consider it as the LEFT node and the remote server as the RIGHT node. The diagram below shows the basic pieces of the network’s LEFT and RIGHT sides.  

insert image

####Config setup file

The *config setup* subsection in the `IPsec.conf` file defines the general configuration parameters. 

1.	Indent all parameters belonging to a sub-section by at least one space or tab character. You can have only one *config setup* section but an unlimited number of *conn* and *ca* sections.
2.	strongSwan provides IKEv1 and IKEv2 support through two different daemons, Pluto and Charon, respectively. Pluto is the keying daemon for the IKEv1 protocol. Setting  plutostart=yes states  starts the Pluto daemon to support the IKEv1 by default.
3.	Charon is *the* keying daemon for the IKEv2 protocol. Setting `charonstart=yes` starts the Charon daemon to support the IKEv2 by default.

**Note:** If you plan to use only IKEv1 for testing and deployment, turn the Charon daemon off and run the Pluto daemon.

4.	If the network is behind "NAT" turn the `nat_traversal` parameter to **yes**:

	`nat_traversal=yes`

5.	Use the plutodebug parameter to enable Pluto debug:

	`plutodebug=all|control`

Setting to all logs all Pluto-related messages, but control only enables the control related messages.

**Note:** Other strongSwan paramaters and configuration options are not covered here. For detailed information, refer to the [strongSwan User Documentation](http://wiki.strongswan.org/projects/strongswan/wiki/UserDocumentation)  or the “VPN Quick Start Guide.”

####Customize the IPsec.conf file
Modify the configuration file for your connections.

First, modify the config setup section:

	nat_transversal=yes
	plutostart-yes
The remaining configurations can stay the same.

Modify the connection information in the `conn %default` section:

**Note:** As mentioned above, all common IKE and IPsec proposal information can be addressed in this section.

      ike=aes128-sha1-modp1024!
      ikelifetime=28800s
      keyexchange=ikev1
      keyingtries=10
      esp=aes128-sha1-modp1024!
      keylife=3600s
      rekeymargin=5m
      type=tunnel
      pfs=yes
      compress=no
      authby=secret

For each specific network connection information modify the file. This shows an example of a generic connection setup with conn-default.

      conn Site-name	#the name you designate that site
      left=%defaultroute
      leftid=10.2.79.21
      leftsubnet=10.2.0.0/16
      leftfirewall=yes
      right=209.65.244.238
      rightid=192.168.1.50
      rightsubnet=192.168.2.0/24
      dpdaction=hold
      dpddelay=60
      dpdtimeout=500 
      auto=add

Repeat the above for every site needed in the network.

**Note:** Once you have made the modifications, restart the IPsec process to use the latest information from the `IPsec.conf` file: 

	# sudo IPsec restart

####Customize the IPsec.secrets file

Based on the authentication type and shared secret for the VPC VPN instance, the customized *IPsec.secrets* file with the "Peer" and "Local" id is shown below. 

**Note:** You can use the same pre-shared key for all the connections or choose different pre-shared keys for different connections. This example demonstrates the same key for all connections.

	#include /var/lib/strongswan/IPsec.secrets.inc
	10.2.79.21 209.65.244.238 192.168.1.50 : PSK "abcd" 

**Note:** Before you enter the ID of the remote router, verify the ID the remote router will send as "PEER_ID" during the IKE negotiation.  The ID can be the IP address, FQDN, etc. When configured as the IP Address the ID can be either the Public IP of the router or the gateway Public IP address. Add the IP in the list above to authenticate against the PSK.

**Note:** Do not modify the IPsec.conf file for other strongSwan applications.  Only IPsec starter can parse the IPsec.conf file, which is created by default, and IPsec starter automatically loads the necessary modules based on the IPsec.conf file definition. 

###IKE and IPsec proposals for different sites

This section includes examples for IKE and IPsec proposals.

####Examples for remote site IKE and IPsec proposals

These examples have three remote sites named a, b, and c (you can, of course, name your remote sites whatever makes sense to you). 

**Setting the IKE and IPsec proposals:**

In the configuration files, modify the following for Site-A:

	IKE
	#1: Internet Key Exchange Configuration
	
	- Pre-Shared Key           : "abcd"

	- Encryption Algorithm     : aes-128-cbc

	IPsec
	
	#2: IPsec Configuration
	
	- Encryption Algorithm     : aes-128-cbc

Modify the following for Site-B:

	IKE
	#1: Internet Key Exchange Configuration
	
	- Pre-Shared Key           : "siteb"
	- Encryption Algorithm     : aes-256-cbc

	IPsec
	
	#2: IPsec Configuration
	
	- Encryption Algorithm     : aes-256-cbc

Modify the following for Site-C:

	IKE
	#1: Internet Key Exchange Configuration
	
	- Pre-Shared Key           : "sitec"

	- Perfect Forward Secrecy  : Diffie-Hellman Group 5

	IPsec
	
	#2: IPsec Configuration
	
	- Perfect Forward Secrecy  : Diffie-Hellman Group 5

**Sample IPsec configuration file for all sites (A, B and C) in the VPC**

The *ipsec.conf* file can hold multiple connection sections. Because we have three connections in this example, you have one `conn %default` that includes all the common options for all the connections. The specific options are included in the **conn Site-A**, **conn Site-B**, and **conn Site-C**.

    # ipsec.conf - strongSwan IPsec configuration file
    
    # basic configuration
    
    config setup
    	plutodebug=all
    	plutostderrlog=/home/ubuntu/plutolog.txt
    	nat_traversal=yes
    	charonstart=no
    	plutostart=yes
    
    # Add connections here.
    
    # Sample VPN connections
    # NOTE: As mentioned above all common IKE and IPsec Proposal information can be
    # included in the section below
    
    conn %default 
      ikelifetime=28800s
      keyexchange=ikev1
      keyingtries=10
      keylife=3600s
      rekeymargin=5m
      type=tunnel
      pfs=yes
      compress=no
      authby=secret
    
    # Site specific network connection information
    conn Site-A 
      left=%defaultroute
      leftid=10.2.79.21
      leftsubnet=10.2.0.0/16
      leftfirewall=yes
      right=209.65.244.238
      rightid=192.168.1.50
      rightsubnet=192.168.2.0/24
      ike=aes128-sha1-modp1024!
      esp=aes128-sha1-modp1024!
      dpdaction=hold
      dpddelay=60
      dpdtimeout=500 
      auto=add
      
    conn Site-B 
      left=%defaultroute
      leftid=10.2.79.21
      leftsubnet=10.2.0.0/16
      leftfirewall=yes
      right=209.65.244.239
      rightid=172.168.2.50
      rightsubnet=192.168.4.0/24
      ike=aes256-sha1-modp1024!
      esp=aes256-sha1-modp1024!
      dpdaction=hold
      dpddelay=60
      dpdtimeout=500 
      auto=add
    
    conn Site-C 
      left=%defaultroute
      leftid=10.2.79.21
      leftsubnet=10.2.0.0/16
      leftfirewall=yes
      right=209.65.244.240
      rightid=172.168.1.50
      rightsubnet=192.168.3.0/24
      ike=aes256-sha1-modp1536!
      esp=aes256-sha1-modp1536!
      dpdaction=hold
      dpddelay=60
      dpdtimeout=500 
      auto=add


**Modify the *ipsec.secrets* file for connections with different keys:**

	#include /var/lib/strongswan/ipsec.secrets.inc
	10.2.79.21 209.65.244.238 192.168.1.50 : PSK "abcd" 
	10.2.79.21 209.65.244.239 172.168.2.50 : PSK “siteb”
	10.2.79.21 209.65.244.240 172.168.1.50 : PSK “sitec”

back to the [top](#top)

##Establish a connection with your HP Cloud VPN## {#connect}

You can establish a connection with the remote router in two ways:

1. The router can start the negotiation

*or*

2. The router can accept a negotiation from the remote node.

In this example, either automatically start the connection from the VPC VPN (auto=start option in the *IPsec.conf* file) or configure it in passive mode listening for connections (`auto=add` option in the *IPsec.conf* file).

In this router configuration, the router will only negotiate a connection when it sees a packet destined for the remote subnet in the Cloud. In this example, the site's are named Site-A, Site-B, and Site-C, but you can name them anything that makes sense to you.

- From Site-A send traffic from subnet 192.168.2.0/24 to subnet 10.2.0.0/16. HP Networking MSR router starts IKE negotiation with VPC VPN in the cloud when it receives the first packet.
- From Site-B send traffic from subnet 192.168.4.0/24 to subnet 10.2.0.0/16. HP Networking MSR router starts IKE negotiation with VPC VPN in the cloud when it receives the first packet.
- From Site-C send traffic from subnet 192.168.3.0/24 to subnet 10.2.0.0/16. HP Networking MSR router starts IKE negotiation with VPC VPN in the cloud when it receives the first packet.

back to the [top](#top)

## Troubleshoot and verify connections## {#trouble}

See the "[VPN Quick Start Guide](http://docs.hpcloud.com/compute/vpn-quickstart)" for instructions on how to troubleshoot and verify connections.

###For further information## {#info}

- [strongSwan wiki](http://wiki.strongswan.org)
- HP Networking MSR 20-40 Router Security Configuration Guide: [http://www.h3c.com/portal/download.do?id=1223846](http://www.h3c.com/portal/download.do?id=1223846)
 
back to the [top](#top)


