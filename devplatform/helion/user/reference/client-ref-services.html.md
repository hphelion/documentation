---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/services/
title: "Application Lifecycle Service Command Line Client Reference: Services"
product: devplatform

---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Services

- [Services](/als/v1/user/reference/client-ref/services)
	- [helion marketplace](#command-marketplace)
	- [helion purge-service-offerings](#command-purge-service-offerings)
	- [helion service](#command-service)
	- [helion services](#command-services)
	
## Syntax

	helion [options] command [arguments] [command-options]
For more information, use the **helion help**, **helion help [*option*]**, or **helion options** commands.

<hr>

  helion marketplace 
    List the supported service plans of the target, for the current or specified space. This command is new in Helion OpenStack&reg; 1.1.


	
    --json
      
	    Print raw json as output, not human-formatted data.
	
    --organization
      
	    The once-off organization to use for the current operation.
	    	
    --space
      
	    The once-off space to use for the current operation, specified
	    by name. 
	    Cannot be used together with --space-guid.
	
    --space-guid
      
	    The once-off space to use for the current operation, specified
	    by guid. 	    Cannot be used together with --space.
	
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
    
.. _command-purge-service-offerings:
  
  helion purge-service-offerings  *<service>* 
    Purge all offerings of the service type from the system. Danger. Do this only for services we know to have their brokers killed, leaving behind orphans. This command is new in Helion OpenStack&reg; 1.1.

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
	
    --version
      
		The service version. Use this to disambiguate
		between multiple versions of the same vendor/type.
	    
    
.. _command-services:
  
  helion services 
    List the supported and provisioned services of the target.

    --json
      
	    Print raw json as output, not human-formatted data.
	
    --organization
      
	    The once-off organization to use for the current operation.
	    
	
    --space
      
	    The once-off space to use for the current operation, specified
	    by name. 
	    Cannot be used together with --space-guid.
	
    --space-guid
      
	    The once-off space to use for the current operation, specified
	    by guid. 
	    Cannot be used together with --space.
	
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
    
.. _command-service:
  
  helion service  *<name>* 
    Show the information about the named service.

    --json
      
	    Print raw json as output, not human-formatted data.
	
    --organization
      
	    The once-off organization to use for the current operation.
	    
	
    --space
      
	    The once-off space to use for the current operation, specified
	    by name. 
	    Cannot be used together with --space-guid.
	
    --space-guid
      
	    The once-off space to use for the current operation, specified
	    by guid. 
	    Cannot be used together with --space.
	
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




###helion service-plans###
List all available plans of the supported services. 

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-trace</td>
    <td>Complementary alias of --trace.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--target</td>
    <td>The once-off target to use for the current operation.</td>
    </tr>    <tr><td>--token</td>
    <td>The once-off authentication token to use for the current
    operation.</td>
    </tr>    <tr><td>--token-file</td>
    <td>Path to an existing and readable file containing the targets and
    authorization tokens.</td>
    </tr>    <tr><td>--trace</td>
    <td>Activate tracing of the issued REST requests and responses. This
    option is a no-op now. Tracing is always active. See the 'trace'
    command to print the saved trace to stdout.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>
### helion services###
List the supported and provisioned services of the target.

<table>     <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--group</td>
    <td>The once-off group to use for the current operation. This is a
    Application Lifecycle Service 2 option.</td>
    </tr>    <tr><td>--json</td>
    <td>Print raw json as output, not human-formatted data.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-trace</td>
    <td>Complementary alias of --trace.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--organization</td>
    <td>The once-off organization to use for the current operation. This
    is an Application Lifecycle Service 3 option.</td>
    </tr>    <tr><td>--space</td>
    <td>The once-off space to use for the current operation, specified by
    name.  Cannot be used together with --space-guid.</td>
    </tr>    <tr><td>--space-guid</td>
    <td>The once-off space to use for the current operation, specified by
    guid.  Cannot be used together with --space.</td>
    </tr>    <tr><td>--target</td>
    <td>The once-off target to use for the current operation.</td>
    </tr>    <tr><td>--token</td>
    <td>The once-off authentication token to use for the current
    operation.</td>
    </tr>    <tr><td>--token-file</td>
    <td>Path to an existing and readable file containing the targets and
    authorization tokens.</td>
    </tr>    <tr><td>--trace</td>
    <td>Activate tracing of the issued REST requests and responses. This
    option is a no-op now. Tracing is always active. See the 'trace'
    command to print the saved trace to stdout.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>
### helion service *\<name\*###
Show the information about the named service.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--group</td>
    <td>The once-off group to use for the current operation. This is a
    Application Lifecycle Service 2 option.</td>
    </tr>    <tr><td>--json</td>
    <td>Print raw json as output, not human-formatted data.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-trace</td>
    <td>Complementary alias of --trace.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--organization</td>
    <td>The once-off organization to use for the current operation. This
    is an Application Lifecycle Service 3 option.</td>
    </tr>    <tr><td>--space</td>
    <td>The once-off space to use for the current operation, specified by
    name.  Cannot be used together with --space-guid.</td>
    </tr>    <tr><td>--space-guid</td>
    <td>The once-off space to use for the current operation, specified by
    guid.  Cannot be used together with --space.</td>
    </tr>    <tr><td>--target</td>
    <td>The once-off target to use for the current operation.</td>
    </tr>    <tr><td>--token</td>
    <td>The once-off authentication token to use for the current
    operation.</td>
    </tr>    <tr><td>--token-file</td>
    <td>Path to an existing and readable file containing the targets and
    authorization tokens.</td>
    </tr>    <tr><td>--trace</td>
    <td>Activate tracing of the issued REST requests and responses. This
    option is a no-op now. Tracing is always active. See the 'trace'
    command to print the saved trace to stdout.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>) 