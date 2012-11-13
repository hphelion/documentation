---
layout: default
title: "Windows CLI: Command Reference"
permalink: /cli/win/command-reference/

---
# Windows CLI: Command Reference

Below you can find a full reference of supported Windows PowerShell commands.

##Get-Policy

The Get-Policy Cmdlet shows security information for the supplied Bucket or StorageObject.
### Syntax
 Get-Policy  <i>SourcePath</i>
### Parameters
<table class="Get-Policy-code-table table_data"><tr>
<th>Name</th>
<th>Description</th>
</tr>
<TR>
<TD>
SourcePath
</TD>
<TD>
The path to the remote Storage Object or Bucket. Paths may be expressed as fully qualified or relative to the current location in the store.
</TD>
</TR>
</table>
###Examples
EXAMPLE 1

    PS yourBucket:\> Get-Policy prototypes
This command will write out Owner and ACL information for the prototypes Bucket.

EXAMPLE 2

    PS yourBucket:\> Get-Policy test.txt
This command will write out Owner and ACL information for the test.txt Storage Object.

##Get-Config

This Cmdlet will print out what config file entries the current session is running under.
### Syntax
 Get-Config 
### Parameters
<table class="Get-Config-code-table table_data"><tr>
<th>Name</th>
<th>Description</th>
</tr>
</table>
###Examples
EXAMPLE 1

    PS yourBucket:\> Get-Config
Prints out settings for the current session.

##Set-Policy

The Set-Policy Cmdlet allows you to apply Grants to an existing Storage Object.
### Syntax
 Set-Policy  <i>SourcePath</i>
### Parameters
<table class="Set-Policy-code-table table_data"><tr>
<th>Name</th>
<th>Description</th>
</tr>
<TR>
<TD>
SourcePath
</TD>
<TD>
The path to the remote Storage Object. Paths may be expressed as fully qualified or relative to the current location in the store.
</TD>
</TR>
<TR>
<TD>
CannedACL
</TD>
<TD>
Specifies the pre-canned combination set of Users and Permission to be applied to the Object. Valid values include [Private, PublicRead,  PublicReadWrite, AuthenticatedRead, AuthenticatedReadWrite, BucketOwnerRead, BucketOwnerFullcontrol].
</TD>
</TR>
<TR>
<TD>
Grantee
</TD>
<TD>
Specified the AccountID, User Email Address or URI Group to apply an ACL Grant to. Valid URI Groups include AllUsers, AuthenticatedUsers and LogDelivery types.
</TD>
</TR>
<TR>
<TD>
Permission
</TD>
<TD>
Specifies the Permission being applied to the Object. Valid values include FULLCONTROL, WRITE, WRITEACP, READ, READACP
</TD>
</TR>
<TR>
<TD>
ForceOverwrite
</TD>
<TD>
Overwrites and replaces existing security infomation for the resource identified by the SourcePath.
</TD>
</TR>
</table>
###Examples
EXAMPLE 1

    PS yourBucket:\> Set-Policy test.txt -g 1234833 -p WRITE
This command will give WRITE permissions to the test.txt file for the user behind AccountID 1234833.

EXAMPLE 2

    PS yourBucket:\> Set-Policy test.txt -g AllUsers -p FULLCONTROL
This command will give FULLCONTROL over to all users in the system.

EXAMPLE 3

    PS yourBucket:\> Set-Policy test.txt -g thatGuy@SomeCorp.com -p WRITE
Very similiar to the Grant by ID example this command will give Write permission to the test.txt file to the user with an email address of thatGuy@Somecorp.com

EXAMPLE 4

    PS yourBucket:\> Set-Policy test.txt -acl AuthenticatedReadWrite
Thisa example shows a canned ACL being applied to the test.txt file. This will give ReadWrite access to the resource for any authenticated user in the system.

##Get-Metadata

This Cmdlet will list out the Metadata entries assigned to the supplied resource.
### Syntax
 Get-Metadata  <i>SourcePath</i>
### Parameters
<table class="Get-Metadata-code-table table_data"><tr>
<th>Name</th>
<th>Description</th>
</tr>
<TR>
<TD>
SourcePath
</TD>
<TD>
The path to the remote Storage Object. Paths may be expressed as fully qualified or relative to the current location in the store.
</TD>
</TR>
</table>
###Examples
EXAMPLE 1

    PS yourBucket:\> Get-metadata test.txt
This command will print out a list of name value pairs assigned to the object via Copy operations use of the -md argument.

##Remove-Bucket

This Cmdlet will delete a bucket. If any files exist within the bucket, they are deleted as well.
### Syntax
 Remove-Bucket  <i>Name</i>
