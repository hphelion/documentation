---
layout: default
title: "HP Helion OpenStack&#174; Edition: HP Helion Ceph"
permalink: /helion/openstack/ceph-rados-gateway-dmz-ha-proxy/
product: commercial

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/esx/">NEXT &#9654;</a> </p>
-->


##Ceph RADOS Gateway - DMZ HAProxy

As discussed in the previous sections, Ceph storage system is successfully integrated with HP Helion OpenStack. Ceph has Rados gateway that is a public facing interface and is vulnerable. Hence, any end user gains access into Helion system with this integration. In order to minimize risks, external HAProxy is built in a DMZ environment behind a firewall. HAProxy is a commonly used as a load balancer for TCP and HTTP based applications. It works as a reverse-proxy, which means it maintains two connections when allowing a client to cross it- connection between HAProxy and the client and the another between HAProxy and the server. 
 
To ensure secured connectivity, the connections should be HTTPS (SSL over HTTP). Stunnel is used as an intermediate between client with an HTTPs request and the haproxy.  During normal operation, stunnel receives the HTTPs request from client and hands off the request to a haproxy instance that is bound to the loopback address (127.0.0.1) on that same box. HAProxy now forwards the HTTPs request to gateway nodes listening on port 443.

Below diagram illustrates communication flow between Helion-Ceph-DMZ HAProxy-Ceph Gateway

<img src="media/commercial-ceph-communication-flow-between-helion-Ceph-DMZ-HAProxy-Ceph Gateway.png"/)>

####Assumptions

1.	Dual homed Proxy server in DMZ. Public facing address for internet clients and private address to connect to gateway nodes.
2.	Gateway nodes in private network-192.0.2.x
3.	Client node in public network-192.168.122.x

###Install General Packages

Perform the following steps to install the general packages in the proxy server:

* Install curl, openssl and libnss3-tools
* apt-get install curl
* apt-get install openssl ssl-cert
* apt-get install libnss3-tools


####Stunnel Install and Configuration

Perform the following steps to install and configure stunnel:

1.	Execute the following command to install stunel4 

		apt-get install stunnel4

2. Create a local CA and haproxy certificates in `/etc/ssl/certs` directory

   * Create the CA key and certificate 
  
			openssl genrsa -out ca.key 1024
			openssl req -x509 -new -nodes -key ca.key -days 1024 -out ca.crt
	
	* Create haproxy key, CSR and certificate like below
			
			openssl genrsa -out ha.key 1024
			openssl req -new -key ha.key -out ha.csr
			openssl x509 -req -in ha.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out ha.crt -days 1023


	* View  the files

			cat /etc/ssl/certs/ha.key /etc/ssl/certs/ha.crt > /etc/stunnel/ha.pem

	* Copy CA certificate to client node making requests.
	** Command is required?**

3.	Edit `stunnel.cfg` file at `/etc/stunnel/stunnel.cfg` to configure stunnel. Emphasis is on `radosgw` section where IP is the address of the proxy server. Proxy server certificate generated above is used for authentication.
		
		sslVersion = all
		cert = /etc/ssl/certs/ha.pem
		pid = /var/run/stunnel4/stunnel4.pid
		debug = 7
		output = /var/log/stunnel4/stunnel.log
		verify = 0

		[radosgw]	
		accept = 192.168.122.152:443
		connect = 127.0.0.1:81

4.	Edit `/etc/default/stunnel4` to enable automatic stunnel startup 

		ENABLED=1 

5.	Restart stunnel service 

	       /etc/init.d/stunnel4 restart 


####HAProxy Install and Configuration

Perform the following steps to install and configure HAProxy:

1.	Install HAProxy 
        
		apt-get install haproxy

2.	Edit `haproxy.cfg` at `/etc/haproxy/haproxy.cfg` to configure haproxy. <!---Emphasis is on radosgw section where address to listen on and addresses of gateway nodes is specified as per test setup ---->
		   

		global   
			log /dev/log    local0
			log /dev/log    local1 notice
	   		 chroot /var/lib/haproxy
			stats socket /run/haproxy/admin.sock mode 660 level admin
			stats timeout 30s
			user haproxy
			group haproxy
			daemon
			# Default SSL material locations
			ca-base /etc/ssl/certs
			crt-base /etc/ssl/private
			# Default ciphers to use on SSL-enabled listening sockets.
			# For more information, see ciphers(1SSL).
		    ssl-default-bind-ciphers kEECDH+aRSA+AES:kRSA+AES:+AES256:RC4-SHA:!kEDH:!LOW:!EXP:!MD5:!aNULL:!eNULL
		    ssl-default-bind-options no-sslv3
		defaults
        	log     global
        	option  dontlognull
        	timeout  http-request 10s
        	timeout  queue 1m
        	timeout  connect 10s
        	timeout  client 10m
        	timeout  server 10m
        	timeout  check 10s
        	mode  tcp
        	option  tcpka
        	option  tcplog
        	balance source
        	errorfile 400 /etc/haproxy/errors/400.http
        	errorfile 403 /etc/haproxy/errors/403.http
        	errorfile 408 /etc/haproxy/errors/408.http
        	errorfile 500 /etc/haproxy/errors/500.http
        	errorfile 502 /etc/haproxy/errors/502.http
        	errorfile 503 /etc/haproxy/errors/503.http
        	errorfile 504 /etc/haproxy/errors/504.http

		listen radosgw 127.0.0.1:81 ssl crt /etc/ssl/certs/ha.pem
        	balance roundrobin
        	server hrados 192.0.2.215:443 maxconn 1500 ssl verify none
        	server hrados1 192.0.2.216:443 maxconn 1500 ssl verify none
        	reqadd X-Forwarded-Proto:\ https
	listen haproxy.stats :1993
  			mode http
 			stats enable
  			stats uri /

3.	Restart haproxy service

        /etc/init.d/haproxy restart

####Validation

* Validation is performed from client node. 
* Swift requests are purely v1 as keystone is not integrated into this system. Hence, ensure that s3 and swift user are created using `radosgw-admin` commands.
* Ensure CA certificate is available in `/usr/local/share/ca-certificates`
* Execute `update-ca-certificates`
* curl or swift calls as shown the following command must succeed.
		
		curl  https://192.168.122.152 
		swift -V 1.0 -A https://HA.ex.com/auth/v1.0 -U s3User:swiftUser -K Ks0qeIDJz5SBU7WuVi6RattjaXign54seoNqAh1O list


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>