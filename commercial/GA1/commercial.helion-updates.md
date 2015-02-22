---
layout: default
title: "HP HP Helion OpenStack&#174; 1.1 Update Procedure"
 "
permalink: /helion/openstack/updates/
product: commercial.ga
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Systems Administrator 
role2: Cloud Architect 
role3: Storage Administrator 
role4: Network Administrator 
role5: Service Developer 
role6: Cloud Administrator 
role7: Application Developer 
role8: Network Engineer 
authors: Michael B

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!---
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/esx/">NEXT &#9654;</a> </p> -->



# HP HP Helion OpenStack&#174; 1.1 Update Procedure

Welcome to the Helion OpenStack 1.1 update instructions. These instructions apply to existing Helion OpenStack 1.1 installations and describe how you can update your Helion OpenStack cloud environment from 1.1 to a higher release. 

If you are running a version of Helion OpenStack prior to the 1.1 release, there is not update procedure. The process of changing a Helion OpenStack 1.0 or 1.01 release to a later release (such as 1.1) is described in the release notes for the respective release.

The process of updating Helion OpenStack 1.1 to a higher release consists of two steps:

1. [Update the undercloud](#uc-update-process)
2. [Update the overcloud](#oc-update-process)

These two procedures are described in the following sections.

##Helion 1.1 to 1.1.X update process {#uc-update-process}

The procedure will guide you through updating the undercloud by running the update_uc.sh shell script.

To update your Helion OpenStack undercloud from 1.1 to a higher release:

1.	Log on to the seed VM.

    	ssh root@<seed-ip>

2.	Download the update tarball onto the seed VM.

	    cd /root
	    mkdir helion-update-1.1-to-<version>
	    cd helion-update-1.1-to-<version>
	    wget http://<url>/helion_ee_<version>.tgz

3.	Extract the tarball and run the update script.

	    tar -xvzf helion_ee_<version>.tgz
	    cd tripleo/helion-update/undercloud_update
	    ./update_uc.sh ~/helion-update-1.1-to-<version>/tripleo

Your Helion OpenStack undercloud is now updated.
 
To verify the upgrade, enter:

[Sanjeev?]

##Helion 1.1 to 1.1.X update process {#oc-update-process}

Updating the overcloud using `update_oc.sh`

1. Log on to the seed

    	ssh root@<seed-ip>

2. Download the update tarball on the seed

   		 cd /root
    	mkdir helion-update-1.1-to-<version>
    	cd helion-update-1.1-to-<version>
    	wget http://<url>/helion_ee_<version>.tgz

3. Extract the tarball and run the update script

	    tar -xvzf helion_ee_<version>.tgz
	    cd tripleo/helion-update/overcloud_update
	    ./update_oc.sh ~/helion-update-1.1-to-<version>/tripleo

Your Helion OpenStack overcloud is not updated.

To verify the update, enter:
[Sanjeeve]

###Updating the overcloud manually

This procedure allows you to update your overcloud installation from Helion OpenStack 1.1 to a higher release by executing the update commands directly and not relying on the update scripts.

To update your overcloud:

1. Log on to the seed
 
    	ssh root@<seed-ip>

2. Download the update tarball on the seed
 
	    cd /root
	 	mkdir helion-update-1.1-to-1.1.X
		cd helion-update-1.1-to-1.1.X
		wget http://<url>/helion_ee_1.1.X.tgz

3. Untar the file

    	tar -xvzf helion_ce_1.1.X.tgz

4. Log onto the seed and change to the downloaded directory.

	    ssh root@<seed-ip>
	    cd helion-update-1.1-to-1.1.X

5. Source the undercloud credentials

	    export TRIPLEO_ROOT=~/tripleo
	    export TE_DATAFILE=~/tripleo/ce_env.json
	    source ~/tripleo/tripleo-incubator/undercloudrc

6. Download the image service (Glance) images locally.
 
	    OLD_BUILD_NO=$(glance image-show overcloud-compute-vmlinuz \
	                   | grep "Property 'build_no'" | awk '{print $5}')
	    mkdir build-$OLD_BUILD_NO
	    cd build-$OLD_BUILD_NO
	    for image in $(glance image-list | awk '{print $4}' | grep -);do
	        glance image-download --file ./$image $image;
	    done

7. Remove old images from Glance once saved locally. [[can't you rm these first, then download and then proceed?

	    for image in $(glance image-list | awk '{print $4}' | grep -);do
	        glance image-delete  $image;done

8. Upload new images to Glance.

	    BUILD_NO=$(cat /root/helion-update-1.1-to-1.1.1/tripleo/ce_env.json  | grep build_number | awk '{print $2}')
	    /root/helion-update-1.1-to-1.1.X/tripleo/tripleo-incubator/scripts/load-image \
	      -d /root/helion-update-1.1-to-1.1.X/tripleo/images/overcloud-compute-$BUILD_NO.qcow2
	    /root/helion-update-1.1-to-1.1.X/tripleo/tripleo-incubator/scripts/load-image \
	      -d /root/helion-update-1.1-to-1.1.X/tripleo/images/overcloud-control-$BUILD_NO.qcow2
	    /root/helion-update-1.1-to-1.1.X/tripleo/tripleo-incubator/scripts/load-image \
	      -d /root/helion-update-1.1-to-1.1.X/tripleo/images/overcloud-swift-$BUILD_NO.qcow2
	    glance image-create --name bm-deploy-kernel --is-public True \
	      --disk-format aki < /root/helion-update-1.1-to-1.1.X/tripleo/images/deploy-ramdisk-ironic.kernel
	    glance image-create --name bm-deploy-ramdisk --is-public True \
	      --disk-format ari < /root/helion-update-1.1-to-1.1.X/tripleo/images/deploy-ramdisk-ironic.initramfs

9. Update image names and set build metadata.
  
	    cd /root/helion-update-1.1-to-1.1.X/tripleo/tripleo-incubator/scripts/
	    ./set-sherpa-metadata overcloud-compute-$BUILD_NO
	    ./set-sherpa-metadata overcloud-control-$BUILD_NO
	    ./set-sherpa-metadata overcloud-swift-$BUILD_NO

10. Update the triple Ansible playbook.

	    mv /opt/stack/triple-ansible /opt/stack/triple-ansible-1.1
	    cp -r /root/helion-update-1.1-to-1.1.X/tripleo/helion-update/tripleo-ansible/ /opt/stack/

Refer to the Ansible update README for more details on running the play.

    source /opt/stack/venvs/ansible/bin/activate
    cd /opt/stack/tripleo-ansible/
    ./scripts/inject_nova_meta.bash
    ./scripts/populate_image_vars
    ansible-playbook -vvvv -M library/cloud -i plugins/inventory/heat.py -u heat-admin playbooks/pre-flight_check.yml
    ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py playbooks/update_cloud.yml












































<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----