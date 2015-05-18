---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Deploying the HLM and DCN Clouds "
permalink: /helion/openstack/carrier/install/pm/hlm-cloud/
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

<p style="font-size: small;"><a href="/helion/openstack/carrier/install/pb/hlm-vm/">&#9664; Configuring the installation environment</a> | <a href="/helion/openstack/carrier/install/bm/overview/">&#9650; Installation Overview</a>  </p> 

# HP Helion OpenStack&#174; Carrier Grade (Beta): Deploying the HLM and DCN Clouds 

At this point, the HLM VM is up and running.

Use the following steps to create three controller nodes, two compute nodes, a DCN Node and a VRS-G nodes.

Use the following steps:

1. Deploy and configure the cloud services using the following command:

		hdeploy <cloudname> 

	You can run this command from anywhere.

When this command completes, the HP DCN installation is complete.

## Verify the installation

1. SSH to your vsc VM from DCM KVM Host using the DCM IP.

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

 

3. Also run the below commands and check if the status is active

		show vswitch-controller vsd

		show vswitch-controller xmpp-server

		ping router "management" <vsd IP or domain name>

 


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---
