---
layout: default
title: "HP Cloud Services: Overview of Transitioning from Version 12.12 to 13.5"
permalink: /migration-overview-reference/

---
#HP Cloud Services: Overview of Transitioning from Version 12.12 to 13.5 #

This page provides you with information to help you transition your HP Cloud Services version 12.12 instance(s) to an HP Cloud Services 13.5 instance. 

In general, the process for transitioning to 13.5 involves creating a new 13.5 instance, configuring that instance, and moving any required data files to that new instance.  

This overview outlines the tasks you will need to perform, based upon the operating system on your cloud client system (your local system) and the operating systems used by your cloud instance(s).

If you have any questions or concerns about which files to copy, [contact our Support team](#support).


##Tasks for the Cloud migration## {#tasks}

In order to transition version 12.12 to version 13.5, you will need to perform the following general steps: 

1: [Review the tasks in Before You Begin](#before).

2: [Generate a security key pair to use with the 13.5 instance](#keypair).

3: [Configure security groups to use with the 13.5 instance](#securitygroup).

4: [Create the HP Cloud Services 13.5 instance](#createinstance).

5: [Connect to the 13.5 instance from a local system](#connect).

6: [Copy data from the 12.12 instance to 13.5 instance](#copydata).

7: [Create and attach block volumes to the instance, if needed](#transdata).

8: [Review further information](#furtherinfo).

Within each of these general tasks, there are procedures for different operating systems and software tools.

<!--
- Develop list of tasks that the user will need to perform
- Determine if instance is ephemeral or persistent 
- List of prerequisites (software, user accounts, passwords, hardware, etc.)
- Estimate of time required
-->


##Before you begin## {#before}

Before you begin transitioning to a 13.5 instance, it can be helpful to purge any unneeded data or log files from your 12.12 instance(s). 

##Section 1: Generating a key pair## {#keypair}

Before you create your first HP Cloud Services 13.5 instance, you must generate a key pair for that instance. The new key pair can be used with any subsequent 13.5 instances you create.

A key pair is a cryptographic tool that uses two mathematically related keys. One key can be used to encrypt a message that can only be decrypted using the other key. 

When you create a key pair, the key pair tool creates a private key and a public key. When you create an instance, you must select a key pair. The public key is injected into your instance and saved in the `.ssh` folder as an authorized key. To access that instance, you must have the private key associated with that public key on the local system.

You create both keys at the same time using any of multiple methods, including the following:
	
- [Using the Management Console](#keypairconsole) 
- [Using the API](#keypairapi) 
- [Using the NovaClient CLI](#keypairconnova)
- [Using an existing public key](#keypaircown)

####Key Pairs and Availability Zones####

In the US West region, key pairs are specific to an Availability Zone (AZ). A key pair you create in AZ-1 cannot be used in AZ-2 until you have [migrated that key pair to that zone](#keypairmigrate).

In the US East region, you create a key pair that can be used in all of the availability zones in the region.
<img src="media/keypair_zones.png" width="350" alt="" />

If your environment includes multiple Availability Zones, you can transfer a key pair for one Availability Zone to the other Availability Zones, as required. Transferring a key pair allows you to create, manage, and maintain only one key pair, rather than using separate key pairs for each zone. For more information, see [Migrating or Transferring Your Key Pairs](#keypairmigrate).

###Generating a Key Pair using the management console### {#keypairconsole}

You can use the management console to generate a key pair.

To create a key pair using the management console:

1. Log in to the [management console](https://console.hpcloud.com/manage) using an HP Cloud Services client.

    <img src="media/cloud_login.png"  alt="" />

2. In the Dashboard, click the appropriate the Availability Zone for your 13.5 instance.

	**Note**: In the US West region, key pairs are specific to an Availability Zone (AZ). A key pair you create in AZ-1 cannot be used in AZ-2 until you have [migrated that key pair to that zone](#keypairmigrate).
	In the US East region, you create a key pair that can be used in all of the availability zones in the region.

3. From the menu, select `Key Pairs`. 

    The Key Pairs page appears.

4. Click `Add Key Pair`.

5. In the Name field, enter a name for the key pair. 

    <img src="media/mc_keypair_add.png"  alt="" />

	Use only alphanumeric characters. Do not use spaces or special characters, such as periods. For more information, see [Naming Convention Best Practices](https://community.hpcloud.com/article/naming-convention-best-practices).

	**Note**: In the management console, there is a 100-character limit in the `Key Name` field. To use a longer name, [use the API](#keypairapi) to create a key pair.

6. Click `Create Key`.

	After creating the key pair, the management console displays the contents of the private key. 
<br><img src="media/mc_keypair_key.png"  alt="" />

7. Click `Download` to save the private key in a PEM file to the local system or copy the key pairs into a text editor and save the file in the PEM format on the local system. Note the location where you save the file for later use.

	IMPORTANT: If you copy the text, do not change the formatting of the text.

###Generating a key pair using the API### {#keypairapi}

To generate the key pair using the API: 

1.  On the 13.5 instance, use the following call, depending upon the data serialization format you choose, XML or JSON :
 

    `POST v2/{tenant_id}/os-keypairs`

	Where:

    	tenant_id (optional) - xsd:string - The ID for the tenant or account in a multi-tenancy cloud.

    	name (required) - xsd:string - The name to be associated with the key pair.

		public_key (optional) - xsd:string - The SSH public key to import. If not provided, both a public and private keys are returned to the user.

	XML

		<?xml version="1.0" ?>
		<keypair>
		    <name>{Name}</name>
		</keypair>

	JSON

		{
    		"keypair": {
    		    "name": "{Name}"
			}
		}

	The following examples create a key pair called `keypair-2`.

	XML

		<?xml version="1.0" ?>
			<keypair>
				<name>keypair-2</name>
			</keypair>

	JSON

		{
    		"keypair": {
    		    "name": "keypair-2"
			}
		}

	The key pair displays when created. 

2. Copy the private key into a text editor and save the file in the PEM format on the local system. Note the location where you save the file for later use. </p>

3. Copy the public key into a text editor and save the file in the PEM format on the local system. Note the location where you save the file for later use.

For more information, see [HP Cloud Compute Service API Reference](https://docs.hpcloud.com/api/v13/compute/#createKeypair).


###Generating a Key Pair using the UNIX Command Line Interface### {#keypairunix}

There are two methods you can use to create a key pair using the HP Cloud Services UNIX CLI. 

- Create your key pair using the `-o` flag to save the key pair file in the `~/.hpcloud/keypairs` folder. The flag does not display the key pair on the screen. Saving to a file allows you to use the auto-connect feature after you create an instance with that key pair. 
- Create a key pair without the `-o` flag to have the key pair display on screen. You will need to manually save the key pair in a text file.

You can view the full details of the command by entering `hpcloud help keypairs:add`

For the full list of supported UNIX commands, see the [UNIX command line interface commands](#http://docs.hpcloud.com/cli/unix/reference).

To generate a key pair in UNIX:

1. Launch an SSH client to connect with the 12.12 instance that is in the same Availability Zone where you will create the 13.5 instance. 
	
2. Use either of the following commands:

    `hpcloud keypairs:add -o KEYPAIR_NAME`

	`hpcloud keypairs:add KEYPAIR_NAME`

	The following example creates a key pair named `test` and saves the key pair to a file at `/home/ubuntu/.hpcloud/keypairs/test.pem`:

    `$ hpcloud keypairs:add test`

3. Navigate to the key pair file and display the file. By default, the key pair is stored in the `/home/ubuntu/.hpcloud/keypairs/` directory.

	`cat KEYPAIR_NAME2.pem`
	<br><img src="media/keypair_unix.png"  alt="" />

4. Copy the entire output into a text file on the local system and save it with a .pem extension.
	<br><img src="media/keypair_copy_text.png"  alt="" />
	
###Generating a Key Pair using the NovaClient CLI### {#keypairnova}

1. Connect with the 12.12 instance that is in the same Availability Zone where you will create the 13.5 instance.

2. Launch a command line window or UNIX shell.

3. Run the following command to create a key pair:

		nova keypair-add KEYPAIR_NAME

	Where:

	KEYPAIR_NAME. The name to assign to the key pair.

	Use only alphanumeric characters. Do not use spaces or special characters, such as periods, slashes, colons, commas, period, semicolons, underscores, or equal signs. Refer to [Naming Convention Best Practices](https://community.hpcloud.com/article/naming-convention-best-practices) for more information.

	**Note**: There is a 255-character limit in the NAME field. You will see a "Invalid keypair name (HTTP 400)" error if you've exceeded that limit.

	NovaClient creates the key pair. The private key pairs appear. 
<br><img src="media/keypair_python.png"  alt="" />

3. Copy the key pair into a text editor and save the file in the PEM format on the local system. Note the location where you save the file for later use.

	**Note**: If you plan to connect to an instance using PuTTY, convert the PEM file to PPK file for use in PuTTY using a program such as PuTTYgen. For more information, see [Converting Your Keypair File](https://community.hpcloud.com/article/converting-your-keypair-file). 


###Uploading Your Own Public Key### {#keypairown}

You can use an existing public key to generate a new key pair based on that public key.

To generate a new public key using an existing private key:

1. Log in to the [management console](https://console.hpcloud.com/manage).

2. In the Dashboard, click the appropriate the Availability Zone.

3. From the menu, click `Key Pairs`.

4. In the Key Pairs screen, click `Add Key Pair`.

5. In the `Key Name` field, enter a name for the new key pair.

	Use only alphanumeric characters for the key pair name. Do not use spaces or special characters, such as periods. Refer to [Naming Convention Best Practices](https://community.hpcloud.com/article/naming-convention-best-practices) for more information.

	**Note**: In the management console, there is a 100-character limit in the Key Name field. To use a longer name, [use the API](#keypairapi) to create a key pair.

6. Click `Show Public Key Field`. The `Show Public Key` field appears.
<br><img src="media/keypair_show_public.png"  alt="" />

7. Copy and paste your public key into the text box, then click `Create Key`.
<br><img src="media/keypair_own.png"  alt="" />

	The management console creates the key pair based on the public key you entered.

###Migrating or Transferring Your Key Pairs## {#keypairmigrate}

If your environment includes multiple Availability Zones, you can transfer a key pair for one Availability Zone to the other Availability Zone, as required. Transferring a key pair allows you to create, manage, and maintain only one key pair, rather than using separate key pairs for each zone.

For example, if you create a key pair for the US West/AZ-1 zone, and you want to use that same key pair in AZ-2 or AZ-3, you can simply transfer that key pair, rather than create a pair for each zone. 

You can use one of the following procedures, based on your environment:

- [Using the API](#keypairmigrateapi)
- [Using PuTTY and the management console](#keypairmigrateputty)
- [Using the HP Linux CLI and the management console](#keypairmigratelinux)


**Note**: In the US West region, key pairs are specific to an Availability Zone (AZ). A key pair you create in AZ-1 cannot be used in AZ-2 until you migrate that key pair to that zone. In the US East region, you create a key pair that can be used in all of the availability zones in the region.
<img src="media/keypair_zones.png" alt="" />

####Transferring a key pair using the API#### {#keypairmigrateapi}

1.  Use the following [API call](http://docs.hpcloud.com/api/compute/#createKeypair) to create a key pair:


	`GET v1.1/{tenant_id}/os-keypairs/{keypair_name}`

	Where:
	
		tenant_id - xsd:string - The ID of the cloud tenant.

		name (required) - xsd:string - The name to be assigned to the key pair.

	XML

			<?xml version="1.0" ?>
				<keypair>
    				<name>{Name}</name>
			</keypair>
	
	JSON

			{
    			"keypair": {
    			    "name": "{Name}"
    			}
			}

	The following examples display a key pair named keypair-2:

	XML

		<?xml version="1.0" ?>
			<keypair>
    			<name>keypair-2</name>
		</keypair>
	

	JSON

		{
    		"keypair": {
    		    "name": "keypair-2"
    		}
		}

	The commands output the key pairs in a format similar to the following:

	XML

		<keypair xmlns="http://docs.openstack.org/compute/api/v2">
    		<public_key>
    		    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQDZcOCJGRF2REub4+j5Y6LnF7Lk4xyvpdeqAEZYRJe8lC0YOhkF9PxOAQnSgRuAvcmFiff9E1Dt9yLCSlU40zRClLEMwchG4S51y4JI/mbMwppWKYxgPnIa9rHSIccEtZbhBU1MkwpUHeRcZE+b60y5xXiYSmVacmtwDZ89qf6TvQ== 
    		</public_key>
    	<private_key>
    	    -----BEGIN RSA PRIVATE KEY-----
		MIICXQIBAAKBgQDZcOCJGRF2REub4+j5Y6LnF7Lk4xyvpdeqAEZYRJe8lC0YOhkF.... Naws/HNm7BwTeXRI+XgnFaIB+yxVMmzmh0/qRVEPEC/P
		-----END RSA PRIVATE KEY-----
    	</private_key>
    	<user_id>
    	    13311562627589
    	</user_id>
    	<name>
    	    keypair-2
    	</name>
    	<fingerprint>
    	    76:e3:b7:ca:95:91:fb:86:f7:fe:5d:d4:11:4d:77:65
    	</fingerprint>
	</keypair>

	JSON
	
		  {
		    "keypair": {
		        "fingerprint": "d3:e3:5f:26:dc:30:fc:04:57:91:ba:c0:1c:f8:8d:cd",
		        "name": "keypair-1",
		        "private_key": "-----BEGIN RSA PRIVATE KEY-----\nMIICXAIBAAKBgQChJO5vnbzIRU45LFdm5ohdFtIDQo...1\nv4gpK7hK3EyKStTsaADbYNjlh/mrMU2Q8Zlu7ybUI2Q=\n-----END RSA PRIVATE KEY-----\n",
				"public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQChJO5vnbzIRU45LFdm5ohdFtIDQo1jPB1xSnWu2vJtyw5wGFjoclpuFLstPMRDixloNTh36ff3XnW6Nb4CTpm5Vwz0V6Im2q56vTbS246Lw0+3fDSrnmwFkuJ7rqI5AKZkN4zJg/iJdsuJ768K7yVzwMHP/FWy6bUdRZm5ETjM2w== \n",
        		"user_id": "13311562627589"
    		}
		}

2.  Use the following [API call](http://docs.hpcloud.com/api/compute/#createKeypair) to import a public key and generate a new key pair.

	`POST v2/{tenant_id}/os-keypairs`

	Where

	    tenant_id - xsd:string - The ID of the tenant.

	    name (required) - xsd:string - The name to be associated with the key pair.

	    public_key - xsd:string - Enter the public key generated above. 

	XML

		<?xml version="1.0" ?>
			<keypair>
	    		<name>{Name}</name>
				<public_key>{public_key}</public_key>
		</keypair>
	
	JSON

		{
    		"keypair": {
    		    "name": "keypair-2"
				"public_key": "public_key"
    		}
		}

	The commands import the key pairs in a format similar to the following:

	XML

		<?xml version="1.0" ?>
			<keypair>
    			<name>keypair-2</name>
				<public_key>ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQDZcOCJGRF2REub4+j5Y6LnF7Lk4xyvpdeqAEZYRJe8lC0YOhkF9PxOAQnSgRuAvcmFiff9E1Dt9yLCSlU40zRClLEMwchG4S51y4JI/mbMwppWKYxgPnIa9rHSIccEtZbhBU1MkwpUHeRcZE+b60y5xXiYSmVacmtwDZ89qf6TvQ==</public_key>
		</keypair>
	
	JSON

		{
    		"keypair": {
    		    "name": "{Name}"
				"public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQDZcOCJGRF2REub4+b60y5xXiYSmVacmtwDZ89qf6TvQ=="
    		}
		}


####Transferring a key pair using PuTTYgen#### {#keypairmigrateputty}

To transfer a key pair using PuTTYgen:
	
1. Launch the PuTTYgen interface.

2. From the `Conversions` menu, click `Import Key`. 

3. Select the PEM file associated with the key pair

	Information about the key pair displays.

4. Copy the entire contents of the `Public key for pasting into OpenSSH authorized_keys file field`, starting with `ssh-rsa` to the end of `imported-openssh-key`.
<br><img src="media/trans_keypair_pgen.png" alt="" />

5. Log in to the [management console](https://console.hpcloud.com/manage).

6. In the Dashboard, click the appropriate the Availability Zone for the 13.5 instance.

7. From the menu, select Key Pairs. 
	The Key Pairs page appears.

8. Click `Add Key Pair`.

9. Enter a name for the key pair.

10. Click `Show Public Key Field`.
<br><img src="media/keypair_show_public.png"  alt="" />

11. Paste the data from your public key into the `Select the Show Public Key` field.
<br><img src="media/keypair_own.png"  alt="" />

12. Click `Create Key`.

A new private key is generated and paired with the public key you entered. You can now use the same private key (the PEM file) in the zone you created the new key pair in.
 
####Transferring a key pair using the Linux CLI#### {#keypairmigratelinux}

You can use a Linux CLI tool, such as PuTTY, to obtain the public key. Then, use the management console to create a key pair.

To transfer a key pair using the Linux CLI:

1. Connect with the 12.12 instance that is in the same Availability Zone where you will create the 13.5 instance using a SSH tool, such as PuTTY.

2. Execute one of the following commands to retrieve the Public Key, depending upon your Linux distribution:

	CentOS or Fedora

	`cat /root/.ssh/authorized_keys`

	Ubuntu 

    `cat /home/ubuntu/.ssh/authorized_keys`

3. Copy the output from the command, starting with `ssh-rsa`.
<br><img src="media/keypair_linux.png"  alt="" />

4. Log in to the [management console](https://console.hpcloud.com/manage).

5. In the Dashboard, click the appropriate the Availability Zone for the 13.5 instance.

6. From the menu, select Key Pairs. 
	The Key Pairs page appears.

7. Click `Add Key Pair`.

8. Enter a name for the key pair.

9. Click `Show Public Key Field`.
<br><img src="media/keypair_show_public.png"  alt="" />

10. Paste the data from your public key into the `Select the Show Public Key` field.
<br><img src="media/keypair_own.png"  alt="" />

11. Click `Create Key`.

A new private key is generated and paired with the public key you entered. You can now use the same private key (the PEM file) in the zone you created the new key pair in.


##Section 2: Controlling traffic using security groups## {#securitygroup}

Access to your instances is controlled by security groups. A security group is a collection of inbound and outbound rules that determine the protocols and ports a server can send and receive traffic from. When you create an instance, you specify a security group.

Security group rules specify the traffic that is allowed through to the server. No traffic can be received by an instance unless a security group rule explicitly allows that traffic from that IP address. 

<p id="securitygroupdefault">The system includes one default security group, which contains four rules:
<br><img src="media/sec_group_defafult.png"  alt="" /></p>

    Outgoing: This rule allows all outgoing traffic.
    Incoming ICMP: This rule allows all inbound ICMP traffic.
	Incoming TCP Port 22: This rule allows SSH traffic through port 22.
    Incoming Group Rule: A rule that adds the default group to itself.

You can create your own security groups or you can change the default group, as needed.

There are different methods that you can use to manage security groups:

- [Using the Management Console to control traffic](#securitygroupconsole)
- [Using the API](#securitygroupapi)
- [Using Python-NovaClient commands](#securitygrouppyth)

####About using CIDR to control traffic#### {#securitygroupcidr}

You can restrict access to your 13.5 instance by configuring security group rules using Classless Inter-Domain Routing (CIDR).

CIDR specifies an IP address range using a combination of an IP address and its associated network mask. CIDR notation uses the following format:

	xxx.xxx.xxx.xxx/n 

Where

	xxx.xxx.xxx.xxx - the IP address that is affected by the rule.
  
	/n - the network mask.

The following is an example of a typical CIDR network address:

    192.30.250.00/18

The `192.30.250.00` is the network address. The `/18` indicates that the first 18 bits are the network part of the address and the last 14 bits for specific host addresses.

The following examples show how to restrict access using CIDR:

	0.0.0.0/0 - This CIDR affects traffic across all IP addresses
	15.185.1.1/0 - This CIDR affects traffic across all IP addresses
	15.185.1.1/8 - This CIDR affects traffic to IP addresses starting with 15.x.x.x
	15.185.1.1/16 - This CIDR affects traffic to IP addresses starting with 15.185.x.x
	15.185.1.1/24 - This CIDR affects traffic to IP addresses starting with 15.185.1.x
	15.185.1.1/32 - This CIDR affects traffic to a single host with IP address 15.185.1.1

For more information on security groups, see [How To Add/Remove Security Groups from an Existing Instance](https://community.hpcloud.com/article/how-addremove-security-groups-existing-instance)
[Common Ports and their Service](https://community.hpcloud.com/article/common-ports-and-their-service).

###Controlling traffic using the management console ### {#securitygroupconsole}

You can use the management console to add, delete, and modify security groups. 	

When you add, modify, or delete a security group rule, the rule immediately goes into effect for all instances using that security group.

####Creating a security group#### {#securitygroupconsolecreate}

To create a new security group:

1. Log in to the [management console](https://console.hpcloud.com/manage).

2. In the Dashboard, click the appropriate the Availability Zone for the 13.5 instance.

3. From the menu, click `Security Groups`.

4. In the Security Groups page, click `New Security Group`.

5. Enter a name and description for the security group in the fields that appear.

	A new security group is listed.

6. Click the name of the security group in the list to edit that group using the steps in the [following section](#securitygroupconsoleedit).
<br><img src="media/sec_group_defafult.png"  alt="" />


####Modifying a security group#### {#securitygroupconsoleedit}

To modify a security group:

1. Log in to the [management console](https://console.hpcloud.com/manage).

2. In the Dashboard, click the appropriate the Availability Zone for the 13.5 instance.

3. From the menu, click `Security Groups`.

4. In the Security Groups page, double-click the name of the security group to modify.

5. Add or edit a rule as follows:

	- Add a new rule by specifying the following in the top row in the Rules table, then click `Add` in the Manage column:

		-  Direction. Select *incoming* if the rule applies to traffic coming into the instance or *outgoing* if the traffic is leaving the instance.
		-  IP Protocol. Select UDP, TCP, or ICMP for the rule.
		-  Port Min / ICMP Type. Enter the port or ICMP type the rule affects. For a range of ports, enter the beginning port in the range. 
		-  Port Max / ICMP Code. Enter the port or ICMP type the rule affects. For a single port, enter the same port that you entered in the Port Min field. For a range of ports, enter the last port in the range.
		-  Remote IP Prefix. Enter the IP address and associated network mask that the rule affects, [using CIDR](#securitygroupcidr).

	- Delete a rule by clicking `Delete` in the Manage column for that rule 
<br><img src="media/sec_group_edit.png" alt="" />


###Managing your Security Groups using the API### {#securitygroupapi}

For information on using the API to create and configure security groups, see [Compute API - Security Groups](https://docs.hpcloud.com/api/v13/compute/#4.1.12SecurityGroups).

Add a security zone

1. Use the following [API call](https://docs.hpcloud.com/api/v13/compute/#4.1.12SecurityGroups) to add a security group to the list of security groups that are associated with the server.

	`POST v2/{tenant_id}/servers/{server_id}/action`


	Where: 

    	tenant_id - xsd:string - The ID for the tenant or account in a multi-tenancy cloud.

		server_id - csapi:ID or UUID -- Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Availability Zone. 

	XML

		<?xml version="1.0" ?>
			<addSecurityGroup xmlns="http://docs.openstack.org/compute/api/v2">
    		<name>security-group-2</name>
		</addSecurityGroup>

	JSON

  		{
    		"addSecurityGroup": {
    		    "name": "security-group-1"
    		}
		}


2. Use the following [API call](https://docs.hpcloud.com/api/v13/compute/#createSecGroupRule-jumplink-span) to create a security group rule. 

	`POST v2/{tenant_id}/os-security-group-rules`

	Where:

		tenant_id (optional) - xsd:string - The ID for the tenant or account in a multi-tenancy cloud.	

		parent_group_id (required) - xsd:int - ID of the security group to which this rule will belong.

    	ip_protocol (optional) - xsd:string - Packets using  the specified IP protocol (TCP, UDP, ICMP) are delivered to the server. If ip_protocol is specified, the from_port and to_port must also be specified. If ip_protocol is omitted, traffic is delivered without regard to protocol. 

    	from_port (optional) - xsd:int - For TCP and UDP packets, traffic to ports between `from_port` and `to_port` are delivered to the server. For ICMP packets, the `from_port` specifies the ICMP type of the packets that will be accepted. If `from_port` is specified, the `to_port` and `ip_protocol` must also be specified.

    	to_port (optional) - xsd:int - For TCP and UDP packets, traffic to ports between `from_port` and `to_port` are delivered to the server. For ICMP packets, the `from_port` specifies the ICMP type of the packets that will be accepted. If `from_port` is specified, the `to_port` and `ip_protocol` must also be specified.

    	cidr (optional) - xsd:string - Traffic from source with an IP address in the range specified by CIDR will be accepted. Either `cidr` or `group_id` must be specified.

    	group_id (optional) - xsd:int - Traffic from all servers associated with the security group specified by `group_id` will be accepted. Either `cidr` or `group_id` must be specified.


###Managing your Security Groups using Python-NovaClient commands### {#securitygrouppyth}

You can use Python-NovaClient commands to add, delete, and modify security groups. 

####Creating a security group#### {#securitygrouppythcreate}

To create a new security group:

1. Connect with the 12.12 instance that is in the same Availability Zone where you will create the 13.5 instance.

2. Launch a command line window or UNIX shell.

3. Execute the following command to create a security group.

	`nova secgroup-create <name> <"description">`

	Where 

		name - The name of the security group.

		description - The Description of the security group. Use quotes with the description. 

	The following example creates a security group called *pgroup*.

		`$ nova secgroup-create pgroup testing`

4. Edit the group using the steps in the [following section](#securitygroupconsoleedit).

####Modifying a security group#### {#securitygrouppythedit}

To modify a security group:

1. Connect with the 12.12 instance that is in the same Availability Zone where you will create the 13.5 instance.

2. Launch a command line window or UNIX shell.

3. Execute the following command to display a list of the security groups for the current instance.

	`nova secgroup-list`
<br><img src="media/Python_secgroup_list.png" alt="" />

4. Execute the following command to display the rules in a specified security group.

    	`nova secgroup-list-rules [security_group_name]`

	Where

		security_group_name - The name of the security group.

	The following example lists the rules in the default security group.

		`nova secgroup-list-rules default`
<br><img src="media/Python_secgroup_list_rules.png" alt="" />

		- The ICMP rule allows all ICMP traffic.
		- The TCP port 22 rule allows SSH traffic over port 22.
		
5. Use the commands in the [Python NovaClient CLI Reference](https://docs.hpcloud.com/cli/nova/reference) to add and remove the rules as needed.

	`Add a rule to a security group.`

    `nova secgroup-add-rule <secgroup> <ip_proto> <from_port> <to_port> <cidr>`

	Where:

		secgroup - The ID of the security group.
	
		ip_proto - IP protocol type (ICMP, TCP, or UDP).

		from_port - The port at start of range. For a range of ports, enter the beginning port in the range.

		to_port - The port at the end of range. For a single port, enter the same port in the Port Min field. For a range of ports, enter the last port in the range.

		cidr - Classless inter-domain routing (CIDR) for the address range. 

	`Remove a rule from a security group.`

	`nova secgroup-delete-rule <secgroup> <ip_proto> <from_port> <to_port> <cidr>`

**Note**: You can type `nova help` before any of the commands for more information and to get the syntax used including both required and optional arguments. 


##Section 3: Creating the storage instance## {#createinstance}

The [OpenStack Storage](http://www.openstack.org/software/openstack-storage) infrastructure provides two classes of storage: *ephemeral* instance storage and *persistent* instance storage.

Ephemeral instance storage exists only for the life of an instance. An ephemeral instance persists across reboots of the client system, but when an instance is terminated the associated data is also deleted.  

Persistent image storage exists beyond the life of an instance. When you create a persistent instance, you also create a bootable volume. If you terminate the instance, the root file system continues to exist and the data is retained.

- [Create an ephemeral instance](#createephinstance)
- [Create a persistent instance](#createpersinstance)

###Creating an ephemeral instance### {#createephinstance}

You can create an ephemeral instance for HP Cloud Services by using either the management console or by using Python-NovaClient commands.

- [Using the management console](#createephinstanceconsole)
- [Using Python-NovaClient](#createephinstancenova)

After you create the instance, you can copy the data from your HP Cloud Services version 12.12 instance to your new version 13.5 instance.

####Creating an ephemeral instance using the management console#### {#createephinstanceconsole}
To create an ephemeral instance using the management console:

1. Log in to the [management console](https://console.hpcloud.com/manage).

2. In the Dashboard, click the appropriate the Availability Zone for the 13.5 instance.

3. In the Security Groups page, click `Create Server`.

4. Enter the appropriate information in the following fields:

	Name - Enter a display name for the instance.

	AZ (optional) - Select a specific availability zone. Select `No Preference` to have an availability zone assigned randomly.

	Source Image - Click `Public Images`, `Partner Images`, `Private Images`, or `Bootable Volume Images`, as appropriate, then select a specific image.

	Flavor - Select a flavor for the instance. A flavor is a set of resources, including the number of virtual CPUs, the amount of RAM, and the size of the ephemeral disks.

	Key name - Select the key pair you created for the instance. For more information on key pairs, see [Generating a key pair](#keypair). 

	Security Group - Select the security group to assign to your server. For more information on security groups, see [Managing traffic using security groups](#securitygroup). 

5. Click `Create`.

After the instance is active, you can [connect to the new instance](#connect).

####Creating an ephemeral instance using Python-NovaClient commands#### {#createephinstancepyth}

To create an ephemeral instance using Python-NovaClient commands:

1. Connect with the 12.12 instance that is in the same Availability Zone where you will create the 13.5 instance using a SSH tool, such as PuTTY.

2. Launch a command line window or UNIX shell.

3. Execute the `nova boot` command:

		nova help boot
		usage: nova boot [--flavor ] [--image ]
		[--meta ] [--file ]
		[--key-name ] [--user_data ]
		[--availability_zone ]
		[--security_groups ]
		[--block_device_mapping ]
		[--nic ]
		[--config-drive ]
    	
	**Note**: Only `--flavor`, `--image`, and name are required.

	Where:

		--flavor (required) - The ID number for the flavor to use for the new instance. Use the nova flavor-list command to view a list of flavors and IDs. 
	
		--image (required) - The ID number for the boot image to use. Use the nova image-list command to view a list of images and IDs. 

		--meta (optional) - Metadata to associate with the instance for use with the metadata service.

		--file (optional) - File(s) from the local server to store on the new instance. You may store up to 5 files.

		--key_name (optional) - The name of the key pair that should be used. The key pair must already exist. 
	
		--user_data (optional) - User data file to pass into the metadata server.

		--availability_zone (optional) -- The availability zone for instance placement.

		--security_group (optional) - The name of the security group to use. 
	
		--block_device_mapping (optional) - A definition of any block devices to attach to the instance. For onformaton, see [Block mapping](#blockmapping). 

		--nic (optional) - Create a network interface card (NIC) on the server. Specify the option multiple times to create multiple NICs. Use either the UUID or IPv4 fixed address for the NIC.

			- nic net-id:UUID to attach the NIC using the UUID (optional) 
			- nic v4-fixed-ip:IPv4_fixed_address for NIC (optional). port-id: attach NIC to port with this UUID (optional)

		--config-drive (optional) - Enables configuration drive.

		--name (required) - The name for the instance.

	The following example is a NovaClient command to create an XSmall Ubuntu 12.04 instance:

	    nova boot --flavor "100" --image "75845" --key_name "az1" --security_groups "default" TEST_SERVER

	The output displays, similar to the following:
	<br><img src="media/Python_Create_Instance.png"  alt="" />

4. Use the following command to allocate a floating IP address that you can attach to the instance.

	`nova floating-ip-create`

	HP Cloud Services 13.5 does not assign a public IP address automatically. To connect with the instance, you must assign a floating IP address to the instance. 
	<br><img src="media/floating_ip_create.png"  alt="" />

5. Use the following command to attach the floating IP to an instance:

	`nova add-floating-ip SERVER IP_ADDRESS`

	Where:

		Server - The name or ID of the instance to attach the floating IP.

		IP_Address - The floating IP address you allocated.

For more information on floating IPs, see [Managing Your Floating IPs](https://community.hpcloud.com/article/managing-your-floating-ips-135#fipnovacli).


####About block mapping#### {#blockmapping}

Block-device mapping - A block device mapping in the format [dev_name=[id]:[type]:[size(GB)]:[delete_on_terminate] 

Where:

	dev_name - The name of the device where the volume will be attached in the system at /dev/dev_name. This value is typically vda.

	id - The ID of the volume to boot from, as shown in the output of nova volume-list.

	type - The volume type, either *snap* or blank. Enter *snap* if the volume is based on a snapshot. Leave blank if the volume is not based on a snapshot.

	size (GB) - The size of the volume, in GB. Or, leave the value blank to have the Compute service determine the size.

	delete_on_terminate. Indicate whether the volume should be deleted when the instance is terminated. Enter *True* or *1* to delete the volume. Enter *False* or *0* to not delete.

	
Tip: To connect with the instance over the internet then you need to allocate and assign a Floating IP to the instance, see [Managing Your Floating IPs](https://community.hpcloud.com/article/managing-your-floating-ips-135#fipnovacli)

Once you have created your instance, you can [connect to the instance](#connect)


<!--
####Copying data from v12.12 to new 13.5 instance with FTP #### {#copy}

After you create the new 13.5 instance, you must copy data from the 12.12 server to the 13.5 server. You can use any standard method for copying data to a new server (such as SCP or FTP), including the following methods:

- Using SCP
- Using rsync (Mac OSX or Linux)
- Using FTP
-->

###Creating a persistent instance### {#createperinstanceconsole}

Use any of several tools to create bootable block volume and a 13.5 persistent instance.

The process for creating a persistent instance involves creating a storage volume then creating a server to host that volume.

- [Using the Management Console](#createperinstanceconsole)
- [Using Python-NovaClient commands](#createperinstancepyth)	

####Creating a persistent instance using the management console#### {#createperinstanceconsole}

1. Log in to the [management console](https://console.hpcloud.com/manage).

2. In the Dashboard, click the appropriate the Availability Zone for the 13.5 instance.

3. In the menu, click `Volumes`.

4. In the Volumes page, click `New Volume` to create a bootable volume.

5. Enter the appropriate information in the following fields:	

	Volume Name - Enter a name for the volume.

	Description - Enter a description for the volume.

	Availability Zone - Select the Availability Zone for the volume, or select No Preference to use the volume in any zone.

	Size - Select the size of the volume from the drop down menu.
	
6. Select the `Make bootable from Image`. 

	Three buttons and a drop down list appear. 

	A bootable volume enables you to launch an instance from that volume. You must make the volume bootable to use the volume to create a persistent server.

7. Click one of the image type buttons: Public Images, Partner Images, or Private Images. For more information, see [About the image types](#https://docs.hpcloud.com/mc/compute/servers/manage#ImageTypes).

8. Select the specific image from the drop down list.
	
9. In the Servers page, click `Create Volume`.

	The volume is created. Now, you create the instance and attach the new volume.

10. In the menu, click `Servers`.

11. In the Servers page, click `New Server`.

12. Enter the appropriate information in the following fields:
	
	Name - Enter a name for the server.

	Availability Zone - Select the same Availability Zone as the volume you created, or select No Preference to use a volume from any zone.

	Network Port - Select a port use if you've manually created a network port.

	Image type - Click `Bootable Volumes` and select the bootable volume you created.
	
	Key name - Select the key pair to use with the server.

	Flavor - Select a flavor for the server.
	
	Security Groups - Select a security group to use with the server.

	Tags (optional) - Enter text to create metadata to associate with the instance for use with the metadata service.

12. Click `Create` to create the instance.

	The management console lists the new instance with a status of `Build`. When the instance is `Active`, you must assign a floating IP address to the instance in order to access the instance.

13. In the menu, click `Floating IPs`.

	HP Cloud Services 13.5 does not assign a public IP address automatically. To connect with the instance, you must assign a floating IP address to the instance. 

	For more information on floating IPs, see [Managing Your Floating IPs](https://community.hpcloud.com/article/managing-your-floating-ips-135#fipnovacli).

13. In the Floating IPs page, click `Allocate New IP`.

	A new floating IP address is added to the table on the page.

14. Select the new instance from the `Port` drop down and click `Apply`. 

	The IP is assigned to the instance and can be used to connect with that instance.

After you assign the floating IP address, you can [connect to the instance](#connect).


####Creating a persistent instance using Python-NovaClient commands#### {#createperinstancepyth}

1. Connect with the 12.12 instance that is in the same Availability Zone where you will create the 13.5 instance using a SSH tool, such as PuTTY.

2. Launch a command line window or UNIX shell.

3. Execute the following command to identify an image to use with the bootable volume:

	`nova image-list`

	A list of images displays, with an ID on the left column.
	<br><img src="media/image-list.png"  alt="" />

	**Note**: Multi-part images listed below work as bootable volumes (Kernel and Ramdisk separated). They will look like this in the NovaClient:
	<br><img src="media/image-list_multi.png"  alt="" />
	
4. Create the volume using the following command:</p>

    `nova volume-create --image-id  --display-name <size>`

	Where:

		image_id - The ID of the image to use.
	
		display_name - A name to associate to the volume. 
	
		Size - Specify the size of the volume in giga-bytes (GB). This option takes no argument. The minimum size for a Linux Instance is 10 GB.

	The following example creates a 20 GB volume called TestBootableVolume:  

		`nova volume-create --image_id 50421 --display_name TestBootableVolume 20`

5. Confirm that the volume was created using the following command:

	`nova volume-list`

	The output appears similar to the following:
	<br><img src="media/Python_Volume_List.png" alt="" />
	
6. Obtain a flavor, key pair name, security group name, and flavor ID to use with the instance. Use the following commands to obtain these values, as needed:
	
	`nova flavor-list`

	`nova image-list`

	`nova keypair-list`
	
	`nova secgroup-list`

7. Create the instance using the following command:

		nova help boot
			usage: nova boot [--flavor ] [--image ]
			[--meta ] [--file ]
			[--key-name ] [--user_data ]
			[--availability_zone ]
			[--security_groups ]
			[--block_device_mapping ]
			[--nic ]
			[--config-drive ]
    	

	**Note**: Only `--image`, `--flavor`, and name are required. 

	For definitions of each property, see [Creating an ephemeral instance using Python-NovaClient commands](#createephinstancepyth).

	Output similar to the following indicates that the persistent instance has been created:
	<br><img src="media/Python_nova_boot.png" alt="" />

8. Allocate and assign a Floating IP using the following command.	

	HP Cloud Services 13.5 does not assign a public IP address automatically. To connect with the instance, the instance requires a Floating IP address.

9. Use the following command to allocate a floating IP address that you can attach to the instance.

	`nova floating-ip-create`

	HP Cloud Services 13.5 does not assign a public IP address automatically. To connect with the instance, you must assign a floating IP address to the instance. 
	<br><img src="media/floating_ip_create.png"  alt="" />

10. Use the following command to attach the floating IP to an instance:

	`nova add-floating-ip SERVER IP_ADDRESS`

	Where:

		Server - The name or ID of the instance to attach the floating IP.

		IP_Address - The floating IP address you allocated.

For more information on floating IPs, see [Managing Your Floating IPs](https://community.hpcloud.com/article/managing-your-floating-ips-135#fipnovacli).

Once you have created your instance, you can [connect to the instance](#connect).

##Section 4: Connecting To Your Instance## {#connect}

After you have created your instance, you need to connect to the instance in order to work with the instance. For example, you must connect to the instance to copy data to the instance.

Important: When you connect to an HP Cloud Services version 13.5 instance, you must use the floating IP address you created for the instance.
	
Use one of the following methods to connect to the new instance, based on the operating system you are connecting from.

- [Connecting to an instance from Linux O/S](#connectlinux)
- [Connecting to an instance from Windows O/S](#connectwindows)
- [Connecting to an instance from Mac O/S](#connectmac)

###Connecting to a Linux Instance from a Linux system using Terminal### {#connectlinux}

Before you start, make sure your key pair file in PEM format is stored on the local system. For more information, see [Generate a security key pair]($keypair).

To connect to an instance using the Linux CLI:

1. Open a terminal session on the local system and browse to the directory where the key pair file is stored.

2. Execute the following command, using the appropriate key pair name:

	`chmod 400 keypair_name.pem`
 	
	Where 

		keypair_name - the name of the key pair PEM file.

	This command grants read access to only the owner of the file.

3. Execute one of the following commands to open an SSH session to the instance, based on your Linux distribution:

	CentOS or Fedora:

	`ssh -i	 keypair_name.pem root@floating_ip`

	Ubuntu or Debian:

	`ssh -i keypair_name.pem ubuntu@floating_ip`

	Where 

		keypair_name - the name of the key pair PEM file.

		(user)@floating_ip - the default user name and floating IP address assigned to the instance.

	In order to access an instance, you must allocate and assign a Floating IP to that instance.  See [Managing Your Floating IPs](https://community.hpcloud.com/article/managing-your-floating-ips-135#fipnovacli)


4. If you see a prompt similar to the following, enter `Y` to select Yes to continue connecting.

	`The authenticity of host 'FLOATING_IP (FLOATING_IP)' can't be established.
	RSA key fingerprint is 17:7f:a9:ae:9d:6c:76:bf:be:68:a4:05:f6:da:84:7b.
	Are you sure you want to continue connecting (yes/no)? yes
	Warning: Permanently added 'FLOATING_IP' (RSA) to the list of known hosts.`

You are now connected to the instance.

###Connecting to a Linux instance from a Windows system using PuTTY
### {#connectwindows}

Before you start, make sure your key pair file has been converted from the PEM to PPK format and is stored on the local system.


To connect to an instance using PuTTY:
	
1. Launch the PuTTY interface.

2. Enter the following information, using appropriate values:

	a. In the Category list, select `Session`. This pane might be active by default. 

	b. In `Host Name (or IP address)` field, enter the floating IP address for your instance.

	You must allocate and assign a Floating IP to your instance. See [Managing Your Floating IPs](https://community.hpcloud.com/article/managing-your-floating-ips-135#fipnovacli).

	c. In the `Category` list, select `Connection` -> `SSH` -> `Auth`. 

	d. In the `Private key file` field, click `Browse` and locate your PPK file that you created for your instance. To use PuTTY, you must have a key pair in the PPK format.

	e. In the Category list, select `Session`. 

	f. In `Saved Sessions` field, enter a name for the SSH session and click `Save`.

3. Open the session by selecting saved sessions and click `Open`.

4. In the dialog that appears, click `YES`.

	**Note**: If your instance uses Ubuntu version 11.10 and higher, use the default user name *ubuntu*. Other Linux images, use *root* as the default user name. 

	If you are prompted a password upon first time log in, check the following:

	- Load up your instance settings and make sure that the key pair is loaded under Connection > SSH > Auth > Private key file for authentication.
	- Make sure that you created the PEM or PPK key pair file correctly. Remake the file if needed.

	For more information, see: [Getting prompted for a password when accessing your instance for the first time](https://community.hpcloud.com/article/getting-prompted-password-when-accessing-your-instance-first-time-135).

After logging in, a system window displays, which indicates you are connected to the HP Cloud Instance.

###Connecting to a Linux instance from a Mac system### {#connectmac}

Before you start, make sure your key pair file in the PEM format is stored on the local system.

You must to allocate and assign a floating IP to your instance. See [Managing Your Floating IPs](https://community.hpcloud.com/article/managing-your-floating-ips-135#fipnovacli).

To connect to an instance using a Mac operating system:

1. Launch a Terminal from the Applications -> Utilities menu.

2. Browse to the directory where the key pair (PEM) file is located.

3. Execute the following command,  to protect your key pair file:

	`chmod 400 KEYPAIR_NAME.pem`

	This command grants read access to only the owner of the file.

4. Execute one of the following commands to connect to the instance using SSH, depending upon your Linux distribution:

	CentOS or Fedora:

	`ssh -i KEYPAIR_NAME.pem root@FLOATING_IP`

	Ubuntu or Debian:

	`ssh -i KEYPAIR_NAME.pem ubuntu@FLOATING_IP`

	Where 

		keypair_name - the name of the key pair PEM file.

		(user)@floating_ip - the default user name and floating IP address assigned to the instance.

	In order to access an instance, you must allocate and assign a Floating IP to that instance.  See [Managing Your Floating IPs](https://community.hpcloud.com/article/managing-your-floating-ips-135#fipnovacli).

5. If you see a prompt similar to the following, enter `Y` to continue connecting,

		The authenticity of host 'FLOATING_IP (FLOATING_IP)' can't be established.
		RSA key fingerprint is 17:7f:a9:ae:9d:6c:76:bf:be:68:a4:05:f6:da:84:7b.
		Are you sure you want to continue connecting (yes/no)? yes
		Warning: Permanently added 'FLOATING_IP' (RSA) to the list of known hosts.

##Copying data from a 12.12 instance to v13.5 instance## {#copydata}

After you create a new 13.5 instance and have connected to that instance on your local system, you can copy the data from your version 12.12 instance to your new 13.5 instance. You can use any tool transfer program of your choice (for example, SCP or FTP), including the following methods, to copy the data to the new instance.

- [Using WinSCP (Windows)](#copydatascp)
- [Using rsync (Mac OSX or Linux)](#copydatarsync)
- [Using FileZilla](#copydatazill)

If you have any questions or concerns about which files to copy, contact [Support](#support).

###Using WinSCP to transfer files to your Instance### {#copydatascp}

WinSCP is a free program available for Windows that enables you to transfer files between attached systems.

To use WinSCP to transfer files, either the 12.12 instance or the 13.5 instance must have an FTP server configured and running and the other instance must have a properly-configured Win SCP client. The following procedure assumes the 12.12 instance is the server and the 13.5 instance is the client.

**Note**: For information on setting up an FTP server, see [Using FileZilla](#copydatazill).

Before starting to transfer files:

- Make sure that Port 22 is open in the security group associated with your instance. For more information, see [Controlling traffic using security groups](#ecuritygroup).
- Make sure your private key file is in PPK format on the client system.  You can convert a PEM key pair into PPK format. For more information, see
[Converting Your Keypair File](https://community.hpcloud.com/article/converting-your-keypair-file).

To transfer files to your 13.5 instance:

1. Use a remote desktop application (RDA) to connect with the 13.5 instance with the WinSCP client.

2. In the instance, launch WinSCP.

3. Use WinSCP to log into the HP Cloud Services 12.12 instance using the fields on the Session page:
	- Host name. Enter the Public IP address of your instance.
	- Port number. Enter the port number for your instance or use the default, port 22.
	- User name: If the instance requires a specific user for WinSCP enter the name.
	- Password. Enter the password for the specified user or leave blank if a password is not required.
	- Private key file: Click `Browse` to locate the PPK file that you created for this instance.

3. Click `Login` to connect. 

4. In the interface window that appears, select all required files from the 12.12 server and move the files to the 13.5 instance.


###Using rsync to transfer files to your Instance (Mac OSX or Linux)### {#copydatarsync}

rsync is an open source utility that provides file transfers between connected systems. 

Before starting to transfer files, make sure the private key associated with the instance is stored on the local system. For more information, see  [Generate a security key pair](#keypair).

To transfer files using rsync:

1. On the 12.12 instance, launch a Terminal from the Applications -> Utilities menu.

2. Browse to the directory where the key pair (.pem) file is located.

3. Execute the following command,  to protect your key pair file:

	`chmod 400 KEYPAIR_NAME.pem`

	This command grants read access to only the owner of the file.

4. Execute a command similar to the following to select a directory from the 12.12 instance and move the directory to the 13.5 instance.

    `rsync -e "ssh -i [key].pem" -avz [source directory on instance] [user]@[instance ip]:[destination directory on local]`

	Where:

    -e. Specifies the remote shell to use. Enter `ssh -i [key].pem` to use SSH and to specific the private key.
    
    -avz. Specifies rsync Archive mode (-a), Verbose mode (-v), and to compress data while in transit.

		Archive mode preserves file permissions and other file attributes (Using `-a` is equivalent to `-rlptgoD`).  

		Verbose mode provides detailed information about the transfer. Or, use the `-q` option to suppress non-error messages (quiet mode). 

	key - The location of the key pair (PEM) file using the full path, such as `/home/user1/Key1.pem`.
    
	source directory on instance - The location of the data on the local system.
	
	user - A user account with permissions on the remote instance.
	
	instance IP - The floating IP address of the instance to which you are copying data.
    
	destination directory on local - The location on the remote instance to send the data. 

Additionally, you can include the `--progress` option to show a progress bar of the transfer.

The following example moves files from the local system (`/home/user1/projects/web/html`) to the `/var/www` directory on an instance at 15.15.15.15:

	rsync -e "ssh -i /home/usr1/Key1.pem" -avz  /home/user1/projects/web/html administrator@15.15.15.15:/var/www


For more information on using rsync to move files, see [Using RSYNC to Upload or Transfer Files on Linux and Mac OSX](#https://community.hpcloud.com/article/using-rsync-upload-or-transfer-files-linux-and-mac-osx).

###Using FileZilla to transfer files to your instance### {#copydatazill}

FileZilla is a free FTP solution. It is available as a client and a server. 

To use FileZilla to transfer files, either the 12.12 instance or the 13.5 instance much have an FTP server configured and running and the other instance must have a properly-configured FTP client (such as FileZilla or WinSCP). The following procedure assumes the 12.12 instance is the server and the 13.5 instance is the client.

In addition, configure the security group assigned to the 12.12 and 13.5 instances to allow traffic through the following ports: 

	- Port 21 must allow FTP traffic.
	- Port 14147 must allow FileZilla traffic (the installer might specify this port).
	- Ports 10000-10500 must be open for data transfer. 

For more information, see [Configuring Security Groups](#securitygroupcidr).

Disable the Windows Firewall on the Windows instance or [configure the firewall to mirror your Security Group](https://community.hpcloud.com/article/configuring-your-windows-firewall-mirror-your-security-group). If you disable the firewall, ensure that you disable both the public and private network location settings for the Windows Firewall. When you are done, restart the firewall as needed.

To set up a FileZilla FTP server on the 12.12 instance:

1. Use Windows Remote Desktop to access the 12.12 instance from your local system. 

2. Download the FileZilla Server from [the FileZilla website](http://filezilla-project.org/download.php?type=server) and install on the 12.12 instance.


3. Launch the FileZilla Server.

	The first time you launch the FileZilla Server, FileZilla prompts you to connect to the server. 

4. Click `File` > `Connect to server`.

5. Enter the appropriate information in the following fields, or leave the default values:

	Server address. Enter the IP address of the server. By default, 127.0.0.1 (localhost). 
	
	Port. Enter the port used for traffic to and from FileZilla. By default, 14147.
	
	Administration password. Enter a password, as needed.
	
6. Click `OK` to connect you to your FTP server.

7. Click `Edit` > `Settings`. 

8. Click `Passive Mode Settings` and enter the following values:

	Use custom port range: Enter a port range for FileZilla to use, such as 10000-10500, to allow for enough data transfer connections.
	
	Under `IPv4 specific`, select `Use the following IP` and enter the Public IP of your Windows instance.
	
	Clear the `Don't use external IP for local connections` option.

9. Click `OK`.

10. Click `Edit` > `Users` to set up a user account for authentication to the FileZilla Server. 

	Creating users enables you to setup user names and passwords and set home directories.

	a. Click `Add`.

	b. In the Add User Account window, enter a user name and optionally select a group, and click `OK`.

	c. Optionally, create a password by selecting `Password` and entering a password in the field. 

	d. Click `OK`.

	e. Click `Page` -> `Shared folders` to specify a home folder.

	f. Click `Add` and browse for a folder to use as a home folder. FileZilla sets the first shared folder for each user as the home folder. 

	g. Use the `Files` and `Directories` options to set file and directory permissions.

	h. Click `OK`.

At this point your FTP server is setup and ready to be connected to with your preferred FTP client. You can use [WinSCP](http://winscp.net/) or you can use the [FileZilla client](http://filezilla-project.org/download.php?type=client).

You can find additional documentation on setting up users in the FileZilla wiki:
[Securing your FileZilla Windows Service Installation](http://wiki.filezilla-project.org/Securing_your_Windows_Service_installation).

To use FileZilla to transfer files to the 13.5 instance:

1. Use Windows Remote Desktop to access the 13.5 instance from your local system. 

2. Download the FileZilla Client from [the FileZilla website](http://filezilla-project.org/download.php?type=client) and install on the 13.5 instance.

3. Launch the FileZilla Client.

4. In the `Quickconnect` tool bar, enter the appropriate information in the following fields, or leave the default values:

	Host. Enter the IP address of the server to which you want to connect.

	Username. Enter the user name created in the FileZilla server. 
	
	Password. Enter the password for the user, as needed.

	Port. Enter the port used for traffic to and from FileZilla. By default, 21.
	
5. Click `Quickconnect` to connect you to your FTP server.

6. Locate and copy the required files, as needed.

##Section 5: Creating and attaching block volumes## {#transdata}

If your environment uses one or more cloud block storage volumes, you must transition the date in those block volumes to a 13.5 instance.	

The process for transitioning the data for block volumes involves creating and attaching a 13.5 block volume and copying the data from your version 12.12 instance to the new instance.

You can perform these tasks using a number of tools including:

- [Using the management console](#transdataconsole)
- [Using the UNIX CLI tool](#transdataunix)
- [Using Windows PowerShell](#transdatawin)

For more information on leveraging your attached storage, see the [Mounting Additional Space](https://community.hpcloud.com/article/mounting-additional-space). 

For information on preparing your volume for use, see [Preparing Your Block Storage Volume For Use](https://community.hpcloud.com/article/preparing-your-block-storage-volume-use).

###Creating and attaching a block volume using the management console### {#transdataconsole}

To create a block volume and attach the volume to the instance:

1. Log in to the [management console](https://console.hpcloud.com/manage).

2. In the Dashboard, click the appropriate the Availability Zone for the 13.5 instance.

3. From the menu, click `Volumes`.

4. In the Security Groups page, click `New Volume`.

5. Enter the appropriate information in the following fields:

	Volume Name - Enter a name for the volume.

	Description - Enter a description for the volume.

	Availability Zone - Select the Availability Zone for the volume, or select No Preference to use the volume in any zone.

	Size - Select the size of the volume from the drop down menu.

6. Click `Create Volume`.

	The volume appears in the Volumes screen with a status of `Creating`. When the volume creation is complete, the status changes to `Available`.

7. To attach the volume to an instance, click `Options` > `Attach` in the Manage column. 

8. In the Attach to Server page, select the instance from the drop-down menu.

9. Click `Attach`. 

	The volume attaches to the first available device on the specified server. If only one volume is attached to the instance, the first device will be `/dev/vdc`. 
	
	To select a specific device to attach, use one of our CLI tools or the API.

After the volume is attached to the instance, the volume appears in the Volumes screen with a status of `In Use`, and the name of the attached server.

###Creating and attaching a block volume using a UNIX CLI tool### {#transdataunix}

You can use a HP Cloud Services UNIX CLI to create and attach a block volume on the 13.5 instance. Then, copy the data on the 12.12 instance to the new 13.5 instance.

To create a block volume and attach the volume to the instance:

1. Launch an SSH tool, such as PuTTY to access the 13.5 instance.

2. Execute the following command to add a new volume, using the appropriate values:

    `$ hpcloud volumes:add <name> <size>`

	Where

		name - the name to assign to the block volume.

		size - the size of the block volume in giga-bytes (GB).
    
	The following example creates a 1GB volume called `test`.

	`$ hpcloud volumes:add test 1`

3. Execute the following command to attach the new volume to the server, using the appropriate values: 

	`$ hpcloud volumes:attach <volume> <instance> <device>`

	Where:

		volume - the name of the volume to attach.

		instance - the name of the 13.5 instance to attach the instance to.

		device - the name of the device where the instance resides (device names must begin with /dev/vd).

	The following example attaches a volume, *test*, to the srv1 instance on */dev/vdi*.

    	$ hpcloud volumes:attach test srv1 /dev/vdi


4. Copy the data from your version 12.12 instance attached volume to your new version 13.5 instance, as described in [Copy data from the 12.12 instance to the 13.5 instance](#copydata).

###Creating and attaching a block volume using Windows PowerShell### {#transdatawin}

You can use a Windows PowerShell to create and attach a block volume on the 13.5 instance. Then, copy the data on the 12.12 instance to the new 13.5 instance.

To create a block volume and attach the volume to the instance:

1. On the 13.5 instance, launch a Windows PowerShell window.  

	Select the shell appropriate to your system, either the 64-bit or 32-bit version. 

2. Enter the HP Cloud Services CLI by entering:

	`PS C:> cd HPCS:`

3. Create a new block storage volume by executing the following command, using the appropriate values:

		PS HPCS:\\> New-Volume <"name"> <"Description"> <size> "metadata|metadata"

	Where:
	
		name - the name for the new volume in quotes

		description - a description for the new volume in quotes

		size - the size of the volume 

		metadata - metadata to associate with the instance for use with the metadata service, in quotes and separated by a pipe character.

	The following example creates a new volume with the name `MyNewVolume`, a description of `MyNewVolume Description` and a volume size of 10 gigabytes. 

    	PS HPCS:\\> New-Volume "MyNewVolume" "MyNewVolume Description" 10 "test|data"
<br><img src="media/volume_create_ps.png"  alt="" />

4. Attach the volume to an existing server by executing the following command, using the appropriate values:

		`PS HPCS:\\> Attach-Volume <server_ID> <volume_ID> <device_name>

	Where:
	
		instance_ID - the ID number of the instance

		volume_ID - the ID number of the volume to attach

		device_name - the name of the device where the instance resides (device names must begin with /dev/vd)  

	Tip: To obtain the ID number for the instance and volume ID, use the `ls` command.

	The following example attaches the volume 31415 to instance 99 on the device /dev/vpd. 

	`PS HPCS:\\> Attach-Volume 99 31415 "/dev/vdp"` 

5. Copy the data from your version 12.12 instance attached volume to your new version 13.5 instance, as described in [Copy data from the 12.12 instance to the 13.5 instance](#copydata).


##Contacting Support## {#support}

If you have any questions or concerns about which files to copy, contact our Support team:

- [Live chat from hpcloud.com](#https://account.hpcloud.com/cases#support_chat)
- [Open a support case](#https://account.hpcloud.com/cases)
- [Using email](#support@hpcloud.com)
- By phone at 1-855-61CLOUD (1-855-612-5683) in the U.S. or +1-678-745-9010 internationally.

##For further information## {#furtherinfo}

For more information on version 13.5:

<li>The <a href="/migration-overview">Self-Migration Reference Guide</a> page contains details on how to migrate your data yourself from version 12.12 to 13.5 of the HP Cloud Services</li>
<li>Our <a href="/release-notes/">release notes for version 13.5</a> of the HP Cloud software</li>
<li>The <a href="/version-overview/">version 13.5 overview</a> provides a look at the different software versions available</li>
<li>The <a href="https://community.hpcloud.com">technical support knowledge base</a></li>
<li><a href="/cli/unix/articles/migration/">UNIX command-line interface migration information</a></li>
</ul>

