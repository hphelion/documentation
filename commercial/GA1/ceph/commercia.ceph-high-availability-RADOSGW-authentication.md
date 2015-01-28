---
layout: default
title: "HP Helion OpenStack&#174; Edition: HP Helion Ceph"
permalink: /helion/openstack/ceph-rados-gateway-keystone-authentication/
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
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/esx/">NEXT &#9654;</a> </p>--->


##Ceph RADOS Gateway- Keystone Authentication

Helion OpenStack HAProxy can be used to enable high availability and load balancing for Rados Gateway nodes. Using HAProxy, Swift requests are load balanced between two gateway nodes. If one of them goes down, then all requests are processed by a live (**What is a live node?**) node. Once the failed node recovers, load balancing is enabled again . Load balancing algorithm used is round robin so that each node is used in turns and that load balancing is fair. (**I am not clear what this sentence mean?**)

#####Assumptions

* Apache2/FastCGI without 100 continue support

* Two rados gateway nodes with two distinct users sharing same radosgw keyring

####Steps

Following are the steps to achieve integration of Helion OpenStack HAProxy, Keystone, and Radosgw.

Ceph Admin Node

* On Ceph admin node, edit `ceph.conf` file to include the following. Keystone url is Helion VIP and keystone admin token is taken `from /etc/keystone/keystone.conf` on controller node.

		rgw keystone admin token = 337b8816f019a04396a2e00e65e6c30ea96ba59b
		rgw keystone accepted roles = Member, admin, swiftoperator
		rgw keystone token cache size = 500
		rgw keystone revocation interval = 500
		rgw s3 auth use keystone = true
		rgw nss db path = /var/ceph/nss
		
		[client.radosgw.gateway]
		host = gateway
		keyring = /etc/ceph/ceph.client.radosgw.keyring
		rgw socket path = /var/run/ceph/ceph.radosgw.gateway.fastcgi.sock
		log file = /var/log/ceph/client.radosgw.gateway.log
		rgw dns name = gateway
		rgw print continue = false
		
		[client.radosgw.gateway1]
		host = gateway1
		keyring = /etc/ceph/ceph.client.radosgw.keyring
		rgw socket path = /var/run/ceph/ceph.radosgw.gateway.fastcgi.sock
		log file = /var/log/ceph/client.radosgw.gateway.log
		rgw dns name = gateway1
		rgw print continue = false

* Redeploy `ceph.conf` file on all nodes in Ceph cluster and Helion Controller nodes.

#####Helion Controller Nodes

* On any controller node, configure keystone to point to Rados gateway as shwon below. IP address used is Helion VIP.

		keystone service-create --name swift --type object-store [Note down service ID]

		keystone endpoint-create --service-id e001b96dc4b54a6c9f672418c21eb132 --publicurl https://192.0.2.x:10080/swift/v1 --internalurl https://192.0.2.x:10080/swift/v1 --adminurl https://192.0.2.x:10080/swift/v1


* Execute `keystone endpoint-get --service object-store`. This should return pointer to Ceph store and not default swift store. If it does return swift, delete existing swift store before proceeding.

* On all controller nodes, edit `haproxy.cfg` file at `/etc/haproxy/haproxy.cfg `as shown below. IP address used is Helion VIP.

		listen radosgw
		bind 192.0.2.21:10080
		balance roundrobin
		server gateway 192.x.x.x:80 check inter 2000 rise 2 fall 5
		server gateway1 192.x.x.x:80 check inter 2000 rise 2 fall 5

* Restart haproxy service on all controller nodes 

		service haproxy restart

* On all controller nodes, `edit /etc/stunnel4/from-heat.conf` as shown below

		[radosgw]
		accept = 192.0.2.x:10080 [where IP = physical IP of controller node]
		connect = 127.0.0.1:10080

* Restart stunnel4service on all controller nodes as shown below

		/etc/init.d/stunnel4 restart

