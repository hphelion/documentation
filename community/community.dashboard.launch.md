---
layout: default
title: "HP Helion OpenStack&#174; Community: Logging into the Dashboards"
permalink: /helion/community/dashboard/login/
product: commercial

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/community/managing/volumes/">&#9664; PREV</a> | <a href="/helion/community/dashboard/users/">&#9650; UP</a> | <a href="/helion/community/managing/routers/">NEXT &#9654;</a> </p> -->

# HP Helion OpenStack&#174; Community: Logging into the Dashboards

The [HP Helion OpenStack Community dashboards](/helion/community/dashboard/how-works/) are browser-based user interfaces that allow you to interact with the HP Helion OpenStack Commercial overcloud.

To log into the Helion dashboard:

1. Ask the cloud operator for the host name or public IP address from which you can access the dashboard, and for your user name and password.

	**Note:** When accessing Horizon in a virtual environment, use the public network address, not the management network address. In a default configuration, the URL is http://192.0.8.2.


2. Open a web browser that has JavaScript and cookies enabled.

3. In the address bar, enter the host name or IP address for the dashboard.

	**Note:** If a certificate warning appears when you try to access the URL for the first time, a self-signed certificate is in use, which is not considered trustworthy by default. Verify the certificate or add an exception in the browser to bypass the warning.

4. On the Log In page, enter your user name and password, and click **Sign In**.

5. If you are a non-admin user, select a project from the list at the top of the screen.

<img src="media/HorizonProjectMenu.png" alt="" />


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593;</a>
