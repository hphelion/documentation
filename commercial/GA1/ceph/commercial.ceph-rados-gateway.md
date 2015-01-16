---
layout: default
title: "HP Helion OpenStack&#174; Edition: HP Helion Ceph"
permalink: /helion/openstack/ceph-rados-gateway/
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

##Ceph Rados Gateway

Ceph Rados Gateway offers Swift API access to objects stored in Ceph. It is object storage interface that uses Ceph Object Gateway daemon - radosgw. radosgw is FastCGI module for interacting with Ceph storage cluster. For more details, refer to http://ceph.com/docs/master/radosgw/

Setting up of RADOS gateway is done on a discrete node that eventually becomes an integral part of Ceph cluster. Existing Ceph cluster can be easily extended by adding gateway node. For more details, refer http://ceph.com/docs/master/install/install-ceph-gateway/

For High availability Rados Gateway, a load balancer is required. HA Proxy is an example of a load balancer that has been used successfully with rados gateway endpoints. For implementing HA Rados Gateway, second gateway node is setup similar to first one. The only thing needed is to use an unique client for second node. Following section has explicit callouts for HA.

###Administration node

Following steps are performed from Ceph admin node. Assumption here is that hostname for gateway node is gateway. If HA is considered, hostname of second node is gateway1.

* Log in to admin node as root user and ensure Ceph packages are already installed. If not, perform the following

		apt-get install ceph

* Change directory to /etc/ceph

* Create keyring for gateway and associate required permission

		ceph-authtool --create-keyring /etc/ceph/ceph.client.radosgw.keyring
		chmod +r /etc/ceph/ceph.client.radosgw.keyring

* Generate gateway username and key. Default user is gateway

		ceph-authtool /etc/ceph/ceph.client.radosgw.keyring -n client.radosgw.gateway --gen-key

	**Note**: For HA, create additional user – gateway1 like below

		ceph-authtool /etc/ceph/ceph.client.radosgw.keyring -n client.radosgw.gateway1 --gen-key

* Add key capabilities

		ceph-authtool -n client.radosgw.gateway --cap osd 'allow rwx' --cap mon 'allow rwx' /etc/ceph/ceph.client.radosgw.keyring

Note: For HA, add key capabilities to gateway1 user

	ceph-authtool -n client.radosgw.gateway1 --cap osd 'allow rwx' --cap mon 'allow rwx' /etc/ceph/ceph.client.radosgw.keyring

* Add key to Ceph cluster

		ceph -k /etc/ceph/ceph.client.admin.keyring auth add client.radosgw.gateway -i /etc/ceph/ceph.client.radosgw.keyring

	Note: For HA, add key for gateway1 user

		ceph -k /etc/ceph/ceph.client.admin.keyring auth add client.radosgw.gateway1 -i /etc/ceph/ceph.client.radosgw.keyring

* Copy keyring to gateway node(s)

		scp /etc/ceph/ceph.client.radosgw.keyring root@gateway:/etc/ceph

* Add gateway configuration by updating ceph.conf file like below.

		[client.admin]
		
		keyring = /etc/ceph/ceph.client.admin.keyring
		
		[client.radosgw.gateway]
		
		host = gateway
		
		keyring = /etc/ceph/ceph.client.radosgw.keyring
		
		rgw socket path = /var/run/ceph/ceph.radosgw.gateway.fastcgi.sock
		
		log file = /var/log/ceph/client.radosgw.gateway.log
		
		rgw dns name = gateway
		
		rgw print continue = false

		# Added for HA
		
		[client.radosgw.gateway1]
		
		host = gateway1
		
		keyring = /etc/ceph/ceph.client.radosgw.keyring
		
		rgw socket path = /var/run/ceph/ceph.radosgw.gateway.fastcgi.sock
		
		log file = /var/log/ceph/client.radosgw.gateway.log
		
		rgw dns name = gateway1
		
		rgw print continue = false

