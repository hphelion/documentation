---
layout: default
title: "HP Helion OpenStack&#174; Accessing the Sherpa UI"
permalink: /helion/openstack/services/sherpa/accessing/
product: commercial.ga

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/">&#9664; PREV | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/faq/">NEXT &#9654; </a></p>
-->

# HP Helion OpenStack&reg; Accessing the Sherpa UI

The [HP Helion OpenStack Sherpa Service](/helion/openstack/services/sherpa/overview/) provides a link to the remote web catalog containing a repository of software available for purchase and download into the HP Helion environment.

You can make purchases using a self-service account on the public web server. Once a purchase is made, you can use the Sherpa UI and back-end service to download the content. 

To access the Sherpa UI:

1.	Login to Undercloud horizon.  

	Password can be found by in a seed ssh session cat tripleo/tripleo-undercloud-passwords

2.	Navigate to **Admin -> Updates and Extensions -> Updates and Extensions**. 

3.	Click **Configure** to authenticate to the Cloud OS Distribution Network.

	<img src="media/SherpaConfigure.png">

4.	Provide the credentials if you have already signed up, if not, sign up by clicking the **Sign up now** link.
 
	If you are signing up for a new account, send an email to codn@hp.com to get your account assigned to test group.  
