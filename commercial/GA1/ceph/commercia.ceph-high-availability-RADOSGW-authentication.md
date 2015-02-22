---
layout: default
title: "HP Helion OpenStack&#174; Edition: HP Helion Ceph"
permalink: /helion/openstack/ceph-rados-gateway-keystone-authentication/
product: commercial

product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Storage Engineer
role2: Storage Architect 
role3: Storage Administrator 
role4: Storage Engineer
role5: Service Developer 
role6: Cloud Administrator 
role7: Application Developer 
authors: Paul F

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


# Ceph RADOS Gateway- Keystone Authentication in the HP Helion OpenStack 1.1 Environment

The Helion OpenStack 1.1 HAProxy can be used to enable high availability and load balancing for RADOS Gateway nodes. With HAProxy, Swift requests are load balanced between two gateway nodes. If one of them goes down, then all requests are processed by the remaining live node. Once the failed node recovers, load balancing is re-enabled. Load balancing is done using the round robin algorithm so that each node is used in turn, and load balancing is fair. 

###Assumptions
The following assumptions apply to this configuration:

* Apache2/FastCGI without `100 continue support`

* Two RADOS gateway nodes with two distinct users sharing same RADOSGW keyring

###Steps
The steps to achieve integration of Helion OpenStack HAProxy, Keystone, and RADOSGW are:

#### Ceph Admin Node ####

* On the Ceph admin node, edit the `ceph.conf` file to include the following (the Keystone URL is Helion VIP and the Keystone admin token is taken from `/etc/keystone/keystone.conf` on the controller node):

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

* Re-deploy the `ceph.conf` file on all nodes in the Ceph cluster and on the Helion Controller nodes.

####Helion Controller Nodes

* On any controller node, configure Keystone to point to the RADOS gateway as shown below (the IP address used is Helion VIP):

		keystone service-create --name swift --type object-store [Note down service ID]

		keystone endpoint-create --service-id e001b96dc4b54a6c9f672418c21eb132 --publicurl https://192.0.2.x:10080/swift/v1 --internalurl https://192.0.2.x:10080/swift/v1 --adminurl https://192.0.2.x:10080/swift/v1


* Execute `keystone endpoint-get --service object-store`. This should return a pointer to the Ceph store and not default to the Swift store. If it does return Swift, delete the existing Swift store before proceeding.

* On all controller nodes, edit the `haproxy.cfg` file at `/etc/haproxy/haproxy.cfg `as shown below (IP address used is Helion VIP):

		listen radosgw
		bind 192.0.2.21:10080
		balance roundrobin
		server gateway 192.x.x.x:80 check inter 2000 rise 2 fall 5
		server gateway1 192.x.x.x:80 check inter 2000 rise 2 fall 5

* Restart the HAProxy service on all controller nodes by entering:

		service haproxy restart

* On all controller nodes, `edit /etc/stunnel4/from-heat.conf` as shown below:

		[radosgw]
		accept = 192.0.2.x:10080 [where IP = physical IP of controller node]
		connect = 127.0.0.1:10080

* Restart the `stunnel4service` on all controller nodes as shown below:

		/etc/init.d/stunnel4 restart

* On all controller nodes, edit the  `/etc/apache2/sites-enabled/keystone_modwsgi.conf` to include `WSGIChunkedRequest` as shown below (for more details, refer http://tracker.ceph.com/issues/7796):

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

* Restart the Apache2 service on all controller nodes by entering: 
	
		service apache2 restart


*  On any controller node, convert OpenSSL certificates that Keystone uses to the NSS database format. To perform this, make sure the `certutil` package is available on controller or gateway nodes.

	* `apt-get install libnss3-tools`
	* `mkdir /var/ceph/nss`
	* `openssl x509 -in /mnt/state/etc/keystone/ssl/certs/ca.pem -pubkey | certutil -d /var/ceph/nss -A -n ca -t "TCu,Cu,Tuw"`
	* `openssl x509 -in /mnt/state/etc/keystone/ssl/certs/signing_cert.pem -pubkey | certutil -A -d /var/ceph/nss -n signing_cert -t "P,P,P"`

####Ceph RADOS Gateway Nodes

* Create the following directory on gateway node(s) and copy converted certificates generated above in this path by entering:

		mkdir /var/ceph/nss

* Copy the following certificates from the Helion setup to `/etc/ssl/certs` by entering:

		eca.crt and eca.key from seed node
		ca-certificates.crt from controller node
		from-heat.crt and from-heat.key from swift node

* On the RADOS gateway node(s), edit the `/etc/apache2/sites-available/rgw.conf` file as shown below:

		SSLEngine on
		SSLCertificateFile /etc/ssl/from-heat.crt
		SSLCertificateKeyFile /etc/ssl/from-heat.key
		SSLCACertificateFile /etc/ssl/certs/eca.crt
		SetEnv SERVER_PORT_SECURE 443

* Restart the Apache2 service by entering:

		/etc/init.d/apache2 restart

* Restart the RADOSGW service by entering:

		/etc/init.d/radosgw restart



####Validating the Configuration

* Make sure proxy is not set on the gateway nodes.

* Make sure the `radosgw` daemons are running as `root` and that there are no errors in logs on both  nodes.

* When both `radosgw` daemons are running, Swift requests are usually made to the gateway node listed last in the Ceph configuration file. To test HA, stop one of the daemons and the respective Apache2 service on one of the nodes and test that the processes fail over to their counterparts.

* From the Management node, make a Swift v1 request like that shown below. In this example it is assumed that `s3User` is already created using the `radosgw-admin` command and that correct credentials for `s3User` is used in making the request. Output should list containers, if any.

		swift -V 1.0 -A http://192.0.2.21:10080/auth/v1.0 -U s3User:swiftUser -K abc list

* From the Management node, make a Swift v2 request using Keystone. Ceph Object Gateway's user:subuser tuple maps to the tenant:user tuple expected by Swift. Admin credentials are considered. Output should list containers, if any.

		swift -V 2.0 -A http://192.0.2.21:5000/v2.0 -U admin:admin -K abc list

* From the Management node, get the admin tenant ID by entering:

		Keystone tenant-list

Output:

		+----------------------------------+---------+---------+
		| id 							   | name    | enabled |
		+----------------------------------+---------+---------+
		| 627770d0c17c4423b8c27a2607e60798 | admin 	 | True    |
		| aa70711bd69e4958ac239e2564c18054 | demo    | True    |
		| 250bf66045814455a5b3c3e6c7fb7c19 | service | True    |
		+----------------------------------+---------+---------+

* Verify that the admin user is created in the RADOS pool as shown below, and make sure the admin user is indeed present

		rados --pool .users.uid ls
		
		s3User
		
		s3User.buckets
		
		627770d0c17c4423b8c27a2607e60798
		
		627770d0c17c4423b8c27a2607e60798.buckets



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

