---
layout: default-devplatform
permalink: /als/v1/user/deploy/newrelic/
product: devplatform
title: "New Relic Monitoring"
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1

---
<!--PUBLISHED-->
<!-- file deliberately orphaned, functionality not currently supported although it may work 
-->

# HP Helion Development Platform: New Relic Monitoring {#new-relic-monitoring}

   [New Relic for Ruby](#new-relic-for-ruby)
        -   [The Ruby Gem](#the-ruby-gem)
        -   [Installing the Ruby agent with the Bundler Gem](#installing-the-ruby-agent-with-the-bundler-gem)
        -   [Configuration File](#configuration-file)
    -   [New Relic for Python](#new-relic-for-python)
        -   [Bottle Currency Example](#bottle-currency-example)
    -   [New Relic for Java](#new-relic-for-java)
        -   [Pet Catalog Example](#pet-catalog-example)
    -   [New Relic for PHP](#new-relic-for-php)
        -   [WordPress Example](#wordpress-example)
    -   [Results](#results)
 
**Note**

These instructions are for use with Application Lifecycle Service. For further details,
please see the [New Relic
site](http://newrelic.com/docs/python/new-relic-for-python).

New Relic can be used to track your application analytics running in
Application Lifecycle Service as well as for server monitoring. The languages it can
currently be used with are:

1.  [Ruby](#newrelic-ruby)
2.  [Python](#newrelic-python)
3.  [Java](#newrelic-java)
4.  [PHP](#newrelic-php)

In order to use New Relic, you need a [New Relic
account](http://newrelic.com/).

**Note**

For security reasons, avoid committing your license key to source
control.

New Relic for Ruby[](#new-relic-for-ruby "Permalink to this headline")
-----------------------------------------------------------------------

### The Ruby Gem[](#the-ruby-gem "Permalink to this headline")

New Relic recommends installing the New Relic Ruby gem available on
gemcutter as `newrelic_rpm`:

    $ sudo gem install newrelic_rpm

Update the Ruby Gem at any time by running:

    $ sudo gem update newrelic_rpm

Once the Ruby Gem is installed, add this line to your *Gemfile*:

    $ gem 'newrelic_rpm'

### Installing the Ruby agent with the Bundler Gem[](#installing-the-ruby-agent-with-the-bundler-gem "Permalink to this headline")

Add the gem specification to your *Gemfile*. It's best to place the New
Relic gem as low in the list as possible, allowing the frameworks above
it to be instrumented when the gem initializes:

    $ gem 'newrelic_rpm'

In the same folder as the *Gemfile*, run:

    $ bundle install

### Configuration File[](#configuration-file "Permalink to this headline")

After installing the agent, copy the newrelic.yml file into the config
subdirectory of your application. You can download a fresh newrelic.yml
that includes your license key from the Account Settings link when
logged in to [rpm.newrelic.com](http://rpm.newrelic.com/).

Whenever you update the agent, double-check that your Agent
configuration file (*config/newrelic.yml*) is up to date. To do this,
you'll need to do a visual inspection of the default *newrelic.yml* file
that lives in the Agent plugin folder
(*vendor/plugins/newrelic\_rpm/newrelic.yml*). Look for new
configuration options that aren't in your *config/newrelic.yml* file.

New Relic for Python[](#new-relic-for-python "Permalink to this headline")
---------------------------------------------------------------------------

The New Relic Python agent is pre-installed on Application Lifecycle Service.

The minimal steps required to integrate New Relic to your Python WSGI
application:

1.  At the top of *wsgi.py*, add:

        import newrelic.agent
        newrelic.agent.initialize()

2.  In *wsgi.py*, wrap your `application` WSGI entry
    point, eg:

        application = newrelic.agent.wsgi_application()(application)

3.  Add required newrelic environment variables to *manifest.yml*:

        env:
              NEW_RELIC_LOG: stderr
              NEW_RELIC_LOG_LEVEL: DEBUG  # <- this is optional
              NEW_RELIC_APP_NAME: <your application name>
              NEW_RELIC_LICENSE_KEY: <your license key>

An alternative to modifying your python is to wrap
`$PROCESSES_WEB` in *manifest.yml* with
[newrelic-admin](https://newrelic.com/docs/python/python-agent-admin-script).

### Bottle Currency Example[](#bottle-currency-example "Permalink to this headline")

[Bottle Currency with New Relic on
GitHub](https://github.com/Stackato-Apps/bottle-currency/tree/newrelic).

New Relic for Java[](#new-relic-for-java "Permalink to this headline")
-----------------------------------------------------------------------

The New Relic Java agent is **not** pre-installed on the Application Lifecycle Service VM. To
add monitoring, you must include the agent with your application.

-   Download a fresh newrelic\_agent\<version number\>.zip that includes
    your license key from the Account Settings link when logged in to
    [rpm.newrelic.com](http://rpm.newrelic.com/).

-   Unpack the zip file in a convenient directory to edit the
    newrelic.yml file inside.

-   Set the app\_name in newrelic.yml to the actual name of your
    application as you would like it to appear in your New Relic
    dashboard.

-   Save your changes and place the newrelic folder in the root
    directory of your application along with WEB-INF folder.

-   Add the following section to a "hooks" section in *
-   .yml*:

        hooks:
            pre-running:
            - mv newrelic $HELION_APP_ROOT/tomcat/
            - cd $HELION_APP_ROOT/tomcat/newrelic
            - java -jar newrelic.jar install

### Pet Catalog Example[](#pet-catalog-example "Permalink to this headline")

[Pet Catalog (Java EE) with New Relic on
GitHub](https://github.com/Stackato-Apps/pet-catalog/tree/newrelic).

New Relic for PHP[](#new-relic-for-php "Permalink to this headline")
---------------------------------------------------------------------

The New Relic agent PHP libraries are pre-installed on Application Lifecycle Service. To add
monitoring, you need to add an agent configuration file to the root
directory of the application and make some modifications to
*manifest.yml*.

-   Add a `newrelic.ini` file in
    [*HOME*](/als/v1/user/reference/environment/#term-home) directory
    containing the following:

        extension=newrelic.so

        newrelic.daemon.logfile="/home/helion/logs/newrelic-daemon.log"
        newrelic.daemon.loglevel="warning"

        newrelic.logfile="/home/helion/logs/php_agent.log"
        newrelic.loglevel="warning"

        newrelic.license="XXXXXXX-your-new-relic-key-XXXXXXXXXXX"
        newrelic.appname="YourAppName"

    The `license_key` can be found in your 'Account
    settings' page on New Relic.

    Set `newrelic.appname` to the actual name of
    your application as you would like it to appear in your New Relic
    dashboard.

    The above settings are described in detail in the [New Relic PHP
    Agent Settings
    documentation](http://newrelic.com/docs/php/php-agent-phpini-settings).

-   Add the following section to a "hooks" section in *manifest.yml*:

        hooks:
            pre-running:
            - mv -f newrelic.ini $HELION_APP_ROOT/apache/php/newrelic.ini

### WordPress Example[](#wordpress-example "Permalink to this headline")

[WordPress with New Relic on
GitHub](https://github.com/Stackato-Apps/wordpress/tree/newrelic).

Results[](#results "Permalink to this headline")
-------------------------------------------------

Push the app to the Application Lifecycle Service server, and make a few requests to it in a
browser. After a few minutes, check the New Relic dashboard to confirm
the information is being logged correctly.
