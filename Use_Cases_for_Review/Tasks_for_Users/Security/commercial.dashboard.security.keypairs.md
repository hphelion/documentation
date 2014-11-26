---
layout: default
title: "HP Helion OpenStack&#174; Managing Security Groups"
permalink: /helion/commercial/dashboard/managing/security/keypairs/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/commercial/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/ga1/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&#174; Managing Security Groups

Use this option to manage and view key pairs.</p>

Keypairs are SSH security keys that are used to launch secure, provisioned cloud instances, images or topologies. The keypair is injected into the launched instance. Each project user needs to create a keypair(s) for use. An admin cannot create it on behalf of the user.</p>

The following tasks can be performed by a user:</p>

* <a href="#createKeypairs">Create Keypairs</a></li>
* <a href="#deleteKeypairs">Delete Keypairs</a></li>
* <a href="#importKeypairs">Import Keypairs</a></li>

### Create Keypairs ### {#createKeypairs}

To create a keypair, do the following:</p>

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Access &amp; Security</strong> link on the <strong>Project</strong> dashboard <strong>Compute</strong> panel.</p>

	The Access &amp; Security page is displayed with four tabs, <strong>Security Groups</strong>, <strong>Key Pairs</strong>, <strong>Floating IPs</strong>, and <strong>API Access</strong>. By default, <strong>Security Groups</strong> is the active tab. </p>
3. Click the <strong>Key Pairs</strong> tab to activate it.</p>

	The list of Keypairs is displayed in a table.</p>

4. Click <strong>Create Key Pair</strong>.</p>

5. In the <strong>Create Key Pair Name</strong> box, enter the name of the key pair.</p>

6. Click <strong>Create Key Pair</strong>.</p>

	The private key of the key pair is downloaded to your local system, either automatically or a dialog box prompts you to download the keypair.</p>

7. Click Save to place the private key on your local system.</p>

### Delete Keypairs ### {#deleteKeypair}

To delete a keypair, do the following:</p>

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Access &amp; Security</strong> link on the <strong>Project</strong> dashboard <strong>Compute</strong> panel.</p>

3. Click the <strong>Key Pairs</strong> tab to activate it.</p>

4. For the key pair you want to delete, click <strong>Create Key Pair</strong>.</p>

5. In the confirmation screen that appears, click <strong>Delete Key Pair</strong>.</p>

	A message displays if the key pair is deleted.</p>

### Import Keypairs {#Import Keypairs}

To import a keypair, do the following:</p>

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Access &amp; Security</strong> link on the <strong>Project</strong> dashboard <strong>Compute</strong> panel.</p>

3. Click the <strong>Key Pairs</strong> tab to activate it.</p>

4. Click <strong>Import Keypair</strong> to display the Import Keypair dialog box.</p>

5. In the <strong>Keypair Name</strong> box, enter the name of the keypair.</p>

6. In the <strong>Public Key</strong> box, enter the public key.</p>

7. Click <strong>Import Keypair</strong>.</p>

	A message appears if the import is successful.</p>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*