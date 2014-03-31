
---
layout: default
title: "HP Cloud OS for Moonshot: Administration Dashboard"
permalink: /cloudos/moonshot/manage/administration-dashboard/cloud-users/
product: moonshot

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage">&#9650; UP</a> | NEXT &#9654; </p>




#Manage Users

You can create different users and assign different roles and projects to them. 

You can perform the following tasks:

* <a href="#Create a Cloud User">Create a Cloud User</a> 

* <a href="#Edit a Cloud User">Edit a Cloud User</a> 

* <a href="#Disable a Cloud User">Disable a Cloud User</a> 

* <a href="#Enable a Cloud User">Enable a Cloud User</a> 

* <a href="#Delete a Cloud User">Delete a Cloud User</a> 

* <a href="#Restore a Cloud Project">Restore a Cloud User</a> 



To view the list of different cloud users:

1. Click **Cloud** Tab to select it.

2. From the options in the left panel, select **Users** to display the Users page with a list of users.

3. Click  **User Name** to view the user details.

##Create a Cloud User##<a name= "Create a Cloud User"></a>

Use this option to create a cloud user and set general attributes for the user. You can also assign a project specific and cloud specific role to the user through this option.

To create a cloud user:

1. Click **Cloud** Tab to select it.

2. From the options in the left panel, select **Users** to display the Users page.

3. Click **Create User** displayed on the top right corner in the right pane. Create User dialog box is displayed with three different tabs: **User**, **Project**, and **Cloud**. By default, User is the active tab.

4. In the User Tab, perform the following:
 
 * In the **User Name** box, enter the name of the user.
 
 * (Optional) In the **Email** box, enter the email-ID for the user.
 
 * In the Password box, enter the password.
 
 * In the **Confirm Password** box, re-enter the password to verify it.

5.  In the User Tab, perform the following:
 
 * In the **User Name** box, enter the name of the user.From** Primary Project** drop-down list, select the project to which you want to add the user.
 
 * From **Project Role** drop-down list, select the role to that you want to assign to the user.<br>
 **Note**: The role defined in the Project Tab is specific to the selected project.


1. (Optional) In the Cloud Tab, perform the following:
 * From the **Cloud Role** drop-down list, select the cloud role for the user.

7. Click **Create User** to create the user. A message is displayed on successful creation.<br>
OR<br>
Click **Cancel** to abort and go to the previous screen.

##Edit a Cloud User##<a name= "Edit a Cloud User"></a>

Use this option to edit the attributes of a cloud user. You can modify the User and Cloud related information here and for modifying the project related attributes refer to Modify Users section. 
To modify the user details:

1. Click **Cloud** Tab to select it.

2. From the options in the left panel, select **Users** to display the Users page.

3. Click **Edit** against the user whom you want to edit. Update User dialog box is displayed with only two tabs: **User** and **Cloud**.

4. Make the required changes.

5. Click **Update User** to save the details.<br>
OR<br>
Click **Cancel** to abort and go to the previous screen.

##Disable a Cloud User##<a name= "Disable a Cloud User"></a>

To disable the cloud user from logging in:

1. Click **Cloud** Tab to select it.

2. From the options in the left panel, select **Users** to display the Users page.

3. Click **More** drop-down list against the user whom you want to disable and select **Disable User** from the drop-down list. The user is disabled and the Enabled field status changes to **False**. 

##Enable a Cloud User## <a name= "Enable a Cloud User"></a>
* To enable the user again, select **Enable User** from the **More** drop-down list against the user. The Enabled field status changes to **True**.

##Delete a Cloud User##<a name= "Delete a Cloud User"></a>

The delete option marks the user for deletion:

1. Click **Cloud** Tab to select it.

2. From the options in the left panel, select **Users** to display the Users page.

3. Click **More** drop-down list against the user whom you want to delete.

4. Select **Delete User** from the drop-down list. A confirmation box is displayed.

5. Click **Delete User**. The user is marked for deletion by adding a tilde mark (~) against it.<br>
OR <br>
Click **Cancel** to abort and go to the previous screen.

##Restore a Cloud User##<a name= "Restore a Cloud User"></a>

To restore a deleted user:

1. Click **Cloud** Tab to select it.

2. From the options in the left panel, select **Users** to display the Users page.

3. Click **Restore User** against the user whom you want to restore. A confirmation box is displayed.

4. Click **Restore**. A message is displayed on successful restoration. Once the user is restored, you need to manually assign the user to the previously assigned project.<br>
OR <br>
Click **Cancel** to abort and go to the previous screen.




<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>



