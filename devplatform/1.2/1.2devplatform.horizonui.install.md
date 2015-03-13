---
layout: default-devplatform
title: "HP Helion 1.2 Development Platform: Installing the Horizon UI for ALS, DBaaS, and Marketplace"
permalink: /helion/devplatform/1.2/horizonuiinstallation/
product: devplatform2.0
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.2
role1: Systems Administrator 
role2: System Engineer
role3: Cloud Administrator
role4: Network Administrator
role5: Application Developer
Role6: Security Engineer
role7: Application Developer 
role8: ISV Developer
role9: Service Developer
authors: Patrick F
SME1: Chris Johnson
SME2: Dominic Vieira

---
<!--UNDER REVISION-->



# HP Helion 1.2 Development Platform: Installing the Horizon UI for ALS, DBaaS, and Marketplace

This document shows how to install the Horizon UI for the [Application Lifetime Service (ALS)](/helion/devplatform/1.2/als/), [Database as a Service (DBaaS)](/helion/devplatform/1.2/databaseservice/), and [Marketplace](/helion/devplatform/1.2/marketplace/) Services.

**Note:** You will need to download and install the Horizon UI separately for each service you wish to upgrade.
 
## Step 1: Retrieve the ALS, DBaaS, and Marketplace Service Updates from CODN

Use the **Helion Development Platform UI** to check CODN for a new Service Update for ALS, DBaaS, or Marketplace.

If there are new Service Updates for ALS, DBaaS, or Marketplace, retrieve them from CODN. This will retrieve the ALS, DBaaS, and Marketplace packages from CODN and push them into a container in Swift within your local cloud.

## Step 2: Install the ALS, DBaaS, and Marketplace Service Updates

### Preparation

You will need the following pieces of information in order to run the service updates.

<table width="100%">
  <tr><th><p>Identifier</p></th><th><p>Description</p></th></tr>
  <tr><td><p>BASE_NODE_IP</p></td><td><p>The IP address of the base node for your Helion installation.</p></td></tr>
  <tr><td><p>SEED_NODE_IP</p></td><td><p>The IP address of the seed node for your Helion installation.</p></td></tr>
  <tr><td><p>USERNAME</p></td><td><p>The username of a cloud admin that has rights to perform a service update for the selected service (ALS, DBaaS, or Marketplace).</p></td></tr>
  <tr><td><p>PASSWORD</p></td><td><p>The password of a cloud admin that has rights to perform a service update for the selected service (ALS, DBaaS, or Marketplace).</p></td></tr>
  <tr><td><p>HEAT_ADMIN_KEY</p></td><td><p>The private key file for the <strong>heat-admin</strong> user. <br />
Usually available within the root user account on the seed node here: ~/.ssh/id_rsa</p></td></tr>
  <tr><td><p>CONTAINER_NAME</p></td><td><p>The Swift container that contains the service update. <br />
Defaults to <strong>als-horizon-ui</strong> for ALS. <br />
Defaults to <strong>dbaas-horizon-ui</strong> for DBaaS. <br />
Defaults to <strong>murano-dashboard-horizon-ui</strong> for Marketplace.</p></td></tr>
  <tr><td><p>SERVICE_UPDATE_FILENAME</p></td><td><p>The filename of the ALS, DBaaS, or Marketplace service update. <br />
This can typically can be found inside the above container in Swift.</p></td></tr>
</table>

### Let's get to it!

a) SSH to the seed node of your cloud:

<pre>
# SSH to the base node 
ssh USERNAME@BASE_NODE_IP

# Become root
sudo su (will prompt for password)

# SSH to the seed node 
ssh SEED_NODE_IP
</pre>

b) Ensure your environment has the proper credentials to perform the download from Swift:

<pre>

# For ALS: Source the overcloud credentials to reach Swift 
export TE_DATAFILE="/root/tripleo/ce_env.json"
source /root/tripleo/tripleo-incubator/overcloudrc
# For DBaaS and Marketplace: overcloud credentials needed here 
source admin_over_creds
</pre>

c) Use the Swift client to download the Service Update:

<pre>
# List the contents of the Swift container for the desired service update
# ALS
swift list als-horizon-ui

# DBaaS
swift list dbaas-horizon-ui

# Marketplace
swift list murano-dashboard-horizon-ui

# Take note of the name of the file within each container 
# ex: SERVICE_UPDATE_FILENAME.tar.gz 

# Download the installation file 
swift download CONTAINER_NAME SERVICE_UPDATE_FILENAME 
</pre>

d) Once the file is downloaded, unzip/tar the file:

<pre>
tar -zxvf SERVICE_UPDATE_FILENAME.tar.gz
</pre>

e) Go to the newly created folder and execute the install script, passing in the location of the private key of the <strong>heat-admin</strong> account:

<pre>
# For ALS: Source undercloud creds from the same location as the overcloudrc
source /root/tripleo/tripleo-incubator/undercloudrc

# For DBaaS and Marketplace: Source undercloud creds 
source admin_under_creds 

# Fire up the install!
cd SERVICE_UPDATE_FILENAME 
./install.sh HEAT_ADMIN_KEY 
</pre>

## Step 3: Configure each service

Return to the **Helion Development Platform UI** and click on "Configure" to configure each service.
 ----


