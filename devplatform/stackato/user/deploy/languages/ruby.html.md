---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/ruby/
---
<!--PUBLISHED-->

Ruby[](#ruby "Permalink to this headline")
===========================================

Deployment[](#deployment "Permalink to this headline")
-------------------------------------------------------

**Note**

See [*Buildpacks*](/als/v1/user/deploy/buildpack/#buildpacks) for an alternative way
to deploy Ruby on Rails applications.

### Using Ruby 2.0[](#using-ruby-2-0 "Permalink to this headline")

The stackato.yml must specify the Ruby runtime version and Rails as the
framework type:

    framework:
      runtime: ruby20

Default Ruby version is Ruby 1.9

### Known Issues[](#known-issues "Permalink to this headline")

-   Rmagick gem currently not supported.

-   PostgreSQL Gem (pg) version must be pinned to 0.12.2 (if used):

        gem 'pg', '0.12.2'

-   Must specify Rake Gem immediately before the line loading rails.
    This happens because when Rails loads, it finds version 0.9.2 of
    Rake, and that becomes the only version of Rake in the process.
    Later code wants version 0.9.2.2, and fails:

        gem 'rake', '0.9.2.2'
        gem 'rails'

-   For Ruby 1.9 Cloud Foundry requires a tweak to the jquery-rails gem.

    > gem 'cloudfoundry-jquery-rails'

### Ruby on Rails 3.1+[](#ruby-on-rails-3-1 "Permalink to this headline")

To get the asset pipeline working on Application Lifecycle Service, precompile your assets in
your development environment, which compiles them into public/assets:

    bundle exec rake assets:precompile

### Gems and Libraries[](#gems-and-libraries "Permalink to this headline")

A *Gemfile* must be included in your app that lists all required gems.
Run:

    $ bundle install
    $ bundle package

any time you modify the *Gemfile* and prior to pushing an app to
Application Lifecycle Service.

If VCAP sees a Gemfile.lock in the application, it will ensure the
needed gems are packaged, and set the BUNDLE\_PATH environment variable
to point at them.

Unsupported *Gemfile* features:

1.  git urls or branch dependencies
2.  gem :path =\> "some/path"
3.  platform-conditional gems

Database Services[](#database-services "Permalink to this headline")
---------------------------------------------------------------------

Cloud Foundry supports database auto-reconfiguration for Rails
applications.

Worker Applications[](#worker-applications "Permalink to this headline")
-------------------------------------------------------------------------

Non-HTTP apps that run as an Application Lifecycle Service application under the control of
the Health Manager.

To deploy worker applications, you need to use the
[*command*](/als/v1/user/deploy/stackatoyml/#stackato-yml-command) key and set the
[*proceses: web*](/als/v1/user/deploy/stackatoyml/#stackato-yml-processes-web-null)
key to Null ("\~").

### Example[](#example "Permalink to this headline")

    name: ruby-app
    framework:
      type: rails3
      runtime: ruby19
    command: ruby worker.rb
    processes:
      web: ~

General Guidelines[](#general-guidelines "Permalink to this headline")
-----------------------------------------------------------------------

### App/Web Servers[](#app-web-servers "Permalink to this headline")

For the best performance, using Thin Ruby web server is recommended.
Include `gem 'thin'` in your *Gemfile*.

-   [Using Thin
    Webserver](https://devcenter.heroku.com/articles/ruby#webserver):
    Heroku Dev Center.

### Bundler[](#bundler "Permalink to this headline")

First, you need bundler and rails installed locally. This can be done
via:

    $ sudo gem install rails bundler --no-ri --no-rdoc

### Running rake commands[](#running-rake-commands "Permalink to this headline")

Generally, `bundle exec` must be used when running
any commands that are installed through Gemfile/bundler.

To run `rake stats`, for instance, use the
`helion run` command:

    $ helion run *appname* bundle exec rake stats

See the [*Command
Reference*](/als/v1/user/reference/client-ref/#command-ref-client) for
details on the use of `helion run`.

References[](#references "Permalink to this headline")
-------------------------------------------------------

-   [Auto-Reconfiguration Part
    I](http://blog.cloudfoundry.com/2012/03/12/using-cloud-foundry-services-with-ruby-part-1-auto-reconfiguration/):
    Cloud Foundry Blog.
-   [Auto-Reconfiguration Part
    II](http://blog.cloudfoundry.com/2012/03/15/using-cloud-foundry-services-with-ruby-part-2-run-time-support-for-ruby-applications):
    Cloud Foundry Blog.
-   [Working with Ruby, Rails and Sinatra: Things to
    know](http://docs.cloudfoundry.com/frameworks/ruby/ruby-rails-sinatra):
    Cloud Foundry Documentation.

### [Table Of Contents](/als/v1/index-2/)

-   [Ruby](#)
    -   [Deployment](#deployment)
        -   [Using Ruby 2.0](#using-ruby-2-0)
        -   [Known Issues](#known-issues)
        -   [Ruby on Rails 3.1+](#ruby-on-rails-3-1)
        -   [Gems and Libraries](#gems-and-libraries)
    -   [Database Services](#database-services)
    -   [Worker Applications](#worker-applications)
        -   [Example](#example)
    -   [General Guidelines](#general-guidelines)
        -   [App/Web Servers](#app-web-servers)
        -   [Bundler](#bundler)
        -   [Running rake commands](#running-rake-commands)
    -   [References](#references)

