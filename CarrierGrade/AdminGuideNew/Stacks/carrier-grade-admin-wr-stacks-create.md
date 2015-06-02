---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Creating a Stack"
permalink: /helion/openstack/carrier/admin/stacks/create/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: All

authors: Paul 

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/1.1/3rd-party-license-agreements/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/">&#9650; UP</a> | NEXT &#9654; </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Creating a Stack

You can create a stack (or service) using the web administration interface, or you can use the command-line interface.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>


For CLI assistance, use the following command.

	heat help stack-create

Make sure that you have a template for the stack.

Depending on the template, you may need to collect some parameters in advance. For details, see the documentation for the specific template, or refer to the Parameters section of the template.

1. Launch the Horizon Dashboard.

	Specify the URL for the appropriate server environment, either the hLinux servers or Wind River Linux servers:

		hLinux: <IP_address>/horizon/auth/login/
		Wind River Linux: <IP_address>/auth/login/


2. Click the **Project** dashboard, then the **Orchestration** panel, then the **Stacks** link.

	The Stacks list appears.

2. Click **Launch Stack**.

3. In the **Select Template** screen, specify a template from the **Template Source** list.

	* File - Browse to a locally stored template files.
	* Direct Input - Enter text to define the template.
	* URL - Enter an IP address to a template file content.

3. Specify an environment file in the **Environment Source** list.

	* File - Browse to a locally stored environment files (YML format).
	* Direct Input - Enter text to define the environment.

4. Click **Next**.

4. In the **Launch Stack** complete the fields.

	**Note:** The form is created dynamically based on the Parameters section of the template, and varies depending on the template. 


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
