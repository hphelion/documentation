---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Installation Troubleshooting"
permalink: /helion/openstack/carrier/install/pb/trouble/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"><a href="/helion/openstack/carrier/install/pb/network/prepare/">&#9664; Preparing the Network for Installation</a> | <a href="/helion/openstack/carrier/install/pb/overview/">&#9650; Installation Overview</a> | <a href="/helion/openstack/carrier/install/pb/hlm-vm/"> Create the HLM Virtual Machine &#9654;</a> </p> 



# HP Helion OpenStack&#174; Carrier Grade (Beta): Installation Troubleshooting

This installation troubleshooting guide is written for HP Helion OpenStack Carrier Grade installers who, during or after building the environment, find that the cloud environment does not work as expected. The HP Helion OpenStack Carrier Grade environment is not itself complex but it does include a sufficient number of components that isolating a fault can be challenging.

The goal of this guide is to help you to identify the problem or problems affecting your cloud installation and efficiently fix them.

### The HP Helion OpenStack directory does not get copied

The `hnewcloud` command should copy the HP Helion OpenStack directory to the `~/<cloud-name> `folder. 

#### Resolution

Copy the `hnewcloud.sh` script to HLM node under `/opt/bin/hnewcloud.sh` before `hnewcloud` script is run.


### LDP-CCN role gets stuck when you run hdeploy

#### Resolution

Edit the `~/<cloud-name>/clouds/<cloud-name>/001/stage/ansible /roles/LDP-CCN/tasks/ldap.yml` file before running `hdeploy`.

Replace `apt-get install python-ldap` with `apt: name=python-ldap install_recommends=no state=latest force=yes`.
     

**Note:** All the files, except venom-patch.tar.gz, required for patching are attached to this page. venom-patch.tar.gz  can be found under 

	sftp 'cdl\USER'@15.242.209.8 
	sftp> cd cg-hos-builds/Patches/build-33/
	sftp> get venom-patch.tar.gz

## Troubleshooting

### The `hdeploy` script fails for a particular role.

#### Resolution

**Notes:**

	* The Ansible playbook for the cloud are located under `~/<cloud-name>/clouds/<cloud-name>/001/stage/ansible/` on HLM node
	* Roles which gets executed on particular tier (T1, T2, T3) are defined in `ccp-3-1-1-dcn-as.json`, which can be found under ~/<cloud-name>.
	* Roles that get executed on Compute (CPN) are defined in `definition.json`.

Use the following steps to patch and rerun the role:

