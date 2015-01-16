---
layout: default
title: "HP Helion OpenStack&#174; Edition: HP Helion Ceph"
permalink: /helion/openstack/ceph-integration-to-Helion-nodes/
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
--->



####Integration of Cephx authentication to Helion nodes

To integrate Cephx authentication into Helion nodes, perform following steps on Ceph admin node as shown below:

1. Log in to admin node as root user.

2. Discrete pools for glance, nova and cinder users are created using `ceph osd pool create` command by script.

3. Create new users for glance, cinder, cinder-backup, and nova operating on respective pools.

		ceph auth get-or-create client.glance mon 'allow r' osd 'allow class-read object_prefix rbd_children, allow rwx pool=helion-ceph-glance'

		ceph auth get-or-create client.cinder mon 'allow r' osd 'allow class-read object_prefix rbd_children, allow rwx pool=helion-ceph-cinder, allow rwx pool=helion-ceph-glance, allow rwx pool=helion-ceph-nova'

		ceph auth get-or-create client.nova mon 'allow r' osd 'allow class-read object_prefix rbd_children, allow rwx pool=helion-ceph-nova'

		ceph auth get-or-create client.cinder-backup mon 'allow r' osd 'allow class-read object_prefix rbd_children, allow rwx pool=helion-ceph-backups'

4. Add keyrings and change ownership.

		ceph auth get-or-create client.glance | tee /etc/ceph/ceph.client.glance.keyring
		ceph auth get-or-create client.cinder | tee /etc/ceph/ceph.client.cinder.keyring
		ceph auth get-or-create client.nova | tee /etc/ceph/ceph.client.nova.keyring
		ceph auth get-or-create client.cinder-backup | tee /etc/ceph/ceph.client.cinder- backup.keyring

5. Edit Ceph configuration file as follows

		[global]
		auth cluster required = cephx
		auth service required = cephx
		auth client required = cephx
		
		[client.admin]
		keyring = /etc/ceph/ceph.client.admin.keyring
		
		[client.glance]
		keyring = /etc/ceph/ceph.client.glance.keyring
		
		[client.cinder]
		keyring = /etc/ceph/ceph.client.cinder.keyring
		
		[client.nova]
		keyring = /etc/ceph/ceph.client.nova.keyring

5. Re-deploy Ceph configuration file to respective nodes.

		ceph-deploy install {ceph-node}[{ceph-node} ...]

6. Nodes running nova-compute need keyring files for nova-compute process. For this a secret key of `client.cinder` user is stored in `libvirt`. Create a temporary key as shown below in the Ceph admin node.

		ceph auth get-key client.cinder | tee /etc/ceph/client.cinder.key

7. Copy the generated keyrings to the respective Helion nodes. 

(**command required??)**

	For example –

		ceph.client.glance.keyring to all controller nodes
		ceph.client.cinder.keyring to all controller nodes
		ceph.client.nova.keyring to all controller and compute nodes
		client.cinder.key to all compute nodes
		ceph.client.cinder-backup.keyring to all controller, compute and to all ceph nodes.

* Restart Ceph services

		/etc/init.d/ceph restart

At this point, if glance user attempts to access cinder or nova pool, Ceph cluster would reject the attempt with a **Permission Denied** error message. Therefore, it is necessary to change `glance-api.conf`, `cinder.conf` on controller nodes and `nova-api.conf` on controller and compute nodes to include appropriate user-pool mapping. Also, on compute nodes, secret key to `libvirt` must be added. For more details, refer [http://ceph.com/docs/master/rbd/rbd-openstack/#setup-ceph-client-authentication](http://ceph.com/docs/master/rbd/rbd-openstack/#setup-ceph-client-authentication)

Perform following steps on HP Helion Openstack nodes –

1. On first compute node, add secret key to `libvirt` and remove temporary copy of key. Execute `uuidgen`. 

	For example:

		uuidgen
		
		457eb676-33da-42ec-9a8c-9293d545c337
		
		cat > secret.xml <<EOF
		<secret ephemeral='no' private='no'>
		<uuid>457eb676-33da-42ec-9a8c-9293d545c337</uuid>
		<usage type='ceph'>
		<name>client.cinder secret</name>
		</usage>
		</secret>
		EOF
		
		sudo virsh secret-define --file secret.xml
		Secret 457eb676-33da-42ec-9a8c-9293d545c337 created
		sudo virsh secret-set-value --secret 457eb676-33da-42ec-9a8c-9293d545c337 --base64 $(cat client.cinder.key) && rm client.cinder.key secret.xml

	**Note**: Save this UUID to be used on all compute nodes

2. Repeat above step on all compute nodes. Ensure same UUID is used in this process.

3. Edit `glance-api.conf` on all controller nodes to include glance user and respective pool.

		rbd_store_user=glance
		rbd_store_pool=helion-ceph-glance

4. Edit `cinder.conf` on all controller nodes to include cinder user and respective pool.

		rbd_store_user=cinder
		rbd_store_pool=helion-ceph-cinder
		rbd_secret_uuid=457eb676-33da-42ec-9a8c-9293d545c337
		
5. Edit `nova.conf on` all controller nodes to include cinder user and respective pool

		rbd_store_user=cinder
		rbd_store_pool=helion-ceph-nova
		rbd_secret_uuid=457eb676-33da-42ec-9a8c-9293d545c337
		
6. Restart glance, cinder and nova services on controller nodes.

		service glance-api restart
		service glance-reg restart
		glance-manage db_sync
		
		service cinder-volume restart
		service cinder-scheduler restart
		service cinder-api restart
		service cinder-backup restart
		
		service nova-api restart
		service nova-scheduler restart
		service nova-conductor restart

7. Restart glance, cinder and nova services on compute nodes.

		service nova-compute restart

8. Execute the following command to ensure that Ceph Health is OK at this point.

		ceph health

## Next Steps

[Ceph Manual Installation]( /helion/openstack/ceph-manual-install/).






