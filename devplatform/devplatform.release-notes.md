---
layout: default-devplatform
title: "HP Helion Development Platform Release Notes"
permalink: /helion/devplatform/release-notes/
product: devplatform
product-version1: HP Helion Development Platform
product-version3: HP Helion Development Platform 1.1
role1: Systems Administrator 
role2: System Engineer
role3: Cloud Administrator
role4: Network Administrator
role5: Application Developer
Role6: Security Engineer
role7: Application Developer 
role8: ISV Developer
role9: Service Developer
writer: Jayme P

---
<!--UNDER REVISION-->

# HP Helion Development Platform: Release Notes for HP Helion Development Platform 1.1


The following release notes are for the HP Helion Development Platform 1.1 released on February 20, 2015. We hope you enjoy the release!

## Known Issues:

2.  Running the Helion Development Platform from multiple projects may cause issues. Please run the install only from the "Admin" project.

3. **Password Field is not used when creating a RabbitMQ cluster**. The password field in the Horizon panel is not necessary when creating a RabbitMQ cluster and will be ignored. This is a known issue and will be fixed in the next release.

3. **Download PEM not working in the RabbitMQ Panel for the Messaging Service**. In Safari browsers only, clicking the button to download a PEM file results in an error. 

4. **RabbitMQ cluster creation fails when a floating IP pool has not been selected**. You must select a floating IP pool when creating a RabbitMQ cluster in the messaging service.

5. **Use the correct network to connect to an ALS cluster**. This note applies only if your ALS cluster administrator has not created additional, custom domains for your use. <br />By default, when pushing applications to ALS, you will be presented with two domains for the new application: a xip.io address (example: *10.0.0.1.xip.io*) and a local domain (example: *hphelion-xyz.local*). When connecting to the ALS Cluster over a network, select the xip.io domain to allow clients to connect to the deployed application. Do not select the local network. 

----
