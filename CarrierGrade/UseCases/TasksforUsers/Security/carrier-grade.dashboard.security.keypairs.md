---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Managing Key Pairs"
permalink: /helion/commercial/carrier/dashboard/managing/security/keypairs/
product: carrier-grade

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/commercial/carrier/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/carrier/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/carrier/ga1/">NEXT &#9654;</a></p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Managing Key Pairs

Use this option to manage and view key pairs.

Keypairs are SSH security keys that are used to launch secure, provisioned cloud instances, images or topologies. The keypair is injected into the launched instance. Each project user needs to create a keypair(s) for use. An admin cannot create it on behalf of the user.

The following tasks can be performed by a user:

* [Create Keypairs](#createKeypairs)
* [Delete Keypairs](#deleteKeypairs)
* [Import Keypairs](#importKeypairs)


### Create Keypairs ### {#createKeypairs}

To create a keypair, do the following:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Project** dashboard, then the **System** panel, then the **Access &amp; Security** link.

	The Access &amp; Security page is displayed with four tabs, **Security Groups**, **Key Pairs**, **Floating IPs**, and **API Access**. By default, **Security Groups** is the active tab. 

3. Click the **Key Pairs** tab to activate it.

	The list of Keypairs is displayed in a table.

4. Click **Create Key Pair**.

5. In the **Create Key Pair Name** box, enter the name of the key pair.

6. Click **Create Key Pair**.

	The private key of the key pair is downloaded to your local system, either automatically or a dialog box prompts you to download the keypair.

7. Click Save to place the private key on your local system.

### Delete Keypairs ### {#deleteKeypair}

To delete a keypair, do the following:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Project** dashboard, then the **System** panel, then the **Access &amp; Security** link.

3. Click the **Key Pairs** tab to activate it.

4. For the key pair you want to delete, click **Create Key Pair**.

5. In the confirmation screen that appears, click **Delete Key Pair**.

	A message displays if the key pair is deleted.

### Import Keypairs {#ImportKeypairs}

To import a keypair, do the following:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Project** dashboard, then the **System** panel, then the **Access &amp; Security** link.

3. Click the **Key Pairs** tab to activate it.

4. Click **Import Keypair** to display the Import Keypair dialog box.

5. In the **Keypair Name** box, enter the name of the keypair.

6. In the **Public Key** box, enter the public key.

7. Click **Import Keypair**.

	A message appears if the import is successful.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
