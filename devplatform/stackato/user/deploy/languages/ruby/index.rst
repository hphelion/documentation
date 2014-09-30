.. index:: Ruby
.. _develop-in-ruby:

Developing In Ruby
==================

Whether you're deploying an application to the HP Helion Development Platform, a
Cloud Foundry based Platform as a Service (PaaS), or writing applications that take
advantage of HP Helion OpenStack® to manage infrastructure or software services, tools
to enable successful development are available in Ruby.

Application Lifecycle Services
------------------------------
Application Lifecycle Services (ALS), a cloud foundry based Platform as a Service,
provides a means to execute ruby applications on a managed platform. Deploying applications
to the platform is as simple as adding configuration to a YAML configuration file and using
a console application to push the application to ALS.

At its simplist form the configuration file, ``stackato.yml``, at the root of a project would like::

    name: ruby-web-app
    framework:
        type: ruby20

This will tell ALS to have a ruby web application.

To create a worker non-http application set the web process to null (~) and specify
the command to run. For example,

.. code-block:: yaml

    name: ruby-app
    framework:
      type: rails3
      runtime: ruby19
    command: ruby worker.rb
    processes:
        web: ~


Management of the deployed application and its services happens through a web application or
a console application.

To learn more see:

* `Working with applications in ruby <http://docs.hpcloud.com/als/v1/user/deploy/languages/ruby/>`_
* `The stackato.yml reference <http://docs.hpcloud.com/als/v1/user/deploy/stackatoyml/>`_



HP Helion SDK
-------------
Ruby applications can communicate directly with the `Helion APIs <http://docs.hpcloud.com/api>`_ through a REST client
or use the SDK. The SDK is designed to have a simple well documented API to simplify working with the
services.



To understand how it works, here is an example of writing and reading from object storage:

.. code-block:: ruby

    def credentials_hash
      {
        :provider => :openstack,
        :openstack_auth_url => ENV['OS_AUTH_URL'],
        :openstack_username => ENV['OS_USER'],
        :openstack_api_key => ENV['OS_API_KEY'],
        :openstack_tenant =>  ENV['OS_TENANT'] ,
        :openstack_region => ENV['OS_REGION']
      }
    end

    storage = Fog::Storage.new(credentials_hash)

    #list directories
    storage.directories

    #create a directory
    storage.directories.create(:key => "Example")

    #create an object
    dir = storage.directories.get("Example")
    dir.files.create(:key => "sample.txt", :body => File.open("/path/to/sample.txt"))

    #get the same object out
    dir = conn.directories.get("Example")
    file = dir.files.get("sample.txt")
    file.key   # => sample.txt
    file.content_type # => text/plain


To learn more about getting and using the SDK see:

* :ref:`Get Started With the Ruby Library <getting-started-in-ruby>`
* :ref:`Connecting To The Service <sdk-ruby-connect>`
* :ref:`Object Storage Examples <sdk-ruby-object-storage>`
