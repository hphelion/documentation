---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/ruby/connect/
published: false
title: "Connecting to HP Helion using Ruby Fog Bindings"
---
<!--PUBLISHED-->

# HP Helion 1.0 Development Platform: Connecting to HP Helion using Ruby Fog Bindings
The HP Helion uses OpenStack as the platform and you can connect and set
up your HP Helion Cloud using Ruby Fog. To begin, connect using the following
instructions:

-  `Initial Connection <#initial-connection>`__
-  `Optional Parameters <#optional-parameters>`__

Initial Connection
------------------

To connect to the HP Helion, follow these steps:

1. Enter IRB

   ::

       irb

2. Require the Fog library and Rubygems:

   ::

       require 'fog'

3. Establish a connection to the desired HP Helion service

   ::

       def credentials_hash
          {
            :provider => :hp,
            :hp_auth_uri => ENV['OS_AUTH_URL'],
            :hp_access_key => ENV['OS_USER'],
            :hp_secret_key => ENV['OS_API_KEY'],
            :hp_tenant_id =>  ENV['OS_TENANT'],
            :hp_avl_zone => ENV['OS_REGION']
          }
       end

       storage = Fog::<SERVICE-NAME>.new(credentials_hash)

Where ``SERVICE-NAME`` can be
`Compute <https://github.com/fog/fog/blob/master/lib/fog/hp/docs/compute.md>`__,
`Storage <https://github.com/fog/fog/blob/master/lib/fog/hp/docs/object_storage.md>`__


Optional Parameters
-------------------

This section describes the optional parameters that you can use when
connecting to any of the HP Helion services. The examples below show the
Compute service, but these optional parameters work with all of the HP
Helion services.

The ``user_agent`` parameter allows you to specify a string to pass as a
``user_agent`` header for the connection. You can use this to track the
caller of the operations. You can set the ``user_agent`` parameter as
follows:

::

        conn = Fog::Compute.new(
               ...
               ...
               :user_agent => "MyApp/x.x.x")

This inserts a ``user_agent`` string such as
``hphelionfog/x.x.x (MyApp/x.x.x)`` into the header.

In addition to the ``user_agent`` parameter, there are several
additional parameters you can set using the ``connection_options``
parameter. These options are provided by the Excon library and allow you
to modify the underlying connection to a service. These options are
`Instrumentation <#Instrumentation>`__, `Timeouts <#Timeouts>`__,
`Proxy <#Proxy>`__, and `HTTPS/SSL <#HTTPS>`__.

Instrumentation
~~~~~~~~~~~~~~~

Use this parameter for debugging purposes. When you use the default
instrumentor ``Excon::StandardInstrumentor``, all events are output to
``stderr``. You can also designate your own instrumentor. You can set
the default instrumentor as follows:

::

        conn = Fog::Compute.new(
               ...
               ...
               :connection_options => {:instrumentor => Excon::StandardInstrumentor})

Timeouts
~~~~~~~~

Use this parameter to set different timeout values. You can set the
timeouts parameter as follows:

::

        conn = Fog::Compute.new(
               ...
               ...
               :connection_options => {
                      :connect_timeout => <time_in_secs>,
                      :read_timeout => <time_in_secs>,
                      :write_timeout => <time_in_secs>})

Proxy
~~~~~

Use this parameter to specify a proxy URL for both HTTP and HTTPS
connections. You can set the proxy parameter as follows:

::

        conn = Fog::Compute.new(
               ...
               ...
               :connection_options => {:proxy => 'http://myproxyurl:4444'})

HTTPS/SSL
~~~~~~~~~

By default, peer certificates are verified when you use secure socket
layer (SSL) for HTTPS. Sometimes this does not work due to
configurations in different operating systems, causing connection
errors. To help avoid this, you can set HTTPS/SSL parameters. To set the
path to the certificates:

::

        conn = Fog::Compute.new(
               ...
               ...
               :connection_options => {:ssl_ca_path => "/path/to/certs"})

To set the path to a certificate file:

::

        conn = Fog::Compute.new(
               ...
               ...
               :connection_options => {:ssl_ca_file => "/path/to/certificate_file"})

To set turn off peer verification:

::

        conn = Fog::Compute.new(
               ...
               ...
               :connection_options => {:ssl_verify_peer => false})

**Note**: This makes your connection less secure.

For further information on these options, please see `the Excon
documentation <http://github.com/geemus/excon>`__.
