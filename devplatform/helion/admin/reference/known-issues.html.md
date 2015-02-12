---
layout: default-devplatform
permalink: /als/v1/admin/reference/known-issues/
product: devplatform
title: "Known Issues"
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer
role2: Security Engineer
role3: ISV Developer 
role4: Service Developer
role5: Network Administrator
role6: Systems Administrator 
writer: Jayme P

---
<!--UNDER REVISION-->

# HP Helion Development Platform: Known Issues[](#known-issues "Permalink to this headline")

Please keep up to date with the latest Known Issues, FAQs and announcements in our [online Application Lifecycle Service forums](https://community.dev.hp.com/t5/Forum/bd-p/cloud_board).

##1.1
###Changing the MBUS IP (Core node)

If the IP address of the Core node changes, you must reconfigure the cluster to use the new MBUS IP address. Run [kato node migrate](/als/v1/admin/reference/kato-ref#kato-command-ref-node-migrate) or [kato op static_ip](/als/v1/admin/server/configuration#server-config-static-ip) on the Core node, then [kato node attach](als/v1/admin/cluster/index#server-cluster-attach) on all other cluster nodes to set the new MBUS IP.

###Adding New Relic Repositories

The New Relic system monitoring (**newrelic-sysmond**) and PHP application monitoring (**newrelic-php5**) packages are no longer pre-installed in the ALS default Docker base container.

To allow end users to install these packages in the [requirements](/als/v1/user/deploy/stackatoyml#stackato-yml-requirements) section of their application config, admins should [add New Relic repository URLS and keys](als/v1/admin/server/configuration#server-config-allowed-repositories) to the system configuration.

###security&#95;groups_ids in autoscaling.yaml

The **security\_group** key in the EC2 section of autoscaling.yml has been changed to **security&#95;groups_ids**. Specify the AWS Security Groups by ID rather than name in this setting.

If you are upgrading a cluster that already has DEA autoscaling configured, the settings should be manually modified to use the new key.

###PHP 5.5 Repositories

PHP 5.5 in contained in the default Docker image. This version is more recent than the one available in the standard Ubuntu repositories.

To get updates for PHP 5.5 or add additional modules (globally or as user-defined requirements for applications), a third-party package repository must be added to the Allowed Repos list.

Administrators can add the [PPA for PHP 5.5](https://launchpad.net/~ondrej/+archive/php5) or import from a  repository supporting compatible packages via kato:

		kato config push cloud_controller_ng allowed_repos \
		"deb http://ppa.launchpad.net/ondrej/php5/ubuntu precise main"

###Kato data users export|import broken

The** kato data users export** and **kato data users import** commands, which save and load lists of users to and from CSV files, are non-functional in the current release. The [kato data import]((/als/v1/admin/reference/kato-ref#kato-command-ref-data-import) and [kato data export](/als/v1/admin/reference/kato-ref#kato-command-ref-data-export) commands are still available for migrating users from one ALS installation to another.

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
<tr><td>stackato-tty.log</td><td>(Stackato TTY console); manually inspect /s/logs/stackato-tty.log on all nodes.</td></tr>
</table> 
 
##1.01 and previous

###Buildpack config\_vars Deprecated[](#buildpack-config-vars-deprecated "Permalink to this headline") 

- [Buildpack config\_vars Deprecated](#buildpack-config-vars-deprecated)
    -   [Legacy Buildpack and Environment
        Variables](#legacy-buildpack-and-environment-variables)
    -   [Service Gateway Log Errors in Maintenance
        Mode](#service-gateway-log-errors-in-maintenance-mode)
    -   [Nodes with FATAL or perpetually STARTING
        processes](#nodes-with-fatal-or-perpetually-starting-processes)
    -   [Avoiding App Reliance on IP
        Addresses](#avoiding-app-reliance-on-ip-addresses)
    -   [Community Forums](#community-forums)

Buildpacks used to rely on the `config_vars` feature
of *bin/release* to set environment variables, but this has been
deprecated by Heroku.

The replacement mechanism is to [crea= e a shell script in
\$HOME/.profile.d](https://devcenter.heroku.com/articles/profiled) to
set environment variables. This mechanism is fully supported in Application Lifecycle Service
/ Cloud Foundry v2, and is used by all of the built-in buildpacks.

###Legacy Buildpack and Environment Variables[](#legacy-buildpack-and-environment-variables "Permalink to this headline")

When using the [Legacy Buildpack](/als/v1/user/deploy/buildpack/#buildpacks), environment variable values defined in *manifest.yml* cannot be updated without re-pushing the application with new settings. Changes to variables made in the Management Console will be
overwritten by the original ones defined at push when the application is restarted.

To modify custom environment variables, re-push the application after changing the values in *manifest.yml*.

###Service Gateway Log Errors in Maintenance Mode[](#service-gateway-log-errors-in-maintenance-mode "Permalink to this headline")

With Application Lifecycle Service set in [*Maintenance
Mode*](/als/v1/admin/console/customize/#console-settings), all "\_gateway"
processes will report the following error once per minute:

    Failed registering with cloud controller, status=503

This is normal, and can be safely ignored. The service nodes will
reconnect once the Controller is taken out of Maintenance Mode.

###Nodes with FATAL or perpetually STARTING processes[](#nodes-with-fatal-or-perpetually-starting-processes "Permalink to this headline")

If the Core node of an Application Lifecycle Service cluster is offline for more than 90
seconds, `kato status` will show processes on other
nodes (systail, apptail, router and others) in a FATAL or (hung)
STARTING state. These processes will not automatically reconnect to the
Core node.

To correct this, run `kato start` (for FATAL
processes) or `kato restart` (for STARTING
processes) on all affected nodes.

###Avoiding App Reliance on IP Addresses[](#avoiding-app-reliance-on-ip-addresses "Permalink to this headline")

Cluster configurations make use of private IP addresses for identifying
the various cluster nodes. Best practice is to avoid the literal use of
these addresses wherever possible, as these addresses are subject to
change with cluster configuration.

If the VM instance can locally resolve a hostname rather than an IP
address, it's generally best practice to use the hostname.

If not, Application Lifecycle Service provides various [*environment
variables*](/als/v1/user/reference/environment/#environment-variables)
so that applications do not need to hardcode them at install time. Some
examples are `VCAP_SERVICES` and `DATABASE_URL`. We strongly encourage their use.

A known issue is that some applications have install procedures that
can't be configured to make use of these variables. If the server that's
providing the app's database (mysql\_gateway/node for example) gets
moved to another location, the only way for the app to become aware of
the new credentials is by restaging the app as noted below. A restart
isn't sufficient.

Choose one of the following according to need, either:

    $ helion delete -n
    $ helion push -n

or:

    $ helion delete -n
    $ helion update -n

Another possible workaround in such cases is to write a script that will
pull the credentials from `VCAP_SERVICES` and update
the app's config as needed, then add this script to the pre-running
hooks.