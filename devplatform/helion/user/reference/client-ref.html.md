---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/
title: "Application Lifecycle Service Command Line Client Reference: Index"
product: devplatform

---
<!--UNDER REVISION-->

# HP Helion Development Platform: Application Lifecycle Service Client Command Reference {#helion-client-command-reference}
 
Many of the informational commands take a **--json** option if you wish to generate machine-parseable output. In some cases the **--json** option reveals additional details.

Note that Administrative user privileges are required for some commands.

###[Getting Started](/als/v1/user/reference/client-ref/gettingstarted)

- [helion login](/als/v1/user/reference/client-ref/gettingstarted/#command-login): Logs in to the current or specified target with the named user.
- [helion logout](/als/v1/user/reference/client-ref/gettingstarted/#command-logout): Logs the current user out of the current, specified, or all targets.
- [helion target](/als/v1/user/reference/client-ref/gettingstarted/#command-target): Set the target API endpoint for the client or report the current target.

###[Administration](/als/v1/user/reference/client-ref/administration)
- [helion admin grant](/als/v1/user/reference/client-ref/administration/#command-admin-grant): Grant the named user administrator privileges for the current or specified target.
- [helion admin list](/als/v1/user/reference/client-ref/administration/#command-admin-list): Show a list of the administrators for the current or specified target.
- [helion admin patch](/als/v1/user/reference/client-ref/administration/#command-admin-patch): Apply a patch to the current or specified target.
- [helion admin report](/als/v1/user/reference/client-ref/administration/#command-admin-report): Retrieve a report containing the logs of the current or specified target.
- [helion admin revoke](/als/v1/user/reference/client-ref/administration/#command-admin-revoke): Revoke administrator privileges for the named user at the current or specified target.
- [helion info](/als/v1/user/reference/client-ref/administration/#command-info): Show the basic system and account information
- [helion show-token](/als/v1/user/reference/client-ref/administration/#command-show-token): Print the current target's authorization token.
- [helion stacks](/als/v1/user/reference/client-ref/administration/#command-stacks): List the supported stacks of the target.
- [helion targets](/als/v1/user/reference/client-ref/administration/#command-targets), [helion tokens](/als/v1/user/reference/client-ref/administration/#command-tokens): List the available targets and their authorization tokens, if any.
- [helion usage](/als/v1/user/reference/client-ref/administration/#command-usage): Show the current memory allocation and usage of the specified or current space.
- [helion user](/als/v1/user/reference/client-ref/administration/#command-user): Show the name of the current user in the current or specified target.
- [helion user-info](/als/v1/user/reference/client-ref/administration/#command-user-info): Shows the information of a user in the current or specified target.
- [helion version](/als/v1/user/reference/client-ref/administration/#command-version): Print the version number of the client.

###[Applications](/als/v1/user/reference/client-ref/applications)
- [helion app](/als/v1/user/reference/client-ref/applications/#command-app)
- [helion apps](/als/v1/user/reference/client-ref/applications/#command-apps)
- [helion list](/als/v1/user/reference/client-ref/applications/#command-list)

###[Authentication Tokens](/als/v1/user/reference/client-ref/tokens)  
- [helion create-service-auth-token](#command-create-service-auth-token)
- [helion delete-service-auth-token](#command-delete-service-auth-token)
- [helion service-auth-tokens](#command-service-auth-tokens)
- [helion update-service-auth-token](#command-update-service-auth-token)
	
###[Brokers](/als/v1/user/reference/client-ref/brokers)
- [helion add-service-broker](/als/v1/user/reference/client-ref/brokers/#command-add-service-broker)
- [helion create-service-broker](/als/v1/user/reference/client-ref/brokers/#command-create-service-broker)
- [helion delete-service-broker](/als/v1/user/reference/client-ref/brokers/#command-delete-service-broker)
- [helion remove-service-broker](/als/v1/user/reference/client-ref/brokers/#command-remove-service-broker)
- [helion service-brokers](/als/v1/user/reference/client-ref/brokers/#command-service-brokers)
- [helion update-service-broker](/als/v1/user/reference/client-ref/brokers/#command-update-service-broker)

###[Buildpacks](/als/v1/user/reference/client-ref/buildpacks) 
- [helion buildpacks](/als/v1/user/reference/client-ref/buildpacks/#command-buildpacks)
- [helion create-buildpack](/als/v1/user/reference/client-ref/buildpacks/#command-create-buildpack)
- [helion delete-buildpack](/als/v1/user/reference/client-ref/buildpacks/#command-delete-buildpack)
- [helion rename-buildpack](/als/v1/user/reference/client-ref/buildpacks/#command-rename-buildpack)
- [helion update-buildpack](/als/v1/user/reference/client-ref/buildpacks/#command-update-buildpack)

###[Control](/als/v1/user/reference/client-ref/control)
- [helion migrate](/als/v1/user/reference/client-ref/control/#command-migrate)
- [helion restage](/als/v1/user/reference/client-ref/control/#command-restage)

###[Domains](/als/v1/user/reference/client-ref/domains)
- [helion create-domain](/als/v1/user/reference/client-ref/domains/#command-create-domain)
- [helion delete-domain](/als/v1/user/reference/client-ref/domains/#command-delete-domain)
- [helion domains](/als/v1/user/reference/client-ref/domains/#command-domains)
- [helion map-domain](/als/v1/user/reference/client-ref/domains/#command-map-domain)
- [helion unmap-domain](/als/v1/user/reference/client-ref/domains/#command-unmap-domain)

###[Feature Flags](/als/v1/user/reference/client-ref/flags) 
- [helion disable-feature-flag](/als/v1/user/reference/client-ref/flags/#command-disable-feature-flag)
- [helion enable-feature-flag](/als/v1/user/reference/client-ref/flags/#command-enable-feature-flag)
- [helion feature-flag](/als/v1/user/reference/client-ref/flags/#command-feature-flag)	
- [helion feature-flags](/als/v1/user/reference/client-ref/flags/#command-feature-flags)

###[History](/als/v1/user/reference/client-ref/history)
- [helion history clear](/als/v1/user/reference/client-ref/history/#command-history-clear)
- [helion history limit](/als/v1/user/reference/client-ref/history/#command-history-limit)
- [helion history list](/als/v1/user/reference/client-ref/history/#command-history-list)

###[Information](/als/v1/user/reference/client-ref/information)
- [helion crashes](/als/v1/user/reference/client-ref/information/#command-crashes): List recent application crashes.
- [helion crashlogs](/als/v1/user/reference/client-ref/information/#command-crashlogs): Display log information for the application.
- [helion disk](/als/v1/user/reference/client-ref/information/#command-disk): Show the disk reservation for a deployed application.
- [helion drain list](/als/v1/user/reference/client-ref/information/#command-drain-list): Show the list of drains attached to the application. 
- [helion drains](/als/v1/user/reference/client-ref/information/#command-drains): Show the list of drains attached to the application. 
- [helion env](/als/v1/user/reference/client-ref/information/#command-env): List the application's environment variables.
- [helion events](/als/v1/user/reference/client-ref/information/#command-events): Show recorded application events for an application or space.
- [helion file](/als/v1/user/reference/client-ref/information/#command-file): Display directory listing or file.
- [helion files](/als/v1/user/reference/client-ref/information/#command-files): Display directory listing or files.
- [helion health](/als/v1/user/reference/client-ref/information/#command-health): Report the health of the specified application(s).
- [helion instances](/als/v1/user/reference/client-ref/information/#command-instances): List application instances for a deployed application.
- [helion logs](/als/v1/user/reference/client-ref/information/#command-logs): Display the application log stream.
- [helion mem](/als/v1/user/reference/client-ref/information/#command-mem): Show the memory reservation for a deployed application.
- [helion stats](/als/v1/user/reference/client-ref/information/#command-stats): Display the resource usage for a deployed application.
- [helion tail](/als/v1/user/reference/client-ref/information/#command-tail): Monitor file for changes and stream the changes.

### [Management](/als/v1/user/reference/client-ref/management)
- [helion create-app](/als/v1/user/reference/client-ref/management/#command-create-app): Create an empty application with the specified configuration.
- [helion dbshell](/als/v1/user/reference/client-ref/management/#command-dbshell): Invoke interactive db shell for a bound service.
- [helion delete](/als/v1/user/reference/client-ref/management/#command-delete): Delete the specified application(s).
- [helion drain add](/als/v1/user/reference/client-ref/management/#command-drain-add): Attach a new named drain to the application.
- [helion drain delete](/als/v1/user/reference/client-ref/management/#command-drain-delete): Remove the named drain from the application.
- [helion env-add](/als/v1/user/reference/client-ref/management/#command-env-add): Add the specified environment variable to the named application.
- [helion env-del](/als/v1/user/reference/client-ref/management/#command-env-del): Remove the specified environment variable from the named application.
- [helion map ](/als/v1/user/reference/client-ref/management/#command-map): Make the application accessible through the specified URL (a route consisting of host and domain).
- [helion open](/als/v1/user/reference/client-ref/management/#command-open): Open the url of the specified application in the default web browser.
- [helion push](/als/v1/user/reference/client-ref/management/#command-push): Configure, create, push, map, and start a new application
- [helion rename](/als/v1/user/reference/client-ref/management/#command-rename): Rename the specified application.
- [helion restart](/als/v1/user/reference/client-ref/management/#command-restart): Stop and restart a deployed application.
- [helion rollback](/als/v1/user/reference/client-ref/management/#command-rollback): Switch to a different version of the application.
- [helion run](/als/v1/user/reference/client-ref/management/#command-run): Run a specified command on a running instance.
- [helion scale](/als/v1/user/reference/client-ref/management/#command-scale): Update the number of instances, memory and/or disk reservation for a deployed application.
- [helion scp](/als/v1/user/reference/client-ref/management/#command-scp): Copy source files and directories to the destination.
- [helion set-env](/als/v1/user/reference/client-ref/management/#command-set-env): Add the specified environment variable to the named application.
- [helion ssh](/als/v1/user/reference/client-ref/management/#command-ssh): SSH to a running instance (or target), or run a specific command.
- [helion start](/als/v1/user/reference/client-ref/management/#command-start): Start a deployed application.
- [helion stop](/als/v1/user/reference/client-ref/management/#command-stop): Stop a deployed application.
- [helion switch-version](/als/v1/user/reference/client-ref/management/#command-switch-version): Switch to a different version of the application.
- [helion unmap](/als/v1/user/reference/client-ref/management/#command-unmap): Unregister the application from a URL.
- [helion unset-env](/als/v1/user/reference/client-ref/management/#command-unset-env): Remove the specified environment variable from the named application.

###[Miscellaneous](/als/v1/user/reference/client-ref/miscellaneous)
- [helion admin](/als/v1/user/reference/client-ref/miscellaneous/#command-admin): A set of administrative tasks.
- [helion alias](/als/v1/user/reference/client-ref/miscellaneous/#command-alias): Create a shortcut for a command.	
- [helion aliases](/als/v1/user/reference/client-ref/miscellaneous/#command-aliases): List the known aliases (shortcuts).
- [helion color](/als/v1/user/reference/client-ref/miscellaneous/#command-color): Management of terminal colors.
- [helion curl](/als/v1/user/reference/client-ref/miscellaneous/#command-curl): Run a raw REST request against the chosen target.
- [helion drain](/als/v1/user/reference/client-ref/miscellaneous/#command-drain): Commands for the management of drains attached to applications.
- [helion guid](/als/v1/user/reference/client-ref/miscellaneous/#command-guid): Map the specified name into a GUID given the type.
- [helion help](/als/v1/user/reference/client-ref/miscellaneous/#command-help): Retrieve help for a command or command set.
- [helion named-entities](/als/v1/user/reference/client-ref/miscellaneous/#command-named-entities): List the entity types usable for GUID.
- [helion trace](/als/v1/user/reference/client-ref/miscellaneous/#command-trace): Print the saved REST trace for the last client command to stdout.
- [helion unalias](/als/v1/user/reference/client-ref/miscellaneous/#command-unalias): Remove a shortcut by name.

###[Organizations](/als/v1/user/reference/client-ref/organizations)
- [helion create-org](/als/v1/user/reference/client-ref/organizations/#command-create-org)
- [helion command-delete-org](/als/v1/user/reference/client-ref/organizations/#delete-org)
- [helion link-user-org](/als/v1/user/reference/client-ref/organizations/#command-link-user-org)
- [helion org-users](/als/v1/user/reference/client-ref/organizations/#command-org-users)
- [helion org](/als/v1/user/reference/client-ref/organizations/#command-org)	
- [helion orgs](/als/v1/user/reference/client-ref/organizations/#command-orgs)
- [helion quota-org](/als/v1/user/reference/client-ref/organizations/#command-quota-org)
- [helion rename-org](/als/v1/user/reference/client-ref/organizations/#command-rename-org)
- [helion switch-org](/als/v1/user/reference/client-ref/organizations/#command-switch-org)
- [helion unlink-user-org](/als/v1/user/reference/client-ref/organizations/#command-unlink-user-org)
- [helion update-org](/als/v1/user/reference/client-ref/organizations/#command-update-org)

### [Placement Zones](/als/v1/user/reference/client-ref/placement) 
- [helion placement-zone](/als/v1/user/reference/client-ref/placement/#command-placement-zone)
- [helion placement-zones](/als/v1/user/reference/client-ref/placement/#command-placement-zones)
- [helion set-placement-zone](/als/v1/user/reference/client-ref/placement/#command-set-placement-zone)
- [helion unset-placement-zone](/als/v1/user/reference/client-ref/placement/#command-unset-placement-zone)

###[Quotas](/als/v1/user/reference/client-ref/quotas)
- [helion quota configure](/als/v1/user/reference/client-ref/quotas/#command-quota-configure)
- [helion quota create](/als/v1/user/reference/client-ref/quotas/#command-quota-create)
- [helion quota delete](/als/v1/user/reference/client-ref/quotas/#command-quota-delete)
- [helion quota list](/als/v1/user/reference/client-ref/quotas/#command-quota-list)
- [helion quota rename](/als/v1/user/reference/client-ref/quotas/#command-quota-rename)
- [helion quota show](/als/v1/user/reference/client-ref/quotas/#command-quota-show)
- [helion quotas](/als/v1/user/reference/client-ref/quotas/#command-quotas)

###[Routes](/als/v1/user/reference/client-ref/routes)
- [helion delete-route](/als/v1/user/reference/client-ref/routes/#command-delete-route)
- [helion routes](/als/v1/user/reference/client-ref/routes/#command-routes)

###[Security Groups](/als/v1/user/reference/client-ref/securitygroups) 
- [helion bind-security-group](#command-bind-security-group)
- [helion create-security-group](#command-create-security-group)
- [helion delete-security-group](#command-delete-security-group)
- [helion security-group](#command-security-group)
- [helion security-groups](#command-security-groups)
- [helion unbind-security-group](#command-unbind-security-group)
- [helion update-security-group](#command-update-security-group)

###[Service Management](/als/v1/user/reference/client-ref/servicemanagement) 
- [helion bind-service](/als/v1/user/reference/client-ref/servicemanagement/#command-bind-service): Bind the named service to the specified application.
- [helion clone-services](/als/v1/user/reference/client-ref/servicemanagement/#command-clone-services): Copy the service bindings of the source application to the destination application.
- [helion create-service](/als/v1/user/reference/client-ref/servicemanagement/#command-create-service): Create a new provisioned service and optionally bind it to an application.
- [helion delete-service](/als/v1/user/reference/client-ref/servicemanagement/#command-delete-service): Delete the named provisioned service.
- [helion rename-service](/als/v1/user/reference/client-ref/servicemanagement/#command-rename-service): Rename the specified service instance.
- [helion tunnel](/als/v1/user/reference/client-ref/servicemanagement/#command-tunnel): Create a local tunnel to a service and optionally start a local client as well.
- [helion unbind-service](/als/v1/user/reference/client-ref/servicemanagement/#command-unbind-service): Disconnect the named service from the specified application.
- [helion update-user-provided-service](/als/v1/user/reference/client-ref/servicemanagement/#command-update-user-provided-service): Update the credentials of a user provided service.

###[Service Plans](/als/v1/user/reference/client-ref/plans)
- [helion hide-service-plan](/als/v1/user/reference/client-ref/plans/#command-hide-service-plan)
- [helion service-plans](/als/v1/user/reference/client-ref/plans/#command-service-plans)
- [helion service-plans](/als/v1/user/reference/client-ref/plans/#command-service-plans)
- [helion show-service-plan](/als/v1/user/reference/client-ref/plans/#command-show-service-plan)
- [helion update-service-plan](/als/v1/user/reference/client-ref/plans/#command-update-service-plan)

###[Services](/als/v1/user/reference/client-ref/services)
- [helion marketplace](/als/v1/user/reference/client-ref/services/#command-marketplace)
- [helion purge-service-offerings](/als/v1/user/reference/client-ref/services/#command-purge-service-offerings)
- [helion service](/als/v1/user/reference/client-ref/services/#command-service)
- [helion services](/als/v1/user/reference/client-ref/services/#command-services)

###[Spaces](/als/v1/user/reference/client-ref/spaces)
- [helion create-space](/als/v1/user/reference/client-ref/spaces/#command-create-space): Create a new space.
- [helion delete-space](/als/v1/user/reference/client-ref/spaces/#command-delete-space): Delete the named space.
- [helion link-user-space](/als/v1/user/reference/client-ref/spaces/#command-link-user-space): Add the specified user to the named space in various roles. 
- [helion rename-space](/als/v1/user/reference/client-ref/spaces/#command-rename-space): Rename the named space.
- [helion space-users](/als/v1/user/reference/client-ref/spaces/#command-space-users): Show the users for the space, by role.
- [helion space](/als/v1/user/reference/client-ref/spaces/#command-space): Show the named space's information. 	
- [helion spaces](/als/v1/user/reference/client-ref/spaces/#command-spaces): List the available spaces in the specified organization.
- [helion switch-space](/als/v1/user/reference/client-ref/spaces/#command-switch-space): Switch from the current space to the named space. 
- [helion unlink-user-space](/als/v1/user/reference/client-ref/spaces/#command-unlink-user-space): Remove the specified user from the named space in various roles.
- [helion update-space ](/als/v1/user/reference/client-ref/spaces/#command-update-space): Change one or more attributes of a space in a single call.

###[Space Quotas](/als/v1/user/reference/client-ref/spacequotas)
- [helion create-space-quota](/als/v1/user/reference/client-ref/spacequotas/#command-create-space-quota)
- [helion delete-space-quota](/als/v1/user/reference/client-ref/spacequotas/#command-delete-space-quota)
- [helion rename-space-quota](/als/v1/user/reference/client-ref/spacequotas/#command-rename-space-quota)
- [helion set-space-quota](/als/v1/user/reference/client-ref/spacequotas/#command-set-space-quota)
- [helion space-quota](/als/v1/user/reference/client-ref/spacequotas/#command-space-quota)
- [helion space-quotas](/als/v1/user/reference/client-ref/spacequotas/#command-space-quotas )
- [helion unset-space-quota](/als/v1/user/reference/client-ref/spacequotas/#command-unset-space-quota)
- [helion update-space-quota](/als/v1/user/reference/client-ref/spacequotas/#command-update-space-quota)

###[User Management](/als/v1/user/reference/client-ref/usermanagement) 
- [helion add-user](/als/v1/user/reference/client-ref/usermanagement/#command-add-user): Register a new user in the current or specified target. Requires admin privileges.
- [helion delete-user](/als/v1/user/reference/client-ref/usermanagement/#command-delete-user):Delete the named user and the user's applications and services from the current or specified target. Requires admin privileges.
- [helion login-fields](/als/v1/user/reference/client-ref/usermanagement/#command-login-fields): Show the names of the credential fields needed for a login. 
- [helion passwd](/als/v1/user/reference/client-ref/usermanagement/#command-passwd): Change the password of the current user in the current or specified target.
- [helion register](/als/v1/user/reference/client-ref/usermanagement/#command-register): Register a new user in the current or specified target. Requires admin privileges.
- [helion token](/als/v1/user/reference/client-ref/usermanagement/#command-token): Interactively set authentication token.
- [helion unregister](/als/v1/user/reference/client-ref/usermanagement/#command-unregister): Delete the named user and the user's applications and services from the current or specified target. Requires admin privileges.
- [helion users](/als/v1/user/reference/client-ref/usermanagement/#command-users): Show the list of users known to the current or specified target.