---
layout: default
title: "Windows CLI: Folder Operations"
permalink: /cli/windows/folder-operations/

---
# Windows CLI: Folder Operations

# HP-Cloud Object Storage Powershell Tutorial: Folder Operations
##Folder Operations

When you consider the sheer quantity of data that could be potentially moved into the cloud you soon realize that operations on individual files are impractical at best. To remedy this we have the ability to copy entire sets of objects from your local machine to
the store, within the store , and to your local machine in one operation. Each of these commands can be tailored to affect a specific folders contents, or any descendant folders beneath the target path.To address a folder, remember to include a trailing \ on the 
end of each path to indicate that you are working with a folder and not an individual file.

**Example: Local-to-Server Copy**

In this example, we're making a copy of the local folder named Test to the current location on the server which is the root directory. The lack of target path will force the system to assume the current location is the target (this is also true of individual files).
Notice that when the operation completes that a new Folder named Test has been created off of root, in other words folder operations are inclusive of the container that you're pointing to.

<img src="media/CopyL2SNonRecursive.png" width="580" height="573" alt="" />

**Example: Local-to-Server Copy (Recursive)**

Here's another example of a Local to Remote copy but this time we will push an entire hierarchy of folders as shown below.

<img src="media/CopyL2SRecursive.png" width="580" height="573" alt="" />

**Example: Server-To-Local Copy**

Now for the sake of completeness, let's throw this entire set of folders back to the client

<img src="media/CopyS2L.png" width="580" height="573" alt="" />

Done...

Now let's make sure that we can move these folders around on the server.

**Example: Intra-Server Copy (Recursive)**

<img src="media/CopyIntraserverRecursive.png" width="580" height="573" alt="" />

##Deleting Folders

Finally, when we're done with a folder we can simply remove it. Note that when you delete a folder, all of its contents are deleted along with any child folders as well.

<img src="media/DeleteFolders.png" width="580" height="381" alt="" />

Recommended Links

+ [Index](/cli/windows)
+ [Working with Metadata](/cli/windows/metadata)