1. From the console get the failed role name which is line above the first error line (in red)

	TASK: [NOV-CMP | Add availability zone and host] ******************************
	changed: [MYCLOUD-CCP-CPN-N0002-NETCLM]
	failed: [MYCLOUD-CCP-CPN-N0001-NETCLM] => {"failed": true}

	msg: Exception: There was a conflict when trying to complete your request. (HTTP 409) (Request-ID: req-1d65aa9

	In the highlighted section
	NOV-CMP is the role name
	MYCLOUD-CCP-CPN-N0002-NETCLM is the cloud name
	MYCLOUD-CCP-CPN-N0002-NETCLM indicates controller
	MYCLOUD-CCP-CPN-N0002-NETCLM indicates compute
	MYCLOUD-CCP-CPN-N0002-NETCLM indicates compute node 2
	MYCLOUD-CCP-CPN-N0002-NETCLM indicates CLM network

	Additional tiers could be:

	MYCLOUD-CCP-T1-NETCLM In DCN deployment this is DCN tier where the VSC is hosts. In OVS deployment this is Controller tier
	
	MYCLOUD-CCP-T2-NETCLM In DCN deployment this is Controller tier. In OVS deployment this is tier does not exist
	
	MYCLOUD-CCP-T3-NETCLM In DCN deployment this is VRS-G tier. In OVS deployment this is tier does not exist

	MYCLOUD-CCP-CPN-NETCLM In both DCN and OVS deployment this is a compute tier aka resource pool

	Current execution sequence is:
		MYCLOUD-CCP-CPN-N000X-NETCLM
		MYCLOUD-CCP-T1-NETCLM
		MYCLOUD-CCP-T2-NETCLM
		MYCLOUD-CCP-T3-NETCLM

	This sequence is defined in ~/<cloud-name>/clouds/<cloud-name>/001/stage/ansible/top_level_playbooks/commit/commit.yml

    This example indicates that failure is on second compute node for NOV-CMP role.
    This role can be located under - ~/<cloud-name>/clouds/<cloud-name>/001/stage/ansible/roles/NOV-CMP (where all the roles reside)

2. If /NOV-CMP/ role needs to be rerun after patching, make a copy of existing role under `~/<cloud-name>/clouds/<cloud-name>/001/stage/ansible/roles/, modify /NOV-CMP/`

	Note that some of the tiers might have already been executed before compute

	(In case of ovs its just controller tier [T1], In case of dcn cloud its dcn tier[T2] and vrg tier []). Hence we need not run the controller (dcn and vrgs in case of dcn cloud) roles again. 

3. Comment the following lines in the build file which executes controller roles in c`ommit.yml`.

		#Cloud: orion (orion)
		#Install the cloud
		#include: build-CCP-T1.yml
		#include: build-CCP-T2.yml
		#include: build-CCP-T3.yml
		#include: build-CCP-CPN.yml

4. Comment the following lines in the `build-CCP-CPN.yml` file.

		# Install resource nodes "CPN" of control plane "CCP"
			hosts: ORION-CCP-CPN
			sudo: yes	
			roles:
		#- Common
		#- NTP-SVR
			NOV-CMP
			DCN-VRS
			DUM-BLS	
			LDP-CPN

	At this point you have successfully commented all the roles in all the tiers that got exercised before NOV-CMP
    
5. Copy the patched `NOV-CMP` folder under `~/<cloud-name>/clouds/<cloud-name>/001/stage/ansible/roles/`.

6. Rerun the `hdeploy <cloud-name>` command.
    
	With this patch all the nodes on which NOV-CMP role gets executed should be refreshed.

	**Note:** Not all the roles are idempotent. Which means they are not runnable. Hence only the idempotent roles would work with this approach.

    The `build-CCP-*` and `commit.yml` also get copied under `~/<cloud-name>/clouds/<cloud-name>/001/stage/ansible/`.

	In such cases the `build-CCP-*` and `commit.yml` need to be changed in two locations:

		~/<cloud-name>/clouds/<cloud-name>/001/stage/ansible/top_level_playbooks/commit/

		~/<cloud-name>/clouds/<cloud-name>/001/stage/ansible/

7. Patch the existing role which was deployed successfully.

	a. Make a copy of desired role under `~/<cloud-name>/clouds/<cloud-name>/001/stage/ansible/roles/`.
    
	b, Copy the patch role under `~/<cloud-name>/clouds/<cloud-name>/001/stage/ansible/roles/`.

	c. Comment all the tiers in `~/<cloud-name>/clouds/<cloud-name>/001/stage/ansible/top_level_playbooks/commit/commit.yml` except for patched role tier (all the tiers BEFORE and AFTER patched tier).
    
	d. Comment all the roles, except for patched role, from build-CCP-* file under `~/<cloud-name>/clouds/<cloud-name>/001/stage/ansible/top_level_playbooks/commit/`.
	
    The `build-CCP-*` and `commit.yml` also gets copied under `~/<cloud-name>/clouds/<cloud-name>/001/stage/ansible/`.

	e. The `build-CCP-*` and `commit.yml` needs to be changed in tow locations:

	    ~/<cloud-name>/clouds/<cloud-name>/001/stage/ansible/top_level_playbooks/commit/
		~/<cloud-name>/clouds/<cloud-name>/001/stage/ansible/
    
	f. If the patched role needs some new variables to be added, this can be done by adding new variables to `~/<cloud-name>/clouds/<cloud-name>/001/stage/ansible/group_var/all` file.

	g. Rerun `hdeploy <cloud-name>`.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
