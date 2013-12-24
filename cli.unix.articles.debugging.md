---
layout: default
title: "Unix Command Line Interface: Verbose debugging output"
permalink: /cli/unix/articles/debugging
product: unix-cli
categories: cli linux
tags: cli linux
---
#UNIX CLI: Generating verbose debugging output#

___________________

###Important Notice###

On November 4, 2013, the UNIX CLI was moved into its End-of-Life Cycle process toward final deprecation. During this 6-month transition time:

* New and existing customers are encouraged to migrate to the OpenStackClient (Unified) CLIs or the OpenStack command-line clients for each respective service
* No new feature requests will be honored
* Bug reports will be accepted

After 6-months, access to online resources will still be available, but no support will be offered from HP Public Cloud, and the software download will be disabled—although you are most welcome to continue development at your discretion! HP Cloud has contributed the Unix CLI back to the open source community, and you can access the source code, documentation, and downloads [here](https://github.com/hpcloud/unix_cli).

_________________________________________

Almost every command in the UNIX command-line interface (CLI) contains an option that allows you to display verbose debugging information.  The debugging log includes a trace of the HTTP requests made with both requests and responses as well as a stack trace if an exception is generated.  The verbose mode assists you in debugging problems if the standard error messages are not enough. 

Here is the `list` command without verbose debugging enabled:

    $ hpcloud list 
    cross
    notmycontainer
    someoneelses
    $

Now the `list` command with verbose debugging enabled:

    $ hpcloud list --debug
    excon.request  {:connect_timeout=>30, :headers=>{"User-Agent"=>"hpfog/0.0.18 (HPCloud-UnixCLI/1.5.0)",...}
    excon.response  {:body=>"{\"access\": {\n  \"token\": ... :status=>200}
    excon.request  {:connect_timeout=>30, :headers=>{"User-Agent"=>"hpfog/0.0.18 (HPCloud-UnixCLI/1.5.0)", "Content-Type"=>"application/json", "X-Auth-Token"=>"****", "Host"=>"****"}, :instrumentor_name=>"excon", :mock=>false, :read_timeout=>60, :retry_limit=>4, :ssl_ca_file=>"/home/terry/.rvm/gems/ruby-1.9.2-p320@unix_cli/gems/excon-0.14.3/data/cacert.pem", :ssl_verify_peer=>false, :write_timeout=>60, :host=>"****", :path=>"/v1/42501822420976/", :port=>"443", :query=>{"format"=>"json"}, :scheme=>"https", :instrumentor=>Excon::StandardInstrumentor, :expects=>[200, 204], :method=>"GET"}
    excon.response  {:body=>"[{\"count\": 4, \"bytes\": 62, \"name\": \"cross\"}, {\"count\": 1, \"bytes\": 16, \"name\": \"notmycontainer\"}, {\"count\": 1, \"bytes\": 16, \"name\": \"someoneelses\"}]", :headers=>{"Content-Length"=>"148", "Accept-Ranges"=>"bytes", "X-Timestamp"=>"1338927651.12676", "X-Account-Bytes-Used"=>"94", "X-Account-Container-Count"=>"3", "Content-Type"=>"application/json; charset=utf-8", "X-Account-Object-Count"=>"6", "X-Trans-Id"=>"txb5600f7af08d40b5ab517cf7758bd80f", "Date"=>"Sun, 20 Jan 2013 13:07:47 GMT"}, :status=>200}
    cross
    notmycontainer
    someoneelses

In this example, you can see it authorizes and then provides a list of containers.

For additional information, take a look at the [CLI Reference page](/cli/unix/reference).
