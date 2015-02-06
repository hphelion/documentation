---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/plans/
product: devplatform
title: "Application Lifecycle Service Command Line Client Reference: Service Plans"
---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Service Plans

 	- [helion hide-service-plan](#command-hide-service-plan)
	- [helion service-plans](#command-service-plans)
 	- [helion service-plans](#command-service-plans)
	- [helion show-service-plan](#command-show-service-plan)
	- [helion update-service-plan](#command-update-service-plan)

stackato service-plan  *<name>*       
        Show the details of the specified service plan. This is a Stackato 3 specific command.

        .. raw:: html

          <div class="spoiler">
          <a style="font-size: x-small" onclick="showSpoiler(this);"/>+ options</a>
          <div class="inner" style="display:none;">

        --json
          
	    Print raw json as output, not human-formatted data.
	
        --provider
          
		The service provider. Use this to disambiguate
		between multiple providers of the same vendor/type.
	    
        --target
          
	    The once-off target to use for the current operation.
	
        --token
          
	    The once-off authentication token to use for the
	    current operation.
	
        --token-file
          
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	
        --vendor
          
		    Name of the service type the specified plan belongs to.
		
        --version
          
		The service version. Use this to disambiguate
		between multiple versions of the same vendor/type.
	    


.. _command-show-service-plan:

      stackato show-service-plan  *<name>*  *<organization>*       
        Make the specified service-plan visible to the named organization. This is a Stackato 3 specific command.

        .. raw:: html

          <div class="spoiler">
          <a style="font-size: x-small" onclick="showSpoiler(this);"/>+ options</a>
          <div class="inner" style="display:none;">

        --provider
          
		The service provider. Use this to disambiguate
		between multiple providers of the same vendor/type.
	    
        --target
          
	    The once-off target to use for the current operation.
	
        --token
          
	    The once-off authentication token to use for the
	    current operation.
	
        --token-file
          
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	
        --vendor
          
		    Name of the service type the specified plan belongs to.
		
        --version
          
		The service version. Use this to disambiguate
		between multiple versions of the same vendor/type.
	    


.. _command-update-service-plan:

      stackato update-service-plan  *<name>*  *<newname>*       
        Update the target's knowledge of the named service plan. This is a Stackato 3 specific command.

        .. raw:: html

          <div class="spoiler">
          <a style="font-size: x-small" onclick="showSpoiler(this);"/>+ options</a>
          <div class="inner" style="display:none;">

        --description
          
		    Change the plan's description.
		
        --free
          
		    Mark the plan as free.
		
        --no-free
          Complementary alias of --free.
        --no-public
          Complementary alias of --public.
        --provider
          
		The service provider. Use this to disambiguate
		between multiple providers of the same vendor/type.
	    
        --public
          
		    Mark the plan as globally public.
		
        --target
          
	    The once-off target to use for the current operation.
	
        --token
          
	    The once-off authentication token to use for the
	    current operation.
	
        --token-file
          
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	
        --vendor
          
		    Name of the service type the specified plan belongs to.
		
        --version
          
		The service version. Use this to disambiguate
		between multiple versions of the same vendor/type.
	    


