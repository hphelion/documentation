---
layout: default
title: "Unix CLI Object Storage Examples"
permalink: /cli/unix/2/object-storage/
product: unix-cli

---
# Unix CLI v13.5 Object Storage Examples

If you are using v12.12, click [here](https://docs.hpcloud.com/cli/unix/object-storage) for documentation.
___________________

###Important Notice###

On November 4, 2013, the UNIX CLI was moved into its End-of-Life (EOL) Cycle process toward final deprecation. Please be aware that this does not mean that the UNIX CLI is "going away", but simply that HP Cloud is relinquishing its ownership of this CLI and, instead, making it available on the [HPCloud Github](https://github.com/hpcloud/unix_cli) repository. We encourage existing customers to consider migrating to the OpenStackClient (Unified) CLIs. As such, during this 6-month transition timeframe, HP Cloud will be dedicating engineering efforts around the OpenStackClient CLI as the primary Unified CLI of choice for development around your OpenStack cloud services.

We wanted to ensure you were aware of the changes that may affect you during this 6-month transition time:

+ The UNIX CLI has moved to the HP Cloud Github repository

  + In order to encourage development by the community, HP Cloud is sharing it with the community as open source, hosted on [https://github.com/hpcloud/unix_cli](https://github.com/hpcloud/unix_cli).
 
  + However, [links to 12.12 and 13.5 UNIX CLI downloads](#downloads), and all documentation, are still currently available on docs.hpcloud.com, as usual.

+ Bugs will be addressed

  + Although the CLI has moved into the open source community, showstoppers and significant defects will be examined and addressed by the HP Cloud SDK/CLI team on a case-by-case basis.

After 6 months, access to online resources will be available through GitHub, and no support will be offered from HP Public Cloud. Of course, you are most welcome to access the install from GitHub and continue your development ([HPCloud Github](https://github.com/hpcloud/unix_cli)).
_________________________________________
<iframe src="http://player.vimeo.com/video/32534203?title=0&amp;byline=0&amp;portrait=0" width="580" height="420" frameborder="0"> </iframe>

This page gives discusses the following object storage tasks using HP Cloud and provides some examples: 

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

Get detailed help for any command or task with the following command:

    $ hpcloud help <TASK>

##Container Commands## {#ContainerCommands}

To add a new container, run:

    $ hpcloud containers:add demorama
    Created container 'demorama'.

To list available containers, run:

    $ hpcloud list
    demorama
    demorama2

To list available containers with their byte and object count values, run:

    $ hpcloud list -l
      +-------------------+-------+------+
      | sname             | count | size |
      +-------------------+-------+------+
      | big               | 10    | 2456 |
      | copy              | 5031  | 0    |
      | cross             | 5     | 66   |
      +-------------------+-------+------+

##Copy Commands## {#CopyCommands}

To add or copy objects to a container, run:

    $ hpcloud copy simple.txt :demorama
    simple.txt:    100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    Copied simple.txt => :demorama

To copy the contents of a directory to a container, run:

    $ ls database
    one  two
    $ hpcloud copy database/ :demorama/backup/
    one:           100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    two:           100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    Copied database/ => :demorama/backup/

To copy objects from a container to the local file system, run:

    $ hpcloud copy :demorama/simple.txt ./simple.txt
    simple.txt:    100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    Copied :demorama/simple.txt => ./simple.txt

To copy objects to a directory, run:

    $ hpcloud copy :demorama/backup/ restore/
    one:           100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    two:           100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    Copied :demorama/backup/ => restore/

To copy objects between containers, run:

    $ hpcloud copy :demorama/simple.txt :demorama2
    Copied :demorama/simple.txt => :demorama2

    $ hpcloud copy :demorama/simple.txt :demorama2/simpler.txt
    Copied :demorama/simple.txt => :demorama2/simpler.txt

    $ hpcloud copy :demorama/anakin/ :demorama2/vader/
    Copied :demorama/anakin/ => :demorama2/vader/

To specify multiple files on the command line, run:

    $ hpcloud copy ewok.htm yoda.htm :demorama
    ewok.htm:  100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    Copied ewok.htm => :demorama
    yoda.htm:   100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    Copied yoda.htm => :demorama

You can use regular expressions to copy from a container, but the regular expressions must follow Ruby regular expression rules.  To match one or more of any character in a container, use the character string `.*` instead of just the `*` character:

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

To use the -m option to override the mime type, run:

    $ hpcloud copy analytics :demorama -m application/json
    analytics:  100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    Copied analytics => :demorama

To copy a shared (with cross tenant ACL) object to the local file system, run:

    $ hpcloud copy https://r.../demorama/raveonettes downtown
    Copied https://r.../demorama/raveonettes => downtown

To copy a file to a shared (with cross tenant ACL) object, run:

    $ hpcloud copy warsaw https://r.../demorama/raveonettes
    Copied warsaw => https://r.../demorama/raveonettes

##List Command## {#ListCommand}

To list the contents of a container, run:

    $ hpcloud list :demorama
    simple.txt

To list the files in a shared (with cross tenant ACL) container, run:

    $ hpcloud list https://r.../demorama/
    https://r.../demorama/raveonettes
    https://r.../demorama/analytics

To list the object names, size, type, MD5 sum, and modification date for a container, run:

    $ hpcloud list -l :clone_container 
      +---------------------------------------------------------+------+------------+----------------------------------+----------------------------+
      | sname                                                   | size | type       | etag                             | modified                   |
      +---------------------------------------------------------+------+------------+----------------------------------+----------------------------+
      | nested/Matryoshka/Putin/Medvedev.txt                    | 16   | text/plain | 7cb77c03d207f10b0fdb8b7e09592a21 | 2013-01-23T14:04:57.570290 |
      | nested/Matryoshka/Putin/Vladimir.txt                    | 15   | text/plain | 64049c2a21421cba3f99a9008ac4abad | 2013-01-23T14:04:59.314870 |
      | nested/Matryoshka/Putin/Yeltsin/Boris.txt               | 16   | text/plain | 7dfeb9b922726430294039983afcded5 | 2013-01-23T14:05:01.056420 |
      | nested/Matryoshka/Putin/Yeltsin/Gorbachev/Andropov.txt  | 15   | text/plain | 062d1572570f7ad2776fb942e8c97aff | 2013-01-23T14:05:02.810180 |
      | nested/Matryoshka/Putin/Yeltsin/Gorbachev/Chernenko.txt | 16   | text/plain | e16e3409a074c46c2846569a2c23042a | 2013-01-23T14:05:04.597210 |
      | nested/Matryoshka/Putin/Yeltsin/Gorbachev/Mikhail.txt   | 15   | text/plain | 189c47c8979573f7f511538dbd255d57 | 2013-01-23T14:05:06.643640 |
      +---------------------------------------------------------+------+------------+----------------------------------+----------------------------+

##Get Command## {#GetCommand}

To get an object to the local file system, run:

    $ hpcloud get :demorama2/simpler.txt
    Copied :demorama2/simpler.txt => simpler.txt

To get a shared (with cross tenant ACL) object to the local file system, run:

    $ hpcloud get https://r.../demorama/raveonettes
    Copied https://r.../demorama/raveonettes => .

##Move Command## {#MoveCommand}

To move objects from a container to the local file system, run:

    $ hpcloud move :demorama/simple.txt ./simple.txt
    Moved :demorama/simple.txt => ./simple.txt

To move objects between container, run:

    $ hpcloud move :demorama2/simpler.txt :demorama
    Moved :demorama2/simple.txt => :demorama

    $ hpcloud move :demorama/simple.txt :demorama2/even_simpler.txt
    Moved :demorama/simple.txt => :demorama2/even_simpler.txt

##ACL Commands## {#AclCommands}

To get ACLs for an existing object, run:

    $ hpcloud acl :demorama
    +--------+-------------------+------------------+-------------------------+
    | public | readers           | writers          | public_url              |
    +--------+-------------------+------------------+-------------------------+
    | no     | luke@starwars.com | han@starwars.com | https://hp...8/demorama |
    +--------+-------------------+------------------+-------------------------+

To set a public ACL for an existing container, run:

    $ hpcloud acl:grant :demorama r
    ACL for :demorama updated to public-read.

To set a cross-tenant ACL for an existing container, run:

    $ hpcloud acl:grant :demorama r luke@starwars.com
    ACL for :demorama updated to r for luke@starwars.com.

To set a read and write cross-tenant ACL for an existing container, run:

    $ hpcloud acl:grant :demorama rw han@starwars.com
    ACL for :demorama updated to rw for han@starwars.com.

To revoke a public ACL from a container, run:

    $ hpcloud acl:revoke :demorama r
    Revoked public-read from :demorama

To revoke a cross-tenant ACL from a container, run:

    $ hpcloud acl:revoke :demorama r luke@starwars.com
    Revoked r for luke@starwars.com from :demorama

##Location Command## {#LocationCommand}

To get a location for an existing container, run:

    $ hpcloud location demorama
    http://127.0.0.1/v1/AUTH_ea2007cf-5c74-4936-b381-743b438b45e8/demorama

To get a location for an existing object, run:

    $ hpcloud location demorama/simple.txt
    http://127.0.0.1/v1/AUTH_ea2007cf-5c74-4936-b381-743b438b45e8/demorama/simple.txt

##Temporary URL Command## {#TmpurlCommand}

Create temporary URLS for the given objects to share an object for a specified period of time without opening up permissions to everyone. Only users with access to the URL are able to access the file. You can specify the time period in seconds (s), hours (h), or days (d). If you do not specify a time period, the default is two days.

To create a temporary URL for an existing object, run:

    hpcloud tempurl :tainer/2.txt
    https://objects...fe&temp_url_expires=1355440419

##Remove Commands## {#RemoveCommands}

To remove an object from a container, run:

    $ hpcloud remove :demorama2/even_simpler.txt
    Removed object ':demorama2/even_simpler.txt'.

To remove an empty container, run:

    $ hpcloud containers:remove :demorama2
    Removed container 'demorama2'.

To force the removal of a container even there are files in it, run:

    $ hpcloud containers:remove :demorama --force
    Removed container 'demorama'.


##Migration Commands## {#Migration}

Use the `migrate` command to migrate files from one account to another.  The source account may be another HP Public Cloud account or an account from another provider such as AWS, Google, or Rackspace.  If the provider for the other account is not HP, use the `-p` option of the [`account:setup`](/cli/unix/2/reference#account:setup) command to create the account.

Now use the `migrate` command and specify the source account, source container (or object), and destination in the default account.  `migrate` is similar to the [`copy`](/cli/unix/2/reference#copy) command in that it supports recursive copy and regular expressions:

    $ hpcloud migrate aws :lucas :disney
    chewy.htm:  100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    Copied chewy.htm => :disney

For more information, see [Object Store Migration](/cli/unix/articles/migration).
