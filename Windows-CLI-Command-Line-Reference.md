---
layout: default
title: "Windows CLI: Command Line Reference"
permalink: /cli/windows/reference/

---
# Windows CLI: Command Line Reference

Below you can find a full reference of supported Windows PowerShell command-line interface (CLI) commands.  The commands are broken up into separate sections by functional area:

* [Non-service-specific](#Nonservicespecific)
* [Compute](#Compute)
* [Object Storage](#ObjectStorage)
* [CDN](#CDN)
* [Block Storage](#BlockStorage)

**Note**: Windows CLI cmdlets are not case specific; in other words, `Get-Catalog` and `get-catalog` function identically. When referencing an argument, like a container name, that has a space, use quotes to access that resource. For example:
     
     PS: HPCS:\> cd "my container:"
     PS: HPCS:\> new-container "my new container"

<!--DOUG: Modify the fonts in the syntax sections--perhaps create a Jira case for them?-->
<!--DOUG: Create a CDN examples page?-->
<!--DOUG: include a section on environment variables, such as ENABLE-CREDENTIAL-TRACKING? Full list from Travis.-->

#Non-service-specific# {#Nonservicespecific}

Following is the complete list of HP Cloud Windows CLI commands that are not applicable to a specific service (compute, object storage, etc.).   To issue these commands, you need to navigate to a container or the HP Cloud Services (HPCS) provider, issuing the following command:

    cd HPCS:

##Get-Catalog## {#getcatalog}

Displays the current user's service catalog that was retrieved at login time.  This catalog stores each service the user has authorization to use.

###Syntax###
 get-catalog {-v} 

**v**
: Verbose mode; displays detailed information about each service that's available

###Examples###
EXAMPLE

    PS yourcontainer:\> get-catalog

Lists the available services.

EXAMPLE

    PS yourcontainer:\> get-catalog -v

Lists the available services with extended information about each available service.

##Get-Config## {#getconfig}

Lists the config file entries for the current session.

### Syntax###
 get-config 

###Examples###
EXAMPLE

    PS HPCS:\> get-config
     
     ==============================================================================================
     Current Session Settings are as follows.
     ==============================================================================================
      
     Configuration File located at C:\Users\morando\Documents\HP\CLI.config
      
      
     Name                           Value
     ----                           -----
     LogReadAttemptsMax             20
     ReleaseNotesURI                https://a248.e.akamai.net/cdn.hpcloudsvc.com/hdb0a98359ca04396dd429335015a1b4b/prodaw...
     AccessKey                      ***********
     AuthenticationServiceURI       https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/tokens
     HttpTimeoutInterval            9200000
     RDPClientPath                  40000
     EnableCredentialTracking       true
     LogReadAttemptIntervalInMil... 40000
     delimiter                      /
     DefaultTenantId
     PasteGetURIResultsToClipboard  true
     max-keys                       10000
     SecretKey                      ***********
      
    PS HPCS:\>

Displays the settings for the session.  The above example shows all currently-configurable environment variables.

##Get-Metadata## {#getmetadata}
Lists the Metadata entries assigned to the supplied resource.  

###Syntax
 `get-metadata  [*SourcePath*  | -sp *SourcePath* | -s *server-ID* | -cn "*container-name*" | -cdn "*cdn-container-name*"]`

###Description
You can list metadata assigned to Servers, Storage Objects, Containers, and CDN Containers.  Many resources can have zero to many custom meta-data entries assigned to them. *Get-Metadata* generates a list of key value pairs attached to the resource; you may use these for whatever purpose you like. (For details on how to add meta-data elements, see the [Set-Metadata](#setmetadata) cmdlet.)

### Options

**sp**
:  Path to the remote storage object. You can express paths as fully qualified (absolute) or relative to the current location in the store. 

**s**
: Server ID.

**cn**
: Container name.

**cdn**
: CDN container name.

###Examples###
EXAMPLE 1

    PS yourcontainer:\> get-metadata test.txt

Generates a list of name value pairs assigned to the object via the copy operation's use of the -md argument.

EXAMPLE 2

    PS yourcontainer:\> get-metadata -sid 23465

Lists all metadata entries for the server with the ID=23465.

EXAMPLE 3

    PS yourcontainer:\> get-metadata -cn "Marketing"

Lists all metadata entries for the container "Marketing".

EXAMPLE 4

    PS yourcontainer:\> get-metadata -cdn "Marketing"

Lists all metadata entries for the CDN container "Marketing".

##get-notes## {#getnotes}
Displays the release notes for the current version. You can filter the release notes to a specific version or show all previous release notes.

###Syntax###
 Get-Notes {-all *switch*} {-v *switch*}

**all**
: Prints all release notes

**v**
: Prints the release notes for the specific WinCLI version in the for of xx.xx.xx.xx. 

###Examples###
EXAMPLE

    get-notes

Lists the current release notes.

##Get-Version## {#getversion}
Displays the current version number.

###Syntax###
 Get-Version

###Examples###
EXAMPLE

    get-version

Displays the product's current version.

##Get-Zone## {#getzone}
Lists the currently-used availability zone.

###Syntax###
Get-Zone

###Examples###

    get-zone

Displays which availability zone is currently being used.

##Get-Zones## {#getzones}
Lists all currently-availability zones.

###Syntax###
get-zones

###Examples###

    PS HPCS:\\> get-zones
     
    Current Availability Zones include
     
 
    Zone Id  Name                 Shell Foreground Color  Is Default
    -------  ----                 ----------------------  ----------
    1        az-1.region-a.geo-1  Green                   True
    2        az-2.region-a.geo-1  Red                     False
    3        az-3.region-a.geo-1  Blue                    False
    4        az-1.region-b.geo-1  Magenta                 False
 
    PS HPCS:\\>    

Displays all the availability zones with their color information.

##Set-Config## {#setconfig}
Changes specific settings on a per session basis. All settings may be changed simultaneously by supplying the path to a different config file.

### Syntax###
 set-config -k *Key -v *Value

###Examples###
EXAMPLE 1

    PS yourContainer:\> set-config -k "HttpTimeOut" -v "100"

Changes the HttpTimeout setting to 100 miliseconds

EXAMPLE 2

    PS yourContainer:\> set-config -s "c:\testconfig.config"

Replaces all current session settings with those defined within the testconfig.config file.

EXAMPLE 3

    PS yourContainer:\> set-config -resercfg"

Resets the current session settings to those defined within the default config file (CLI.config)

##Set-Credentials## {#setcredentials}
Sets the credentials (access key, secret key, and so on) for your session.
<!--   Set-Credentials [-AccessKey] <String> [-SecretKey] <String> [-TenantId] <String>   -->

###Syntax###
 set-credentials -AccessKey *access-key* -SecretKey *secret-key* -TenantId *tenant-id*

**Note**: If you execute `set-credentials` with no arguments or options, you are prompted for the input values.

###Examples###
EXAMPLE

    set-credentials -AccessKey 12345678901234:12345678901234 -SecretKey abcd1EFGH2ijklmnop3QRSTUV4wxyz5678 -TenantId 31415926535898

Sets the session credentials for the access key to `12345678901234:12345678901234`, secret key to `abcd1EFGH2ijklmnop3QRSTUV4wxyz5678`, and tenant ID to `31415926535898`.

##Set-Metadata## {#setmetadata}
Allows you to add meta-data elements to an existing resource. Storage objects can have zero to many custom meta-data entries assigned to them.  This is essentially a list of key value pairs attached to the object that you may use for whatever you would like. Delimit the name value pairs (NVPs) with the pipe symbol | and enclose them in quotes. You can delimit multiple NVPs with commas.

### Syntax###
 set-metadata  [*SourcePath* | -sp *SourcePath* | -s *server-ID* | -cdn "*cdn-container-name*"] -md ["*name*" {"*name2*" . . .}]

<dl>
**sp**
:  Path to the remote storage object. You can express paths as fully qualified (absolute) or relative to the current location in the store. 
**s**
: Server ID.
**cdn**
: CDN container name.
**md**
: Pipe-delimited set of key value pairs seperated by commas.
</dl>

###Examples###
EXAMPLE 1

    PS yourcontainer:\> set-metadata test.txt -md "Author|Tom", "Editor|Sam"

Adds the KVPs "Author|Tom" and "Editor|Sam" to the file test.txt.

EXAMPLE 2

    PS yourcontainer:\> set-metadata -s 1345 -md "Author|Tom", "Editor|Sam"

Applies the KVPs "Author|Tom" and "Editor|Sam" to the server with the ID=1345.

EXAMPLE 3

    PS yourcontainer:\> set-metadata -cdn "Marketing" -md "Author|Tom", "Editor|Sam"

Applies the KVPs "Author|Tom" and "Editor|Sam" to the CDN-enabled container "Marketing".

##Set-Zone## {#setzone}
Sets the availability zone; all subsequently-issued commands will apply to the assigned availability zone.

### Syntax###
set-zone "*zone-ID*"

###Examples###
EXAMPLE

    set-zone "1"

Sets the availability zone to "az-2-region-a.geo-1".

#Compute CLI Commands# {#Compute}

Following is the complete list of HP Cloud Windows Compute CLI commands.

##Add-Rule## {#Add-Rule}
Creates a new security group rule and assigns it to an existing security group.

### Syntax###
add-rule [ -fp "*FromPort*" -tp "*ToPort*" | -ipr "*low*/*high*" ] -ipp "*Protocol*" -gid "*GroupID*"

<dl>
**fp**
: From Port: designates the low end of the port range to which this rule applies.
**tp**
: To Port: designates the high end of the port range to which this rule applies.
**ipr**
: `/`-separated range of IP addresses to which the rule applies (highest/lowest).
**ipp**
: The protocol affected by this rule. Valid values include tcp, udp, and icmp.
**gid**
: The security group ID used to apply this rule. If your current location is within one of these groups the ID is implied and therefore optional.
</dl>

###Examples###
EXAMPLE

    add-rule -fp "80" -tp "84" -ipp "tcp" -ipr "15.185.118.75" -gid "2133"

Creates a new security group rule affecting the TCP protocol from port 80 to 84, and assigns it to SecurityGroup 2133.

##Allocate-IP## {#Allocate}
Requests a new Floating IP and adds to your IP pool

### Syntax###
allocate-ip

###Examples###
EXAMPLE

    allocate-ip

##Assign-IP## {#Assign-IP}
Assigns an allocated IP address to an existing server.

###Syntax###
assign-ip "*address*" *server-ID*

###Examples###
EXAMPLE

    assign-ip "192.168.110.45" 2344

Assigns the IP address 192.168.45 to the server with the ID 2344.

##Connect-Server## {#Connect-Server}
Performs a quick connection to the designated server instance. 

**Note:** Currently available for Windows instances only.

###Syntax###
connect-server *instance-ID*

###Examples###
EXAMPLE

    connect-server 123456

Performs a connection to the server with the ID `123456`.

##Deallocate-IP## {#Deallocate-IP}
Deallocates (releases) a previously allocated IP address.

### Syntax###
deallocate-ip *AddressId*

###Examples###
EXAMPLE

    deallocate-ip 23466
Deallocates the previously allocated IP address with an Id of 23466
##Get-Limits## {#Get-Limits}
Shows your quota amounts for Compute assets

### Syntax###
get-limits

###Examples###
EXAMPLE

    get-limits

##Get-Password## {#Get-Password}
Displays the password for a server instance.

###Syntax###
get-password *instance-ID*

If you do not enter the keypair name, `Get-Password` prompts you for it.  In order to invoke `get-password`, both of the following must be true:

* The server must appear in the server list 
* The listing of the EventLog for the server (`PS HPCS:\Servers\server_id\EventLog\`), must display the encrypted key

**Note:** This cmdlet is currently available for Windows instances only. This password does not get updated if you change your password using the `reset-password` command, It always show the original generated password as long as the eventlog is available.

###Examples###
EXAMPLE

    PS HPCS:\> get-password 123456

Displays the password for the server instance `123456`.

##Ls## {#ls}
Lists the currently-available servers, flavors, images, networking, and security group and their associated information.  The information listed is dependent on the directory in which you execute the command.  For example, if you are in the directory "\Servers", the server information is listed.

**Note**: The Windows PowerShell CLI supports the [standard Windows wildcard](http://msdn.microsoft.com/en-us/library/windows/desktop/aa717088(v=vs.85).aspx) characters asterix (`*`), question mark (`?`), and range brackets (`[]`).

### Syntax###
ls 

###Examples###
EXAMPLE 1

    PS HPCS:\Servers> ls

Lists the currently-available servers and their associated details.

EXAMPLE 2

    PS HPCS:\Flavors> ls

Lists the currently-available flavors and their associated details.

##New-Keypair## {#New-Keypair}
Creates a new keypair. The keypair is stored by default in `C:\Users\*username*\Documents\HP\`.

### Syntax###
new-keypair *Name*

###Examples###
EXAMPLE

    new-keypair "TestKey"

Creates a new keypair with the name "TestKey.pem".

##New-SecurityGroup## {#New-SecurityGroup}
Creates a new security group.

### Syntax###
new-securitygroup -n "*name*" "*description*"

###Examples###
EXAMPLE

    new-securitygroup -n "TestGroup" -d "SomeDescription"

Creates a new security group with the name "TestGroup" and the description "SomeDescription".

##New-Image##{#New-Image}
Creates a new server image based on an existing server.

###Syntax
new-image "_existing-server-name_" "_new-server-name_"

###Examples
EXAMPLE

    new-image myserver testserver

Creates a new server instance `testserver` based on the existing server instance `testserver`.

##New-Server## {#New-Server}
Creates a new server.

### Syntax###
new-server -n "*name*" -i "*image-ref-ID*" -f "*flavor-ref-ID*" {-md ["*name*" {"*name2*" . . .}] {-s "*server-ID*"}} -sg "*security-group*" -k "*key-name*"

<dl>
**n**
: Server name.
**i**
: The image identifier (ImageRefId) used to define this server.
**f**
: The flavor identifier (FlavorRefId) used to define the server.
**md**
: Pipe-delimited set of metadata name value pairs seperated by commas.
**s**
: The identifier (ServerId) used to associate the metadata for the server. If your currently viewing a servers details, this parameter may be ommited as it's supplied for you.
**sg**
: Set of SecurityGroup names that are to be applied to the newly created server separated by commas.
**k**
: Keypair for this server.
</dl>

###Examples###
EXAMPLE

    new-server -n "TestServer" -i "2111" -f "100" -md "Namevalue1 | value1" , "NameValue2 | value2", "NameValue3 | value3" -sg "securitygroupname","securitygroupname2" -k "KeyName"

Creates a new server with the name "TestServer", along with some metadata.

##Ping-Server## {#Ping-Server}
Sends echo request packets to the named server.

###Syntax###
ping-server *instance_ID*

###Examples###
EXAMPLE

    PS HPCS:\Servers> ping-server 123456
    
    2 assigned IP addresses found.  Ping results are as follows.
    
    Pinging Server : 10.5.180.96
    Time to live   : 64
    Don't fragment : True
    ping status    : TimedOut
    
    Pinging Server : 15.185.107.139
    Time to live   : 64
    Don't fragment : True
    ping status    : Success
    Address        : 15.185.107.139
    RoundTrip time : 62
    Time to live   : 59
    Don't fragment : False
    Buffer size    : 32

Sends echo request packets to the server with the ID 123456 and returns the results.

##Reboot-Server## {#Reboot-Server}
Allows you to perform either a soft or hard reboot of a server. With a soft reboot, the operating system is signaled to restart, which allows for a graceful shutdown of all processes. A hard reboot is the equivalent of cycling power on the server.

### Syntax###
reboot-server "*server-ID*" [ "SOFT" | "HARD" ]

###Examples###
EXAMPLE

    reboot-server "4516" "SOFT"

Performs a soft reboot of server 4516.

##Refresh-Cache##{#Refresh-Cache}
Refreshes current shell cache.

###Syntax
refresh-cache

###Examples
EXAMPLE

    refresh-cache

Refreshes the cache for your current shell.

##Remove-Keypair## {#Remove-Keypair}
Deletes a previously created keypair.

### Syntax###
remove-keypair *Name*

###Examples###
EXAMPLE

    remove-keypair "TestKey"

Removes the keypair with the name `TestKey`.

##Remove-Rule## {#Remove-Rule}
Deletes an existing security group rule.

### Syntax###
remove-rule "*rule-ID*"

###Examples###
EXAMPLE

    remove-rule -id "3244"

Removes the rule with the ID of 3244.

##Remove-SecurityGroup## {#Remove-SecurityGroup}
Deletes an existing security group.

### Syntax###
remove-securitygroup -id "*group-ID*"

###Examples###
EXAMPLE

    remove-securitygroup -id "3244"

Removes the security group with the ID of 3244.

##Remove-Server## {#Remove-Server}
Deletes an existing server.

### Syntax###
remove-server [ "*server-ID*" | -all ]  "*server-ID*"

<dl>
**-all**
: Deletes all servers
</dl>

###Examples###
EXAMPLE

    remove-server "4516"

Deletes server 4516.

##Reset-Password## {#reset-password}
Re-syncs your Windows Administrator password for the given server, after manual modification, in order to use the `connect-server` cmlet.

### Syntax###
reset-password -id "*serverID*" -p "*password*"

###Examples###
EXAMPLE

    reset-password -id "3245" -p "testpassword08"

Resets the password for the server with the ID of "3245" to "testpassword08".

##Set-ZoneColor## {#Set-ZoneColor}
Sets the availability zone; all subsequently-issued commands are applied to the assigned availability zone.

### Syntax###
set-zonecolor *zone_ID* *color*

###Examples###
EXAMPLE

    PS HPCS:\\> set-zonecolor 1 Cyan
 
    az-1.region-a.geo-1 now assigned to Cyan.
     
    PS HPCS:\\>

Sets the color identifier for zone 1 to cyan.  The color names must be capitalized (as in the example).

##Unassign-IP## {#Unassign-IP}

###Syntax###
unassign-ip "*address*" *server-ID*

###Examples###
EXAMPLE

    unassign-ip "192.168.110.45" 2344

Unassigns the IP address 192.168.110.45 from the server with the ID 2344.

##Update-Server## {#Update-Server}
Allows you to change the server name property.

### Syntax###
update-server -id "*server-ID*" -n "*name*"

###Examples###
EXAMPLE

    update-server -id "2133" -n "NewName"

Changes the name of server 2133 to "NewName".

#Object Storage CLI Commands# {#ObjectStorage}

Following is the complete list of HP Cloud Windows Object Storage CLI commands.

##Cd## {#Cd}
Allows you to traverse through a directory structure (along both ascendant and descendant axis). 

### Syntax###
 cd *target

###Examples###
EXAMPLE 1

    PS yourContainer:\> cd foo\bar

Sets the current folder to "bar" location 2 levels deep.

EXAMPLE 2

    PS yourContainer:\foo\bar> cd .. 

Moves the current folder to "foo" from its current position (bar)

##Copy## {#Copy}
Allows you to move files in the following ways:

+ Local Client to Object Storage
+ Within Object Storage
+ From Object Storage to the Local Client

**Note**: **copy** supports the [standard Windows wildcard](http://msdn.microsoft.com/en-us/library/windows/desktop/aa717088(v=vs.85).aspx) characters asterix (`*`), question mark (`?`), and range brackets (`[]`).

### Syntax###
 copy *[source] target  [-recurse]

###Examples###
EXAMPLE 1

    PS yourContainer:\> copy c:\test\
Copies the entire folder named "test" to the current location within Object Storage. This is a non-recursive operation.

EXAMPLE 2

    PS yourContainer:\> copy c:\test\ -recurse

Copies the entire folder named "test" (along with all descendant folders) to the current location within Object Storage. This is a recursive operation.

EXAMPLE 3

    PS yourContainer:\> copy test\ incoming\

This copies the folder within Object Storage called "test" to the folder named "incoming". Both folders are adjacent to the current directory.
 
EXAMPLE 4

    PS yourContainer:\> copy foo\bar\anothertest.txt c:\incoming\

This example copies the file "anothertest.txt" location two levels deep from the current location within Object Storage, to the local Incoming folder.

EXAMPLE 5

    PS yourContainer:\> copy sourceContainerName\folder1\ targetContainerName\FolderX\ -r

This examples copies the folder `folder1` from container `sourceContainerName` to container `targerContainerName`.

##Copy-Item##{#Copy-Item}
Copies an item from one location to another.

###Syntax
copy-item "_source-object_" "_target-object_"

###Examples
EXAMPLE

    copy-item my-file backup-file

Copy's the object `my-file` to the object `backup-file`.

##Del## {#del}
Removes an object from storage.

**Note**: **del** supports the [standard Windows wildcard](http://msdn.microsoft.com/en-us/library/windows/desktop/aa717088(v=vs.85).aspx) characters asterix (`*`), question mark (`?`), and range brackets (`[]`).

###Syntax###
del -t "*object*"

<dl>
**-t**
: Path to the storage object to be removed
</dl>

###Examples###
EXAMPLE 1

    PS yourContainer:\># del test.xml

Removes the storage object `test.xml` from the current directory.

#Get-Uri ## {#Get-Uri}
Lists the fully qualified URI of the resource that you supply.  The optional parameters allow you to define a timespan for the URI.  When you issue this command, the URI is also pasted to the Windows clipboard for your convenience. If you want to disable this behavior, set the `CLI.config` option `PasteGetURIResultsToClipboard` to `false`.

### Syntax###
 get-uri *filename* {-dv *days-valid*} {-sv *seconds-valid*}

<dl>
*filename*
: Source path to the storage object
**dv**
: Number of days the URI is valid
**sv**
: Number of seconds the URI is valid
</dl>

###Examples###
EXAMPLE 1

    PS yourContainer:\> get-uri anothertest.txt.
    
    Object located at : https://region-a.geo-1.objects.hpcloudsvc.com/v1/AUTH_e9e11fd3-ec18-4415-8b4f-e7b7ec9eed8e/Kaushik/test11.html

Displays the fully qualified URI for the file `anothertest.txt`.

EXAMPLE 2

    PS yourContainer:\> get-uri anothertest.txt -dv 27
    
    Object located at   : https://region-a.geo-1.objects.hpcloudsvc.com/v1/AUTH_e9e11fd3-ec18-4415-8b4f-e7b7ec9eed8e/Kaushik/test11.html?temp_url_sig=95110298407447%3a95110298407447%3a75713970004400%3a84d2be6d472d06b7e83ca4af42b5ea14cc01596c
    &temp_url_expires=1361904513
    Url Expiration Date : 2/26/2013. [120 day(s) \ 1361904513 seconds.]

Displays the URI for the file `anothertest.txt`, where the URI is valid for 27 days.

##Ls## {#Ls}
Allows you to list available resources within the current Container.

**Note**: **ls** supports the [standard Windows wildcard](http://msdn.microsoft.com/en-us/library/windows/desktop/aa717088(v=vs.85).aspx) characters asterix (`*`), question mark (`?`), and range brackets (`[]`).

### Syntax###
 ls {*target*}

###Examples###
EXAMPLE 1

    PS yourContainer:\> ls

Lists the contents of the current folder (in this case root)

EXAMPLE 2

    PS yourContainer:\> ls foo\bar

Lists the contents of the "bar" folder located two levels from the current directory (root).

##Md## {#Md}
Allows you organize your resources within Object Storage in a hierarchical fashion through the use of folders.

### Syntax###
 md *target*

###Examples###
EXAMPLE 1

    PS yourContainer:\> md foo

This creates a sub-folder under the current folder (in this example root).

EXAMPLE 2

     PS yourContainer:\> md foo\bar

This examples creates another sub-folder but this time the target location is two levels deep from the current location (root).

##Migrate-Drive## {#Migrate-Drive}
Migrates existing stores of data from external sources like S3, Dropbox and Skydrive to a target Container within HP Object Storage.

### Syntax###
 migrate-drive -p "*bucket*" -sk "*secret-key*" -ak "*access-key*"

**p**
: Bucket type, e.g. `S3` 

**sk**
: Secret key ID.

**ak**
: Access key ID.

**b**
: Comma-deliniated bucket names to be copied to the HP Cloud system.


###Examples###
EXAMPLE 1

    migrate-drive -p "S3" -sk "aa78676dhhh100" -ak "jhjhgu64332" -b "testb1", "testb2"

Copies the `testb1` and `testb2` S3 buckets to the HP object storage containers of the same name, using a secret-key value of "`aa78676dhhh100`" and an access-key value of "`jhjhgu64332`".

##New-Container## {#New-Container}
Creates a new storage container.

### Syntax###
 new-container  *Name*

###Examples###
EXAMPLE

    PS yourcontainer:\> New-container marketing

Creates a new container named marketing.

##Remove-Container## {#Remove-Container}
After confirmation, deletes a container entirely. If any files exist within the container, they are deleted as well.

### Syntax###
 remove-container  *Name* { -cdn }

<dl>
**cdn**
:  Removes any associated CDN entry when the container is removed.
</dl>

###Examples###
EXAMPLE

    PS yourcontainer:\> remove-container marketing

Deletes the container named marketing and all of its contents.

##Remove-Item##{#Remove-Item}
Removes an object from your object storage container.

###Syntax
remove-item "_object_"

###Examples
EXAMPLE

    remove-item my-object

Removes the object `'my-object` from the container.

##Remove-Metadata##{#Remove-Metadata}
Removes the metadata from an object in storage.

###Syntax
remove-metadata "_object_"

###Examples
EXAMPLE

    remove-metadata my-object

Removes the metadata from the object `my-object`.

##Set-Scope## {#Set-Scope}
Sets the scope of a Private Container to Public.

### Syntax###
 set-scope  *Name* PUBLIC

###Examples###
EXAMPLE

    marketing:\> set-scope yourcontainer -s PUBLIC

Allows you to access resources hosted within the Marketing Container over the public Internet.

#CDN CLI  Commands# {#CDN}

##Get-CDN## {#Get-CDN}
Lists all CDN-enabled containers and their associated CDN entries.

### Syntax###
get-cdn

###Examples###
EXAMPLE

    get-cdn

Lists all CDN-enabled containers and their associated CDN entries.

##New-CDN## {#New-CDN}
Creates a new CDN entry for the specified container.

###Syntax###
new-cdn -n "*container-name*"

###Examples###
EXAMPLE

    new-cdn -n "TestContainer"

Creates a new CDN entry for the container "TestContainer".

##Remove-CDN## {#Remove-CDN}
Removes a CDN entry from the specified container.

### Syntax###
remove-cdn -n "*container-name*"

###Examples###
EXAMPLE

    remove-cdn -n "TestContainer"

Removes a CDN entry from container "TestContainer".

#Block Storage CLI Commands# {#BlockStorage}

##Attach-Volume## {#Attach-Volume}
Associates a volume with an existing server.

###Syntax###
  attach-volume *server_id* *volume_id* "*device_name*"

###Examples###
EXAMPLE

    # attach-volume 21 2345 "/dev/vdp"

Associates the volume with the volume ID `2345` to the server with the ID of `21`, with the assigned device name of `/dev/vdX`.

##Detach-Volume## {#Detach-Volume}
Disassociates a volume from an existing server.

###Syntax###
  detach-volume *server_id* *volume_id*

###Examples###
EXAMPLE

    # detach-volume 21 2345

Disassociates the volume with the ID of 2345 from the server with the ID of 21.

##New-Snapshot## {#New-Snapshot}
Creates a new snapshot of your block storage volumes.

###Syntax###
  new-snapshot "*snapshot_name*" ["*snapshot_description*"] *volume_id*

###Examples###
EXAMPLE

    # new-snapshot "TestSnapshot" "This is a simple Snapshot test" 2344

Creates a snapshot with the name `TestSnapshot` and the description `This is a simple Snapshot test` of the block storage volume with the ID of 2344.

##New-Volume## {#New-Volume}
Creates a new block storage volume.

###Syntax###
  new-volume "*volume_name*" ["*volume_description*"] *volume_size* ["*metadata*"]

###Examples###
EXAMPLE 1

    # new-volume "TestVolume" "This is a simple Volume test" 20

Creates the new volume `TestVolume` with a size of 20 gigabytes and the description "This is a simple Volume test".

EXAMPLE 2

    # new-volume "TestVolume" "This is a simple Volume test" 20 "test|data", "another|test"

Creates the new volume `TestVolume` with a size of 20 gigabytes, the metadata `test|data` and `another|test`, and the description "This is a simple Volume test".

##Remove-Snapshot## {#Remove-Snapshot}
Deletes an existing block storage snapshot.

###Syntax###
  remove-snapshot *snapshot_id*

###Examples###
EXAMPLE

     # remove-snapshot 2457

Deletes the snapshot with the snapshot ID of 2457.

##Remove-Volume## {#Remove-Volume}
Deletes an existing block storage volume.

###Syntax###
  remove-volume *volume_ID*

###Examples###
EXAMPLE

    # remove-volume 2457

Removes the block storage volume with the ID of `2457`.