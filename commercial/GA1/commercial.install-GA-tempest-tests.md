---
layout: default
title: "HP Helion OpenStack: Verifying the Install Using Embedded Tests"
permalink: /helion/openstack/install/envars/
product: commercial.ga
product-version1: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Michael B, 


---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> &#9664; <a href="/helion/openstack/install/prereqs/#envars">Prerequisites | <a href="/helion/openstack/install/overview/test/"> &#9650; Installation Overview</a> </p> 

# HP Helion OpenStack&reg;: Verifying the Install Using Embedded Tests

A vanilla version of the upstream integration tests (Tempest) is pre-deployed in the undercloud. 
Embedded tests may be used to verify if the deployed overcloud is functional.

Running the tests [L2 title]
Login to the seed VM. From there on to undercloud:
seed> $ ssh heat-admin@${UNDERCLOUD_IP}
undercloud $ sudo –i

Source the overcloud admin credentials, activate the virtual environment and start the tests:
undercloud # source ~root/overcloud.stackrc
undercloud # source /opt/stack/venvs/openstack/bin/activate
undercloud {openstack)# run-tempest

Test results [L2 title]
Tempest is deployed under /opt/stack/tempest. During a test run, test results are displayed on the console. A detailed log file is written under /opt/stack/tempest/tempest.log.
The results are stored in testrespository database as well. To access them after the run:

undercloud (openstack)# cd /opt/stack/tempest
undercloud (openstack)# testr last

See testrepository documentation https://testrepository.readthedocs.org/en/latest/ for more details on how to manage the test result repository.

Customizing the test run [L2 title]
There are several ways available to customize which tests will be executed.

1) Run only the tests from a certain folder (and subfolders) – for instance run only compute api tests:
undercloud {openstack)# OS_TESTPATH=./tempest/api/compute run-tempest

2) Run only the tests matching a series of white and blacklists. To do so customize the content of /opt/stack/tempest/tests2skip.txt.
Documentation on the format of white and black-lists is available at http://git.openstack.org/cgit/openstack/tripleo-image-elements/tree/elements/tempest/tests2skip.py#n24. 
A good selection would only run api tests, and exclude tests that are less relevant for deployment validation, such as negative, admin, cli and thirdparty (EC2) tests:

# Include all API tests
+tempest\.api\.*

# Exclude all admin and negative tests
.*[Aa]dmin.*
.*[Nn]egative.*

# Exclude CLI and third party tests
tempest\.cli.*
tempest\.thirdparty\.*

3) Run only the tests for certain services, and exclude specific features: tempest allows doing this via its configuration file. 
A sample configuration file with inline documentation is deployed under /opt/stack/tempest/etc/tempest.conf.sample.
See the service_available section to enabled / disable tests which require a specific service. 
See the *_feature_enabled sections to enabled / disabled tests which require a specific feature of a specific service. 

Known issues [L2 tile]
The following failing tests can be excluded from the test run by adding the following to the tests2skip.txt file:

# Exclude tests for features non available or test not compatible
tempest\.api\.compute\.certificates\.*
tempest\.api\.compute\.servers.test_disk_config\.*
tempest\.api\.network\.test_fwaas_extensions\.*
tempest\.api\.network\.test_vpnaas_extensions\.*
tempest\.api\.network\.test_load_balancer\.*
tempest\.api\.image\.v1\.test_images\.CreateRegisterImagesTest\.test_register_http_image
tempest\.api\.image\.v1\.test_images\.CreateRegisterImagesTest\.test_register_remote_image
tempest.api\.network\.test_metering_extensions\.MeteringTestJSON
tempest\.api\.network\.test_metering_extensions\.MeteringIpV6TestJSON
tempest\.api\.compute\.test_live_block_migration.LiveBlockMigrationTestJSON\.test_live_block_migration
tempest\.api\.compute\.floating_ips\.test_list_floating_ips\.FloatingIPDetailsTestJSON\.test_list_floating_ip_pools

# Known failures, could be fixed by installing tempest-lib>=0.2.0
tempest\.api\.object_storage\.test_container_staticweb\.StaticWebTest\.test_web_index      
tempest\.api\.object_storage\.test_container_staticweb\.StaticWebTest\.test_web_listing_css
tempest\.api\.object_storage\.test_container_services\.ContainerTest\.test_update_container_metadata_with_delete_metadata
tempest\.api\.object_storage\.test_container_services\.ContainerTest\.test_update_container_metadata_with_delete_metadata_key
tempest\.api\.object_storage\.test_object_slo\.ObjectSloTest\.test_upload_manifest
tempest\.api\.object_storage\.test_container_sync_middleware\.ContainerSyncMiddlewareTest\.test_container_synchronization


Disclaimer [L2 titile]
Running the tests requires access the overcloud identity admin credentials; it will create and delete test accounts and test resources for test purposes. 
In certain cases tempest may fail to clean-up some of test resources after a test is complete – typically in case of failed tests.
