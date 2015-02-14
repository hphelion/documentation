---
layout: default
title: "HP Helion OpenStack&#174; Edition: VSA Support"
permalink: /helion/openstack/install/ntp/
product: commercial.ga
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

<p style="font-size: small;"> &#9664; <a href="/helion/openstack/install/prereqs/#ntp">Prerequisites | <a href="/helion/openstack/install/overview/test/"> &#9650; Installation Overview</a> </p> 

# HP Helion OpenStack&#174;: Installing an NTP Server

This page provides detailed information on configuring the seed VM as a Network Time Protocol (NTP) server. NTP is a networking protocol for clock synchronization between computer systems. The undercloud and overcloud systems are configured as NTP clients during the installation process.

HP Helion OpenStack does not require using the seed VM as the NTP server. You can use an external NTP server, as needed.

 "higher stratum" and "lower stratum" needs to be clarified, i.e. “higher stratum” means higher in the hierarchy (closer to zero) rather than meaning numerically higher (farther from zero).

**Notes:** 

* NTP clients should use only stratum 2 and higher servers.
* All the Helion servers use UTC as a time zone.

##Configure NTP

1. Install the NTP package using the following command:

		sudo apt-get install ntp

2. Verify that there are broadcasting NTP servers:

		ntpq -pd

	**Note:** The NTP stratum must be 10 or higher in order to use as a source. If one is not available, you may be able to [fudge one](#fudge).

3. Add NTP servers to `/etc/ntp.conf`.

4. Configure system time zone in the `/usr/bin/tzselect` directory.

	The output should be placed in `/etc/profile` and executed on the command line

	Note: if your NTP source is less than a stratum 10 you will not be able to properly sync the clients with the server. You can use the `fudge` command as described in [Stratum lower than 10](#fudge) in Troubleshooting.

5. Verify that your server is broadcasting. You should see a message similar to the following: 

		"*LOCAL(0)") ntpq -pd

	You can now point clients to your NTP server

6. Add your NTP server IP to the clients `/etc/ntp.conf` file

7. Configure system timezone

		/usr/bin/tzselect

	The output should be placed in `/etc/profile` and executed on the command line

8. Restart NTP service

		service ntp restart

9. Verify that you have a connection to the NTP server

		ntpq -pd

10. Verify that your server shows client connections

		ntpdc -c monlist

## Troubleshooting ##

### Trouble synching ###

If your client (including your NTP server) has trouble syncing time you can try the following.

1. Sync system time with system clock:

		hwclock [--utc | --localtime] -s --hctosys (update system time based on hardware clock)
		hwclock [--utc | --localtime] -w --systohc (update hardware clock based on system time)
		hwclock [--utc | --localtime] --systz (update system time based on timezone)

2. Verify hardware clock time

		hwclock -r

3. Verify system time

		date

4. If the times are still not synching, check if NTP ports are blocked

		sudo apt-get install nmap

		sudo nmap -p123 -sU -P0 <localhost | known ntp host>

###Stratum lower than 10<a name="fudge"></a>

NTP uses a hierarchical, semi-layered system of time sources. Each level of this hierarchy is termed a *stratum* and is assigned a number starting with zero at the top. The number represents the distance from the reference clock and is used to prevent cyclical dependencies in the hierarchy. 

HP Helion OpenStack uses stratum 10. Using a numerically high stratum so this is only used if all external clocks fail. This will mitigate skew until external clocks return to service.

If your NTP stratum is lower than 10, set up your host as the time source by fudging a stratum 10.

1. Configure host as a time source.

2. Add the following to /etc/ntp.conf to force a stratum 10

		server 127.127.1.0
		fudge 127.127.1.0 stratum 10

3. Restart NTP service

		service ntp restart

----
