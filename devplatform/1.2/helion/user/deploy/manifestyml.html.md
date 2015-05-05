---
layout: default-devplatform
permalink: /helion/devplatform/als/user/deploy/manifestyml/
product: devplatform2.0
title: "HP Helion 1.2 Development Platform: Manifest.yml Options "
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer 
role2: ISV Developer
role3: Service Developer
role4: Systems Administrator
authors: Jayme P
---
<!--UNDER REVISION-->

# HP Helion 1.2 Development Platform: Manifest.yml Options {#manifest-yml-options}


The *manifest.yml* file sets application configuration options which are then passed to ALS during the [helion push](/helion/devplatform/als/user/reference/client-ref/management/#command-push) command.
 
This file is the standard application configuration file format for all Cloud Foundry systems, allowing for portability from those systems to Application Lifecycle Service without configuration changes. See [Application Manifests](http://docs.cloudfoundry.org/devguide/deploy-apps/manifest.html) for the complete canonical documentation. 

The client uses the keys to determine values that are otherwise passed by the user as arguments or as answers to prompts.

- [name:](#name)
- [applications](#applications)
	- [depends-on](#depends-on)
	- [helion](#helion)

- [buildpack:](#buildpack)
    -   [framework:](#framework)
        -   [type:](#type)
        -   [runtime:](#runtime)
        -   [document-root:](#document-root)
        -   [start-file:](#start-file)
    -   [app-dir](#app-dir)
    -   [services:](#services)
    -   [requirements:](#requirements)
        -   [OS Packages](#os-packages)
        -   [Language Modules](#language-modules)
    -   [mem:](#mem)
    -   [disk:](#disk)
    -   [instances:](#instances)
    -   [url (or urls):](#url-or-urls)
    -   [env:](#env)
        -   [env Attributes](#env-attributes)
    -   [processes:](#processes)
        -   [web:](#web)
    -   [command:](#command)
    -   [cron:](#cron)
    -   [ignores:](#ignores)
    -   [inherit:](#inherit)
    -   [hooks:](#hooks)
        -   [pre-push:](#pre-push)
        -   [pre-staging:](#pre-staging)
        -   [post-staging:](#post-staging)
        -   [pre-running:](#pre-running)
    -   [drain:](#drain)
    -   [min\_version:](#min-version)
        -   [client:](#client)
        -   [server:](#server)
    -   [Key Substitution](#key-substitution)


##applications: {#applications}

This key contains a list of options corresponding to individual apps to
be pushed. Each sub-key should match the name of folders where the files
for each app are contained. For example:

    applications:
      web:
        name: springweb
        framework:
          name: spring
        instances: 1
        mem: 512
      worker:
        name: springweb-helper
        framework:
          name: node
        instances: 1
        mem: 64

Here the two keys `web:` and `worker:` match subdirectories (named `web` and
`worker`) of the directory containing the
*manifest.yml* file.

The shortcut "." can be used if the application code is in the top level
directory along with the *manifest.yml* file:

    applications:
      .:
        name: singleapp
        framework:
          name: spring
        instances: 1
        mem: 512

###depends-on: {#depends-on}
When deploying multiple applications from a single *manifest.yml* use
the `depends-on:` key to set the order in which the
apps are started and stopped. An app with the `depends-on:` option will be pushed only after the listed apps have been
pushed and are running on the server.

In the previous example, if you wanted to ensure that `web` was started before `worker`, you would add
`depends-on: worker` in the `web:` section:

    applications:
      web:
        depends-on: worker
        name: springweb
        framework:
          name: spring
        instances: 1
        mem: 512
      worker:
        name: springweb-helper
        framework:
          name: node
        instances: 1
        mem: 64

If an app is stopped or restarted, the process happens in the reverse
order.

###helion: {#helion}
The following Application Lifecycle Service-specific options need to be placed in a
`helion:` block within the application block.

-   processes:
-   min\_version:
-   env:
-   ignores:
-   hooks:
-   cron:
-   requirements

For example:

    applications:
      .:
        name: celery-demo
		buildpack: https://github.com/ActiveState/stackato-buildpack-python.git
        mem: 128
        helion:
          env:
            CELERY_ENV:
              default: crisper
          processes:
            web: celeryd
          requirements:
            pypm: [celery]
          hooks:
            pre-running:
              - sudo cp $HOME/fstab /etc/fstab
              - sudo mount /dev/shm
          min_version:
            server: 0.9.0.143
            client: 1.0

Configuration options for Application Lifecycle Service applications can be stored in a
*manifest.yml* file in the top-level application directory.

The *manifest.yml* file defines **keys** and associated **values** which
the `helion` client uses to set options that are
otherwise passed by the user as command arguments or answers to prompts.
Other values are used by the server to install needed packages, or run
setup scripts during the staging, post-staging, or pre-running steps in
deployment.

[Key substitution](#key-substitution) can be used to
insert values from one key into another.

The following sections describe the available keys and the values that
can be assigned to them:

##name: {#name}
This is the name of the application being pushed. If not specified, the
user will be prompted during `helion push` to
provide a name. The name can also be specified on the command line (eg.
`helion push currency-converter`).

Example:

    name: currency-converter

**Note**

The application name must be a valid [hostname
label](http://en.wikipedia.org/wiki/Hostname#Restrictions_on_valid_host_names)
(i.e. containing only alphanumeric characters and hyphens).

buildpack:[](#buildpack "Permalink to this headline")
------------------------------------------------------

The Git repository URL for the specific
[buildpack](/helion/devplatform/als/user/deploy/buildpack/#buildpacks) used to deploy the application.
For example:

    name: java-app
    mem: 512M
    buildpack: https://github.com/heroku/heroku-buildpack-java.git

If unset, Application Lifecycle Service will check to see if the application triggers the
`detect` scripts in any of its [built-in
buildpacks](/helion/devplatform/als/user/deploy/buildpack/#buildpacks-built-in).

framework:[](#framework "Permalink to this headline")
------------------------------------------------------

Allows the app to specify a framework and runtime to be used. Specifying
a value for the `framework` key triggers the use of
the [Legacy Buildpack](/helion/devplatform/als/user/deploy/buildpack/#buildpacks-legacy).

**Note**

The keys in the `framework` section are used with
the [Legacy Buildpack](/helion/devplatform/als/user/deploy/buildpack/#buildpacks-legacy) only.
Applications using language or framework-specific buildpacks do not
require these values, and should instead specify the
[buildpack](#yml-buildpack) or rely on the detection scripts
of the [built-in buildpacks](/helion/devplatform/als/user/deploy/buildpack/#buildpacks-built-in).

### type:[](#type "Permalink to this headline")

The framework to use. Check `helion frameworks`
for a complete list of available frameworks. If not specified, user may
be prompted during `helion push`. Can also be
input with the command line option --framework, -f (eg.
`helion push --framework python`).

### runtime:[](#runtime "Permalink to this headline")

The runtime to use. Check `helion runtimes` for a
complete list of available runtimes. If not specified, server will
select the best option based on available data. Can also be input with
the command line option --runtime, -f (eg.
`helion push --runtime python32`).

Example:

    framework:
      type: python
      runtime: python32

### document-root:[](#document-root "Permalink to this headline")

Overrides the default document-root setting (\$HOME) for the web server.

**Note**

Node.js, Perl, PHP, and Python frameworks only.

Setting a deeper document root directory avoids the problem of exposing
supporting files (e.g. *manifest.yml*) over HTTP.

Example:

    framework:
      type: php
      document-root: web

The document-root must always be specified relative to \$HOME
(/home/helion/app).

### start-file:[](#start-file "Permalink to this headline")

Set the main application filename.

**Note**

Perl and Python frameworks only.

If your application does not use a conventional filename (e.g. app.psgi
for Perl, wsgi.py for Python) using this option, possibly in conjunction
with **document-root**, avoids the need to refactor the application for
Application Lifecycle Service. For example:

    framework:
      start-file: temp.psgi

Or:

    framework:
      start-file: temp.py

This value will be used by the
[PROCESSES\_WEB](/helion/devplatform/als/user/reference/environment/#term-processes-web) and
HELION\_START\_FILE environment variables. Any changes to
HELION\_START\_FILE at runtime will not change the value of
[PROCESSES\_WEB](/helion/devplatform/als/user/reference/environment/#term-processes-web) as
the macro is expanded before the pre-running hooks are run.

app-dir[](#app-dir "Permalink to this headline")
-------------------------------------------------

The directory containing the application code to be pushed to Application Lifecycle Service
(if it's not in the top-level directory). This directory becomes the
\$HOME directory of the application when the application is pushed to
Application Lifecycle Service. For example, Java applications will often have a 'target'
sub-directory containing the output of ant or mvn builds:

    name: sample
    framework:
      type: java_web
      runtime: java7
    app-dir: target

If required, you can also set
[document-root](#yml-document-root) in the
[framework](#yml-framework) section to specify a
sub-directory of the application \$HOME to be used as the document root.

To launch multiple applications from multiple sub-directories use a
[*manifest.yml*](/helion/devplatform/als/user/deploy/manifestyml/#manifest-yml) file.

###services: {#services}
A list of services to create and bind to the application. Each sub key
is the name of the service to create / bind, and the associated value is
the type of the new service. If multiple services of the same type are
needed, list them on separate lines as in the example below.

Use `helion services` for a complete list of
available services. If not specified, the user may be prompted during
`helion push`.

Example:

    services:
      customerdb: mysql
      paymentsdb: mysql

The Application Lifecycle Service client supports [key
substitution](#yml-key-substitution) for service names,
allowing you to create service names based on the specified application
name. For example:

    services:
      ${name}-db: mysql

The application name can be set as an option to the [helion push](/helion/devplatform/als/user/reference/client-ref/management/#command-push) command, overriding
the **name** value defined in *manifest.yml*. Use this technique when
pushing multiple versions of the same application (using different
names) if you want them to use separate databases. For example:

    name: sample

    framework:
      type: node

    services:
      ${name}-db: mysql

Using the name specified in *manifest.yml*, a data service is created to
match that name:

    helion push -n
    Pushing application 'sample'...
    Framework:       node
    Runtime:         <framework-specific default>
    Application Url: sample.helion-pjw3.local
    Creating Application [sample]: OK
    Binding service [sample-db]: OK
    ...
    Starting Application [sample]: ...OK

If you specify a new name for the application as an argument to
`helion push`, a new service with a matching name
is created rather than binding to the existing 'sample-db' service:

    helion push sample-2 -n
    Pushing application 'sample-2'...
    Framework:       node
    Runtime:         <framework-specific default>
    Application Url: sample-2.helion-pjw3.local
    Creating Application [sample-2]: OK
    Binding service [sample-2-db]: OK
    ...
    Starting Application [sample-2]: ..OK

    helion apps

    +-------------+---+---------+------------------------------+-------------+
    | Application | # | Health  | URLS                         | Services    |
    +-------------+---+---------+------------------------------+-------------+
    | sample      | 1 | RUNNING | sample.helion-pjw3.local   | sample-db   |
    | sample-2    | 1 | RUNNING | sample-2.helion-pjw3.local | sample-2-db |
    +-------------+---+---------+------------------------------+-------------+

### Requirements {#requirements}

Specifies required modules and allows the installation of additional OS
packages.

### OS Packages[](#os-packages "Permalink to this headline")

OS packages can be added in an `ubuntu:` block
within a `staging:` and/or `running:` block. Plain strings are treated as package names:

    requirements:
      staging:
        ubuntu:
          - libfoo-dev
      running:
        ubuntu:
          - libfoo
          - some-app

To add the OS requirements to both the staging and running phases add
the `ubuntu:` block directly beneath the
`requirements:` key:

    requirements:
      ubuntu:
        - libfoo-dev

If your account has been given sudo privileges in application
containers, you can use arrays to add additional repositories,
overriding repository restrictions set by admins.

Example:

    requirements:
      staging:
        ubuntu:
          - ["ppa:gophers/go"]
          - golang-stable
      running:
        ubuntu:
          - libfoo

### Language Modules[](#language-modules "Permalink to this headline")

For the installation of language modules, replace the
*requirements.txt* file. For Python, `pypm:` and `pip:` can be specified:

    requirements:
      pypm:
        - tornado
        - pymongo
      pip:
        - pycurl

For Perl, `ppm:` or `cpan:` can be specified:

    requirements:
      ppm:
        - CGI::Application::PSGI
        - Plack::Builder

    requirements:
      cpan:
        - CGI::Application::PSGI
        - Plack::Builder

mem:[](#mem "Permalink to this headline")
------------------------------------------

The amount of memory to allocate for the application.

Syntax: \<int\> or \<int\>M - Memory in megabytes. eg. 256M

Syntax: \<int\>G or \<float\>G - Memory in gigabytes. eg. 1.5G or 2G

If not specified, user may be prompted during `helion push`. Can also be specified on the command line (eg.
`helion push --mem 256M`).

Example:

    mem: 64M

disk:[](#disk "Permalink to this headline")
--------------------------------------------

The amount of disk space to allocate for the application (minimum
512MB).

Syntax: \<int\> or \<int\>M - Disk in megabytes. eg. 768M

Syntax: \<int\>G or \<float\>G - Disk in gigabytes. eg. 1.5G or 2G

If not specified, 2GB of disk space is allocated. Can also be specified
on the command line (eg. `helion push --disk 768M`).

Example:

    mem: 3.5GB

instances:[](#instances "Permalink to this headline")
------------------------------------------------------

The number of instances to allocate for the application. If not
specified, defaults to 1. Can be specified on the command line (eg.
`helion push --instances 2`).

Example:

    instances: 2

url (or urls):[](#url-or-urls "Permalink to this headline")
------------------------------------------------------------

List of URLs mapped to the application. For example:

    name: cms-platform

    url:
      - blog.example.org
      - exampleblog.com

With this key specified, Application Lifecycle Service will not assign a default
"appname.paasname.com" URL to the application. If you would like this
URL assigned as well, add `${name}.${target-base}`
to the list of URLs.

See [Mapping App URLs](index.html#deploy-map-url) for more
information.

env:[](#env "Permalink to this headline")
------------------------------------------

A map of environment variables to initialize for the application. Each
subkey is the name of the variable, with an associated value.

Example:

    env:
      HOME_IP_ADDRESS: 127.0.0.1

Avoid using this for values which should not be stored in plain text,
such as API keys and passwords.

### env Attributes[](#env-attributes "Permalink to this headline")

Each environment variable can have attributes which modify the
interactive behavior of the [ALS client](/helion/devplatform/als/user/reference/client-ref/) when using the
[push](/helion/devplatform/als/user/reference/client-ref/management/#command-push) command. These
attributes are set with the following keys:

-   **default** (string): The value to use if nothing is entered by the
    user interactively (no default).
-   **required** ([boolean](http://yaml.org/type/bool)): If set,
    the variable must have a value (defaults to "false" == "not
    required").
-   **inherit** (boolean): If set, the client looks in the local
    environment for a variable of the same name and takes its value
    (defaults to "false" == "no inheritance").
-   **prompt** (string): The prompt to show when the client asks for the
    variable value (Defaults to "Enter \<varname\>:").
-   **choices** (list of strings): If specified, a list of legal values
    for the variable, to be presented to the user as a menu rather than
    prompting for a string (no default).

For example:

    env:
      MY_SPECIAL_VAR:
        default: "development"
        required: y
        inherit: y
        prompt: "What type of deployment?: "
        choices:
          - "development"
          - "testing"
          - "staging"
          - "production"

Pushing with the `--no-prompt` option will fail with
the error message "Required variable *VAR\_NAME* not set" if "required"
is set but no value is given (via "default", "inherit" or the
`--env` option).

**Note**

These attributes are only recognized by the [ALS client](/helion/devplatform/als/user/reference/client-ref/).

##processes: {#processes}

### web: {#web}

**Note**

Used with the [Legacy buildpack](/helion/devplatform/als/user/deploy/buildpack/#buildpacks-legacy)
only. When using other buildpacks, create a
[Procfile](https://devcenter.heroku.com/articles/procfile) in the
application's root directory.

Specify a custom command to launch your web application or to pass
custom arguments to uWSGI. For example:

    processes:
      web: python3.2 app.py

This key is required when using the
[generic](/helion/devplatform/als/user/deploy/other-frameworks/#generic-framework) framework, but is
optionally available for all other frameworks.

**If defined**, this process is expected to launch a HTTP server bound
to `0.0.0.0` host and `$PORT`
port.

**If set to Null ("\~")**, the application is treated as a worker
application and not provisioned with a URL. For example, an application
that just runs a background Perl script might look like this:

    name: perlwork
    framework:
      type: perl
    command: perl worker.pl
    processes:
      web: ~

A 'command:' value must be present for worker applications.

If the application exists solely to run commands via
[cron](#yml-cron), a dummy command such as '*sleep 365d*'
should be specified.

The `$PROCESSES_WEB` and `$HELION_UWSGI` variables can also be used with `processes: web:`.

`$PROCESSES_WEB` contains the command that is used
to start the web application, if you want to override the default
command.

`$HELION_UWSGI` is defined for runtimes using
uWSGI (Perl and Python), and it contains the command to start uWSGI with
all relevant options. It can be used if you are appending additional
uWSGI options to the command.

command:[](#command "Permalink to this headline")
--------------------------------------------------

Used for worker applications to start a background process. Below is an
example using the
[standalone](/helion/devplatform/als/user/deploy/other-frameworks/#standalone-framework) framework:

    name: helion-worker
    instances: 1
    framework:
      type: standalone
      runtime: ruby18
    command: ruby worker.rb

cron:[](#cron "Permalink to this headline")
--------------------------------------------

Commands listed here are added to the crontab file. See the section on
[Crontab Support](index.html#deploy-crontab) for details.

Example:

    cron:
      - PLUGH=xyzzy
      - "*/1 * * * * env > $HOME/env"

ignores:[](#ignores "Permalink to this headline")
--------------------------------------------------

A list of .gitignore-style patterns. Files and directories in the
application directory matching at least one pattern are ignored during
"push" and "update".

Example:

    ignores: ["tmp", ".git"]

To include all hidden files or folders simply use an empty list.

Example:

    ignores: []

If not specified, a default list is used to exclude files and folders
not typically required in a deployed application (e.g. the dot files and
folders of various source code control systems).

The default list contains the following: \~\*/, .git/, \*.svn/, \*.hg/,
\*CVS/, \_FOSSIL\_.fos, \*.bzr, \*.cdv, \*.pc, \*RCS, \*SCCS,\*\_MTN,
\*\_build, \*\_darcs, \*\_sgbak, \*autom4te.cache, \*blib, \*cover\_db,
\*\~.dep, \*\~.dot, \*\~.nib, \*\~.plst

inherit:[](#inherit "Permalink to this headline")
--------------------------------------------------

This special key has the effect of treating its value as the name of a
file to be included into *manifest.yml*.

Example:

*parent.yml*:

    env:
      COMPANY: The ABC Company

*manifest.yml*:

    name: example-app
    inherit: parent.yml
    mem: 64M

effect from processing:

    name: example-app
    env:
      COMPANY: The ABC Company
    mem: 64M

##hooks: {#hooks}
Hooks are commands that are run at various point of the staging and
running process of an app.

### pre-push:[](#pre-push "Permalink to this headline")

Commands run **on the local system** before pushing the code to
Application Lifecycle Service. This can be useful for building source files (e.g. with
`make`) or performing configuration steps that need
to be done on the local system before the application code can be
pushed. Commands are executed between application creation (when the URL
and application resources are reserved) and the actual upload of the
local code.

The client will set the HELION\_HOOK\_ACTION variable to "create" if
the application is new, or "update" if it detects the application
already exists. You can use this variable to run hooks differently in
either context.

### pre-staging:[](#pre-staging "Permalink to this headline")

A list of commands to be run in the root of the app's directory before
the staging process is started. The commands are only run a single time
on push or update.

### post-staging:[](#post-staging "Permalink to this headline")

A list of commands to be run in the root of the app's directory after
the staging process is complete. The commands are only run a single time
on push or update.

### pre-running:[](#pre-running "Permalink to this headline")

A list of commands to be run in the root of the app's directory after
staging is complete and before the app is started. The commands are run
sequentially, in the order listed, each time an app is started or
restarted.

Example:

    hooks:
      pre-staging:
        - python prestagingsetup.py
      post-staging:
        - python manage.py syncdb --noinput
        - python manage.py migrate --noinput
      pre-running:
      - python prerunsetup.py

Hook processing ends and staging aborts if a command returns a nonzero
exit status (i.e. if the command fails). You can suppress this behavior
by prefacing the command with "-" to force staging to proceed despite
failures. The "-" must be included in a quoted command string. For
example:

    hooks:
      post-staging:
        - "-python manage.py syncdb --noinput"

Commands used in the `hooks:` keys may not include
shell metacharacters, such as "&&" for combining commands, "\#" for
comments, "\<", "\>" or "|" for I/O redirection.

If you need shell functionality such as metacharacters, signal trapping,
or forcing zero exit status, wrap your command in a *script.sh* file and
use `sh +x script.sh` as your hook command.

Also note that if only a single command needs to be run, the list format
is not needed and can be included on the same line:

    hooks:
      post-staging: python staging.py
      pre-running:  python running.py

drain:[](#drain "Permalink to this headline")
----------------------------------------------

[Application log drains](/helion/devplatform/als/user/deploy/app-logs/#application-logs-drain) can be
added to an application when it is deployed by describing them in a
`drain:` block with a drain name and URL:

    drain:
      drain_name: protocol://host.domain.tld:port/

To enable JSON logging, specify the URL separately along with a
`json: true` line:

    drain:
      drain_name:
        url: protocol://host.domain.tld:port/
        json: true

For example:

    drain:
      mytestdrain: udp://logs.loggly.com:12346/
      otherdrain:
        url: tcp://logs.papertrailapp.com:12345/
        json: true

min\_version:[](#min-version "Permalink to this headline")
-----------------------------------------------------------

Sets requirements for the minimum version of the client and server under
which the app will run.

### client:[](#client "Permalink to this headline")

The minimum version of the Application Lifecycle Service client needed to manage the app.

To determine the client version, use:

    helion version

    helion 0.3.13.0.18

Example:

    min_version:
      client: 0.3.13.0.18

### server:[](#server "Permalink to this headline")

The minimum version of the Application Lifecycle Service server needed to run the app.

##Key Substitution {#key-substitution}
The value of any key in *manifest.yml* can be inserted in other keys
using the \${*key*} syntax. For example:

    name: example-app
    env:
      MY_NAME: ${name}

This defines a "MY\_NAME" environment variable with the value
"example-app".

A small number of keys are predefined for your use within
*manifest.yml*:

	  ------------------------------------------------------------------------
	  key
	  substitution
	  value
	  -------------- ---------------------------------------------------------
	  \${random-word \${target-base}
	  }              The hostname of the targeted Application Lifecycle Service system, for
	  A short        example **helion-xxxx.local**
	  alphanumeric   
	  string of      
	  random         
	  characters     
	  ------------------------------------------------------------------------

**Note**
See the [services](#services) section for an example of variable key substitution for *yaml* key names.


<!-- ##stackato {#manifest-yml-stackato} 

The following Stackato-specific options, if necessary, need to be placed in a **stackato** block within the **Application** block. They are indented as sub-keys. 

processes <stackato_yml-processes>`: 
min_version <stackato_yml-version>`: 
ignores <stackato_yml-ignores>`: 
hooks <stackato_yml-hooks>`: 
cron <stackato_yml-cron>`: 
requirements <stackato_yml-requirements>`:

-->    