* Re-deploy Ceph configuration on all cluster nodes and client nodes

###Gateway Node

Following steps are performed on gateway node. For HA, same steps are repeated on second node.

* Log in to gateway node as root user and install Ceph packages

		apt-get install ceph

* Install Apache2 and Fastcgi packages

		apt-get install apache2 libapache2-mod-fastcgi

* Configure Apache2/FastCGI

Edit `/etc/apache2/apache2.conf` to include server name of gateway node(s) 
    ServerName gateway.ex.com

**Note**: For HA, second node will have the following

ServerName gateway1.ex.com

* Enable URL rewrite modules for Apache2 and FastCGI

		a2enmod rewrite
		a2enmod fastcgi

* Restart Apache2 for changes to take effect

		/etc/init.d/apache2 restart

* Enable SSL

* Install SSL module

		apt-get install openssl ssl-cert

* Enable SSL

		a2enmod ssl

* Generate certificate

		mkdir /etc/apache2/ssl

		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt

* Restart Apache2

		/etc/init.d/apache2 restart

Note: SSL is currently not being considered in working environment

* Edit /etc/hosts file to include fqdn of gateway node	

		192.x.x.x gateway.ex.com gateway

	Note: For HA, second node will have the following
	
		192.x.x.x gateway1.ex.com gateway1

* Add wildcard to DNS

* Install dnsmasq

		apt-get install dnsmasq

* Edit /etc/dnsmasq.conf as follows

		address=/.{fqdn}/{host ip}

		listen-address=127.0.0.1

	For example –

		address=/.gateway.ex.com/192.x.x.x
		
		listen-address=127.0.0.1

	**Note**: For HA, second node will have the following

		address=/.gateway1.ex.com/192.x.x.x
		
		listen-address=127.0.0.1

* Restart dsnmasq

		/etc/init.d/dnsmasq restart

* Ping server with subdomain to ensure radosgw can process subdomain requests

		ping mybucket.{fqdn}

		ping mybucket.gateway.ex.com

		[NOTE: This did not work in hlinux]

* Install Ceph Object Gateway on node(s)

		apt-get install radosgw

* Install Gateway agent on node(s) 
	* wget -q -O- 'https://ceph.com/git/?p=ceph.git;a=blob_plain;f=keys/release.asc' | apt-key add -

	[Note: If key cannot be downloaded, then perform above step on Ubuntu host and copy it to gateway node]

	* echo deb http://ceph.com/debian-firefly/ wheezy main | tee /etc/apt/sources.list.d/ceph.list

	* apt-get install radosgw-agent

* Add Ceph Object Gateway script s3gw.fcgi in /var/www directory with file contents like below

		#!/bin/sh
		exec /usr/bin/radosgw -c /etc/ceph/ceph.conf -n client.radosgw.gateway

* Ensure proper file permission

		chmod +x s3gw.fcgi

		Note: For HA, second node will have the following

		#!/bin/sh
		
		exec /usr/bin/radosgw -c /etc/ceph/ceph.conf -n client.radosgw.gateway1

* Create data directory

		mkdir -p /var/lib/ceph/radosgw/ceph-radosgw.gateway

* Add gateway configuration file rgw.conf in /etc/apache2/sites-available directory with file contents like below

		FastCgiExternalServer /var/www/s3gw.fcgi -socket /var/run/ceph/ceph.radosgw.gateway.fastcgi.sock
		
		<VirtualHost *:80>
		
		ServerName gateway.ex.com
		
		ServerAlias *.gateway.ex.com
		
		ServerAdmin gateway@hp.com
		
		DocumentRoot /var/www
		
		RewriteEngine On
		
		RewriteRule ^/(.*) /s3gw.fcgi?%{QUERY_STRING} [E=HTTP_AUTHORIZATION:%{HTTP:Authorization},L]
		
		<IfModule mod_fastcgi.c>
		
		<Directory /var/www>
		
		Options +ExecCGI
		
		AllowOverride All
		
		SetHandler fastcgi-script
		
		Order allow,deny
		
		Allow from all
		
		AuthBasicAuthoritative Off
		
		</Directory>
		
		</IfModule>
		
		AllowEncodedSlashes On
		
		ErrorLog /var/log/apache2/error.log
		
		CustomLog /var/log/apache2/access.log combined
		
		ServerSignature Off
		
		</VirtualHost>

	Note: For HA, second node will have changes for ServerName, ServerAlias and ServerAdmin accordingly.

