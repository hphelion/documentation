---
layout: default-devplatform
title: "HP Helion 1.2 Development Platform: Release Notes for HP Helion Development Platform 1.2"
permalink: /helion/devplatform/1.2/release-notes/
product: devplatform2.0
product-version1: HP Helion Development Platform
product-version3: HP Helion Development Platform 1.1
role1: Systems Administrator 
role2: System Engineer
role3: Cloud Administrator
role4: Network Administrator
role5: Application Developer
Role6: Security Engineer
role7: Application Developer 
role8: ISV Developer
role9: Service Developer
authors: Jayme P

---
<!--UNDER REVISION-->

# HP Helion 1.2 Development Platform: Release Notes for HP Helion Development Platform 1.2
[See the Helion 1.0 Development Platform version of this page](/helion/devplatform/release-notes/)


The following release notes are for the HP Helion Development Platform 1.2 released in February 2015. We hope you enjoy the release!

* [Development Platform Release Notes](#DPnotes)
* [ALS Release Notes](#alsnotes)
* [Known Issues](#known)

## Release Notes {#DPnotes}

The following features have been changed in the HP Helion Development Platform:

**OpenStack&#174; Juno support** <br />All of the [HP Helion OpenStack services](/helion/openstack/1.1/services/overview/#OpenStack) have been updated to [OpenStack Juno](http://www.openstack.org/software/juno/).

**Updated Command Line Client** <br />
The [ALS Cluster Management Tool](/helion/devplatform/1.2/als/client/reference/) (cfmgmt.exe). has been updated to provide more options for managing clusters from the command line.

**Additional ALS Client Commands**<br />
More [commands](/helion/devplatform/1.2/als/user/reference/client-ref/) are now available for managing your ALS deployment from the command line.

- [Control](/helion/devplatform/1.2/als/user/reference/client-ref/control/)
- [Feature Flags](/helion/devplatform/1.2/als/user/reference/client-ref/flags/)
- [Security Groups](/helion/devplatform/1.2/als/user/reference/client-ref/securitygroups/)
- [Space Quotas](/helion/devplatform/1.2/als/user/reference/client-ref/spacequotas/) 

**Ruby CLI No Longer Supported** <br />The Ruby CLI (unix_cli) is no longer supported. Users are advised to consider the Python CLIs as an alternative.

## ALS Release Notes {#alsnotes}
Due to length, the ALS release notes have been separated out.
v3.4.2

- New Features
	- [103548] Apps can now be moved between Spaces (by Org Managers) and Orgs (by Admins).
- Management Console UI for:
	- [102890] Quota management
	- User Provided Service Instances
	- Routes within a Space
	- All Routes (Admin view)
	- Space Quota Plans
	- Feature Flags
	- Toggling Admin/Non-admin view

- Enhancements & Updates
	- [104831] Merge from upstream Cloud Foundry (August 2014)
	- [105462] Updated built-in Buildpacks
	- [104659] Logyard stream is now brandable
	- [105465] Updated Node.js to v0.10.33
	- [105411] Update Docker to 1.3

- Bug Fixes
	- Management Console
		- [102951] Consistent styling of common UI patterns
		- [102489] Show problem components in red
		- [102316] App logs in chronological order (previously reverse chronological)
		- [105420] Fixed usage reporting in Space quota view
		- [105413] Hide non-functional UI elements for users without permission to use them
		- [105352] START button disappears from web console in certain condition
		- Deleting an app now asks if you also want to delete the routes associated with that app
		- [104841] Router Stats Dashboard 'Connections' display expands outside the box when it's over 6 digits
		- [104866] JS error: Cannot read property 'trim' of undefined welcome.js.src.js:106
		- [104820, 104819, 104818] App file browser view bugs
		- [104809] Server date/time warning
		- [104028] Add "install app from app store" to the space page
		- [104703] Unexpected results from clicking on domain rows

	- Kato
		- [105318] Options for `kato data export` for exporting just the Cloud Controller main database (users, orgs, spaces).
		- [98559] `kato status` now faster. Contacts all nodes concurrently.
		- [105286] ` kato patch` checks that it is up-to-date before applying patches.
		- [105467] `kato start controller` needs to check for multiple controllers
		- [105347] `kato patch install` attempts to repeatedly update other nodes
		- [105298] Kato emits "error getting sizes" message every 10 seconds
		- [105260] Installed patch status lost
		- [105014] Fixed recursion in `kato patch update`
		- [104860] `kato patch install` on non-existent patch should return proper error message
		- [104458] `kato data import/export` unauthorized service offering error
		- [104893] Inconsistent kato command `kato data repair_routes`
		- [104785] `kato relocate containers` doesn't maintain all DOCKER_OPTS
		- [104621] `kato relocate` failure: error trying to unmount an aufs docker node
		- [104133] `kato relocate` does not work if data is on different device
		- [103770] `kato node reset factory` fails with error

	- Docker & Fence
		- [105194] Fence crashing with fork error
		- [105123] Fence process keeps restarting
		- [105116] Fence connection issues
		- [105322, 105202, 105362] Clean up orphaned containers
		- [105295] app logs going to Fence
		- [105259] Fence crash on services node during patching

	- Upgrades
		- [104975, 105424] Upgrade issue with filesystem service
		- [104935] Random hang during upgrade
		- [104925] Fatal error in Bundler during upgrade
		- [104912] Pin bundler to a known good version in sentinel
		- [105698] Upgrade fails on stackato-tools-3.4.1 with 'no such directory'
		- [105690] Upgrade fails on client due to incorrect versions
		- [105689] `sentinel download --for-upgrade` should download intermediate version
		- [104982] Failing with exception during mysql upgrade
		- [104842] Unable to delete app after upgrade from 3.2.1 -> 3.4.1
		- [104996, 104993] Log drains stop working after upgrade
		- [104554] Duplicate key value on first kato op remap_hosts after data import
		- [104499] 3.2.1->3.4.1 upgrade fails with NoMethodError

	- Security
		- various fixes for POODLE
		- [105437] `stackato-ssh` breaks when SSLv3 disabled
		- [105161] CVE-2014-5119 glibc vulnerability that leads to escalation

	- Misc
		- [105068] DEA lockup
		- [105514] Missing /usr/share/doc directory restored
		- [105513] run_fibered_command: Don't create /dev/fd if it already exists.
		- [104272] Staging and pre-running hooks abort if they return a non-zero exit code (as in v2.10).
		- [105590] Longer default health check timeouts. Modified settings will need to be reset after an upgrade from v3.4.1.
			- cloud_controller_ng/maximum_health_check_timeout is now 1800 seconds (30min)
			- dea_ng/default_health_check_timeout is now 300 seconds (5min)
		- [104166] app_store and app_mdns can't connect to redis after restart
		- [105702] AOK: LDAP fix (omniauth-ldap)
		- [105430] Update to latest available kernel
		- [105432] AOK: AD LDAP auth failing - Encoding::UndefinedConversionError, "x82" from ASCII-8BIT to UTF-8
		- [105410] Better Docker base image update/upgrade instructions
		- [105365] Make all periodic-timer intervals configurable and responsive
		- [105372] Stackato-tty crashes if VM window confines text rendering
		- [105339] Prevent use of routes already deployed in different Org or Space
		- [105335] Problem with file view when using a load balancer (407 error)
		- [105333] Cloud Controller memory leak
		- [105246] Can't delete migrated (3.2 to 3.4) applications
		- [105148] Updated cf-services-connector-nodejs to match current service API
		- [105110] Fixed rack support in Legacy Buildpack
		- [105066] Run app/.profile.d scripts being run with bash instead of dash
		- [105049] Updated recommendation for minimum disk size (30GB)
		- [104972] CSS delayed visibility in customized web console
		- [104963] Org/Space Customization does not work when a non-default quota is specified
		- [104898] Setting up Postgres external service changes internal Postgres password
		- [104882] Exceptions are getting wrapped up in unhelpful "An unknown error occurred" exceptions
		- [104817] hastebin app: use filesystem service for storage instead of redi
		- [104807] apptail configuration problems showing in Cloud Events of upgraded systems
		- [104796] Application view button on spaces Apps view doesn't work
		- [104794] PostgreSQL external service - error after kato restart postgresql
		- [104787] Can't deploy to api.paas.as.com - "Cannot allocate memory - unzip -l"
		- [104782] helion report support help in console has incorrect syntax
		- [104757] Upgrades - exit out of an upgrade as early as possible if all nodes are already on the latest version 
		- [104728] Two apps can communicate only under limited circumstances
		- [104702] uninitialized constant VCAP::CloudController::App::InvalidRouteRelation
		- [104694] Staging cannot find admin_buildpacks directories on sandbox
		- [104692] Legacy import sometimes creates routes with a leading '.'
		- [104689] Disk usage after upgrade increases by ~5GB
		- [104680] Changes in app_bits_controller.rb lost in 2014-05 merge
		- [104664] AWS upgrade from 3.2.1 fails at Buildpack phase
		- [104635] Hardcoded strings in license settings view
		- [104627] Endless redirect loop in console when enforcing https on the api endpoint
		- [104605] cannot delete apps whose services got disabled
		- [104592] Deleting one user from a space deletes every user from that space
		- [104570] Applications > Versions: If app has never been started, there is nothing on the versions page
		- [104561] Imported Java applications don't auto-configure for RabbitMQ
		- [104421] Retry different route if default route is unavailable during legacy import
		- [104358] %age calculations in bar usage graphs (e.g. DEA, AZ, PZ memory graphs) incorrect
		- [104077] App store app 'calipso' doesn't deploy
		- [103994] Push version info into the timeline
		- [103390] Inconsistent prefixes in app logs
		- [104672] Appstore urls don't get rewritten during upgrade from 3.2 that was previously upgraded from 3.0
		- [104560] nats-pub and nats-sub missing
		- [104470] Quota Definitions -> Quota Plans (CF terminology change)
		- [104487] Default space for ldap users should be generated based on user's email/login creds
		- [104396] "git clone" hangs in proxy environment
	- ALS client updated to 3.2.0
		- [105710] Ensured that filename in buildpack upload ends in ".zip" to avoid the moronic target-side type check by file extension.
		- [104659] Implemented handling of branded log prefix for system/app distinction.
		- [105708] Removed the `admin patch` command.
		- [105652] Fixed code ordering issue which caused use of an outdated client object.
		- [105644] Added SSL/TLS cert validation, and opt-out. Option` --skip-ssl-validation bool`. Env. Variable STACKATO_SKIP_SSL_VALIDATION. Sticky setting when used with `target` command.
		- [105637] Do not ask the user for a missing current org when the command spaces is invoked with option `--all`, as this mode does not require an org.
		- [105648] Generate a proper error message when the command `delete --all` is invoked without a current space, instead of crashing.
		- [105631] Extended the commands `org-users` and `space-users` with support for option `--json`.
		- [105192] Extended help for parameters based on the "memspec" validation type (units used, syntax).
		- Added new option `--all` to the command spaces. When used the command will show all spaces across all orgs, instead of just the spaces in the current/chosen org.
		- Implemented the restage command for applications.
		- [105490] Capture json and other errors in a bad `--token-file`, and report them properly instead of as internal error.
		- [105019] Tweak the help text of push option `--force-war-unpacking` for clarity.
		- [103548] Implemented migration of applications across spaces and orgs.
		- [105497] Keep the original filename of a buildpack on upload, even when going through temp files (like used for uploading by url, and to remove a superfluous top-level directory).
		- [105518] Modified low-level REST code to reset an output channel on redirection, as a redirection may come with its own, unwanted, response body. Seen with buildpack downloads from github, adding a redirection message in front of the retrieved zip archive. While not breaking the archive this is a bug waiting to happen for other places.
		- Global options and proper option argument types in help texts. Option `--colormode`.
		- Support for feature flags, security groups, and space quotas.
		- Command `push` (as update). Added generation of sensible output for when 0-downtime switch-over was available and got triggered.
		- Added undocumented debug option `--keep-form` to commands `create-buildpack` and `update-buildpack`. Taking a path argument its use allows introspection of the form-data generated and uploaded by the client.

## Known Issues {#known}

1. **ALS Cluster Create via UI does not provide a way to input proxy settings.** Either use [the workaround](/helion/devplatform/1.2/als/admin/server/configuration/#http-proxy) to input proxy settings or create the cluster with the [ALS Cluster Management Tool](/helion/devplatform/1.2/als/client/reference/).

3. **Inaccessible Clusters Can Be Restarted** If an ALS cluster becomes inaccessible due to environment issues, it can be restarted from the [kato command line](/helion/devplatform/1.2/als/admin/reference/kato-ref/).

4. **Live Migration of Instance in Stopped, Suspended, or Rescued State May Fail** Make sure instances are not in the Stopped, Suspended, or Rescued state before attempting to migrate them to a new host. A 400 error may appear; a message "Failed to migrate instance..." may be received; or the client may quietly time out, leaving the instance stuck in the Migrating state and thus unmanageable. 

3. **Install supported from within Admin project only**: When using the Horizon console, select only the **Admin** tenant before running the installer. Do not run the installer from any other projects.

3. **Password Field is not used when creating a RabbitMQ cluster**. The password field in the Horizon panel is not necessary when creating a RabbitMQ cluster and will be ignored. This is a known issue and will be fixed in the next release.

3. **Download PEM not working in the RabbitMQ Panel for the Messaging Service**. In Safari browsers only, clicking the button to download a PEM file results in an error. 

4. **RabbitMQ cluster creation fails when a floating IP pool has not been selected**. You must select a floating IP pool when creating a RabbitMQ cluster in the messaging service.

5. **Use the correct network to connect to an ALS cluster**. This note applies only if your ALS cluster administrator has not created additional, custom domains for your use. <br />By default, when pushing applications to ALS, you will be presented with two domains for the new application: a xip.io address (example: *10.0.0.1.xip.io*) and a local domain (example: *hphelion-xyz.local*). When connecting to the ALS Cluster over a network, select the xip.io domain to allow clients to connect to the deployed application. Do not select the local network. 

5. **Development Platform Update Fails**. Occasionally, updating the Development Platform may fail at configuring HAproxy.  This is a known issue.


----
