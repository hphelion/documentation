---
layout: default-devplatform
permalink: /helion/devplatform/1.2/als/admin/reference/known-issues/
product: devplatform2.0
title: "HP Helion 1.2 Development Platform: Known Issues"
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer
role2: Security Engineer
role3: ISV Developer 
role4: Service Developer
role5: Network Administrator
role6: Systems Administrator 
authors: Jayme P

---
<!--UNDER REVISION-->

# HP Helion 1.2 Development Platform: Known Issues[](#known-issues "Permalink to this headline")
[See the Helion 1.0 Development Platform version of this page](/als/v1/admin/reference/known-issues/)

Please keep up to date with the latest Known Issues, FAQs and announcements in our [online Application Lifecycle Service forums](https://community.dev.hp.com/t5/Forum/bd-p/cloud_board).

##1.1
###Changing the MBUS IP (Core node)

If the IP address of the Core node changes, you must reconfigure the cluster to use the new MBUS IP address. Run [kato node migrate](/helion/devplatform/1.2/als/admin/reference/kato-ref#kato-command-ref-node-migrate) or [kato op static ip](/helion/devplatform/1.2/als/admin/reference/kato-ref/#kato-command-ref-op-static_ip) on the Core node, then [kato node attach](/helion/devplatform/1.2/als/admin/reference/kato-ref/#kato-command-ref-node-attach) on all other cluster nodes to set the new MBUS IP.

###Adding New Relic Repositories

The New Relic system monitoring (**newrelic-sysmond**) and PHP application monitoring (**newrelic-php5**) packages are no longer pre-installed in the ALS default Docker base container.

To allow end users to install these packages in the [requirements](/helion/devplatform/1.2/als/user/deploy/manifestyml/#requirements) section of their application config, admins should [add New Relic repository URLS and keys](/helion/devplatform/1.2/als/admin/server/configuration/#allowed-repositories) to the system configuration.

###PHP 5.5 Repositories

PHP 5.5 in contained in the default Docker image. This version is more recent than the one available in the standard Ubuntu repositories.

To get updates for PHP 5.5 or add additional modules (globally or as user-defined requirements for applications), a third-party package repository must be added to the Allowed Repos list.

Administrators can add the [PPA for PHP 5.5](https://launchpad.net/~ondrej/+archive/php5) or import from a  repository supporting compatible packages via kato:

	kato config push cloud_controller_ng allowed_repos \
	"deb http://ppa.launchpad.net/ondrej/php5/ubuntu precise main"

###Kato data users export/import broken

The **kato data users export** and **kato data users import** commands, which save and load lists of users to and from CSV files, are non-functional in the current release. The [kato data import](/helion/devplatform/1.2/als/admin/reference/kato-ref#kato-command-ref-data-import) and [kato data export](/helion/devplatform/1.2/als/admin/reference/kato-ref#kato-command-ref-data-export) commands are still available for migrating users from one ALS installation to another.

###Kato node reset factory with NOPASSWD

The kato **node reset factory** command will not work if **NOPASSWD** has been set for the admin account in */etc/sudoers*. To work around this, revert the change to */etc/sudoers* before resetting or start over with a new ALS VM.

###Cloud Events not gathering logs from some processes

Certain processes noted below use non-standard logging formats and are therefore not included in the Cloud Events log stream. So, for example, they will not appear in the Cloud Events view in the Horizon Console.

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Process</b></td><td><b>Log Location</b></td>
</tr>
<tr><td>router2g </td><td>(ALS router). Manually inspect */s/logs/router2g.log* on Router nodes.</td></tr>
<tr><td>stackato\_rest</td><td>(ALS-specific web service); manually inspect /s/logs/stackato_rest.log on Controller nodes.</td></tr>
<tr><td>harbor_proxy_connector</td><td>(Harbor); manually inspect /s/logs/harbor_proxy_connector.log on Harbor nodes.</td></tr>
<tr><td>cc_upload_server</td><td>(CC upload server); manually inspect /s/logs/cloud_controller_upload_server.log on Controller nodes.</td></tr>
<tr><td>stackato-tty.log</td><td>(ALS TTY console); manually inspect /s/logs/stackato-tty.log on all nodes.</td></tr>
</table> 
 
##1.01 and previous

####Buildpack config\_vars Deprecated {#buildpack-config-vars-deprecated}

Buildpacks used to rely on the `config_vars` feature of *bin/release* to set environment variables, but this has been deprecated by Heroku.

The replacement mechanism is to [create a shell script in \$HOME/.profile.d](https://devcenter.heroku.com/articles/profiled) to
set environment variables. This mechanism is fully supported by the Application Lifecycle Service and is used by all of the built-in buildpacks.

####Legacy Buildpack and Environment Variables {#legacy-buildpack-and-environment-variables} 

When using the [Legacy Buildpack](/helion/devplatform/1.2/als/user/deploy/buildpack/#buildpacks), environment variable values defined in *manifest.yml* cannot be updated without re-pushing the application with new settings. Changes to variables made in the Management Console will be
overwritten by the original ones defined at push when the application is restarted.

To modify custom environment variables, re-push the application after changing the values in *manifest.yml*.

####Service Gateway Log Errors in Maintenance Mode {#service-gateway-log-errors-in-maintenance-mode}

With Application Lifecycle Service set in [*Maintenance
Mode*](/helion/devplatform/1.2/als/admin/console/customize/#console-settings), all "\_gateway"
processes will report the following error once per minute:

    Failed registering with cloud controller, status=503

This is normal, and can be safely ignored. The service nodes will
reconnect once the Controller is taken out of Maintenance Mode.

####Nodes with FATAL or perpetually STARTING processes {#nodes-with-fatal-or-perpetually-starting-processes}

If the Core node of an Application Lifecycle Service cluster is offline for more than 90
seconds, `kato status` will show processes on other
nodes (systail, apptail, router and others) in a FATAL or (hung)
STARTING state. These processes will not automatically reconnect to the
Core node.

To correct this, run `kato start` (for FATAL
processes) or `kato restart` (for STARTING
processes) on all affected nodes.

###Avoiding App Reliance on IP Addresses {#avoiding-app-reliance-on-ip-addresses}

Cluster configurations make use of private IP addresses for identifying
the various cluster nodes. Best practice is to avoid the literal use of
these addresses wherever possible, as these addresses are subject to
change with cluster configuration.

If the VM instance can locally resolve a hostname rather than an IP
address, it's generally best practice to use the hostname.

If not, Application Lifecycle Service provides various [environment variables](/helion/devplatform/1.2/als/user/reference/environment/#environment-variables)
so that applications do not need to hardcode them at install time. Some
examples are `VCAP_SERVICES` and `DATABASE_URL`. We strongly encourage their use.

A known issue is that some applications have install procedures that
can't be configured to make use of these variables. If the server that's
providing the app's database (mysql\_gateway/node for example) gets
moved to another location, the only way for the app to become aware of
the new credentials is by restaging the app as noted below. A restart
is **not** sufficient.

Choose one of the following sets of commands according to need:

    helion delete -n
    helion push -n

or:

    helion delete -n
    helion update -n

Another possible workaround in such cases is to write a script that will pull the credentials from `VCAP_SERVICES`, update the app's configuration as needed, and then add this script to the pre-running hooks.
