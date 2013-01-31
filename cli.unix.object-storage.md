---
layout: default
title: "Unix CLI Object Storage Examples"
permalink: /cli/unix/object-storage/
product: unix-cli

---
# Unix CLI Object Storage Examples

<iframe src="http://player.vimeo.com/video/32534203?title=0&amp;byline=0&amp;portrait=0" width="580" height="420" frameborder="0"> </iframe>

This page gives you a few examples of how to perform various object storage tasks using the HP Cloud service.  This page discusses the following tasks:

* [Container Commands](#ContainerCommands)
* [Copy Commands](#CopyCommands)
* [List Command](#ListCommand)
* [Get Command](#GetCommand)
* [Move Command](#MoveCommand)
* [ACL Commands](#AclCommands)
* [Location Command](#LocationCommand)
* [Temporary URL Command](#TmpurlCommand)
* [Remove Commands](#RemoveCommands)
* [Migration Commands](#Migration)

Remember that you can get detailed help for any command or task with the following command:

    $ hpcloud help <TASK>

##Container Commands## {#ContainerCommands}

To add a new container:

    $ hpcloud containers:add demorama
    Created container 'demorama'.

To list available containers:

    $ hpcloud list
    demorama
    demorama2

or

    $ hpcloud containers
    demorama
    demorama2

##Copy Commands## {#CopyCommands}

To add or copy objects to a container:

    $ hpcloud copy simple.txt :demorama
    simple.txt:    100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    Copied simple.txt => :demorama

To copy the contents of a directory to a container:

    $ ls database
    one  two
    $ hpcloud copy database/ :demorama/backup/
    one:           100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    two:           100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    Copied database/ => :demorama/backup/

To copy objects from a container to the local file system:

    $ hpcloud copy :demorama/simple.txt ./simple.txt
    simple.txt:    100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    Copied :demorama/simple.txt => ./simple.txt

To copy objects to a directory:

    $ hpcloud copy :demorama/backup/ restore/
    one:           100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    two:           100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    Copied :demorama/backup/ => restore/

To copy objects between containers:

    $ hpcloud copy :demorama/simple.txt :demorama2
    Copied :demorama/simple.txt => :demorama2

    $ hpcloud copy :demorama/simple.txt :demorama2/simpler.txt
    Copied :demorama/simple.txt => :demorama2/simpler.txt

    $ hpcloud copy :demorama/anakin/ :demorama2/vader/
    Copied :demorama/anakin/ => :demorama2/vader/

To specify multiple files on the command line:

    $ hpcloud copy ewok.htm yoda.htm :demorama
    ewok.htm:  100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    Copied ewok.htm => :demorama
    yoda.htm:   100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    Copied yoda.htm => :demorama

You may use regular expressions to copy from a container, but the regular expressions must follow Ruby regular expression rules.  To match one or more of any character in a container, use the character string `.*` instead of just the `*` character:

    $ hpcloud copy :demorama/.*.htm /tmp
    ewok.htm:  100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    Copied ewok.htm => /tmp
    yoda.htm:   100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    Copied yoda.htm => /tmp

When copying local files to a container, use bash regular expressions rules:

    $ hpcloud copy *.htm :demorama
    ewok.htm:  100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    Copied ewok.htm => :demorama
    yoda.htm:   100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    Copied yoda.htm => :demorama

To use the -m option to override the mime type:

    $ hpcloud copy analytics :demorama -m application/json
    analytics:  100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    Copied analytics => :demorama

To copy a shared (with cross tenant ACL) object to the local file system:

    $ hpcloud copy https://r.../demorama/raveonettes downtown
    Copied https://r.../demorama/raveonettes => downtown

To copy a file to a shared (with cross tenant ACL) object:

    $ hpcloud copy warsaw https://r.../demorama/raveonettes
    Copied warsaw => https://r.../demorama/raveonettes

##List Command## {#ListCommand}

To list the contents of a container:

    $ hpcloud list :demorama
    simple.txt

To list the files in a shared (with cross tenant ACL) container:

    $ hpcloud list https://r.../demorama/
    https://r.../demorama/raveonettes
    https://r.../demorama/analytics

##Get Command## {#GetCommand}

To get an object to the local file system:

    $ hpcloud get :demorama2/simpler.txt
    Copied :demorama2/simpler.txt => simpler.txt

To get a shared (with cross tenant ACL) object to the local file system:

    $ hpcloud get https://r.../demorama/raveonettes
    Copied https://r.../demorama/raveonettes => .

##Move Command## {#MoveCommand}

To move objects from a container to the local file system:

    $ hpcloud move :demorama/simple.txt ./simple.txt
    Moved :demorama/simple.txt => ./simple.txt

To move objects between container:

    $ hpcloud move :demorama2/simpler.txt :demorama
    Moved :demorama2/simple.txt => :demorama

    $ hpcloud move :demorama/simple.txt :demorama2/even_simpler.txt
    Moved :demorama/simple.txt => :demorama2/even_simpler.txt

##ACL Commands## {#AclCommands}

To get ACLs for an existing object:

    $ hpcloud acl :demorama
    +--------+-------------------+------------------+-------------------------+
    | public | readers           | writers          | public_url              |
    +--------+-------------------+------------------+-------------------------+
    | no     | luke@starwars.com | han@starwars.com | https://hp...8/demorama |
    +--------+-------------------+------------------+-------------------------+

To set a public ACL for an existing container:

    $ hpcloud acl:grant :demorama r
    ACL for :demorama updated to public-read.

To set a cross-tenant ACL for an existing container:

    $ hpcloud acl:grant :demorama r luke@starwars.com
    ACL for :demorama updated to r for luke@starwars.com.

To set a read and write cross-tenant ACL for an existing container:

    $ hpcloud acl:grant :demorama rw han@starwars.com
    ACL for :demorama updated to rw for han@starwars.com.

To revoke a public ACL from a container:

    $ hpcloud acl:revoke :demorama r
    Revoked public-read from :demorama

To revoke a cross-tenant ACL from a container:

    $ hpcloud acl:revoke :demorama r luke@starwars.com
    Revoked r for luke@starwars.com from :demorama

##Location Command## {#LocationCommand}

To get a location for an existing container:

    $ hpcloud location demorama
    http://127.0.0.1/v1/AUTH_ea2007cf-5c74-4936-b381-743b438b45e8/demorama

To get a location for an existing object:

    $ hpcloud location demorama/simple.txt
    http://127.0.0.1/v1/AUTH_ea2007cf-5c74-4936-b381-743b438b45e8/demorama/simple.txt

##Temporary URL Command## {#TmpurlCommand}

Create temporary URLS for the given objects. Creating a temporary URL is a great way to share an object for a specified period of time without opening up permissions to everyone. Only users with access to the URL are able to access the file. You can specify the time period in seconds (s), hours (h), or days (d). If you do not specify a time period, the default is two days. Optionally, you can pass an availability zone to the command.  

Create a temporary URL for an existing object:

    hpcloud tempurl :tainer/2.txt
    https://objects...fe&temp_url_expires=1355440419

##Remove Commands## {#RemoveCommands}

To remove an object from a container:

    $ hpcloud remove :demorama2/even_simpler.txt
    Removed object ':demorama2/even_simpler.txt'.

To remove an empty container:

    $ hpcloud containers:remove :demorama2
    Removed container 'demorama2'.

To force the removal of a container even there are files in it:

    $ hpcloud containers:remove :demorama --force
    Removed container 'demorama'.


##Migration Commands## {#Migration}

You can use the `migrate` command to migrate files from one account to another.  The source account may be another HP Cloud Services account or an account from another provider such as AWS, Google, or Rackspace.  If the provider is not HP for the other account, use the `-p` option of the [`account:setup`](/cli/unix/reference#account:setup) command to create the account.

Once the account is set up, use the `migrate` command and specify the source account, source container (or object), and destination in the default account.  `migrate` works similarly to the [`copy`](/cli/unix/reference#copy) command in that it supports recursive copy and regular expressions:

    $ hpcloud migrate aws :lucas :disney
    chewy.htm:  100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    Copied chewy.htm => :disney

Another article on [Object Store Migration](/cli/unix/articles/migration).