* Enable site for rgw.conf

		a2ensite rgw.conf

* Disable default site

		a2dissite 000-default

* Restart all services and start gateway

	*  Apache2

			 /etc/init.d/apache2 restart

	* Gateway radosgw

			/etc/init.d/radosgw start

	* Radosgw in debug mode for troubleshooting

			/usr/bin/radosgw -d -c /etc/ceph/ceph.conf --debug-rgw 20 --rgw-socket-path=/var/run/ceph/ceph.radosgw.gateway.fastcgi.sock

	* Ceph

			/etc/init.d/ceph restart

###Validation

Once all services are up and running, make an anonymous GET request to gateway instance to receive valid response.

* Ensure proxy is not set on gateway node(s)

* Edit /etc/environment to add the following and source the same

		export no_proxy=localhost,127.0.0.1,192.x.x.x,gateway.ex.com,gateway

* GET Request curl http://gateway.ex.com

* GET Response

		<ListAllMyBucketsResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
		
		<Owner>
		
		<ID>anonymous</ID>
		
		<DisplayName/>
		
		</Owner>
		
		<Buckets/>
		
		</ListAllMyBucketsResult>

This response indicates that gateway instance is working as expected

* If there is an error, ensure radosgw is executed in debug mode and watch out for errors

* If there is permission issue on /var/run/ceph/ceph-client.radosgw.gateway.asok, change file permission accordingly

		chmod 777 /var/run/ceph/ceph-client.radosgw.gateway.asok

* If there is error with Apache2 or FastCGI, look for debug logs in /var/log/apache2/error.log. Changing permission on /var/www directory or /var/www/s3gw.fcgi file may fix the problem

		chmod 777 /var/www

		chmod 777 /var/www/s3gw.fcgi

##Gateway Pools, Users and Sub-users, Access and Secret keys

**Pools**

Ceph Object Gateways require Ceph Storage Cluster pools to store specific gateway data. If user created has permissions, gateway will create pools automatically. Executing rados lspools lists the available pools. Check if .rgw.buckets and .rgw.buckets.index pools are already created by default. If not, create these pools using ceph osd pool create command. For more details refer https://ceph.com/docs/master/radosgw/config-ref/#pools

<screenshot>

**User and Sub-User**

User reflects user of S3 interface and Subuser reflects a user of Swift interface. Subuser is always associated to a user. For more details, refer https://ceph.com/docs/master/radosgw/admin/. Using radosgw-admin commands, user and subuser are created like below

* radosgw-admin user create --subuser=s3User:swiftUser --display-name="First User " --key-type=swift --access=full

<screenshot>

* Ensure user – s3User and subuser – s3User:swiftUser are stored in respective .users.uid and .users.swift pool

**Access and Secret keys**

S3 users and swifts users need to have access and secret keys to enable end users to interact with gateway instance. Access and secret key for s3User are created like below

* radosgw-admin key create --uid=s3User --key-type=s3 --gen-access-key --gen-secret
* Ensure keys generated are free of JSON escape (\) characters
* If the User or Application will write more than 1k Containers, then modification of the max_buckets variable is required. Also, right-sizing of Placement Groups per Pool may be required. Ensure max_buckets is set to unlimited size by setting it to 0. This is important in order to write unlimited containers into .rgw.buckets default pool during workload testing.
**radosgw-admin user modify --uid=s3User --max-buckets=0**

**S3 Client**

