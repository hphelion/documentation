---
layout: default
title: "HP Helion OpenStack&#174; Edition: HP Helion Ceph"
permalink: /helion/openstack/ceph-hp-helion-openstack-glance-ceph-interoperability/
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


##Helion OpenStack Glance-Ceph Interoperability

Glance images along with Cinder and Nova are stored on Ceph RADOS Block Device (RBD). The benefit of storing Glance image, Cinder volume, and Nova nodes on RDB are as follows:

* Snapshots
* Live migration
* Recovery
* Copy-on-write Clones from Glance images to Cinder volumes


For Glance-Ceph integration, the Helion OpenStack Ceph Configuration service performs the following steps.

Install and run the Ceph client script  on the Helion controller and compute nodes. After successfully installation the following steps are automatically performed.

1. Create a new Ceph pool to store Glance images

		ceph osd pool create <glance pool name> <pg-num>

	Example:

		ceph osd pool create helion-ceph-glance 100

2. Change `glance-api.conf` to reference the Ceph rbd storage only on overcloud controller nodes. 

	The following sample displays the `glance-api.conf` references to the Ceph rbd storage only on overcloud controller nodes. 

		# For ceph integration
		
		default_store = rbd
		rbd_store_user = glance
		rbd_store_pool = helion-ceph-glance
		show_image_direct_url = True
		known_stores = glance.store.filesystem.Store, glance.store.swift.Store, glance.store.rbd.Store
		
		#Enable debug for troubleshooting only
		#debug = True
		#verbose = True

3. Create symbolic or softlinks to the relevant files on overcloud controller nodes.

		ln -s /usr/lib/python2.7/dist-packages/rados* /opt/stack/venvs/openstack/lib/python2.7/site-packages/.
		ln -s /usr/lib/python2.7/dist-packages/rbd* /opt/stack/venvs/openstack/lib/python2.7/site-packages/.

4. Edit `rbd.py` in `glance/store/`on the overcloud controller nodes.

		In function, def __init__(self, name, store), change
		self.chunk_size = store.chunk_size to
		self.chunk_size = store.READ_CHUNKSIZE

5. Restart glance services on all the overcloud controller nodes.

		service glance-api restart
		service glance-reg restart
		glance-manage db_sync

6. Create a sample glance RAW image on any of the controller node. 

		glance image-create --name RImg --is-public=true --disk-format=raw --container-format=bare --file cirros-0.3.2-x86_64-disk.raw


	Raw data format is used with RBD for instant image snapshots and protection. For more details, refer [http://ceph.com/docs/master/rbd/qemu-rbd/?highlight=raw](http://ceph.com/docs/master/rbd/qemu-rbd/?highlight=raw)

	Conversion tool like qemu-img is used to convert one image format to another. 
	For example:

		qemu-img convert -f {source-format} -O {output-format} {source-filename} {output-filename}
		
		qemu-img convert -f qcow2 -O raw cirros-0.3.2-x86_64-disk.img cirros-0.3.2-x86_64-disk.raw
		
		glance image-create --name RImg --is-public=true --disk-format=raw --container-format=bare --file cirros-0.3.2-x86_64-disk.raw

7. Ensure that the uploaded glance image is available in the Horizon UI and is correctly stored in the appropriate pool in Ceph.

		rbd ls -l <glance pool name>
		
		glance image-list

8. If problem occurs in any of the above steps, do the following:
	* Enable logging in `glance-api.conf`  
	* Restart glance services and re-run problem step. 
	* Collect g.lance debug logs in `/var/log/glance` directory 
	* Contact HP support team for inputs. 


###Ceph Glance Clone Copy On Write

Ceph implements Clone Copy on Write built off the Protected Snapshot to clone an image quickly and easily. During the image import in glance, images are snapshotted and protected, clones are quickly created from the snapshot and a volume is created from an image. For more details, [refer http://ceph.com/docs/master/dev/rbd-layering/?highlight=rbd%20layering](refer http://ceph.com/docs/master/dev/rbd-layering/?highlight=rbd%20layering)

If the Ceph client script is successfully installed and ran on the Helion controller and compute nodes then the following steps are automatically performed.

1. Edit `cinder.conf` file on all overcloud controller nodes.

		glance_api_version=2

2. Restart Cinder services on all overcloud controller nodes.

		service cinder-volume restart
		service cinder-scheduler restart
		service cinder-api restart

3. Execute the command to create glance image.

		glance image-create

	Note that Clone COW is achieved when image is in RAW format. Conversion tool like qemu-img is used to convert from one format to another. 

	For example:

		qemu-img convert -f {source-format} -O {output-format} {source-filename} {output-filename}
		qemu-img convert -f qcow2 -O raw cirros-0.3.2-x86_64-disk.img cirros-0.3.2-x86_64-disk.raw
		glance image-create --name RImg --is-public=true --disk-format=raw --container-format=bare --file cirros-0.3.2-x86_64-disk.raw

4. Create cinder volume from glance image created on step 1 on any of the controller node

		cinder create -image-id <glance image id> --display-name RVol 2

5. Ensure that Cinder volume which is created is available at `rbd` pool

		rbd ls -l <cinder pool name>
		
		cinder list

6. Track clones to demonstrate copy-on-write feature by first listing snapshots of glance image  and then listing the children of the snapshot

		rbd --pool <glance pool name> snap ls <glance image id>
		
		rbd --pool <glance pool name> children --image <glance image id> --snap <snap name>
		
		rbd children <glance pool name>/<glance-image id>@<snap name>

7.  If the problem occurs in any of the above steps, do the following:

	* Enable logging in `glance-api.conf` and `cinder.conf`. 
	* Restart Glance and Cinder services and re-run problem step. 
	* Collect Glance debug logs in `/var/log/glance` directory and cinder debug logs in `/var/log/upstart` directory.
	*  Contact HP support team for inputs.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>