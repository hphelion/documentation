---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Verifying the HLM and DCN Installation"
permalink: /helion/openstack/carrier/install/pb/verify/
product: carrier-grade
product-version1: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Michael B, 

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();	

</script>

<p style="font-size: small;"><a href="/helion/openstack/carrier/install/pb/hlm-cloud/">&#9664; Deploying the HLM and DCN Clouds</a> | <a href="/helion/openstack/carrier/install/pb/overview/">&#9650; Installation Overview</a> | <a hrf="http://gaf2871b9d2d13cf45c1306b35bf01764.cdn.hpcloudsvc.com/HP_Helion_OpenStack_Carrier_Grade_Software_Install.pdf">Install HP Helion OpenStack Carrier Grade (PDF) &#9654;</a> </p> 

# HP Helion OpenStack&#174; Carrier Grade (Beta): Verifying the HLM and DCN Installation

Perform the following tasks to make sure the installation of the HLM VM, HLM Cloud and DCN Cloud has been successful.


## SSH to the VSC node

1. SSH to your VSC VM from the DCM KVM Host using the DCM IP.

		Login: admin
		Password: admin

2. Execute the following command:

		admin display-config

	The output appears, similar to the following:

		admin display-config
		TiMOS-DC-C-3.0.4-OEM-76 cpm/i386  VSC Copyright (c) 2000-2015
		All rights reserved. All use subject to applicable license agreements.
		Built on Thu Jan 15 21:32:52 PST 2015 [c4263c] by builder in /rel3.0-DC/oem/4-OEM-76/panos/main
		Generated FRI MAY 15 23:18:14 2015 UTC

		exit all

		configure
		--------------------------------------------------

		echo "System Configuration"
		--------------------------------------------------

			system
				name "vsc"
				snmp
				exit
				time
					ntp
						server 10.1.64.20
						server 16.110.135.123
						no shutdown
					exit
					sntp
						shutdown
					exit
					zone UTC
				exit
				thresholds
					rmon
					exit
				exit
			exit
			--------------------------------------------------

			echo "System Security Configuration"
			--------------------------------------------------

			system
			exit
			--------------------------------------------------

			echo "Log Configuration"
			--------------------------------------------------
				log
				exit
			--------------------------------------------------

			echo "System Security Cpm Hw Filters and PKI Configuration"
			--------------------------------------------------

				System
					security
					exit
				exit
			--------------------------------------------------

			echo "QoS Policy Configuration"
			--------------------------------------------------

				qos
				exit
			--------------------------------------------------

			echo "Card Configuration"
			--------------------------------------------------
			--------------------------------------------------

			echo "Service Configuration"
			--------------------------------------------------

				service
				exit
			--------------------------------------------------

			echo "Virtual Switch Controller Configuration"
			--------------------------------------------------

				vswitch-controller
					xmpp-server "vsc1b2.password@vsd1.dcn-seven.helion.cg"
					open-flow
					exit
					exit
			--------------------------------------------------

			echo "Management Router Configuration"
			--------------------------------------------------

				router management
				exit
			--------------------------------------------------

			echo "Router (Network Side) Configuration"
			--------------------------------------------------

				router
					interface "control"
						address 10.200.184.31/24
						no shutdown
					exit
						interface "system"
						no shutdown
					exit
			--------------------------------------------------

			echo "Web Portal Protocol Configuration"
			--------------------------------------------------
				exit
			--------------------------------------------------

			echo "Service Configuration"
			--------------------------------------------------

				service
					customer 1 create
						description "Default customer"
					exit
				exit
			--------------------------------------------------

			echo "Router (Service Side) Configuration"
			--------------------------------------------------

				router
			--------------------------------------------------

			echo "RADIUS Server Configuration"
			--------------------------------------------------

				exit
			--------------------------------------------------

			echo "System Time NTP Configuration"
			--------------------------------------------------

				System
					time
						ntp
					exit
				exit
			exit
		exit all

		Finished FRI MAY 15 23:20:05 2015 UTC


## Verify the vSwitch

Execute the below commands and check if the status is active

		show vswitch-controller vsd
		show vswitch-controller xmpp-server
		ping router "management" <vsd IP or domain name>

## Verify the VRS-G Node

Verify that the VRS-G Node is properly configured. 
VRS-G node provisioning happens as part of cloud deployment.

From VSC Node, run this command. 
 
		show vswitch-controller vswitches

	**Note:** Depending on the number of computes, the list of entries will change

If VRS-G node is not listed here, use the following steps:

1. Make sure the `/etc/resolv.conf` on each cloud nodes contains the domain name and DNS server

2. Make sure the `/etc/resolv.conf` file contains the IP address of each DNS server on all the cloud nodes.

**Example:**

<img src="media/CGH-install-verify-vrs.png">




4. Access the Horizon dashboard. 

		a. Obtain the IP address using one of the following methods:

		* Search in the ~clouds/dcnjunobuild33bed2new/001/stage/net/hosts.hf file for `VIP`.

		* Locate the CLM IP address in the /etc/keepalived/keepalive.conf file on any of the controller node


		b. Log into the dashboard using the default credentials:

			http://<vip>/horizon

			login: admin
			password: admin

5. Perform various tasks as a sanity check to make sure everything works as expected. For example:

	* Upload an image 
	* Create a networks
	* Launch an instance. 

	For information on using the Horizon dashboard, see [Operator Guide to Managing Your Cloud](/helion/commercial/carrier/dashboard/managing/).

## Next Step

[Install HP Helion OpenStack Carrier Grade](http://gaf2871b9d2d13cf45c1306b35bf01764.cdn.hpcloudsvc.com/HP_Helion_OpenStack_Carrier_Grade_Software_Install.pdf) (Opens in PDF)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---