S3 client is not supported by HP for User Data, other than as a validation step during installation and configuration. Gateway instance, S3 users created can be verified using s3cmd tool on gateway node or Ceph client. For more details on s3cmd tool, refer http://s3tools.org/s3cmd.

* Install s3cmd tool

		sudo apt-get install s3cmd

* Configure s3cmd tool like below. Enter relevant information like access key, secret key, etc when prompted. Information is stored in .s3cfg file

		s3cmd --configure

* Access and secret key generated for s3 user can be collected like below

		radosgw-admin user info –uid=s3User

* List buckets using radosgw-admin command or s3cmd or by listing .rgw.buckets pool like below. To begin with, list is empty.

* Create bucket

		s3cmd mb s3://my-Bucket

* Ensure bucket is created by checking its statistics like below
* Upload image to bucket

		s3cmd put <image> <bucket>

* List bucket contents

		s3cmd ls <bucket>
* Download uploaded image

		s3cmd get <bucket> <image>

* Run checksum to ensure downloaded image is not corrupt

		md5sum <image uploaded> <image downloaded>

**Swift Client**

Gateway instance, swift users can be verified using Swift client on gateway node or Ceph client. For more details on swift client, refer https://www.swiftstack.com/docs/integration/python-swiftclient.html

* Install swift client

		sudo apt-get install python-swiftclient

* Create creds.py with following file contents

		#Auth url pointing to gateway node

		export ST_AUTH=http://gateway.ex.com/auth/v1.0

		#Swift user

		export ST_USER=s3User:swiftUser
		#Swift user – secret key

		export ST_KEY= Pp3YqVoyqOpFF28kby03e55j3akd0wEE3NYGjXsK

* Source swift credentials like below

		source creds.py

* List container (aka S3 bucket) like below

		swift list

* Display container information

		swift stat <container>

* Upload image into container

		swift upload <container> <image to upload>

* Verify upload using stat

		swift stat <container>

* Verify uploaded image is residing in rgw pool

		rados –p .rgw.buckets ls
		
**Ceph Radosgw Client**

Assuming that Ceph client packages are already installed, perform following steps on client node to verify gateway instance, user and subuser created in previous section

* Edit /etc/hosts file to include gateway node

		192.x.x.x gateway.ex.com gateway

* Edit /etc/environment to gateway node entries and source the same. For example -

		export no_proxy=localhost,127.0.0.1,192.x.x.x,gateway.ex.com,gateway

* Copy ceph.client.radosgw.keyring and ceph.conf file from gateway node to /etc/ceph directory

		scp ceph-admin@192.x.x.x:/etc/ceph/ceph.client.radosgw.keyring .

		scp ceph-admin@192.x.x.x:/etc/ceph/ceph.conf .

* Ensure Ceph Health is OK

* Exercise S3 or Swift API calls as described in previous sections

**RADOS GATEWAY – KEYSTONE AUTHENTICATION**

Integration of Rados Gateway with Helion OpenStack identity service sets up the Gateway to authorize and accept Keystone users automatically. Users are created in rados pools provided they have valid keystone token. For more details refer, http://ceph.com/docs/master/radosgw/keystone/

**Assumptions**

* Gateway node has Apache2/FastCGI without 100 continue support

* Default gateway user on gateway node

**Steps**

Following are the steps to achieve this integration.

* On Ceph admin node, edit ceph.conf file to include the following.

		rgw keystone url = {keystone server url:keystone server admin port}
		
		rgw keystone admin token = [keystone admin token – Available in /etc/keystone/keystone.conf]
		
		rgw keystone accepted roles = {accepted user roles}
		
		rgw keystone token cache size = {number of tokens to cache}
		
		rgw keystone revocation interval = {number of seconds before checking revoked tickets}
		
		rgw s3 auth use keystone = true
		
		nss db path = {path to nss db}

	For example – rgw keystone url = http://192.0.2.21:5000

		rgw keystone admin token = aa4edaa3aa219a8b8e78f937083c61d68728b654
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

