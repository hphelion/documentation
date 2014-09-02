---
layout: default
title: "HP Helion OpenStack&#174; Edition: VSA Support"
permalink: /helion/openstack/ga/install/esx/proxy/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/install/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-overview/">&#9650; UP</a> | <a href="/helion/openstack/install/esx/">NEXT &#9654;</a> </p>


# HP Helion OpenStack&#174; Deploy vCenter ESX compute proxy

To deploy vCenter Nova-Compute proxy into a cloud deployment an set of automated step is available through the scripts. But there are few manual steps still needed to bring up Nova-Compute proxy VM

Upload the genertated Nova-Compute proxy vm OVA as a template into the management cluster of the vCenter.

Update Network information for the Nova-Compute proxy vm

To Get vCenter SSL certificate of the vCenter into Nova-Compute proxy vm.

## Prerequisite ##

- [Verify that the cloud is installed up and running](/helion/openstack/ga/install/esx/#verifying-your-installation).
- Verify that the network connection between Overcloud controller and Nova-Compute proxy will work.
- Access information like credentials to the vCenter.
- Management cluster name of the vCenter in which Nova-Compute proxy VM will be provisioned.
- Obtain a list of compute clusters that will be managed by the Compute proxy VM.
- Obtain the Network Portgroup information of the vCenter to which Nova-Compute proxy VM should be connected.
- Assign network IP information in case of Nova-Compute proxy VM using static IP.
- For enabling SSL communication between nova-compute, cinder-volume in proxy VM to vCenter Server. Follow the steps provided at the end of this page

## Deploy the Proxy VM

1. Import the `overcloud-nova_compute_esx_proxy.ova` into the vCenter using the vSphere client. Click **File -> Deploy OVF Template**.

2. Convert the OVF VM into a template by right-clicking **VM -> Template -> Convert To Template**. 

3. Provide this name for the template overcloud_vcenter_compute_proxy

4. On the UNDERCLOUD system, copy the `tripleo/hp-vcenter-compute-proxy` directory from `host` (where `ee_installer.tar.gz` is extracted ) to undercloud /root/ directory.

5. Change to the `hp-vcenter-compute-proxy`:

		`cd /root/hp-vcenter-compute-proxy`

6. Export PYTHONPATH=$PWD

7. Copy the SSH key into `/root/hp-vcenter-compute-proxy/input/ssh_key` file (SSH key of the seed VM or any machine which need to access to the proxy vm)

8. Update the `conf/compute_proxy.ini` file the details mentioned in the prerequisite section.

9. Execute the following script:

		`python create_compute_proxy_vm.py`

	A vCenter proxy VM named hp_helion_vcenter_proxy is available in the vCenter.

## Enable SSL between vCenter and proxy VM ##

1. Get the root certificate from the vCenter server available at this location `C:\ProgramData\VMware\VMware VirtualCenter\SSL\cacert.pem`

2. Copy the certificate into the `/root/hp-vcenter-compute-proxy/input/cacert.pem`

3. Edit the `conf/compute_proxy.ini` file to change the the host-name of the vCenter (Compulsory) instead of `ip-address vCenter`.

4. If DNS name resolution is not available add a `/etc/hosts` entry for the vCenter ip address