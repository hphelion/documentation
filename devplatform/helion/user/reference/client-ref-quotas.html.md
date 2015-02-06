---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/quotas/
product: devplatform
title: "Application Lifecycle Service Command Line Client Reference: Quotas"
---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Quotas

- [Quotas](#command-Administration-Quotas)
	- [helion quota configure](#command-quota-configure)
	- [helion quota create](#command-quota-create)
	- [helion quota delete](#command-quota-delete)
	- [helion quota list](#command-quota-list)
	- [helion quota rename](#command-quota-rename)
	- [helion quota show](#command-quota-show)
	- [helion quotas](#command-quotas)

.. _command-Administration-Quotas:
    
Quotas
^^^^^^^^^^^^^^^^^^^^^^^^
      
.. _command-quota configure:

      stackato quota configure  *<name>*       
        Reconfigure the named quota plan. This is a Stackato 3 specific command.

        --allow-sudo
          
		Applications can use sudo in their container.
	    
        --droplets
          
		Limit for the number of droplets per application
		that are stored (older droplets that exceed this
		quota are removed and their associated versions
		can no longer be restored).
		This is a Stackato 3.4+ specific setting.
	    
        --mem
          
		Amount of memory applications can use.

		Use the suffices 'M' and 'G' for the convenient specification
		of mega- and gigabytes. Without a unit-suffix mega-bytes are
		assumed. As the base-unit megabytes must specified as integers.
		Gigabytes can be specified as fractions.
	    
        --no-allow-sudo
          Complementary alias of --allow-sudo.
        --no-paid-services-allowed
          Complementary alias of --paid-services-allowed.
        --no-trial-db-allowed
          Complementary alias of --trial-db-allowed.
        --paid-services-allowed
          
		Applications can use non-free services.
	    
        --routes
          
		Limit for the number of routes in the quota.
		This is a Stackato 3.2+ specific setting.
	    
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
	
        --trial-db-allowed
          
		Applications can use trial databases.
		Before Stackato 3.4 only    


.. _command-quota create:

      stackato quota create  *<name>*       
        Create a new quota plan. This is a Stackato 3 specific command.

        --allow-sudo
          
		Applications can use sudo in their container.
	    
        --droplets
          
		Limit for the number of droplets per application
		that are stored (older droplets that exceed this
		quota are removed and their associated versions
		can no longer be restored).
		This is a Stackato 3.4+ specific setting.
	    
        --mem
          
		Amount of memory applications can use.

		Use the suffices 'M' and 'G' for the convenient specification
		of mega- and gigabytes. Without a unit-suffix mega-bytes are
		assumed. As the base-unit megabytes must specified as integers.
		Gigabytes can be specified as fractions.
	    
        --no-allow-sudo
          Complementary alias of --allow-sudo.
        --no-paid-services-allowed
          Complementary alias of --paid-services-allowed.
        --no-trial-db-allowed
          Complementary alias of --trial-db-allowed.
        --paid-services-allowed
          
		Applications can use non-free services.
	    
        --routes
          
		Limit for the number of routes in the quota.
		This is a Stackato 3.2+ specific setting.
	    
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
	
        --trial-db-allowed
          
		Applications can use trial databases.
		Before Stackato 3.4 only.
	    


.. _command-quota delete:

      stackato quota delete  *<name>*       
        Delete the named quota plan. This is a Stackato 3 specific command.

        --target
          
	    The once-off target to use for the current operation.
	
        --token
          
	    The once-off authentication token to use for the
	    current operation.
	
        --token-file
          
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	


.. _command-quota list:

      stackato quota list       
        List the available quota plans. This is a Stackato 3 specific command.

        

          
          
          

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
	


.. _command-quota rename:

      stackato quota rename  *<name>*  *<newname>*       
        Rename the named quota plan. This is a Stackato 3 specific command.

        --target
          
	    The once-off target to use for the current operation.
	
        --token
          
	    The once-off authentication token to use for the
	    current operation.
	
        --token-file
          
	    Path to an existing and readable file containing
	    the targets and authorization tokens.


.. _command-quota show:

      stackato quota show  *<name>*       
        Show the details of the named quota plan. If not specified it will be asked for interactively (menu). This is a Stackato 3 specific command.

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
	


.. _command-quotas:

      stackato quotas       
        List the available quota plans. This is a Stackato 3 specific command.

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
	