* Redeploy ceph.conf file on all Ceph cluster nodes and Helion Controller nodes

* On Management node, delete the existing swift endpoint and service if swift store is no longer required. For example -

	* keystone service-list will list all services. Note down swift service ID

	* keystone endpoint-list will all endpoints. Note down swift endpoint ID

	* keystone endpoint-delete <swift endpoint ID>

	* keystone service-delete <swift service ID>

* On Management node, configure keystone to point to Rados gateway endpoint like below. Assumption here is that url for gateway node is http://gateway.ex.com

	* keystone service-create --name swift --type object-store [Note down service ID]

	* keystone endpoint-create --service-id <service ID from above> --publicurl http://gateway.ex.com/swift/v1 --internalurl http://gateway.ex.com/swift/v1 --adminurl http://gateway.ex.com/swift/v1

* On any controller node say node 0, convert OpenSSL certificates that keystone uses to nss db format. In order to do this, ensure certutil package is available on controller nodes.

	* apt-get install libnss3-tools

	* mkdir /var/ceph/nss
	
	* openssl x509 -in /mnt/state/etc/keystone/ssl/certs/ca.pem -pubkey | certutil -d /var/ceph/nss -A -n ca -t "TCu,Cu,Tuw"

	* openssl x509 -in /mnt/state/etc/keystone/ssl/certs/signing_cert.pem -pubkey | certutil -A -d /var/ceph/nss -n signing_cert -t "P,P,P"

	* Create /var/ceph/nss directory on gateway node and copy converted certificates generated above in this path.

* On all controller nodes, edit /etc/apache2/sites-enabled/keystone_modwsgi.conf to include WSGIChunkedRequest like below. For more details, refer http://tracker.ceph.com/issues/7796

		<VirtualHost *:35357>
		
		……….

		<Directory /etc/keystone>
		
		……..
		
		WSGIChunkedRequest On
		
		…………
		
		</Directory>
		
		……………
		
		</VirtualHost>
		
		<VirtualHost *:5000>
		
		……….
		
		<Directory /etc/keystone>
		
		……..
		
		WSGIChunkedRequest On
		
		…………
		
		</Directory>
		
		……….....
		
		</VirtualHost>

* Restart apache2 service on all controller nodes like below

		service apache2 restart

* Restart ceph service on all controller nodes like below

		service ceph-all restart

* Restart radosgw service on gateway node like below
	
		/etc/init.d/radosgw restart

**Validation**

* Ensure proxy is not set on gateway node

* Ensure radosgw daemon is running as root and that there are no obvious errors in logs

* From Management node, make Swift v1 request like below. Assumption here is that s3User is already created using radosgw-admin command and that correct credentials for s3User is used in making the request. Output should list container if present.

		swift -V 1.0 -A http://gateway.ex.com/auth/v1.0 -U s3User:swiftUser -K “abc” list

* From Management node, make Swift v2 request using keystone. Ceph Object Gateway’s user:subuser tuple maps to the tenant:user tuple expected by Swift. Here, admin credentials are considered. Output should list container if present.

		swift -V 2.0 -A http://192.0.2.21:5000/v2.0 -U admin:admin -K “abc” list

* From Management node, execute the following to get the admin tenant ID

	Keystone tenant-list

		+----------------------------------+---------+---------+
		| id 							   | name 	 | enabled |
		+----------------------------------+---------+---------+
		| 627770d0c17c4423b8c27a2607e60798 | admin   | True    |
		| aa70711bd69e4958ac239e2564c18054 | demo    | True    |
		| 250bf66045814455a5b3c3e6c7fb7c19 | service | True    |
		+----------------------------------+---------+---------+

* Verify if admin user is created in rados pool like below
		
		rados --pool .users.uid ls
		s3User
		s3User.buckets
		627770d0c17c4423b8c27a2607e60798
		627770d0c17c4423b8c27a2607e60798.buckets