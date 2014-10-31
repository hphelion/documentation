---
layout: default
title: "HP Helion OpenStack&#174; Release Notes"
permalink: /helion/openstack/update/prereqs/101/
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
<p style="font-size: small;"> <a href="/helion/openstack/">&#9664; PREV | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/faq/">NEXT &#9654; </a></p>
-->
# HP Helion OpenStack&reg; Update Prerequisites

### System check:

Prior to getting a system ready for update and performing the update there may be a few tasks that need to be completed that aren’t part of the update, but could affect the update outcome.  This section is for those items.
1.	If you have changed your admin password for Undercloud you need to make sure you update the files below if you haven’t already done so, failure to do so will lead to failed update during script execution.  If you haven’t changed your Undercloud admin password you can skip a, b and c below.
a.	From the seed root directory modify /root/tripleo/tripleo-undercloud-passwords.
The password you are looking for is UNDER_CLOUD_ADMIN_PASSWORD.
b.	Edit file /root/tripleo/ce_env.json, update the undercloud {password”: line with the new password.  E.g.:
"undercloud": {
    "password": "65eef816ac721d6f1b870dfaaff0e7a781dfbc04",
c.	ssh to the Undercloud. 
ssh heat-admin@<undercloudIP>
sudo –i
edit the stackrc file to contain the new password and save it off (OS_PASSWORD).
2.	Prior to starting update you need to verify you are updated to a patch that is greater than:  3.13.0-36 on your seed host machine.  Verifying and obtaining the correct kernel may vary depending on distribution:  From a command prompt running on the host machine running the Seed VM do the following:
uname –r   
Follow instructions for your Linux distribution to update.

### Extract the required scripts and libraries ### {#extract}

As mentioned above a patch update is composed of a few major components.  The Overcloud node images can be one of the components.  If you have followed this guide and done the publish operation in Sherpa then at this stage the Overcloud node images are located in the Undercloud glance image repository.  The other files come as tarballs and are delivered to the Undercloud local filesystem.  This will be located by default /tmp/heat_templates folder.  It is possible to change this during or after deployment.  If you have done so you can recall where you have changed the directory to by viewing the Sherpa configuration file.  If you haven’t changed the default you can skip to step 3 below:  
1.	The Sherpa configuration file for the Undercloud can be found at /etc/sherpa/sherpa.conf.    The directory where the files where stored can be found by looking in the RepositoryMgr portion of /etc/sherpa/sherpa.conf, search for the directory attribute as seen below:
'file': {
'classname': 'sherpa.handlers.repository.file.FileSystemHandler',
'destinations': [
{
'directory': '/tmp/heat_templates',
2.	/tmp/heat_templates will be used below, but you should use the one set in /etc/sherpa/sherpa.conf.
3.	For the update scripts copy the tar file to seed node and extract contents.  From the seed node:  From an ssh session to the seed do the following:
scp heat-admin@<Insert undercloudIP>:/tmp/heat_templates/* /tmp
tar xvf tripleo-ansible<version>.tar 
mv /opt/stack/tripleo-ansible /opt/stack/tripleo-ansible-orig
mv /tmp/tripleo-ansible /opt/stack/
At the end of above step you will have the seed node updated with latest working copy of tripleo-ansible code and the helper scripts.  
The files will now be extracted in the seed tmp node.  If desired the files can now be removed in /tmp/heat_templates.




### Setup the update environment to point to the cloud to be updated ### {#setup}

With Ansible update mechanics all updating under or over cloud is run from the seed node.  The difference is that a cloud specific file is sourced to point Ansible at the correct keystone in the target cloud.  If performing both updates you will do one of the choices either step 2 or 3, once you have finished with a particular update return here and setup for the other cloud.
1.	SSH into the seed:
•	sudo ssh <seed IP>
2.	Undercloud:  To point Ansible to update the Undercloud when logged into the seed as root you simiply source the stackrc in the /root.   
•	source ~/stackrc
3.	Overcloud:  To point Ansible to update the Overcloud when logged into the seed as root you have to source the Undercloud stackrc.  First you have to copy it from the Undercloud to make it available to   
•	ssh heat-admin@<Undercloud IP>
•	sudo –i
•	cp stackrc /home/heat-admin/uc_stackrc
BACK on the seed ssh use scp to the Undercloud to get it.
•	scp heat-admin@<Undercloud ip>:uc_stackrc ~/
EDIT uc_stackrc and replace localhost in the OS_AUTH_URL with the IP of the Undercloud.  export OS_AUTH_URL=http://<Undercloud>:5000/v2.0
•	source ~/uc_stackrc

For both cloud targets above do the following on the seed ssh session you intend to run the update from:
source /opt/stack/venvs/ansible/bin/activate
cd /opt/stack/tripleo-ansible
bash scripts/inject_nova_meta.bash
export ANSIBLE_LOG_PATH=/var/log/ansible/ansible.log
mkdir -p /var/log/ansible

You should have a command prompt that has (ansible).  You will need to use this (ansible) session to perform all the update operations.

If you wish to perform an early test to see if the ansible environment is correctly setup try the following command, it will attempt to ping all the nodes that ansible can find via its inventory.
ansible all -u heat-admin -i plugins/inventory/heat.py -m ping  
If successful the ping command will show a ping of every node in a particular cloud.  It will look similar to this with one for each node.  
192.0.2.28 | success >> {
	“changed”: false,
	“ping”: “pong”
}

## Gather information needed for update:
To perform a node by node or group by group update you will need to know two things.  The IPs of the nodes you are updating and the glance IDs of the new images to place on the nodes.  Later in the process you may be asked for various IPs and image Id’s, when you are refer to this section or save off the information and use it where required.
Determine IP of nodes:
The administrator should know the IP address of the Seed node.  From there the other IP address can be obtained with the commands below.  Please record these for later use. 
•	Undercloud:
	sudo ssh <Seed IP>
	source stackrc
	nova list
The IP of the Undercloud will be listed in the nova list results.  
•	Overcloud:
	sudo ssh <Seed IP>
	From the seed SSH session, SSH into the Undercloud then become root and source the stackrc file
ssh heat-admin@<Undercloud IP>
sudo –i
source ./stackrc
nova list | awk -F"|" '{gsub(/ctlplane=/,"",$7); print $3,$7;}'         

Name                                                   Networks
overcloud-ce-controller-SwiftStorage0-hjbwudw2lmu     10.23.67.142
overcloud-ce-controller-SwiftStorage1-s3xdc4zd3sqg     10.23.67.139
overcloud-ce-controller-controller0-6zhdcwdrkel5       10.23.67.145
overcloud-ce-controller-controller1-ha4yszea5s5b       10.23.67.141
overcloud-ce-controller-controllerMgmt0-4jtwvxi5wyal   10.23.67.144
overcloud-ce-novacompute1-NovaCompute1-j6ntgynq2r6d    10.23.67.146
overcloud-ce-novacompute2-NovaCompute2-pq6wsvscn3ar    10.23.67.147
overcloud-ce-novacompute3-NovaCompute3-riojhsd6dllx    10.23.67.148

	E.g. If asked for the controllerMgmt IP you would provide 10.23.67.144.
Determine Glace ID of image:
•	Undercloud:
o	SSH into the seed:
sudo ssh <Insert Seed IP address>
source ./stackrc
glance image-list | grep qcow2

| ID                                   | Name                   | Disk Format | Container Format | Size       | Status |
| 94763220-a2f1-4558-a289-edfd686c1a59 | undercloud         | qcow2       | bare             | 1368129536 | active |
o	The id is the GUID to the left of the image name you are looking for.  E.g. the Undercloud main image is undercloud and it has image id 94763220-a2f1-4558-a289-edfd686c1a59. 
•	Overcloud:
o	SSH into the seed 
	sudo ssh <Insert Seed IP Address.
o	Execute step for overcloud Pointing Ansible at the cloud you want to update: 
glance image-list | grep qcow2

+--------------------------------------+------------------------------------+-------------+------------------+------------+--------+
| ID                                   | Name                               | Disk Format | Container Format | Size       | Status |
+--------------------------------------+------------------------------------+---------
| 6b68e37f-1a9f-4922-9117-575e556d3815 | overcloud-compute              | qcow2       | bare             | 603799552  | active |
| f6cf864d-28d2-43ad-82fd-32d90466cbc7 | overcloud-control              | qcow2  
| bare             | 1035993088 | active |     
| 8b015088-edf1-4a8c-a798-5e7b2eeeca81 | overcloud-control-mgmt         | qcow2       | bare             | 1035993088 | active |
| 8ff9bd88-a385-4394-bffe-c098fd787b64 | overcloud-swift                | qcow2       | bare             | 384146432  | active |
| 7958e0ed-0e21-4c8b-84fb-ca67970c5f06 | overcloud-vsa                  | qcow2       | bare             | 827457536  | active |
The id is the GUID to the left of the image name you are looking for.  E.g. the controllerMgmt main image is overcloud-control-mgmt and it has image id 8b015088-edf1-4a8c-a798-5e7b2eeeca81

