Text dump to be formatted in files later.

Introduction
Cloud Console Getting Started walks you through network setup, connection, and management, instance and volume creation, security options, and identity parameters that facilitate your organization's HP Cloud use.

In most cases, this document takes you through the interface in the chronological order needed to get up and running, rather than the order displayed. After you are setup, revisit the interface to monitor, modify, add, and delete networks, instances, volumes, usergroups, etc.

Screenshot of Interface.

I. Begin
A. Login to HP Cloud with your username and password
B. Activate an Availability Zone (AZ) from the list under "Compute" in the Cloud Console Interface.


II. Create and Connect a Network
A. Create a Network
1. On the Cloud Console Interface, click "Project," then "Networks" under "Manage Networks."
2. Click "+Create Network" in the right-hand navigation.
3. Enter a "Network Name." (Look at again for description/use of "Admin State" and then if needed, ask Steve - should you leave the default checked for it?

B. Create a Subnet
1. On the "Subnet" page, enter the name of your subnet.
2. Tab to or click in the the "Network Address" box. The pop-up window states the network address is in Classless Inter-Domain Routing (CIDR) format:  000.000.0.0/00. Enter the network address displayed: 192.168.0.0/24.
3. Keep the IPv4 default in the "IP Version" box unless you know you have moved to IPv6.
4. Leave the "Gateway IP" box blank to use the default value of the network address; e.g., 192.168.0.1 for 192.168.0.0/24.
5. Leave the "Disable Gateway" box unchecked to use the default and click "Create." 
6. The "Networks" screen displays your network name and associated subnets.
7. To see a graphic display of your network setup, click "Network Topology."

C. Create a Router
1.  If on the "Network Topology" screen, click "Create Router" on the top right-hand navigation. If not, click "Routers" under the "Manage Network" heading in the left-hand navigation.
2.  Enter your router name and click "Create Router." The router name and status appear on the "Routers" page.

Note: For router details, you can click the router "Name" to display its ID number and status. If you do this, click "Back" before the following steps to make the "Set Gateway" action available.

3. On the "Router" page, click "Set Gateway" under "Actions" to connect your router to the subnet.
4. Click the drop-down menu in the "External Network" box in the "Set Gateway" pop-up, select "Ext-Net," and click "Set Gateway."

Note: Th external network is the router's default route, with the router acting as a gateway for external connectivity. While you can configure a subnet that is internal-only, it would need to be connected to another subnet with external connectivity.

D.  Connect Your Network
1. Click the router name on the "Routers" page.
2. Click "+Add Interface" on the top far-right of the "Router Details" page.
3. Click the drop-down menu in the "Select Subnet" box in the "Add Interface" pop-up and click on the network you configured.

Note: You can optionally specify an IP address in the box provided, but the default interface IP address is the selected subnet's external gateway and the best choice unless you are setting up a more complicated connection. Any IP address you specify must belong to the subnet in the drop-down menu.

4. Click "Add Interface."

III. Manage HP Cloud
A. Overview

You are now ready to use the options under "Manage Compute." Mosey on over to the left-hand navigation, click that bad boy and let's get started. "Manage Compute" options include:
1. Overview
2. Instances
3. Volumes
4. Imanges and Snapshots
5. Access and Security

A. Select "Overview" under "Manage Compute," to display your usage summary and quotas for:
1. Instances
2. VPCUs
3. RAM
4. Floating IPs
5. Security Groups

As you use HP Cloud, click on these options to query current usage as well as usage during specific time frames.

B. Create an Instance
