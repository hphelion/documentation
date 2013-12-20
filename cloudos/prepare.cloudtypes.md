---
layout: default
title: "Introduction to Cloud Types"
permalink: /cloudos/prepare/cloudtypes/
product: cloudos

---

<a name="_top"> </a>

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/prepare/overview/">&#9664; PREV | <a href="/cloudos/prepare/">&#9650; UP</a> | <a href="/cloudos/prepare/glossary/">NEXT &#9654;</a> </p>

# Introduction to Cloud Types

The first step in creating a cloud is to consider the type of cloud you want to create for your organization:

* Private
* Public
* Hybrid 

Based on your choice, you should then capture various details about your environment. 

Depending on which type of cloud you need to deploy, you may need support from your IT administrator to correctly capture information 
about your environment. After you have captured the requisite information about your environment and completed the setup of the HP Cloud OS Administration Node 
(Admin Node), you will be able to start deploying the services that make up your cloud.

If you are interested in creating a public cloud, start in the 
<a href="http://docs.hpcloud.com" target="hpcs"> HP Public Cloud Overview.</a>  This page opens in a new browser tab or window.

## Cloud Environment Types

Using the HP Cloud OS Operational Dashboard, the Admin Node can be set up for a:

* Private cloud
* Hybrid cloud

A private cloud is very similar in functionality to a public cloud, except the infrastructure resources for a private cloud are contained within the host company's internal network. A public cloud is deployed on external networks that are run by a cloud provider, such as <a href="http://www.hpcloud.com"> HP Cloud.</a>  A hybrid cloud is one where resources from two clouds (private, public, or both) can be shared by users of the hybrid cloud. 

### Private Cloud

This type of cloud environment entails deploying a private cloud on your own bare-metal servers (blades, rack-mounted servers, and so on) that you 
have available in and control of in your IT environment. This is the most advanced of the cloud environment deployment options, as setting up the Admin Node for this type of cloud requires gathering information about the servers that will be nodes in your cloud, their networking configuration, and the overall network configuration of your IT environment. Gathering such information may require consultation with your IT administrator.
 
Typically, deploying a private cloud requires a bare-metal server for what is called a Cloud Controller and at least one bare-metal 
server for a Compute Region Controller that offers virtualized compute, network, and storage. After they are installed, Compute Region 
Controllers are elastic, and can be expanded (or reduced) to many more bare-metal servers to offer various scales of virtualized resources to your cloud self-service users. 

A private cloud also supports hybrid Compute Region Controllers. This means you can use Compute Region Controllers from other OpenStack-compatible clouds as if they were part of your private cloud to expand the amount of resources available to your self-service users. 

If you want to install a private cloud, go to the Environment tab and follow the instructions. To complete the install, refer to  
[Install &amp; Configure Your Cloud](/cloudos/install/).

### Hybrid Cloud

A hybrid-only cloud is deployed on your own bare-metal server. Setting up the Admin Node for this type of cloud requires less information about the servers and IT environment; however, you may still need to consult your IT administrator.

Typically, deploying this kind of cloud requires a single bare-metal server for what is called a Cloud Controller. Because of the 
hybrid nature of this cloud, Compute Region Controllers (virtualized compute, network, and storage) are utilized from other 
OpenStack-compatible clouds. HP Cloud is a great example of an OpenStack-compatible public cloud that 
can serve as the Compute Region Controller to a hybrid-only cloud. After a hybrid cloud is set up, it can be converted to a private cloud at a later time. 

A separate HP Cloud account is required for using their resources, and usage rates will apply. If you already have another 
OpenStack-compatible cloud in your environment, you can use that cloud's Compute Region Controller in this hybrid-only 
cloud, taking advantage of the advanced functionality of the Cloud Infrastructure.

### Virtual Hybrid-only Cloud

A virtual hybrid-only cloud is deployed in a virtual environment. This is the simplest cloud to deploy 
because the Admin Node does not need to be modified for your IT environment. The virtual machine used for the Cloud Controller 
can be configured to match the default setup of the Admin Node. A virtual hybrid-only cloud requires only one other virtual 
machine for the Cloud Controller. This type of cloud cannot easily be converted to hybrid-only or a private cloud, so 
create this virtual hybrid-only cloud for temporary usage such as proof-of-concept, education about cloud environments, 
or development. For long-lived elastic clouds, choose either a private cloud or a hybrid cloud environment.

Enjoy the next milestone in computing architecture: Cloud Computing.

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

