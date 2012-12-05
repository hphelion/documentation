---
layout: default
title: "Windows CLI: Deleting and Moving Files"
permalink: /cli/win/deleting-and-moving-files/
product: win-cli

---
# Windows CLI: Deleting and Moving Files

##Deleting Files

Deleting files is as simple as issuing the Delete command. This example will delete the test.xml from the test container. 

<img src="media/winps17.jpg" alt="" />

##Moving Files Around

Once you have a set of folders created and organized within HP Scalene Objects, you probably want to start copying files to those locations. Three separate scenarios are supported here.

* Local to Server:  From your local file system to HP Object Storage.
* Intra-Server   :  From a location within Object Storage to another. This means copying files from one folder to the next within a single container, or across containers as well.
* Server to Local:  From Object Storage to your local file system.

Example: Local-to-Server Copy

<img src="media/winps14.jpg" alt="" />

This example simply copies a file from the local Documents folder to the current location using an Implicit Target Path to the containers root directory.

Example: Intra-Server Copy

This example copies a file which already exists on the server, over to the d1 folder adjacent to root.

<img src="media/winps15.jpg" alt="" />

Example Server-to-Local Copy
When you want to view a file or make modifications to a file locally you need to perform a Server-to-Local copy as shown below.

[ Insert winps16.jpg ]

Note in the example above the lack of a filename specified within the target path. This is another example of an implied target path in which the command will assume that the Source Path filename will be used as the target.

