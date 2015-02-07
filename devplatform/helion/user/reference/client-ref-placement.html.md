---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/placement/
product: devplatform
title: "Application Lifecycle Service Command Line Client Reference: Placement Zones"

---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Placement Zones

- [helion placement-zone](#command-placement-zone)
- [helion placement-zones](#command-placement-zones)
- [helion set-placement-zone](#command-set-placement-zone)
- [helion unset-placement-zone](#command-unset-placement-zone)

##Syntax

	helion [options] command [arguments] [command-options]
For more information, use the **helion help**, **helion help [*option*]**, or **helion options** commands.

<hr>
      
.. _command-placement-zones:

      stackato placement-zones       
        Show the available placement zones. This is a Stackato 3.2+ specific command.

        --json
          
	    Print raw json as output, not human-formatted data.
	
        --target
          
	    The once-off target to use for the current operation.
	
        --token
          
	    The once-off authentication token to use for the
	    current operation.
	
        --token-file
          
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	


.. _command-placement-zone:

      stackato placement-zone  *<zone>*       
        Show the list of DEAs associated with the specified placement zone. This is a Stackato 3.2+ specific command.

        --json
          
	    Print raw json as output, not human-formatted data.
	
        --target
          
	    The once-off target to use for the current operation.
	
        --token
          
	    The once-off authentication token to use for the
	    current operation.
	
        --token-file
          
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	


.. _command-set-placement-zone:

      stackato set-placement-zone  *<application>*  *<zone>*       
        Associate the application with a specific placement zone. This is a Stackato 3.2+ specific command.

        --group
          
	    The once-off group to use for the current operation.
	    This is a Stackato 2 option.
	
        --manifest
          
	    Path of the manifest file to use.
	    If not specified a search is done.
	
        --no-tail
          Complementary alias of --tail.
        --organization
          
	    The once-off organization to use for the current operation.
	    This is a Stackato 3 option.
	
        --path
          
	    Path of the directory or file holding the application files to push.
	    Defaults to the current working directory.
	
        --space
          
	    The once-off space to use for the current operation, specified
	    by name. This is a Stackato 3 option.
	    Cannot be used together with --space-guid.
	
        --space-guid
          
	    The once-off space to use for the current operation, specified
	    by guid. This is a Stackato 3 option.
	    Cannot be used together with --space.
	
        --tail
          
	    Request target to stream the log.
	
        --target
          
	    The once-off target to use for the current operation.
	
        --timeout
          
	    The time the client waits for an application to
	    start before giving up and returning, in seconds.
	    Note that this is measured from the last entry
	    seen in the log stream. While there is activity
	    in the log the timeout is reset.

	    The default is 2 minutes.

	    Use the suffixes 'm', 'h', and 'd' for the convenient
	    specification of minutes, hours, and days. The optional
	    suffix 's' stands for seconds.
	
        --token
          
	    The once-off authentication token to use for the
	    current operation.
	
        --token-file
          
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	
        -o
          Alias of --organization.


.. _command-unset-placement-zone:

      stackato unset-placement-zone  *<application>*       
        Remove the association between application and its current placement zone. This is a Stackato 3.2+ specific command.

        --group
          
	    The once-off group to use for the current operation.
	    This is a Stackato 2 option.
	
        --manifest
          
	    Path of the manifest file to use.
	    If not specified a search is done.
	
        --no-tail
          Complementary alias of --tail.
        --organization
          
	    The once-off organization to use for the current operation.
	    This is a Stackato 3 option.
	
        --path
          
	    Path of the directory or file holding the application files to push.
	    Defaults to the current working directory.
	
        --space
          
	    The once-off space to use for the current operation, specified
	    by name. This is a Stackato 3 option.
	    Cannot be used together with --space-guid.
	
        --space-guid
          
	    The once-off space to use for the current operation, specified
	    by guid. This is a Stackato 3 option.
	    Cannot be used together with --space.
	
        --tail
          
	    Request target to stream the log.
	
        --target
          
	    The once-off target to use for the current operation.
	
        --timeout
          
	    The time the client waits for an application to
	    start before giving up and returning, in seconds.
	    Note that this is measured from the last entry
	    seen in the log stream. While there is activity
	    in the log the timeout is reset.

	    The default is 2 minutes.

	    Use the suffixes 'm', 'h', and 'd' for the convenient
	    specification of minutes, hours, and days. The optional
	    suffix 's' stands for seconds.
	
        --token
          
	    The once-off authentication token to use for the
	    current operation.
	
        --token-file
          
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	
        -o
          Alias of --organization.


 