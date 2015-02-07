---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/spacequotas/
title: "Application Lifecycle Service Command Line Client Reference: Space Quotas"
product: devplatform

---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Space Quotas

- [helion create-space-quota](#command-create-space-quota)
- [helion delete-space-quota](#command-delete-space-quota)
- [helion rename-space-quota](#command-rename-space-quota)
- [helion set-space-quota](#command-set-space-quota)
- [helion space-quota](#command-space-quota)
- [helion space-quotas](#command-space-quotas )
- [helion unset-space-quota](#command-unset-space-quota)
- [helion update-space-quota](#command-update-space-quota)

## Syntax

	helion [options] command [arguments] [command-options]
For more information, use the **helion help**, **helion help [*command*]**, or **helion options** commands.

<hr>
      
.. _command-create-space-quota:

      stackato create-space-quota  *<name>*       
        Create a new space quota. It will be owned by the current or specified organization. This is a Stackato 3.4.2 command.

        --instance-mem
          
		    Amount of memory application instances can use.

		    Use the suffices 'M' and 'G' for the convenient specification
		    of mega- and gigabytes. Without a unit-suffix mega-bytes are
		    assumed. As the base-unit megabytes must specified as integers.
		    Gigabytes can be specified as fractions.

		    Also accepts -1 and "unlimited" for unlimited memory.
		
        --mem
          
		    Amount of memory applications can use.

		    Use the suffices 'M' and 'G' for the convenient specification
		    of mega- and gigabytes. Without a unit-suffix mega-bytes are
		    assumed. As the base-unit megabytes must specified as integers.
		    Gigabytes can be specified as fractions.

		    Also accepts -1 and "unlimited" for unlimited memory.
		
        --no-paid-services-allowed
          Complementary alias of --paid-services-allowed.
        --organization
          
	    The name of the parent organization to use as context.

	    Defaults to the current organization.

	    A current organization is automatically set if there is none,
	    either by taking the one organization the user belongs to, or
	    asking the user to choose among the possibilities.
	
        --paid-services-allowed
          
		    Applications can use non-free services.
		
        --routes
          
		    Limit for the number of routes in the quota.
		
        --services
          
		    Limit for the number of services in the quota.
		
        --target
          
	    The once-off target to use for the current operation.
	
        --token
          
	    The once-off authentication token to use for the
	    current operation.
	
        --token-file
          
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	
        -i
          Alias of --instance-mem.
        -m
          Alias of --mem.
        -o
          Alias of --organization.
        -r
          Alias of --routes.
        -s
          Alias of --services.


.. _command-delete-space-quota:

      stackato delete-space-quota  *<name>*       
        Delete the named space quota. This is a Stackato 3.4.2 command.

        
        --target
          
	    The once-off target to use for the current operation.
	
        --token
          
	    The once-off authentication token to use for the
	    current operation.
	
        --token-file
          
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	


.. _command-rename-space-quota:

      stackato rename-space-quota  *<name>*  *<newname>*       
        Rename the named space quota. This is a Stackato 3.4.2 command.

        --target
          
	    The once-off target to use for the current operation.
	
        --token
          
	    The once-off authentication token to use for the
	    current operation.
	
        --token-file
          
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	


.. _command-set-space-quota:

      stackato set-space-quota  *<name>*       
        Assign the specified space quota to the current or specified space. This is a Stackato 3.4.2 command.

                --organization
          
	    The name of the parent organization to use as context.

	    Defaults to the current organization.

	    A current organization is automatically set if there is none,
	    either by taking the one organization the user belongs to, or
	    asking the user to choose among the possibilities.
	
        --space
          
	    The name of the space to use as context.

	    Defaults to the current space.

	    A current space is automatically set if there is none,
	    either by taking the one space the user has, or
	    asking the user to choose among the possibilities.
	
        --target
          
	    The once-off target to use for the current operation.
	
        --token
          
	    The once-off authentication token to use for the
	    current operation.
	
        --token-file
          
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	
        -o
          Alias of --organization.


.. _command-space-quotas:

      stackato space-quotas       
        List the space quotas owned by the current or specified organization, or all. This is a Stackato 3.4.2 command.

        

          
          
          

        --all
          
		    Show all space quotas instead
		
        --full
          
		    Show all information about the space-quota.
		
        --json
          
	    Print raw json as output, not human-formatted data.
	
        --organization
          
	    The name of the parent organization to use as context.

	    Defaults to the current organization.

	    A current organization is automatically set if there is none,
	    either by taking the one organization the user belongs to, or
	    asking the user to choose among the possibilities.
	
        --target
          
	    The once-off target to use for the current operation.
	
        --token
          
	    The once-off authentication token to use for the
	    current operation.
	
        --token-file
          
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	
        -o
          Alias of --organization.


.. _command-space-quota:

      stackato space-quota  *<name>*       
        Show the details of the named space quota. If not specified it will be asked for interactively (menu). This is a Stackato 3.4.2 command.
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
	


.. _command-unset-space-quota:

      stackato unset-space-quota       
        Drop the space quota from the current or specified space. This is a Stackato 3.4.2 command.
        --organization
          
	    The name of the parent organization to use as context.

	    Defaults to the current organization.

	    A current organization is automatically set if there is none,
	    either by taking the one organization the user belongs to, or
	    asking the user to choose among the possibilities.
	
        --space
          
	    The name of the space to use as context.

	    Defaults to the current space.

	    A current space is automatically set if there is none,
	    either by taking the one space the user has, or
	    asking the user to choose among the possibilities.
	
        --target
          
	    The once-off target to use for the current operation.
	
        --token
          
	    The once-off authentication token to use for the
	    current operation.
	
        --token-file
          
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	
        -o
          Alias of --organization.


.. _command-update-space-quota:

      stackato update-space-quota  *<name>*       
        Modify the named space quota. This is a Stackato 3.4.2 command.

        

          
          

        --instance-mem
          
		    Amount of memory application instances can use.

		    Use the suffices 'M' and 'G' for the convenient specification
		    of mega- and gigabytes. Without a unit-suffix mega-bytes are
		    assumed. As the base-unit megabytes must specified as integers.
		    Gigabytes can be specified as fractions.

		    Also accepts -1 and "unlimited" for unlimited memory.
		
        --mem
          
		    Amount of memory applications can use.

		    Use the suffices 'M' and 'G' for the convenient specification
		    of mega- and gigabytes. Without a unit-suffix mega-bytes are
		    assumed. As the base-unit megabytes must specified as integers.
		    Gigabytes can be specified as fractions.

		    Also accepts -1 and "unlimited" for unlimited memory.
		
        --no-paid-services-allowed
          Complementary alias of --paid-services-allowed.
        --paid-services-allowed
          
		    Applications can use non-free services.
		
        --routes
          
		    Limit for the number of routes in the quota.
		
        --services
          
		    Limit for the number of services in the quota.
		
        --target
          
	    The once-off target to use for the current operation.
	
        --token
          
	    The once-off authentication token to use for the
	    current operation.
	
        --token-file
          
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	
        -i
          Alias of --instance-mem.
        -m
          Alias of --mem.
        -r
          Alias of --routes.
        -s
          Alias of --services.

