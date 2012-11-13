---
layout: default
title: "Unix CLI Object Storage Examples"
permalink: /cli/unix/object-storage/

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

Remember that you can get detailed help for any command or task with the following command:

        $ hpcloud help <TASK>

##Container Commands## {#ContainerCommands}

To add a new container:

    $ hpcloud containers:add demorama
    # => Created container 'demorama'.

To list available containers:

    $ hpcloud list
    # => demorama
    # => demorama2

or

    $ hpcloud containers
    # => demorama
    # => demorama2

##Copy Commands## {#CopyCommands}

To add or copy objects to a container:

    $ hpcloud copy simple.txt :demorama
    # => simple.txt:    100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    # => Copied simple.txt => :demorama

To copy the contents of a directory to a container:

    $ ls database
    one  two
    $ hpcloud copy database/ :demorama/backup/
    # => one:           100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    # => two:           100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    # => Copied database/ => :demorama/backup/

To copy objects from a container to the local file system:

    $ hpcloud copy :demorama/simple.txt ./simple.txt
    # => simple.txt:    100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    # => Copied :demorama/simple.txt => ./simple.txt

To copy objects to a directory:

    $ hpcloud copy :demorama/backup/ restore/
    # => one:           100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    # => two:           100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    # => Copied :demorama/backup/ => restore/

To copy objects between containers:

    $ hpcloud copy :demorama/simple.txt :demorama2
    # => Copied :demorama/simple.txt => :demorama2

    $ hpcloud copy :demorama/simple.txt :demorama2/simpler.txt
    # => Copied :demorama/simple.txt => :demorama2/simpler.txt

    $ hpcloud copy :demorama/anakin/ :demorama2/vader/
    # => Copied :demorama/anakin/ => :demorama2/vader/

To specify multiple files on the command line:

    $ hpcloud copy ewok.htm yoda.htm :demorama
    # => ewok.htm:  100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    # => Copied ewok.htm => :demorama
    # => yoda.htm:   100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    # => Copied yoda.htm => :demorama

You may use regular expressions to copy from a container, but the regular expressions must follow Ruby regular expression rules.  To match one or more of any character in a container, use the character string `.*` instead of just the `*` character:

    $ hpcloud copy :demorama/.*.htm /tmp
    # => ewok.htm:  100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    # => Copied ewok.htm => /tmp
    # => yoda.htm:   100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    # => Copied yoda.htm => /tmp

To use wildcards when copying files to a container using regular expressions:

    $ hpcloud copy *.htm :demorama
    # => ewok.htm:  100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    # => Copied ewok.htm => :demorama
    # => yoda.htm:   100% |ooooooooooooooooooooooooooooooooooooo| Time: 00:00:00
    # => Copied yoda.htm => :demorama

##List Command## {#ListCommand}

To list the contents of a container:

    $ hpcloud list :demorama
    # => simple.txt

##Get Command## {#GetCommand}

To get an object to the local file system:

    $ hpcloud get :demorama2/simpler.txt
    # => Copied :demorama2/simpler.txt => simpler.txt

##Move Command## {#MoveCommand}

To move objects from a container to the local file system:

    $ hpcloud move :demorama/simple.txt ./simple.txt
    # => Moved :demorama/simple.txt => ./simple.txt

To move objects between container:

    $ hpcloud move :demorama2/simpler.txt :demorama
    # => Moved :demorama2/simple.txt => :demorama

    $ hpcloud move :demorama/simple.txt :demorama2/even_simpler.txt
    # => Moved :demorama/simple.txt => :demorama2/even_simpler.txt

##ACL Commands## {#AclCommands}

To get ACLs for an existing container:

    $ hpcloud acl :demorama
    # => private

To get ACLs for an existing object:

    $ hpcloud acl :demorama/simple.txt
    # => private

To set an ACL for an existing container:

    $ hpcloud acl:set :demorama public-read
    # => ACL for :demorama updated to public-read.

To set an ACL for an existing object:

    $ hpcloud acl:set :demorama/simple.txt public-read
    # => ACL for :demorama/simple.txt updated to public-read.

##Location Command## {#LocationCommand}

To get a location for an existing container:

    $ hpcloud location demorama
    # => http://127.0.0.1/v1/AUTH_ea2007cf-5c74-4936-b381-743b438b45e8/demorama

To get a location for an existing object:

    $ hpcloud location demorama/simple.txt
    # => http://127.0.0.1/v1/AUTH_ea2007cf-5c74-4936-b381-743b438b45e8/demorama/simple.txt

##Temporary URL Command## {#TmpurlCommand}

Create temporary URLS for the given objects. Creating a temporary URL is a great way to share an object for a specified period of time without opening up permissions to everyone. Only people with access to the URL will be able to access the file. The time period may be specified in seconds (s), hours (h), or days (d). If you do not specify a time period, the default is two days. Optionally, an availability zone can be passed in to the command.
Create a temporary URL for an existing object:

###Syntax
`hpcloud tempurl &lt;<i>object</i>&gt; ...`

###Options
-p, [--time-period=TIME_PERIOD]              # time period to keep the url alive  
-z, [--availability-zone=AVAILABILITY_ZONE]  # Set the availability zone.  
-a, [--account-name=ACCOUNT_NAME]            # Select account.  

    hpcloud tempurl -p 7d :my_container/file.txt   # make a temporary URL for 7 days
    hpcloud tempurl -p 24h :my_container/file.txt :my_container/other.txt # multiple files or containers for 24 hours
    hpcloud tempurl :my_container/file.txt -z region-a.geo-1  # Optionally specify an availability zone   

##Remove Commands## {#RemoveCommands}

To remove an object from a container:

    $ hpcloud remove :demorama2/even_simpler.txt
    # => Removed object ':demorama2/even_simpler.txt'.

To remove an empty container:

    $ hpcloud containers:remove :demorama2
    # => Removed container 'demorama2'.

To force the removal of a container even there are files in it:

    $ hpcloud containers:remove :demorama --force
    # => Removed container 'demorama'.