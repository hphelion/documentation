---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/flags/
product: devplatform
title: "Application Lifecycle Service Command Line Client Reference: Feature Flags"
---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Feature Flags

- [helion disable-feature-flag](#command-disable-feature-flag)
- [helion enable-feature-flag](#command-enable-feature-flag)
- [helion feature-flag](#command-feature-flag)	
- [helion feature-flags](#command-feature-flags)

##Syntax

	helion [options] command [arguments] [command-options]
For more information, use the **helion help**, **helion help [*option*]**, or **helion options** commands.

<hr>
    
.. _command-disable-feature-flag:
  
  stackato disable-feature-flag  *<name>* 
    Deactivate the specified feature. This is a Stackato 3.4.2 command.

    
    --target
      
	    The once-off target to use for the current operation.
	
    --token
      
	    The once-off authentication token to use for the
	    current operation.
	
    --token-file
      
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	
    
.. _command-enable-feature-flag:
  
  stackato enable-feature-flag  *<name>* 
    Activate the specified feature. This is a Stackato 3.4.2 command.

    --target
      
	    The once-off target to use for the current operation.
	
    --token
      
	    The once-off authentication token to use for the
	    current operation.
	
    --token-file
      
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	
    
.. _command-feature-flags:
  
  stackato feature-flags 
    Show all known feature flags and their stati. This is a Stackato 3.4.2 command.

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
	
    
.. _command-feature-flag:
  
  stackato feature-flag  *<name>* 
    Show the details of the specified feature flag. This is a Stackato 3.4.2 command.

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
