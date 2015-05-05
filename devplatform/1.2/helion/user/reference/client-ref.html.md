---
layout: default-devplatform
permalink: /helion/devplatform/als/user/reference/client-ref/
title: "HP Helion 1.2 Development Platform: Application Lifecycle Service Client Command Reference "
product: devplatform2.0
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer 
role2: ISV Developer
role3: Service Developer
role4: Systems Administrator
authors: Jayme P

---
<!--UNDER REVISION-->

# HP Helion 1.2 Development Platform: Application Lifecycle Service Client Command Reference {#helion-client-command-reference}

 
Many of the informational commands take a **--json** option if you wish to generate machine-parseable output. In some cases the json output reveals additional details.

Note that Administrative user privileges are required for some commands.

###[Getting Started](/helion/devplatform/als/user/reference/client-ref/gettingstarted/)

- [helion login](/helion/devplatform/als/user/reference/client-ref/gettingstarted/#command-login): Logs in to the current or specified target with the named user.
- [helion logout](/helion/devplatform/als/user/reference/client-ref/gettingstarted/#command-logout): Logs the current user out of the current, specified, or all targets.
- [helion target](/helion/devplatform/als/user/reference/client-ref/gettingstarted/#command-target): Set the target API endpoint for the client or report the current target.

###[Administration](/helion/devplatform/als/user/reference/client-ref/administration/)
- [helion admin grant](/helion/devplatform/als/user/reference/client-ref/administration/#command-admin-grant): Grant the named user administrator privileges for the current or specified target.
- [helion admin list](/helion/devplatform/als/user/reference/client-ref/administration/#command-admin-list): Show a list of the administrators for the current or specified target.
- [helion admin patch](/helion/devplatform/als/user/reference/client-ref/administration/#command-admin-patch): Apply a patch to the current or specified target.
- [helion admin report](/helion/devplatform/als/user/reference/client-ref/administration/#command-admin-report): Retrieve a report containing the logs of the current or specified target.
- [helion admin revoke](/helion/devplatform/als/user/reference/client-ref/administration/#command-admin-revoke): Revoke administrator privileges for the named user at the current or specified target.
- [helion info](/helion/devplatform/als/user/reference/client-ref/administration/#command-info): Show the basic system and account information
- [helion show-token](/helion/devplatform/als/user/reference/client-ref/administration/#command-show-token): Print the current target's authorization token.
- [helion stacks](/helion/devplatform/als/user/reference/client-ref/administration/#command-stacks): List the supported stacks of the target.
- [helion targets](/helion/devplatform/als/user/reference/client-ref/administration/#command-targets), [helion tokens](/helion/devplatform/als/user/reference/client-ref/administration/#command-tokens): List the available targets and their authorization tokens, if any.
- [helion usage](/helion/devplatform/als/user/reference/client-ref/administration/#command-usage): Show the current memory allocation and usage of the specified or current space.
- [helion user](/helion/devplatform/als/user/reference/client-ref/administration/#command-user): Show the name of the current user in the current or specified target.
- [helion user-info](/helion/devplatform/als/user/reference/client-ref/administration/#command-user-info): Shows the information of a user in the current or specified target.
- [helion version](/helion/devplatform/als/user/reference/client-ref/administration/#command-version): Print the version number of the client.

###[Applications](/helion/devplatform/als/user/reference/client-ref/applications/)
- [helion app](/helion/devplatform/als/user/reference/client-ref/applications/#command-app): Show the information of the specified application.
- [helion apps](/helion/devplatform/als/user/reference/client-ref/applications/#command-apps): List the applications deployed to the target.
- [helion list](/helion/devplatform/als/user/reference/client-ref/applications/#command-list): List the applications deployed to the target.
- [helion releases](/helion/devplatform/als/user/reference/client-ref/applications/#command-releases): Show the list of versions for the specified application.
- [helion versions](/helion/devplatform/als/user/reference/client-ref/applications/#command-versions): Show the list of versions for the specified application.


###[Authentication Tokens](/helion/devplatform/als/user/reference/client-ref/tokens/)  
- [helion create-service-auth-token](/helion/devplatform/als/user/reference/client-ref/tokens/#command-create-service-auth-token): Create a new service authentication token.
- [helion delete-service-auth-token](/helion/devplatform/als/user/reference/client-ref/tokens/#command-delete-service-auth-token): Delete the specified service authentication token
- [helion service-auth-tokens](/helion/devplatform/als/user/reference/client-ref/tokens/#command-service-auth-tokens):Show all service authentication tokens known to the target. 
- [helion update-service-auth-token](/helion/devplatform/als/user/reference/client-ref/tokens/#command-update-service-auth-token): Update the specified service authentication token.
	
###[Brokers](/helion/devplatform/als/user/reference/client-ref/brokers/)
- [helion add-service-broker](/helion/devplatform/als/user/reference/client-ref/brokers/#command-add-service-broker): Make the named service broker known.
- [helion create-service-broker](/helion/devplatform/als/user/reference/client-ref/brokers/#command-create-service-broker): Make the named service broker known. 
- [helion delete-service-broker](/helion/devplatform/als/user/reference/client-ref/brokers/#command-delete-service-broker): Remove the named service broker from the target
- [helion remove-service-broker](/helion/devplatform/als/user/reference/client-ref/brokers/#command-remove-service-broker): Remove the named service broker from the target.
- [helion service-brokers](/helion/devplatform/als/user/reference/client-ref/brokers/#command-service-brokers): Show the list of known service brokers.
- [helion update-service-broker](/helion/devplatform/als/user/reference/client-ref/brokers/#command-update-service-broker): Update the target's knowledge of the named service broker.

###[Buildpacks](/helion/devplatform/als/user/reference/client-ref/buildpacks/) 
- [helion buildpacks](/helion/devplatform/als/user/reference/client-ref/buildpacks/#command-buildpacks): Show all buildpacks known to the target in the order they are checked in during auto-detection.
- [helion create-buildpack](/helion/devplatform/als/user/reference/client-ref/buildpacks/#command-create-buildpack): Add a buildpack to the target.
- [helion delete-buildpack](/helion/devplatform/als/user/reference/client-ref/buildpacks/#command-delete-buildpack): Remove the specified buildpack from the target.
- [helion rename-buildpack](/helion/devplatform/als/user/reference/client-ref/buildpacks/#command-rename-buildpack): Change the name of the specified buildpack.
- [helion update-buildpack](/helion/devplatform/als/user/reference/client-ref/buildpacks/#command-update-buildpack): Change the information known about the specified buildpack.

###[Control](/helion/devplatform/als/user/reference/client-ref/control/) (new in HP Helion OpenStack&#174;  Development Platform 1.1)
- [helion migrate](/helion/devplatform/als/user/reference/client-ref/control/#command-migrate): Move the application to a different space. 
- [helion restage](/helion/devplatform/als/user/reference/client-ref/control/#command-restage): Restage an application and regenerate its droplet.

###[Domains](/helion/devplatform/als/user/reference/client-ref/domains/)
- [helion create-domain](/helion/devplatform/als/user/reference/client-ref/domains/#command-create-domain): Create a new domain.
- [helion delete-domain](/helion/devplatform/als/user/reference/client-ref/domains/#command-delete-domain): Delete the named domain.
- [helion domains](/helion/devplatform/als/user/reference/client-ref/domains/#command-domains): List the available domains in the specified space or all domains.

###[Feature Flags](/helion/devplatform/als/user/reference/client-ref/flags/) (new in HP Helion OpenStack&#174;  Development Platform 1.1)
- [helion disable-feature-flag](/helion/devplatform/als/user/reference/client-ref/flags/#command-disable-feature-flag): Deactivate the specified feature. 
- [helion enable-feature-flag](/helion/devplatform/als/user/reference/client-ref/flags/#command-enable-feature-flag): Activate the specified feature.
- [helion feature-flag](/helion/devplatform/als/user/reference/client-ref/flags/#command-feature-flag): Show the details of the specified feature flag. 	
- [helion feature-flags](/helion/devplatform/als/user/reference/client-ref/flags/#command-feature-flags):  Show all known feature flags and the status of each one.

###[History](/helion/devplatform/als/user/reference/client-ref/history/)
- [helion history clear](/helion/devplatform/als/user/reference/client-ref/history/#command-history-clear): Clear the saved history.
- [helion history limit](/helion/devplatform/als/user/reference/client-ref/history/#command-history-limit): Limit the size of the history or display the current limit.
- [helion history list](/helion/devplatform/als/user/reference/client-ref/history/#command-history-list): Show the saved history of commands.

###[Information](/helion/devplatform/als/user/reference/client-ref/information/)
- [helion crashes](/helion/devplatform/als/user/reference/client-ref/information/#command-crashes): List recent application crashes.
- [helion crashlogs](/helion/devplatform/als/user/reference/client-ref/information/#command-crashlogs): Display log information for the application.
- [helion disk](/helion/devplatform/als/user/reference/client-ref/information/#command-disk): Show the disk reservation for a deployed application.
- [helion drain list](/helion/devplatform/als/user/reference/client-ref/information/#command-drain-list): Show the list of drains attached to the application. 
- [helion drains](/helion/devplatform/als/user/reference/client-ref/information/#command-drains): Show the list of drains attached to the application. 
- [helion env](/helion/devplatform/als/user/reference/client-ref/information/#command-env): List the application's environment variables.
- [helion events](/helion/devplatform/als/user/reference/client-ref/information/#command-events): Show recorded application events for an application or space.
- [helion file](/helion/devplatform/als/user/reference/client-ref/information/#command-file): Display directory listing or file.
- [helion files](/helion/devplatform/als/user/reference/client-ref/information/#command-files): Display directory listing or files.
- [helion health](/helion/devplatform/als/user/reference/client-ref/information/#command-health): Report the health of the specified application(s).
- [helion instances](/helion/devplatform/als/user/reference/client-ref/information/#command-instances): List application instances for a deployed application.
- [helion logs](/helion/devplatform/als/user/reference/client-ref/information/#command-logs): Display the application log stream.
- [helion mem](/helion/devplatform/als/user/reference/client-ref/information/#command-mem): Show the memory reservation for a deployed application.
- [helion stats](/helion/devplatform/als/user/reference/client-ref/information/#command-stats): Display the resource usage for a deployed application.
- [helion tail](/helion/devplatform/als/user/reference/client-ref/information/#command-tail): Monitor file for changes and stream the changes.

### [Management](/helion/devplatform/als/user/reference/client-ref/management/)
- [helion create-app](/helion/devplatform/als/user/reference/client-ref/management/#command-create-app): Create an empty application with the specified configuration.
- [helion dbshell](/helion/devplatform/als/user/reference/client-ref/management/#command-dbshell): Invoke interactive db shell for a bound service.
- [helion delete](/helion/devplatform/als/user/reference/client-ref/management/#command-delete): Delete the specified application(s).
- [helion drain add](/helion/devplatform/als/user/reference/client-ref/management/#command-drain-add): Attach a new named drain to the application.
- [helion drain delete](/helion/devplatform/als/user/reference/client-ref/management/#command-drain-delete): Remove the named drain from the application.
- [helion env-add](/helion/devplatform/als/user/reference/client-ref/management/#command-env-add): Add the specified environment variable to the named application.
- [helion env-del](/helion/devplatform/als/user/reference/client-ref/management/#command-env-del): Remove the specified environment variable from the named application.
- [helion map](/helion/devplatform/als/user/reference/client-ref/management/#command-map): Make the application accessible through the specified URL (a route consisting of host and domain).
- [helion open](/helion/devplatform/als/user/reference/client-ref/management/#command-open): Open the url of the specified application in the default web browser.
- [helion push](/helion/devplatform/als/user/reference/client-ref/management/#command-push): Configure, create, push, map, and start a new application
- [helion rename](/helion/devplatform/als/user/reference/client-ref/management/#command-rename): Rename the specified application.
- [helion restart](/helion/devplatform/als/user/reference/client-ref/management/#command-restart): Stop and restart a deployed application.
- [helion rollback](/helion/devplatform/als/user/reference/client-ref/management/#command-rollback): Switch to a different version of the application.
- [helion run](/helion/devplatform/als/user/reference/client-ref/management/#command-run): Run a specified command on a running instance.
- [helion scale](/helion/devplatform/als/user/reference/client-ref/management/#command-scale): Update the number of instances, memory and/or disk reservation for a deployed application.
- [helion scp](/helion/devplatform/als/user/reference/client-ref/management/#command-scp): Copy source files and directories to the destination.
- [helion set-env](/helion/devplatform/als/user/reference/client-ref/management/#command-set-env): Add the specified environment variable to the named application.
- [helion ssh](/helion/devplatform/als/user/reference/client-ref/management/#command-ssh): SSH to a running instance (or target), or run a specific command.
- [helion start](/helion/devplatform/als/user/reference/client-ref/management/#command-start): Start a deployed application.
- [helion stop](/helion/devplatform/als/user/reference/client-ref/management/#command-stop): Stop a deployed application.
- [helion switch-version](/helion/devplatform/als/user/reference/client-ref/management/#command-switch-version): Switch to a different version of the application.
- [helion unmap](/helion/devplatform/als/user/reference/client-ref/management/#command-unmap): Unregister the application from a URL.
- [helion unset-env](/helion/devplatform/als/user/reference/client-ref/management/#command-unset-env): Remove the specified environment variable from the named application.

###[Miscellaneous](/helion/devplatform/als/user/reference/client-ref/miscellaneous/)
- [helion admin](/helion/devplatform/als/user/reference/client-ref/miscellaneous/#command-admin): A set of administrative tasks.
- [helion alias](/helion/devplatform/als/user/reference/client-ref/miscellaneous/#command-alias): Create a shortcut for a command.	
- [helion aliases](/helion/devplatform/als/user/reference/client-ref/miscellaneous/#command-aliases): List the known aliases (shortcuts).
- [helion color](/helion/devplatform/als/user/reference/client-ref/miscellaneous/#command-color): Management of terminal colors.
- [helion curl](/helion/devplatform/als/user/reference/client-ref/miscellaneous/#command-curl): Run a raw REST request against the chosen target.
- [helion drain](/helion/devplatform/als/user/reference/client-ref/miscellaneous/#command-drain): Commands for the management of drains attached to applications.
- [helion guid](/helion/devplatform/als/user/reference/client-ref/miscellaneous/#command-guid): Map the specified name into a GUID given the type.
- [helion help](/helion/devplatform/als/user/reference/client-ref/miscellaneous/#command-help): Retrieve help for a command or command set.
- [helion named-entities](/helion/devplatform/als/user/reference/client-ref/miscellaneous/#command-named-entities): List the entity types usable for GUID.
- [helion trace](/helion/devplatform/als/user/reference/client-ref/miscellaneous/#command-trace): Print the saved REST trace for the last client command to stdout.
- [helion unalias](/helion/devplatform/als/user/reference/client-ref/miscellaneous/#command-unalias): Remove a shortcut by name.

###[Organizations](/helion/devplatform/als/user/reference/client-ref/organizations/)
- [helion create-org](/helion/devplatform/als/user/reference/client-ref/organizations/#command-create-org): Create a new organization.
- [helion command-delete-org](/helion/devplatform/als/user/reference/client-ref/organizations/#delete-org): Delete the named organization
- [helion link-user-org](/helion/devplatform/als/user/reference/client-ref/organizations/#command-link-user-org): Add the specified user to the named organization in various roles.
- [helion org](/helion/devplatform/als/user/reference/client-ref/organizations/#command-org): Show the named organization's information.	
- [helion orgs](/helion/devplatform/als/user/reference/client-ref/organizations/#command-orgs): List the available organizations.
- [helion org-users](/helion/devplatform/als/user/reference/client-ref/organizations/#command-org-users): Show the users for the organization by role. 
- [helion quota-org](/helion/devplatform/als/user/reference/client-ref/organizations/#command-quota-org): Set the quotas for the current or named organization.
- [helion rename-org](/helion/devplatform/als/user/reference/client-ref/organizations/#command-rename-org): Rename the named organization.
- [helion switch-org](/helion/devplatform/als/user/reference/client-ref/organizations/#command-switch-org): Switch the current organization to the named organization.
- [helion unlink-user-org](/helion/devplatform/als/user/reference/client-ref/organizations/#command-unlink-user-org): Remove the specified user from the named organization in various roles. 
- [helion update-org](/helion/devplatform/als/user/reference/client-ref/organizations/#command-update-org): Change one or more attributes of an organization in a single call.

### [Placement Zones](/helion/devplatform/als/user/reference/client-ref/placement/) 
- [helion placement-zone](/helion/devplatform/als/user/reference/client-ref/placement/#command-placement-zone): Show the list of DEAs associated with the specified placement zone.
- [helion placement-zones](/helion/devplatform/als/user/reference/client-ref/placement/#command-placement-zones): Show the available placement zones.
- [helion set-placement-zone](/helion/devplatform/als/user/reference/client-ref/placement/#command-set-placement-zone): Associate the application with a specific placement zone.
- [helion unset-placement-zone](/helion/devplatform/als/user/reference/client-ref/placement/#command-unset-placement-zone): Remove the association between an application and its current placement zone.

###[Quotas](/helion/devplatform/als/user/reference/client-ref/quotas/)
- [helion quota configure](/helion/devplatform/als/user/reference/client-ref/quotas/#command-quota-configure): Reconfigure the named quota plan.
- [helion quota create](/helion/devplatform/als/user/reference/client-ref/quotas/#command-quota-create): Create a new quota plan.
- [helion quota delete](/helion/devplatform/als/user/reference/client-ref/quotas/#command-quota-delete): Delete the named quota plan.
- [helion quota list](/helion/devplatform/als/user/reference/client-ref/quotas/#command-quota-list): List the available quota plans. 
- [helion quota rename](/helion/devplatform/als/user/reference/client-ref/quotas/#command-quota-rename): Rename the named quota plan.
- [helion quota show](/helion/devplatform/als/user/reference/client-ref/quotas/#command-quota-show): Show the details of the named quota plan
- [helion quotas](/helion/devplatform/als/user/reference/client-ref/quotas/#command-quotas): List the available quota plans.

###[Routes](/helion/devplatform/als/user/reference/client-ref/routes/)
- [helion delete-route](/helion/devplatform/als/user/reference/client-ref/routes/#command-delete-route): Delete the named route.
- [helion routes](/helion/devplatform/als/user/reference/client-ref/routes/#command-routes): List all routes or routes available in the specified space. 

###[Security Groups](/helion/devplatform/als/user/reference/client-ref/securitygroups/) (new in HP Helion OpenStack&#174;  Development Platform 1.1) 
- [helion bind-security-group](/helion/devplatform/als/user/reference/client-ref/securitygroups/#command-bind-security-group): Bind the named security group to the current space, the specified space, or the running and staging phases. 
- [helion create-security-group](/helion/devplatform/als/user/reference/client-ref/securitygroups/#command-create-security-group): Create a new security group.
- [helion delete-security-group](/helion/devplatform/als/user/reference/client-ref/securitygroups/#command-delete-security-group): Delete the named security group.
- [helion security-group](/helion/devplatform/als/user/reference/client-ref/securitygroups/#command-security-group): Show the details of the named security group.
- [helion security-groups](/helion/devplatform/als/user/reference/client-ref/securitygroups/#command-security-groups): Show all known security groups or just those assigned to the running and staging phases.
- [helion unbind-security-group](/helion/devplatform/als/user/reference/client-ref/securitygroups/#command-unbind-security-group): Drop the named security group from the current space, the specified space, or the running and staging phases.
- [helion update-security-group](/helion/devplatform/als/user/reference/client-ref/securitygroups/#command-update-security-group): Modify the named security group.

###[Service Management](/helion/devplatform/als/user/reference/client-ref/servicemanagement/) 
- [helion bind-service](/helion/devplatform/als/user/reference/client-ref/servicemanagement/#command-bind-service): Bind the named service to the specified application.
- [helion clone-services](/helion/devplatform/als/user/reference/client-ref/servicemanagement/#command-clone-services): Copy the service bindings of the source application to the destination application.
- [helion create-service](/helion/devplatform/als/user/reference/client-ref/servicemanagement/#command-create-service): Create a new provisioned service and optionally bind it to an application.
- [helion delete-service](/helion/devplatform/als/user/reference/client-ref/servicemanagement/#command-delete-service): Delete the named provisioned service.
- [helion rename-service](/helion/devplatform/als/user/reference/client-ref/servicemanagement/#command-rename-service): Rename the specified service instance.
- [helion tunnel](/helion/devplatform/als/user/reference/client-ref/servicemanagement/#command-tunnel): Create a local tunnel to a service and optionally start a local client as well.
- [helion unbind-service](/helion/devplatform/als/user/reference/client-ref/servicemanagement/#command-unbind-service): Disconnect the named service from the specified application.
- [helion update-user-provided-service](/helion/devplatform/als/user/reference/client-ref/servicemanagement/#command-update-user-provided-service): Update the credentials of a user provided service.

###[Service Plans](/helion/devplatform/als/user/reference/client-ref/serviceplans/)
- [helion hide-service-plan](/helion/devplatform/als/user/reference/client-ref/serviceplans/#command-hide-service-plan): Hide the specified service-plan from the named organization.
- [helion service-plan](/helion/devplatform/als/user/reference/client-ref/serviceplans/#command-service-plan): Show the details of the specified service plan
- [helion service-plans](/helion/devplatform/als/user/reference/client-ref/serviceplans/#command-service-plans): List all available plans of the supported services
- [helion show-service-plan](/helion/devplatform/als/user/reference/client-ref/serviceplans/#command-show-service-plan): Make the specified service plan visible to the named organization.
- [helion update-service-plan](/helion/devplatform/als/user/reference/client-ref/serviceplans/#command-update-service-plan): Update the target's knowledge of the named service plan.

###[Services](/helion/devplatform/als/user/reference/client-ref/services/)
- [helion marketplace](/helion/devplatform/als/user/reference/client-ref/services/#command-marketplace): List the supported service plans of the target for the current or specified space. This command is new in HP Helion OpenStack&#174; Development Platform 1.1. 
- [helion purge-service-offerings](/helion/devplatform/als/user/reference/client-ref/services/#command-purge-service-offerings): Purge all offerings of the service type from the system. **Warning** use with caution.  This command is new in HP Helion OpenStack&#174; Development Platform 1.1. 
- [helion service](/helion/devplatform/als/user/reference/client-ref/services/#command-service): Show information about the named service.
- [helion services](/helion/devplatform/als/user/reference/client-ref/services/#command-services): List the supported and provisioned services of the target.

###[Spaces](/helion/devplatform/als/user/reference/client-ref/spaces/)
- [helion create-space](/helion/devplatform/als/user/reference/client-ref/spaces/#command-create-space): Create a new space.
- [helion delete-space](/helion/devplatform/als/user/reference/client-ref/spaces/#command-delete-space): Delete the named space.
- [helion link-user-space](/helion/devplatform/als/user/reference/client-ref/spaces/#command-link-user-space): Add the specified user to the named space in various roles. 
- [helion rename-space](/helion/devplatform/als/user/reference/client-ref/spaces/#command-rename-space): Rename the named space.
- [helion space-users](/helion/devplatform/als/user/reference/client-ref/spaces/#command-space-users): Show the users for the space, by role.
- [helion space](/helion/devplatform/als/user/reference/client-ref/spaces/#command-space): Show the named space's information. 	
- [helion spaces](/helion/devplatform/als/user/reference/client-ref/spaces/#command-spaces): List the available spaces in the specified organization.
- [helion switch-space](/helion/devplatform/als/user/reference/client-ref/spaces/#command-switch-space): Switch from the current space to the named space. 
- [helion unlink-user-space](/helion/devplatform/als/user/reference/client-ref/spaces/#command-unlink-user-space): Remove the specified user from the named space in various roles.
- [helion update-space ](/helion/devplatform/als/user/reference/client-ref/spaces/#command-update-space): Change one or more attributes of a space in a single call.

###[Space Quotas](/helion/devplatform/als/user/reference/client-ref/spacequotas/) (new in HP Helion OpenStack&#174; Development Platform 1.1)
- [helion create-space-quota](/helion/devplatform/als/user/reference/client-ref/spacequotas/#command-create-space-quota): Create a new space quota. 
- [helion delete-space-quota](/helion/devplatform/als/user/reference/client-ref/spacequotas/#command-delete-space-quota): Delete the named space quota. 
- [helion rename-space-quota](/helion/devplatform/als/user/reference/client-ref/spacequotas/#command-rename-space-quota): Rename the named space quota.
- [helion set-space-quota](/helion/devplatform/als/user/reference/client-ref/spacequotas/#command-set-space-quota): Assign the specified space quota to the current or specified space
- [helion space-quota](/helion/devplatform/als/user/reference/client-ref/spacequotas/#command-space-quota): Show the details of the named space quota. 
- [helion space-quotas](/helion/devplatform/als/user/reference/client-ref/spacequotas/#command-space-quotas): List the space quotas owned by the current, specified, or all organizations.
- [helion unset-space-quota](/helion/devplatform/als/user/reference/client-ref/spacequotas/#command-unset-space-quota): Drop the space quota from the current or specified space.
- [helion update-space-quota](/helion/devplatform/als/user/reference/client-ref/spacequotas/#command-update-space-quota): Modify the named space quota.

###[User Management](/helion/devplatform/als/user/reference/client-ref/usermanagement/) 
- [helion add-user](/helion/devplatform/als/user/reference/client-ref/usermanagement/#command-add-user): Register a new user in the current or specified target. Requires admin privileges.
- [helion delete-user](/helion/devplatform/als/user/reference/client-ref/usermanagement/#command-delete-user):Delete the named user and the user's applications and services from the current or specified target. Requires admin privileges.
- [helion login-fields](/helion/devplatform/als/user/reference/client-ref/usermanagement/#command-login-fields): Show the names of the credential fields needed for a login. 
- [helion passwd](/helion/devplatform/als/user/reference/client-ref/usermanagement/#command-passwd): Change the password of the current user in the current or specified target.
- [helion register](/helion/devplatform/als/user/reference/client-ref/usermanagement/#command-register): Register a new user in the current or specified target. Requires admin privileges.
- [helion token](/helion/devplatform/als/user/reference/client-ref/usermanagement/#command-token): Interactively set authentication token.
- [helion unregister](/helion/devplatform/als/user/reference/client-ref/usermanagement/#command-unregister): Delete the named user and the user's applications and services from the current or specified target. Requires admin privileges.
- [helion users](/helion/devplatform/als/user/reference/client-ref/usermanagement/#command-users): Show the list of users known to the current or specified target.
