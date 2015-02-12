---
layout: default
title: "HP Helion OpenStack&#174; Identity Service (Keystone) Overview"
permalink: /helion/openstack/services/identity/integrate/ldap/
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
<p style="font-size: small;"> <a href="/helion/openstack/services/compute/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/imaging/overview/"> NEXT &#9654</a> </p>
-->

# HP Helion OpenStack&#174; Integrate the Identity Service (Keystone) with LDAP/AD

This page provides instructions for integrating the Identity service with with an existing LDAP directory for authentication and authorization services.

LDAP simplifies integration of Identity authentication into an organization's existing directory service and user account management processes.


HP Helion OpenStack supports Domain-Specific Configuration (aka multi-domain). 

Domain-specific configuration enables you to specify identity driver configurations on a domain-by-domain basis. This allows a specific domain to have its own LDAP or SQL server. 

To enable domain-specific drivers, you will set options in `identity` section in the keystone.conf file during the integration procedure that follows.

**Note:** You do not need to create users for other OpenStack-based services such as Compute (Nova), Networking (Neutron) on an LDAP server. The HP Helion OpenStack installation process uses MySQL as a primary backend during installation. These users are created in MySQL database and new random passwords generated.



## Intergrate the Identity service with LDAP


1. Log in to your install system as root:

	`sudo su -`

2. Locate the ldap.json file.

	This file contains LDAP server connection settings. The content of the file will be transparently propagated into /etc/keystone/keystone.conf and /etc/keystone/domains/keystone.ldap.conf.

		{
		    "keystone": {
		        "config": [
		            {
		                "section": "<section1>",
		                "values": [
		                    { "option": "<option1>", "value": "<value1>" },
		                    { "option": "<option2>", "value": "<value2>" },
		                    ...
		                ]
		            },
		            ....
		        ]
		    },
		    "keystone_ldap": {
		        "config": [
		            {
		                "section": "<section2>",
		                "values": [
		                    { "option": "<option1>", "value": "<value1>" },
		                    { "option": "<option2>", "value": "<value2>" },
		                    ...
		                ]
		            },
		            ...
		        ]
		    }
		}

    Content of "keystone_ldap" section above is similar to the content of "keystone" section for "LDAP as Primary backend" installation.
    Content of "keystone" section above should turn on Domain Specific Configuration. As per http://docs.openstack.org/trunk/config-reference/content/section_keystone-domain-configs.html, it should only propagate the following 2 settings:

[identity]
domain_specific_drivers_enabled = True
domain_config_dir = /etc/keystone/domains

 

Sample file for OpenLDAP server running on 16.103.150.200, with TLS enabled:


expand source


Sample file for Microsoft AD server running on 16.103.150.204:

 
expand source

 
overcloud-env.json (optional)

This file is only needed if Keystone is set to verify a SSL certificate presented by LDAP server against list of CA certificates known by Keystone. To enable this, option tls_req_cert above must be set to  value other then "never" (i.e. "allow" or "demand"). In this case, a corresponding CA certificate must be added to /mnt/state/etc/keystone/ssl/certs/ca.pem file used by Keystone. To do this, create the file with the following content:
{
   "parameters" : {
      "KeystoneCACertificate" : "<content of CA certificate(s) converted to a single line>",
      "KeystoneSigningKey" : "<content of Signing Key converted to a single line>",
      "KeystoneSigningCertificate" : "<content of Signing Certificate converted to a single line>"
    }
}

