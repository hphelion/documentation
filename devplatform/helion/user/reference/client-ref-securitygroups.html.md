---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/securitygroups/
title: "Application Lifecycle Service Command Line Client Reference: Security Groups"
product: devplatform

---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Security Groups

- [helion bind-security-group](#command-bind-security-group)
- [helion create-security-group](#command-create-security-group)
- [helion delete-security-group](#command-delete-security-group)
- [helion security-group](#command-security-group)
- [helion security-groups](#command-security-groups)
- [helion unbind-security-group](#command-unbind-security-group)
- [helion update-security-group](#command-update-security-group)


## Syntax

	helion [options] command [arguments] [command-options]
For more information, use the **helion help**, **helion help [*option*]**, or **helion options** commands.

<hr>

    
.. _command-bind-security-group:
  
  helion bind-security-group  *<security_group>* 
    Bind the named security group to either the current or specified space, or the running and staging phases. This is a Stackato 3.4.2 command.

    --organization
      
	    The name of the parent organization to use as context.

	    Defaults to the current organization.

	    A current organization is automatically set if there is none,
	    either by taking the one organization the user belongs to, or
	    asking the user to choose among the possibilities.
	
    --running
      
		Switch operation to work on the security groups for running applications.
	    
    --space
      
	    The name of the space to use as context.

	    Defaults to the current space.

	    A current space is automatically set if there is none,
	    either by taking the one space the user has, or
	    asking the user to choose among the possibilities.
	
    --staging
      
		Switch operation to work on the security groups for staging applications.
	    
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
    
.. _command-create-security-group:
  
  stackato create-security-group  *<security_group>*  *<rules>* 
    Create a new security group. This is a Stackato 3.4.2 command.

    
    

    --target
      
	    The once-off target to use for the current operation.
	
    --token
      
	    The once-off authentication token to use for the
	    current operation.
	
    --token-file
      
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	
    
.. _command-delete-security-group:
  
  stackato delete-security-group  *<security_group>* 
    Delete the named security group. This is a Stackato 3.4.2 command.
    --target
      
	    The once-off target to use for the current operation.
	
    --token
      
	    The once-off authentication token to use for the
	    current operation.
	
    --token-file
      
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	
    
.. _command-security-groups:
  
  stackato security-groups 
    Show the known security groups, either all, or just those assigned to the running and staging phases. This is a Stackato 3.4.2 command.

    --json
      
	    Print raw json as output, not human-formatted data.
	
    --running
      
		Switch operation to work on the security groups for running applications.
	    
    --staging
      
		Switch operation to work on the security groups for staging applications.
	    
    --target
      
	    The once-off target to use for the current operation.
	
    --token
      
	    The once-off authentication token to use for the
	    current operation.
	
    --token-file
      
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	
    
.. _command-security-group:
  
  stackato security-group  *<security_group>* 
    Show the details of the named security group. This is a Stackato 3.4.2 command.


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
	
    
.. _command-unbind-security-group:
  
  stackato unbind-security-group  *<security_group>* 
    Drop the named security group from either the current or specified space, or the running and staging phases. This is a Stackato 3.4.2 command.

    --organization
      
	    The name of the parent organization to use as context.

	    Defaults to the current organization.

	    A current organization is automatically set if there is none,
	    either by taking the one organization the user belongs to, or
	    asking the user to choose among the possibilities.
	
    --running
      
		Switch operation to work on the security groups for running applications.
	    
    --space
      
	    The name of the space to use as context.

	    Defaults to the current space.

	    A current space is automatically set if there is none,
	    either by taking the one space the user has, or
	    asking the user to choose among the possibilities.
	
    --staging
      
		Switch operation to work on the security groups for staging applications.
	    
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
    
.. _command-update-security-group:
  
  stackato update-security-group  *<security_group>*  *<rules>* 
    Modify the named security group. I.e. replace the set of rules with a new set. This is a Stackato 3.4.2 command.

   --target
      
	    The once-off target to use for the current operation.
	
    --token
      
	    The once-off authentication token to use for the
	    current operation.
	
    --token-file
      
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	


