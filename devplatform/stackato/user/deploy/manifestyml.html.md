---
layout: default-devplatform
permalink: /als/v1/user/deploy/manifestyml/
---
<!--PUBLISHED-->

Manifest.yml Options[](#manifest-yml-options "Permalink to this headline")
===========================================================================
[applications](#applications)
    -   [depends-on](#depends-on)
    -   [helion](#helion)

Using a *manifest.yml* file is the standard configuration file format for all
Cloud Foundry systems, allowing for portability from those systems to
Application Lifecycle Service without configuration changes.

The client uses the keys to determine values
that are otherwise passed by the user as arguments or as answers to
prompts.

The options below are specific to the *manifest.yml* file. 

applications:[](#applications "Permalink to this headline")
------------------------------------------------------------

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

depends-on:[](#depends-on "Permalink to this headline")
--------------------------------------------------------

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

helion:[](#helion "Permalink to this headline")
----------------------------------------------------

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
        framework:
          name: python
          runtime: python27
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