* On all controller nodes, `edit /etc/apache2/sites-enabled/keystone_modwsgi.conf` to include `WSGIChunkedRequest` as shown below. For more details, refer http://tracker.ceph.com/issues/7796

		<VirtualHost *:35357>
		
		......
		
		<Directory /etc/keystone>
		
		......
		
		WSGIChunkedRequest On
		
		......
		
		</Directory>
		
		......
		
		</VirtualHost>
		
		<VirtualHost *:5000>
		
		......
		
		<Directory /etc/keystone>
		
		......
		
		WSGIChunkedRequest On
		
		......
		
		</Directory>
		
		......
		
		</VirtualHost>

* Restart apache2 service on all controller nodes like below
	
		service apache2 restart


*  On any controller node, convert OpenSSL certificates that keystone uses to `nss` db format. Io perfrom this, ensure the certutil package is available on controller or gateway nodes.

	* `apt-get install libnss3-tools`
	* `mkdir /var/ceph/nss`
	* `openssl x509 -in /mnt/state/etc/keystone/ssl/certs/ca.pem -pubkey | certutil -d /var/ceph/nss -A -n ca -t "TCu,Cu,Tuw"`
	* `openssl x509 -in /mnt/state/etc/keystone/ssl/certs/signing_cert.pem -pubkey | certutil -A -d /var/ceph/nss -n signing_cert -t "P,P,P"`

#####Ceph Rados Gateway Nodes

* Create the following directory on gateway node(s) and copy converted certificates generated above in this path.

		mkdir /var/ceph/nss

* Copy following certificates from Helion setup to `/etc/ssl/certs`

		eca.crt and eca.key from seed node
		ca-certificates.crt from controller node
		from-heat.crt and from-heat.key from swift node

* On Rados gateway node(s), edit `/etc/apache2/sites-available/rgw.conf` file as shown below

		SSLEngine on
		SSLCertificateFile /etc/ssl/from-heat.crt
		SSLCertificateKeyFile /etc/ssl/from-heat.key
		SSLCACertificateFile /etc/ssl/certs/eca.crt
		SetEnv SERVER_PORT_SECURE 443

* Restart apache2 service

		/etc/init.d/apache2 restart

* Restart radosgw service

		/etc/init.d/radosgw restart



####Validation

* Ensure proxy is not set on gateway nodes.

* Ensure radosgw daemons are running as `root` and that there are no errors in logs on both the nodes.

* When both radosgw daemons are running, typically swift requests are made to gateway node listed last in Ceph configuration file. To test HA, stop one of the daemons and respective apache2 service on one of the nodes and test the failover.

* From Management node, make Swift v1 request like as shown below. In this example it is assumed that the s3User is already created using `radosgw-admin` command and that correct credentials for the s3User is used in making the request. Output should list container if any.

		swift -V 1.0 -A http://192.0.2.21:10080/auth/v1.0 -U s3User:swiftUser -K abc list

* From Management node, make Swift v2 request using keystone. Ceph Object Gateway's user:subuser tuple maps to the tenant:user tuple expected by Swift. Here, admin credentials are considered. Output should container if any.

		swift -V 2.0 -A http://192.0.2.21:5000/v2.0 -U admin:admin -K abc list

* From Management node, execute the following to get the admin tenant ID

		Keystone tenant-list

Output:

		+----------------------------------+---------+---------+
		| id 							   | name    | enabled |
		+----------------------------------+---------+---------+
		| 627770d0c17c4423b8c27a2607e60798 | admin 	 | True    |
		| aa70711bd69e4958ac239e2564c18054 | demo    | True    |
		| 250bf66045814455a5b3c3e6c7fb7c19 | service | True    |
		+----------------------------------+---------+---------+

* Verify if admin user is created in rados pool as shown below and make sure admin user above is indeed present

		rados --pool .users.uid ls
		
		s3User
		
		s3User.buckets
		
		627770d0c17c4423b8c27a2607e60798
		
		627770d0c17c4423b8c27a2607e60798.buckets



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

