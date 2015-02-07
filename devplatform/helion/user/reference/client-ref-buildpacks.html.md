---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/buildpacks/
product: devplatform
title: "Application Lifecycle Service Command Line Client Reference: Buildpacks"

---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Buildpacks

- [helion buildpacks](#command-buildpacks)
- [helion create-buildpack](#command-create-buildpack)
- [helion delete-buildpack](#command-delete-buildpack)
- [helion rename-buildpack](#command-rename-buildpack)
- [helion update-buildpack](#command-update-buildpack)

##Syntax

	helion [options] command [arguments] [command-options]
For more information, use the **helion help**, **helion help [*command*]**, or **helion options** commands.

<hr>
      
.. _command-buildpacks:

      stackato buildpacks       
        Show all build-packs known to the target, in the order they are checked in during auto-detection.

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
	


.. _command-create-buildpack:

      stackato create-buildpack  *<name>*  *<zip>*       
        Add a build-pack to the target.
        --disable
          
		Disable the buildpack, prevent its use.
	    
        --enable
          
		Enable use of the buildback.
	    
        --lock
          
		Lock the buildpack against modification.
	    
        --position
          
		Location of the buildpack in the sequence used
		to check them during auto-detection.
	    
        --target
          
	    The once-off target to use for the current operation.
	
        --token
          
	    The once-off authentication token to use for the
	    current operation.
	
        --token-file
          
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	
        --unlock
          
		Unlock the buildpack, allow changes again.
	    
        -P
          Alias of --position.


.. _command-delete-buildpack:

      stackato delete-buildpack  *<name>*       
        Remove the specified buildpack from the target.

        --target
          
	    The once-off target to use for the current operation.
	
        --token
          
	    The once-off authentication token to use for the
	    current operation.
	
        --token-file
          
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	


.. _command-rename-buildpack:

      stackato rename-buildpack  *<name>*  *<newname>*       
        Change the name of the specified build-pack.

       --target
          
	    The once-off target to use for the current operation.
	
        --token
          
	    The once-off authentication token to use for the
	    current operation.
	
        --token-file
          
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	


.. _command-update-buildpack:

      stackato update-buildpack  *<name>*       
        Change the information known about the specified build-pack.

        --disable
          
		Disable the buildpack, prevent its use.
	    
        --enable
          
		Enable use of the buildback.
	    
        --lock
          
		Lock the buildpack against modification.
	    
        --position
          
		Location of the buildpack in the sequence used
		to check them during auto-detection.
	    
        --target
          
	    The once-off target to use for the current operation.
	
        --token
          
	    The once-off authentication token to use for the
	    current operation.
	
        --token-file
          
	    Path to an existing and readable file containing
	    the targets and authorization tokens.
	
        --unlock
          
		Unlock the buildpack, allow changes again.
	    
        --zip
          
		Path or url of the new zip file containing the implementation of the buildpack.
		Accepts the path to a local directory as well, which will become the zip file to upload.
	    
        -P
          Alias of --position.

