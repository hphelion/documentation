---
layout: default
title: "Launch Administration Dashboard for Post-Deployment Tasks"
permalink: /cloudos/moonshot/install/launch-admin-dashboard/
product: moonshot

---


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/install/updates-and-extensions/">&#9664; PREV</a> | <a href="/cloudos/moonshot/install/">&#9650; UP</a> | NEXT &#9654; </p>

# Launch Administration Dashboard for Post-Deployment Tasks

After a cloud environment has been created in the Operational Dashboard, you manage the cloud through the Administration Dashboard. 
The Administration Dashboard provides a simplified means of creating and managing Cloud resources and topology design documents.  
The Administration Dashboard also enables you to provision a composite topology described by the topology design documents. And importantly 
for HP Moonshot environments, the Administration Dashboard lets you <b>manage the Moonshot chassis</b> that are assigned to run specific workloads in your cloud.

This topic describes a set of baseline post-deployment tasks that you should perform on your cloud. Here we are highlighting just the minimal steps you should follow to get started with the Administration Dashboard, and verify that your deployed cloud is operating properly.  

* [How to Access the Administration Dashboard](#how-to-access-the-administration-dashboard)

* [Create a Keypair](#create-a-keypair)

* [Upload Cloud Images](#upload-cloud-images)

* [Use a Provided Flavor](#use-a-provided-flavor)

* [Manage your Moonshot Chassis](#manage-your-moonshot-chassis)

* [Launch an Instance from an Image](#launch-an-instance-from-an-image)

* [Next Steps](#next-steps)


## How to Access the Administration Dashboard

You can access the Administration Dashboard in one of two ways:

* Open a browser and enter the URL of your Cloud Controller node's public IP address. Login with the Admin account and password you specified (in the Operational Dashboard) on the Create Cloud > Attributes dialog. 

* Within the Operational Dashboard, from the Cloud tab, click <b>Manage Clouds</b> > <b>More</b> > <b>Launch Dashboard</b> for the cloud you created.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:600px;"> <b>Important:</b>: Use Google Chrome or 
Mozilla Firefox to access the Administration Dashboard.</p>


## Create a Keypair

Keypairs serve as a means of accessing the instance. One immediate advantage that this method has over traditional password authentication 
is you can be authenticated by the server without ever having to send your password over the network. Users need to create keypair(s) for 
their individual projects.

To create a keypair, do the following:

1. In the Administration Dashboard, select the Project Tab.  The tab displays with options in the left panel.

2. Select Access and Security option from the left panel to display more options.

3. Click Access and Security to display a page with three tabs- Keypairs, API Access and Authentication Token. By default, Keypairs is the active tab.

4. Click Create Keypair to display Create Keypair dialog box.

5. In the Keypair Name box, enter Keypair name. For example testonlykeypair or any custom name with no spaces.

6. Click Create Keypair.  The keypair is downloaded to the browser session's system. A message is displayed to download the keypair from a link, if it does not download automatically.
 
 * The key is downloaded in the form of a PEM file.
 * The key can only be downloaded once.
 * It is very important to store the key in a safe location.

7. From the left Panel, select Access and Security option again. The keypair is displayed in the page.


## Upload Cloud Images

Integrating content Friday 2/21...



## Use a Provided Flavor

Integrating content Friday 2/21...



## Manage Moonshot Chassis

Integrating content Friday 2/21...



## Launch an Instance from an Image

Integrating content Friday 2/21...


## Next Step



For more details about the Administration Dashboard, see the [HP Cloud OS for Moonshot Administration Dashboard Help](/cloudos/moonshot/manage/administration-dashboard/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>



