---
layout: default
title: "Enter or Update your License Key"
permalink: /cloudos/moonshot/install/license/
product: moonshot

---

<!--PUBLISHED-->


<script> 

function PageRefresh { 
onLoad="window.refresh" 
} 
 
PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/install/create-compute-regions/">&#9664; PREV</a> | <a href="/cloudos/moonshot/install/">&#9650; UP</a> | <a href="/cloudos/moonshot/install/customize-user-settings/">NEXT &#9654;</a> </p>

# Manage Licenses

The HP Cloud OS for Moonshot dashboards require a common, date-based HP Cloud OS for Moonshot license. When you purchase HP Cloud OS for Moonshot, there are two Stock Keeping Unit(s); one for a one-year and other for a three-year license. You can [activate your license key](/cloudos/moonshot/install/license-poetic/) only after the installation completes.

The HP Cloud OS for Moonshot license is a chassis based license. Each license has an expiry date and capacity associated with it. The capacity is the number of chassis units that are managed by the product license. A unit from the imported license is consumed when a chassis is added and a unit is released when the chassis is deleted.

When a license is imported, a license information is displayed on the top banner of all the screens in the HP Cloud OS for Moonshot Operational Dashboard and HP Cloud OS for Moonshot Administration Dashboard. In addition, the license information also appears in the HP Cloud OS for Moonshot Administration Dashboard login page. The following message is displayed based on the usage of the license:

  <!---Suppose you are using two chassis with a valid license and if you delete one chassis then automatically the license which is about to expire gets consumed by the available chassis. once this license expire you can use the existing license, if it is valid else you must order for a new license. --->

 * **Evaluation Mode** - is a trial license. 
 * **License is valid** - is a valid license. 
 * **No valid license is found** - when the license expires.
 * **One or more License is going to expire** -  if the one or more license(s) are  about to expire.
 * **License is over consumed (number of chassis consumed)**- if the chassis count exceeds the capacity of the valid license. 


**Note**: Evaluation Mode is valid for 90 days. For evaluation mode, if the chassis count exceeds the capacity of the valid license then the message, *License is over consumed (number of chassis consumed)*, is not displayed.
<!--
If you have not already done so, you can order these in the same way you order other HP Server products (hardware or software) directly through HP or through an HP channel partner. After ordering, you will receive via email or printed letter a certificate that you will redeem at HP.com. When you go to HP.com, you will register for 
support and receive a license key. You will be directed to the HP Software Depot website, where you can download the software.--->

 
After completing the installation, follow the instructions to import your license details using HP Cloud OS for Moonshot Operational Dashboard.  


 
## Import License

After you have completed the Admin node installation in the Operational Dashboard:

1. Click **Settings** in the top banner.

2. From the options in the left panel, click **License** to display the Manage Licenses page. Manage License page allows you to import and view the licenses.
1.  Click **Import**. <br>Import Licenses pop-up box is displayed.
	
2.  Click **Choose File** to browse the license file from your local system and select the license file to upload. Ensure that the license file is already downloaded from [HP Licensing for Software Portal](http://www.hp.com/software/licensing) and present in your local system.
	 
	
3. Click **Open**. The selected file is displayed beside Choose File in the Import Licenses pop-up box.
	<br> 
	**Note**: The license file must be in **.dat** format.  
	
4. Click **Confirm** to import the license. The page navigates to Manage License page. Once a license is imported successfully a message is displayed in the top banner. <br> Also, a message is displayed on the top banner if the license is about to expire or already expired and if the chassis unit exceeds the capacity of the valid license.

To view the expired license, perform the following step:

*  Click **Expired License** check box. The list of expired licenses are displayed in the Manage Licenses page.

	



## Get a New License

When your license expires, you will receive an informational message to purchase a new license key.  

**Note**: Once the license expires, you have to re-order license directly through HP.  After ordering, you will receive a printed letter of certificate with Entitlement Order Number (EON).

Refer to [activate your license key](/cloudos/moonshot/install/license-poetic/) to activate your license.

<!---
When your license expires, follow your usual HP ordering process to purchase a new license. In the Operational Dashboard: 

1. Click **Settings** in the top banner.

2. Click **License**.

3. In the licensing information, note the Instance ID value for your cloud. The HP Support representative will need this value when your new license is generated. 

4. Now enter the license key (alphanumeric characters) given to you by the HP Support representative.---> 

## Next Step

Proceed to the next topic, which includes steps to [Customize User Settings](/cloudos/moonshot/install/customize-user-settings).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