### Parameters
<table class="Remove-Bucket-code-table table_data"><tr>
<th>Name</th>
<th>Description</th>
</tr>
<TR>
<TD>
Name
</TD>
<TD>
The name of the Bucket to delete.
</TD>
</TR>
</table>
###Examples
EXAMPLE 1

    PS yourBucket:\> Remove-Bucket marketing
This command will delete the bucket named marketing and all of its contents.

##Set-BucketPolicy

The Set-BucketPolicy Cmdlet allows you to supply ACL Grants and apply Canned ACLs to an existing Bucket.
### Syntax
 Set-BucketPolicy  <i>BucketName</i>
### Parameters
<table class="Set-BucketPolicy-code-table table_data"><tr>
<th>Name</th>
<th>Description</th>
</tr>
<TR>
<TD>
BucketName
</TD>
<TD>
The name of the Bucket to apply the ACL Grant or Canned ACL to.
</TD>
</TR>
<TR>
<TD>
CannedACL
</TD>
<TD>
Specifies the pre-canned combination set of Users and Permission to be applied to the Object. Valid values include [Private, PublicRead,  PublicReadWrite, AuthenticatedRead, AuthenticatedReadWrite, BucketOwnerRead, BucketOwnerFullcontrol].
</TD>
</TR>
<TR>
<TD>
Grantee
</TD>
<TD>
Specified the AccountID, User Email Address or URI Group to apply an ACL Grant to. Valid URI Groups include AllUsers, AuthenticatedUsers and LogDelivery types.
</TD>
</TR>
<TR>
<TD>
Permission
</TD>
<TD>
Specifies the Permission being applied to the Object. Valid values include FULLCONTROL, WRITE, WRITEACP, READ, READACP
</TD>
</TR>
</table>
###Examples
EXAMPLE 1

    PS yourBucket:\> Set-BucketPolicy marketing -g 1234833 -p WRITE
This command will give WRITE permissions to the marketing Bucket for the user behind AccountID 1234833.

EXAMPLE 2

    PS yourBucket:\> Set-BucketPolicy marketing -g AllUsers -p FULLCONTROL
This command will give FULLCONTROL over to all users in the system to the marketing storage Bucket.

EXAMPLE 3

    PS yourBucket:\> Set-BucketPolicy marketing -g thatGuy@SomeCorp.com -p WRITE
Very similiar to the Grant by ID example this command will give Write permission to the marketing Bucket to the user with an email address of thatGuy@Somecorp.com

EXAMPLE 4

    PS yourBucket:\> Set-BucketPolicymarketing -acl AuthenticatedReadWrite
Thisa example shows a canned ACL being applied to the marketing Bucket. This will give ReadWrite access to the resource for any authenticated user in the system.

##New-Bucket

This Cmdlet create a new storage Bucket.
### Syntax
 New-Bucket  <i>Name</i>
### Parameters
<table class="New-Bucket-code-table table_data" markdown="1"><tr>
<th>Name</th>
<th>Description</th>
</tr>
<TR>
<TD>
Name
</TD>
<TD>
The name of the Bucket to create.
To comply with HPKVS requirements, bucket names must be a valid UTF-8 string between 1 and 255 bytes long and Not contain the / character or the null character 0x004. To be usable in a virtual hosted name (once supported), bucket namesmust further conformto RFC1035 [1], RFC1123 [2], and RFC2181 [3], as summarized in RFC3696 [5]. These RFC restrictions mean that the bucket name is limited to 245 ASCII characters since adding ".hpkvs.com" must keep the total length under 255 bytes. These RFC restrictions further mean that after dividing the bucket name into labels at each . character, each label (everything between two dots) must:  
<ul>
<li>Be between 1 and 63 ASCII characters long. Note: You may choose bucket names that are the DNS version  of punycode [30] [4](Punycode is an instance of a general encoding syntax (Bootstring) by which a string of Unicode characters can be transformed uniquely and reversibly into a smaller, restricted character set), in which case applications that use punycode for internationalized domain names will be able to use UTF-8 names.</li> 
<li>Match the regular expression [a-z0-9-]$, i.e. consist entirely of lower case letters a-z, the digits 0-9, and the character -.</li> 
<li>Not begin or end with the dash (-) character.</li>
</ul>
</TD>
</TR>
<TR>
<TD>
CannedACL
</TD>
<TD>
Specifies the pre-canned combination set of Users and Permission to be applied to the Object. Valid values include [Private, PublicRead,  PublicReadWrite, AuthenticatedRead, AuthenticatedReadWrite, BucketOwnerRead, BucketOwnerFullcontrol].
</TD>
</TR>
</table>
###Examples
EXAMPLE 1

    PS yourBucket:\> New-Bucket marketing
This command will create a new Bucket named marketing.

EXAMPLE 2

    PS yourBucket:\> New-Bucket marketing -acl PublicRead
This command will create a new Bucket named marketing and assign the PublicRead canned ACL during the creation process.