Example:
{
   "parameters" : {
      "KeystoneCACertificate" : "<content of CA certificate(s) converted to a single line>",
      "KeystoneSigningKey" : "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDfDahcllgNW2/U\ne0DBr+PCtRA0yTUr6n9+nZG1jQ3Pz3luYf5H3IMJXD93czXCWhwTrbOU0Gl75NFx\nOIuCpeKCh5+FrRo8FvdSq9h9c3ixw+t8+NHCTnu8YcDGQP0e0JEdxCIbwNa5+iJt\nQdCrLO3Ws3X9nhR6FV4qxXZ57nl2hN7eoBbyilRQc9C8BUOrE/7X/RHcKQWSln0i\n+6QSwDh454gRdSKmIyJXruynnsbQZlhLwHQLOHyHgPvSarbdkeWAgV0EZOC+xpXq\n1YwDWrBP/exYlWBu5PUeBAw9dIeLdpw5eI3GO97pTmma8EfnPAt4jJi0gVuCs6Zw\nwyW7PLolAgMBAAECggEAGsyHR+iAV8p+mybb1umNEd2zPsRV8RrRiqLf2NJDsI4a\n5to7NOMXk05UCcP714gAC5U5GE4Z/lq1l0bV7DKGDmzBC8yKdGHGAVbIQfpXq/QA\nHRnACfpn/3A3Oxqfzs38QXlJJ9B5fArDjCD2MzrIsJ0LNheCGlDq6XSkEW5Hhaej\nskfFVksM8DHcOthprbW9bX3fF0qWRgIwtWBhFnPua41FLBkQjedQWWNiAhN9FaDv\njfjyRE+/EHIOcwObdVi4ESyW8DFhjLfH68qq6SOkvW1fhHXEXdqD1ZIVb4PveALP\n5uvPrpiWc+fnr0OAD4nxkU44Pa/ZcYGH0fJNAkYiAQKBgQD3ntn+fWGn9iDDuIOr\n1JT2cxzt+eGTuBRbbecDyJVYmCQ5O8kcNZfkv+54CVCjM668xmlIzvAvJcnzqAAy\n3Iq/3khRopN5cS84K2ALsZVQTKJV3O2ywOqhZnTxJCJzvg+CzJwjWdCHm2+czr1u\nAdVofNFhCncXG8S2yAw0QajOQQKBgQDmmfrHC5yzh69vsofA3TZtyqk9qSIikdx9\n7PdJABJlpkBTaCnkAqhMVJcvUfu3PuMBUbHvTq8PiZp1C9pXfxqbuJHdH9+FqohT\nKbB0jmulS0VRoL30cC0e+svvi7fwK75dUbCzLBoG2nDbhSddJWJwa0EukFpGcFSG\nmNhFAyG65QKBgE/Jepp60gWp1ALcqGisldcXXmH720iazsxrDD322tByLXHXpsSV\nLD1D7tX0wmvj0lD3aaNRMqkudvUw0+ePkpGiUREk3noKE1n49/isnt0B5GjgSCMJ\n8FBTUCkHKKa8vgi6XzEw1nVrizouj3Er3BTP6zNmiNsEUo1Gxk/sPDVBAoGAJImh\nQoiEe620Dm6rM9PZG+xQhISX9AJIfWtegyKPx6tf5ddLS+Vf5ThB/C1xRMeiEENx\nfglpk3yqDIGkRtjMzn+gHPk/4V3z27lvTAiE5dvXT+e4MVLU02PJjFsG+fb0YrTe\n2oTSWuOhniaq5gdWYZmc6lPU+fQycGEnY0frwEECgYEAoyqSw/h6KQG17D1qj/30\nC4V8hx24y+tZ0jceKY+SS2SSO6tVQmwn2eNV6RqBHVk5ilmNTbxpzkr/PFGHvfj+\nCAovVYLk38ALirUPfSd6KhYHNcjtQSHN0VPcKCnXW2p/lKSv6cQqQXVV0TtqXoAH\nu7qGPsC+w733oD8z4JFnELE=\n-----END PRIVATE KEY-----\n",
      "KeystoneSigningCertificate" : "-----BEGIN CERTIFICATE-----\nMIIDJDCCAgygAwIBAgIBAjANBgkqhkiG9w0BAQUFADBTMQswCQYDVQQGEwJYWDEO\nMAwGA1UECAwFVW5zZXQxDjAMBgNVBAcMBVVuc2V0MQ4wDAYDVQQKDAVVbnNldDEU\nMBIGA1UEAwwLS2V5c3RvbmUgQ0EwHhcNMTQwODE4MjE1NjE2WhcNMjQwODE1MjE1\nNjE2WjBYMQswCQYDVQQGEwJYWDEOMAwGA1UECAwFVW5zZXQxDjAMBgNVBAcMBVVu\nc2V0MQ4wDAYDVQQKDAVVbnNldDEZMBcGA1UEAwwQS2V5c3RvbmUgU2lnbmluZzCC\nASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAN8NqFyWWA1bb9R7QMGv48K1\nEDTJNSvqf36dkbWNDc/PeW5h/kfcgwlcP3dzNcJaHBOts5TQaXvk0XE4i4Kl4oKH\nn4WtGjwW91Kr2H1zeLHD63z40cJOe7xhwMZA/R7QkR3EIhvA1rn6Im1B0Kss7daz\ndf2eFHoVXirFdnnueXaE3t6gFvKKVFBz0LwFQ6sT/tf9EdwpBZKWfSL7pBLAOHjn\niBF1IqYjIleu7KeextBmWEvAdAs4fIeA+9Jqtt2R5YCBXQRk4L7GlerVjANasE/9\n7FiVYG7k9R4EDD10h4t2nDl4jcY73ulOaZrwR+c8C3iMmLSBW4KzpnDDJbs8uiUC\nAwEAATANBgkqhkiG9w0BAQUFAAOCAQEAbcEqCkQn9N6lCBQ3W+lHiqYanQUypCQc\nMoycDEPjjNx3FE6XtVEs8SsIKfl0UpQhZiJsCbJp1nU+po6dtqiqRn5/rPPAPTnj\n8hnB/0oK0LWhOIFS7RFOb3XJlX7soRQU+Zz+mSpd3cg++xT2WqTM/EWSqFOb1nET\nGsDnJm6bIjdG7rXBgRQmr7nrivwrMZsl+vx3Ytf+AraNjEdne8XXKVJ9l0d6jZIV\njA1K2iMtsLDEZgQkKNiCynEQ81EkBcB0P+fswZ9qHD1htj1aUfFtVmIqY/cxpVKX\nyuEml01VKQQ/FVk+SvucqOR8awiVBKw3krcq79DJMFRZ2D30PysHqA==\n-----END CERTIFICATE-----\n"
    }
}

 

For OpenLDAP server running on 16.103.150.200, the overcloud_env.json file can be found in attachment.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
