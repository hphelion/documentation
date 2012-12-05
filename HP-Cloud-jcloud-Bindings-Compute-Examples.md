---
layout: default
title: "HP Cloud jcloud Bindings Compute Examples"
permalink: /bindings/jclouds/compute/
product: jclouds

---
# HP Cloud jcloud Bindings Compute Examples

This page provides you with examples of how to use the jclouds bindings to perform compute tasks.  The library provides you with two different APIs that you can use: the Provider-Specific API, and the Compute Service Portable API, which allows you the freedom to use portable abstractions or cloud-specific features.

*Note*: In examples, text in angle brackets indicates a variable:

        <This_is_a_variable>

## Using the Provider-Specific API

### Connecting to the service

Instantiate the context with the HP Cloud-compute provider:

        ComputeServiceContext ctx = new ComputeServiceContextFactory().createContext("hpcloud-compute", user, apiKey) ;

Using the provider-specific API:

        RestContext<NovaClient, NovaAsyncClient> context = ctx.getProviderSpecificContext();
                NovaClient client = context.getApi();

When you have completed your jclouds compute operations, you need to finish by closing the context:

       context.close(); 

*Note*: You cannot specify an availability zone if it has not been activated.  To activate an availability zone, go to the [Management Console dashboard](https://console.hpcloud.com/) and click the <font face="courier"><strong>Activate</font></strong> button.

### Server Operations

Getting a server client:

        ServerClient serverClient = client.getServerClientForZone(<zone>);

Listing all available servers for an account:

        Set<Server> servers = serverClient.listServersInDetail();

Obtaining the details of a particular server:

        Server server = serverClient.getServer("<server_number>");

Creating a new server:

        Server exampleServer = 
                serverClient.createServer("<exampleServer>", “<image_id>", "<flavor_ID>");

Rebooting a server:

        serverClient.rebootServer(exampleServer.getId(), RebootType.HARD);

<!--Changing password for a server:-->
<!--This command appears not to exist.  Mike A says: "has no effect that I can see...unsupported on hpcloud?"-->

<!--        serverClient.changeAdminPass(exampleServer.getId(), "<newPassword>");-->

Deleting an existing server:

        serverClient.deleteServer(<exampleServer>.getId());

### Flavor Operations

Getting a flavors client:

        FlavorClient flavorClient = client.getFlavorClientForZone(<zone>);

Listing all available flavors:

        Set<Flavor>flavors = flavorClient.listFlavorsInDetail();

Obtaining the details of a particular flavor:

        Flavor flavor = flavorClient.getFlavor("<flavor_ID>");

### Image Operations

Getting an image client:

        ImageClient imageClient = client.getImageClientForZone(<zone>);

Listing all available images:

        Set<Image> images = imageClient.listImagesInDetail();

Obtaining the details of a particular image:

        Image image = imageClient.getImage("<image_ID");

### Keypair Operations

Getting a keypair client:

        KeyPairClient keyPairClient = client.getKeyPairExtensionForZone(zone).get();

Listing all available keypairs:

        Set<Map<String, KeyPair>> keyPairs = keyPairClient.listKeyPairs();

Creating a new keypair:

        KeyPair keyPair = keyPairClient.createKeyPair("<exampleKeyPair>");
        String publicKeyPart = keyPair.getPublicKey();
        String privateKeyPart = keyPair.getPrivateKey();

Deleting an existing keypair:

        boolean queuedForDeletion = keyPairClient.deleteKeyPair("exampleKeyPair");

### Security Groups Operations

Getting a security group client:

        SecurityGroupClient securityGroupClient = client.getSecurityGroupExtensionForZone(zone).get();

Listing all available security groups:

        Set<SecurityGroup> securityGroups = securityGroupClient.listSecurityGroups();

Obtaining the details of a particular security group:

        SecurityGroup securityGroup = securityGroupClient.getSecurityGroup("<security_group_ID>");

Creating a new security group:

        SecurityGroup exampleSecurityGroup =
                securityGroupClient.createSecurityGroupWithNameAndDescription("exampleSecurityGroup", "an example security group");

Creating a rule for an existing security group:

        Ingress ingress = Ingress.builder().ipProtocol(IpProtocol.TCP).fromPort(80).toPort(8080).build();
        SecurityGroupRule rule =
                securityGroupClient. createSecurityGroupRuleAllowingCidrBlock(securityGroup.getId(), ingress, "0.0.0.0/0");

Deleting a rule from an existing security group:

        boolean ruleQueuedForDeletion = 
                securityGroupClient.deleteSecurityGroupRule(rule.getId());

Deleting an existing security group:

        boolean ruleQueuedForDeletion =
                securityGroupClient.deleteSecurityGroup("<security_group_ID>");

### Address Operations

Getting an address client:

        FloatingIPClient floatingIPClient = client.getFloatingIPExtensionForZone(zone).get();

Listing all available floating IP addresses:

        Set<FloatingIP> addresses = floatingIPClient.listFloatingIPs();

Obtaining the details of a particular address:

        FloatingIP address = floatingIPClient.getFloatingIP("<address_ID>");

Creating or allocating a new address:

        FloatingIP exampleAddress = floatingIPClient.allocate();

Associate a server to an existing address:

        floatingIPClient.addFloatingIPToServer(exampleAddress.getIp(), server.getId());

Disassociate a server from an existing address:

        floatingIPClient.removeFloatingIPFromServer(exampleAddress.getIp(), server.getId());

Deleting or releasing an existing address:

        floatingIPClient.deallocate(exampleAddress.getId());

## Using the Compute Service Portable API

Listing all the availability zones:

        Set<? extends Location> locations = cs.listAssignableLocations();

Listing nodes:

        Set<? extends ComputeMetadata> nodes = cs.listNodes();

Listing hardware profiles:

        Set<? extends Hardware> hardware = cs.listHardwareProfiles();
        
Listing images:

        Set<? extends org.jclouds.compute.domain.Image> image  = cs.listImages();

Creating nodes with templates:

        Template template = cs.templateBuilder().osFamily(OsFamily.UBUNTU).build();
        Set<? extends NodeMetadata> groupedNodes = cs.createNodesInGroup("myGroup", 2, template);

Rebooting images in a group:

        cs.rebootNodesMatching(inGroup("myGroup"));

Terminating images in a group:

        cs.destroyNodesMatching(inGroup("myGroup"));

See the [HP Cloud Java/Clojure jclouds Binding](/bindings/jclouds) page for further information on the jclouds bindings.