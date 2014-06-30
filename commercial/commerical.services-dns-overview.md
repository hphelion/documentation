---
layout: default
title: "HP Helion OpenStack&#174; DNS as a Service Overview"
permalink: /helion/openstack/services/dns/overview/
product: commercial

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/helion/openstack/services/horizon/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/tripleo/overview/"> NEXT &#9654</a> </p>

# HP Helion OpenStack&#174; DNS as a Service (DNSaaS) Overview#

Based on OpenStack&reg; Designate, the HP Helion OpenStack DNS as a service project (DNSaaS) provides a Domain Name System (DNS) service for use by HP Helion OpenStack users.

The DNS service offers users the ability to manage their domains and have DNS servers to serve DNS queries worldwide using geographically distributed DNS servers. DNSaaS includes a set of RESTful APIs for the display, creation, modification and deletion of DNS records.

DNSaaS for OpenStack includes:


- REST APIs for domain/record management
- Multi-tenancy
- Integration with Keystone for authentication
- A framework in place to integrate with Nova and Quantum notifications (for auto-generated records)
- Support for PowerDNS and Bind9 out of the box

For example, if a user wants to to access `mytestdomain.com` in their browser, DNS provides the mechanism for the browser to know that the server (for example, `1.2.3.4`).

**Note:** Installing HP Helion OpenStack DNSaaS is optional. Before you attempt the DNSaaS installation, you must have already installed HP Helion Openstack beta and verified that it is configured correctly and operational.

Learn how to [install DNS as a service](/helion/openstack/install-beta/dnsaas/).

##Key Terms

Key terms include:

- **DNS** -- A service that provides look up of the actual internet address (IP address) of domains. 

- **Domain Name** -- An identification string that defines a realm of administrative autonomy, authority, or control on the Internet.

- **DNS Server** -- A server that stores the DNS records for a domain name, such as address (A or AAAA) records, name server (NS) records, and mail exchanger (MX) records.

	A user of DNSaaS needs to set the nameservers for their domains, as described in the [API document](http://docs.hpcloud.com/api/dns).

## Working with DNSaaS

To [perform tasks using DNSaaS](#howto), you can use the API or CLI.

###Using the API to access DNSaaS### {#API}
 
You can use a low-level, raw REST API access to DNSaaS. See the [HP Helion Public Cloud DNS API Specifications](https://docs.hpcloud.com/api/dns/).

###Using the CLI### {#cli}

You can the *python-designateclient* command line tool to access DNSaaS. See [Install the client from PyPI](http://python-designateclient.readthedocs.org/en/latest/installation.html).

For more information on installing the CLI, see [Install the OpenStack command-line clients](http://docs.openstack.org/user-guide/content/install_clients.html).


## How To's with the HP Helion DNSaaS ## {#howto}

The HP DNSaaS provides a way to display, create, modify, and delete DNS records. This service offers users the ability to manage domains and have DNS servers to serve DNS queries worldwide using geographically distributed DNS servers.

The following lists of tasks can be performed by a user or administrator through the [API](http://docs.hpcloud.com/api/dns), or [CLI](http://python-designateclient.readthedocs.org/en/latest/shell.html).


### Domain Operations ###

You can perform the following operations for the DNS domain:

- Creating and deleting domains
- Listing domains
- Modifying domains


### Record Operations ###

You can perform the following operations for DNS records:

- Creating and deleting records
- Listing records
- Modifying records 

## For more information ##

For more information on OpenStack Designate, see [OpenStack Designate wiki](https://wiki.openstack.org/wiki/Designate).