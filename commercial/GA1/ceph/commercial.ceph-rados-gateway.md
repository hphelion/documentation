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
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/esx/">NEXT &#9654;</a> </p> --->

# Ceph Reliable Autonomic Distributed Object Store Gateway (RADOSGW) for Helion OpenStack 1.1 Installations

The Ceph RADOS Gateway offers Swift API access to objects stored in Ceph. It is this object storage interface that uses the Ceph Object Gateway daemon - `radosgw`. `radosgw` FastCGI module for interacting with the Ceph storage cluster. For more details, refer to [http://http://ceph.com/docs/master/radosgw/](http://http://ceph.com/docs/master/radosgw/)


RADOS gateway is setup on a discrete node which eventually becomes an integral part of Ceph cluster. The existing Ceph cluster is easily extended by adding gateway node. For more details, refer to[http://http://ceph.com/docs/master/install/install-ceph-gateway/](http://http://ceph.com/docs/master/install/install-ceph-gateway/)

A load balance is required for a high availability (HA) RADOS Gateway installations. HAProxy is an example of a load balancer that is used with RADOS Gateway endpoints. For implementing the HA RADOS Gateway, a second gateway node is set up similarly to the first one but a  unique client is required for a second node. The following section explains the HA RADOS Gateway set up.


###Configuring the Administration Node

Perform the following steps from the Ceph admin node. It is assumed that the hostname for a gateway node is `gateway`, and the host name of the second node (for HA) is `gateway1`. 


1. Login to the admin node as root and ensure that the Ceph packages are successfully installed. If not, enter:

		apt-get install ceph

2. Change the directory by entering:
	
		cd  /etc/ceph

3. Create a keyring for a gateway and associate the required permission by entering:

		ceph-authtool --create-keyring /etc/ceph/ceph.client.radosgw.keyring
		chmod +r /etc/ceph/ceph.client.radosgw.keyring

4. To generate a gateway username and key (the default user is gateway), enter:


		ceph-authtool /etc/ceph/ceph.client.radosgw.keyring -n client.radosgw.gateway --gen-key

5. For HA, create additional user - `gateway1` by entering:

		ceph-authtool /etc/ceph/ceph.client.radosgw.keyring -n client.radosgw.gateway1 --gen-key

6.  Add key capabilities by entering:

		ceph-authtool -n client.radosgw.gateway --cap osd 'allow rwx' --cap mon 'allow rwx' /etc/ceph/ceph.client.radosgw.keyring

7. For HA, add key capabilities to the `gateway1` user, by entering:

		ceph-authtool -n client.radosgw.gateway1 --cap osd 'allow rwx' --cap mon 'allow rwx' /etc/ceph/ceph.client.radosgw.keyring

8. Add a key to the Ceph cluster by entering:

		ceph -k /etc/ceph/ceph.client.admin.keyring auth add client.radosgw.gateway -i /etc/ceph/ceph.client.radosgw.keyring

9.  For HA, add a key for the `gateway1` user by entering:

		ceph -k /etc/ceph/ceph.client.admin.keyring auth add client.radosgw.gateway1 -i /etc/ceph/ceph.client.radosgw.keyring

10. Copy a keyring to the gateway node(s) by entering:

		scp /etc/ceph/ceph.client.radosgw.keyring root@gateway:/etc/ceph

11.  Add a gateway configuration by updating the `ceph.conf` file by entering:

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

* Re-deploy the Ceph configuration on all cluster nodes and client nodes.

###Configuring the Gateway Node

Perform the following steps on the gateway node. For HA implementations, you will repeat similar steps on the failover node as noted.

1. Log into the gateway node as root and install the Ceph packages by entering:

		apt-get install ceph

2. Install the Apache2 and Fastcgi packages by entering:

		apt-get install apache2 libapache2-mod-fastcgi

3. Configure Apache2 and/or FastCGI by entering:

	**[[Command required**

4. Edit the `/etc/apache2/apache2.conf` file to include the server name of the gateway node(s) as follows: 
    
		ServerName gateway.ex.com

5. For HA, the second node is:

		ServerName gateway1.ex.com

6. Enable URL rewrite modules for Apache2 and FastCGI by entering:

		a2enmod rewrite
		a2enmod fastcgi

7. Restart Apache2 for the changes to take effect by entering:

		/etc/init.d/apache2 restart

8. Follow thse steps to enable SSL.

	1. Install the SSL module by entering:

			apt-get install openssl ssl-cert

	2. Enable SSL by entering:

			a2enmod ssl

	3. Generate SSL certificate by entering:

			mkdir /etc/apache2/ssl
	
			openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt

	4. Restart Apache2 by entering:

			/etc/init.d/apache2 restart

9. Edit `/etc/hosts` file to include the `fqdn` of a gateway node by entering:

		192.x.x.x gateway.ex.com gateway

10. For HA, second node is:
	
		192.x.x.x gateway1.ex.com gateway1

11. Add wildcard support to DNS by following these steps.

	1. Install dnsmasq by entering:

			apt-get install dnsmasq

	2. Edit `/etc/dnsmasq.conf` as follows:

			address=/.{fqdn}/{host ip}
			listen-address=127.0.0.1

		For example -

			address=/.gateway.ex.com/192.x.x.x
			listen-address=127.0.0.1

	3. For HA, the second node is:

		address=/.gateway1.ex.com/192.x.x.x
		listen-address=127.0.0.1

	4. Restart dsnmasq by entering:

			/etc/init.d/dnsmasq restart

	5. Ping the server with the subdomain to ensure RADOSGW can process subdomain requests by entering:

			ping mybucket.{fqdn}
			ping mybucket.gateway.ex.com

		[**NOTE: [[This did not work in hlinux**? does this problem still exit?]

12. Install the Ceph Object Gateway on node(s) by entering:

		apt-get install radosgw

13.  Install the Gateway agent on node(s) by entering:

 	* `wget -q -O- 'https://ceph.com/git/?p=ceph.git;a=blob_plain;f=keys/release.asc' | apt-key add -`

	**Note**: If a key cannot be downloaded, then perform above step on a Ubuntu host and copy it to the gateway node.

	* `echo deb http://ceph.com/debian-firefly/ wheezy main | tee /etc/apt/sources.list.d/ceph.list`

	* `apt-get install radosgw-agent`

14. Add the Ceph Object Gateway script `s3gw.fcgi in /var/www` directory with the file contents as shown below:

		#!/bin/sh
		exec /usr/bin/radosgw -c /etc/ceph/ceph.conf -n client.radosgw.gateway

15. Provide proper file permission by entering:

		chmod +x s3gw.fcgi

16. For HA, second node will be:

		#!/bin/sh
		exec /usr/bin/radosgw -c /etc/ceph/ceph.conf -n client.radosgw.gateway1

17. Create a data directory by entering:

		mkdir -p /var/lib/ceph/radosgw/ceph-radosgw.gateway

18. Add the gateway configuration file `rgw.conf in /etc/apache2/sites-available` directory with file contents as shown below:

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
			
			SSLEngine on
	        SSLCertificateFile /etc/apache2/ssl/apache.crt
	        SSLCertificateKeyFile /etc/apache2/ssl/apache.key
	        SetEnv SERVER_PORT_SECURE 443
		</VirtualHost>

	**Note**: For HA, second node will have changes for `ServerName`, `ServerAlias` and `ServerAdmin` accordingly.

19. Enable a site for `rgw.conf` by entering:

		a2ensite rgw.conf

20. Disable a default site by entering:

		a2dissite 000-default

21. Restart all services and start a gateway by entering:

	*  Apache2

			 /etc/init.d/apache2 restart

	* Gateway radosgw

			/etc/init.d/radosgw start

	* Radosgw in a debug mode for troubleshooting

			/usr/bin/radosgw -d -c /etc/ceph/ceph.conf --debug-rgw 20 --rgw-socket-path=/var/run/ceph/ceph.radosgw.gateway.fastcgi.sock

	* Ceph

			/etc/init.d/ceph restart

###Validating the Installation

Once all the services are up and running, make an anonymous GET request to the gateway instance to make sure you can receive a valid response.

1. Make sure that the proxy is not set on a gateway node(s) by entering:

	**[[command? if any?**

2. Edit `/etc/environment` to add the following and source the same: (** [[is this source command to the following information?).**

		export no_proxy=localhost,127.0.0.1,192.x.x.x,gateway.ex.com,gateway

3. GET Request 

		curl http://gateway.ex.com

4. GET Response

		<?xml version="1.0" encoding="UTF-8"?><ListAllMyBucketsResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/"><Owner><ID>anonymous</ID><DisplayName></DisplayName></Owner><Buckets></Buckets></ListAllMyBucketsResult>


	This response indicates that gateway instance is working as expected.

5. Otherwise execute `radosgw` in debug mode and look for an error(s).

6. For permission issues on `/var/run/ceph/ceph-client.radosgw.gateway.asok`, change file permissions as necessary by entering:

		chmod 777 /var/run/ceph/ceph-client.radosgw.gateway.asok

7. For an error with Apache2 or FastCGI, look for debug logs in `/var/log/apache2/error.log`. Change   permissions on `/var/www directory` or `/var/www/s3gw.fcgi file` to rectify the problem by entering:

		chmod 777 /var/www

		chmod 777 /var/www/s3gw.fcgi

##Creating Gateway Pools, Users and Sub-users, Access and Secret keys

###Pools

Ceph Object Gateways require Ceph Storage Cluster pools to store specific gateway data.  The gateway automatically creates pools. Created users will need permissions to access these pools. 

To list available pools, enter:

	rados lspools

Verify that the .`rgw.buckets` and `.rgw.buckets.index` pools are created by default. If not, create these pools using `ceph osd pool create` command. For more details, refer to [http://https://ceph.com/docs/master/radosgw/config-ref/#pools](http://https://ceph.com/docs/master/radosgw/config-ref/#pools)


<img src="media/helion-ceph-rados-lspools.png"/)>

###Creating the User and Sub-User

The User is a user of the S3 interface, and Sub-user is a user of Swift interface. The sub-user is always associated to a user. For details, refer to https://ceph.com/docs/master/radosgw/admin/. 

* To create a User and a Sub-user, enter:

	radosgw-admin user create --subuser=s3User:swiftUser --display-name="First User " --key-type=swift --access=full

	<img src="media/helion-ceph-create-user-subuser.png"/)>


* Ensure that the user (**s3User**) and subuser (**s3User:swiftUser**) are stored in respective `.users.uid` and `.users.swift` pools.

	<img src="media/helion-ceph-user-uid-user-swift.png"/)>


###Provisioning Access and Secret keys

S3 users and Swift users must have access and secret keys to enable end users and to interact with a gateway instance. S3 user access and its secret key are created by entering:

	radosgw-admin key create --uid=s3User --key-type=s3 --gen-access-key --gen-secret

	<img src="media/helion-ceph-generate-secrete-key.png"/)>

The key generated must be free of JSON escape (\) characters.

If the user or application writes more than 1k containers, then modify the `max_buckets` variable. Also, right-sizing of Placement Groups per Pool is required. Ensure `max_buckets` is set to unlimited size by setting the value to 0. <!---It is important in order to write unlimited containers in `.rgw.buckets` default pool during workload testing---->. To do this, enter:

	radosgw-admin user modify --uid=s3User --max-buckets=0

###Configuring the S3 Client

The S3 client is not supported by HP for user data, other than as a validation step during installation and configuration. For the gateway instance, S3 users created can be verified using  the s3cmd tool on the gateway node or Ceph client. For more details on the s3cmd tool, refer to http://s3tools.org/s3cmd.

* To install the s3cmd tool, enter:

		sudo apt-get install s3cmd

* Configure the s3cmd tool as shown below. Enter relevant information like access key, secret key, etc when prompted. This information is stored in the `.s3cfg` file:

		s3cmd --configure

* Access and secret key generated for the S3 user can be collected as shown below:

		radosgw-admin user info -uid=s3User

* List buckets using `radosgw-admin` command or `s3cmd` or by listing the .rgw.buckets pool as shown below. Initially, the list is empty.

* Create the bucket by entering:

		s3cmd mb s3://my-Bucket

* Upload the image to the bucket

		s3cmd put <image> <bucket>

* List bucket contents (and verify that it was created) by entering:
		s3cmd ls <bucket>

* Download the uploaded image by entering:

		s3cmd get <bucket> <image>

* Run checksum to validate that the downloaded image is not corrupt by entering:

		md5sum <image uploaded> <image downloaded>

###Configuring the Swift Client

For the gateway instance, swift users can be verified using the Swift client on the gateway node or the Ceph client. For more details on the Swift client, refer to https://www.swiftstack.com/docs/integration/python-swiftclient.html

* To install the Swift client, enter:

		sudo apt-get install python-swiftclient

* Create `creds.py` with following file contents by entering:

		#Auth URL pointing to gateway node:

		export ST_AUTH=http://gateway.ex.com/auth/v1.0

		#Swift user:

		export ST_USER=s3User:swiftUser

		#Swift user - secret key:

		export ST_KEY= Pp3YqVoyqOpFF28kby03e55j3akd0wEE3NYGjXsK

* Source the Swift credentials as shown below:

		source creds.py

* List the Swift container (aka S3 bucket) as shown below:

		swift list

* Display the Swift container information by entering:

		swift stat <container>

* Upload the image into the Swift container by entering:

		swift upload <container> <image to upload>

* Verify the upload by entering:

		swift stat <container>

* Verify that the uploaded image is residing in the rgw pool by entering:

		rados -p .rgw.buckets ls
		
**Verifying the Ceph RADOSGW Client**

Assuming that the Ceph client packages are already installed, perform following steps on the client node to verify the gateway instance, user and sub-user created in the previous section.

* Edit the `/etc/hosts` file to include the gateway node by entering:

		192.x.x.x gateway.ex.com gateway

* Edit `/etc/environment` to include the gateway node entries and source the same. For example, enter:

		export no_proxy=localhost,127.0.0.1,192.x.x.x,gateway.ex.com,gateway

* Copy the `ceph.client.radosgw.keyring` and `ceph.conf` file from the gateway node to the `/etc/ceph` directory by entering:
    
		scp ceph-admin@192.x.x.x:/etc/ceph/ceph.client.radosgw.keyring .

		scp ceph-admin@192.x.x.x:/etc/ceph/ceph.conf .

* Veriofy that the Ceph Health is OK.

* Exercise S3 or Swift API calls as described in previous sections.

###Integrating the RADOS Gateway - Keystone Authentication

Integration of the RADOS Gateway with the Helion OpenStack Identity service (Keystone) sets up the Gateway to authorize and accept Keystone users automatically. Users are created in RADOS pools provided they have valid Keystone tokens. For details refer to http://ceph.com/docs/master/radosgw/keystone/.

**Assumptions**

* The gateway node has Apache2/FastCGI without `100 continue support`.

* The default gateway user is on the gateway node.

**Steps**

To achieve this integration, perform the following steps.

* On the Ceph admin node, edit the `ceph.conf` file to include the following:

		rgw keystone url = {keystone server url:keystone server admin port}
		
		rgw keystone admin token = [keystone admin token - Available in /etc/keystone/keystone.conf]
		
		rgw keystone accepted roles = {accepted user roles}
		
		rgw keystone token cache size = {number of tokens to cache}
		
		rgw keystone revocation interval = {number of seconds before checking revoked tickets}
		
		rgw s3 auth use keystone = true
		
		nss db path = {path to nss db}

	For example - rgw keystone url = http://192.0.2.21:5000

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

* Re-deploy the `ceph.conf` file on all Ceph cluster nodes and the Helion Controller nodes.

* On the Management node, delete the existing Swift endpoint and service if Swift store is no longer required. For example:

	* `keystone service-list` will list all services. Note down swift service ID

	* `keystone endpoint-list` will all endpoints. Note down swift endpoint ID

	* `keystone endpoint-delete` *`<swift endpoint ID>`*

	* `keystone service-delete` *`<swift service ID>`*

* On the Management node, configure Keystone to point to the RADOS gateway endpoint as shown below. Assumption here is that the URL for the gateway node is http://gateway.ex.com.

	* `keystone service-create` --name swift --type object-store [Note down service ID]

	* `keystone endpoint-create` --service-id <service ID from above> --public url http://gateway.ex.com/swift/v1 --internal url http://gateway.ex.com/swift/v1 --admin url http://gateway.ex.com/swift/v1

* On any controller node (for example, node 0), convert the OpenSSL certificates that Keystone uses to a NSS database format. To do this, ensure that the `certutil` package is available on all controller nodes. To do this, enter:

	* `apt-get install libnss3-tools`

	* `mkdir /var/ceph/nss`
	
	* `openssl x509 -in /mnt/state/etc/keystone/ssl/certs/ca.pem -pubkey | certutil -d /var/ceph/nss -A -n ca -t "TCu,Cu,Tuw"`

	* `openssl x509 -in /mnt/state/etc/keystone/ssl/certs/signing_cert.pem -pubkey | certutil -A -d /var/ceph/nss -n signing_cert -t "P,P,P"`

	* Create the `/var/ceph/nss` directory on the gateway node and copy converted certificates generated above in this path.

* On all controller nodes, edit `/etc/apache2/sites-enabled/keystone_modwsgi.conf` to include `WSGIChunkedRequest` as shown below. For details, refer to http://tracker.ceph.com/issues/7796.

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

* Restart the Apache2 service on all controller nodes as shown below:

		service apache2 restart

* Restart the Ceph service on all controller nodes as shown below:

		service ceph-all restart

* Restart the RADOSGW service on the gateway node as shown below:
	
		/etc/init.d/radosgw restart

**Validating the Configuration**

* Make sure the proxy is not set on gateway node.

* Make sure that the `radosgw` daemon is running as root and that there are no obvious errors in  the logs.

* From the Management node, make Swift v1 requests as shown below. (The asssumption here is that `s3User` is already created using the `radosgw-admin` command and that the correct credentials for `s3User` are used in making the request. Output should list the container if it is present.)

		swift -V 1.0 -A http://gateway.ex.com/auth/v1.0 -U s3User:swiftUser -K "abc" list

* From the Management node, make Swift v2 requests using Keystone. (The Ceph Object Gateway's user:subuser tuple maps to the tenant:user tuple expected by Swift. Here, admin credentials are considered. Output should list container if it is present.)

		swift -V 2.0 -A http://192.0.2.21:5000/v2.0 -U admin:admin -K "abc" list

* From the Management node, to get the admin tenant ID, enter:

		Keystone tenant-list
Output:

		+----------------------------------+---------+---------+
		| id 							   | name 	 | enabled |
		+----------------------------------+---------+---------+
		| 627770d0c17c4423b8c27a2607e60798 | admin   | True    |
		| aa70711bd69e4958ac239e2564c18054 | demo    | True    |
		| 250bf66045814455a5b3c3e6c7fb7c19 | service | True    |
		+----------------------------------+---------+---------+

* Verify if the admin user is created in the RADOS pool as shown below:
		
		rados --pool .users.uid ls
		s3User
		s3User.buckets
		627770d0c17c4423b8c27a2607e60798
		627770d0c17c4423b8c27a2607e60798.buckets


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
