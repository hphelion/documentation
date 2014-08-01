---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/php/
---
<!--PUBLISHED-->

PHP[](#php "Permalink to this headline")
=========================================

PHP applications are supported through Apache and mod\_php, and require
very little configuration to deploy.

Deployment[](#deployment "Permalink to this headline")
-------------------------------------------------------

You will need at least two files to deploy a PHP app on Application Lifecycle Service:
index.php, and stackato.yml.

The stackato.yml must specify the php as the framework type:

    framework:
            type: php

For full details on the stackato.yml and all possible options, see
[*Configuration With stackato.yml*](/als/v1/user/deploy/stackatoyml/#stackato-yml).

Application URL[](#application-url "Permalink to this headline")
-----------------------------------------------------------------

Some applications require the user to specify the APP\_URL. Below is an
example on how to obtain the correct urls:

    $appinfo = getenv("VCAP_APPLICATION");
    $appinfo_json = json_decode($appinfo,true);
    $admin = $appinfo_json['uris'][0];

Worker Applications[](#worker-applications "Permalink to this headline")
-------------------------------------------------------------------------

Non-HTTP apps that run as an Application Lifecycle Service application under the control of
the Health Manager.

To deploy worker applications, you need to use the
[*command*](/als/v1/user/deploy/stackatoyml/#stackato-yml-command) key and set the
[*proceses: web*](/als/v1/user/deploy/stackatoyml/#stackato-yml-processes-web-null)
key to Null ("\~").

### Example[](#example "Permalink to this headline")

    name: php-app
    framework: php
    command: php worker.php
    processes:
      web: ~

Database Services[](#database-services "Permalink to this headline")
---------------------------------------------------------------------

### DATABASE\_URL[](#database-url "Permalink to this headline")

Authentication details for your configured database services can be
found in the `$_SERVER` variable, under
`DATABASE_URL`. Here is an example of getting the
correct credentials.

    <?php
        $url_parts = parse_url($_SERVER['DATABASE_URL']);
        $db_name = substr( $url_parts['path'], 1 );
        $db_connection_string = $url_parts['host'] . ':' . $url_parts['port'];

        // ** MySQL settings from resource descriptor ** //
        echo $db_name;
        echo $url_parts['user'];
        echo $url_parts['pass'];
        echo $url_parts['host'];
        echo $url_parts['port'];
    ?>

### VCAP\_SERVICES[](#vcap-services "Permalink to this headline")

    <?php
        $services = getenv("VCAP_SERVICES");
        $services_json = json_decode($services,true);
        $mysql_config = $services_json["mysql"][0]["credentials"];

        // ** MySQL settings from resource descriptor ** //
        echo $mysql_config["name"];
        echo $mysql_config["user"];
        echo $mysql_config["password"];
        echo $mysql_config["hostname"];
        echo $mysql_config["port"];
        );
    ?>

PHP.ini[](#php-ini "Permalink to this headline")
-------------------------------------------------

Additional PHP ini files will be loaded from the
`$STACKATO_APP_ROOT/apache/php/` directory. Refer to
the example below for more information.

Document Root Access[](#document-root-access "Permalink to this headline")
---------------------------------------------------------------------------

If your document root (the location of the main *index.php* file) is the
main application directory, the information stored in *stackato.yml* and
*manifest.yml* is exposed to the browser. Note that *manifest.yml* is
generated automatically, even when you don't use *stackato.yml*.

To prevent exposing this information, you can use an *.htaccess* file in
the document root directory with the following rule:

    <filesmatch "^(manifest|helion)\.yml$">
      order allow,deny
      deny from all
    </filesmatch>

Alternatively, move your application into a subdirectory (e.g. move
*index.php* to *www/index.php*) and explicitly set your document-root in
*stackato.yml*:

    framework:
      document-root: www

Using the *.htaccess* file will generate an "HTTP 403 Forbidden" error
if a user tries to access the denied files. Changing the document-root
will generate an "HTTP 404 Not Found" error instead.

These techniques can be use to hide other files in your application
source tree which you do not want exposed to end users.

SERVER\_NAME & SERVER\_PORT[](#server-name-server-port "Permalink to this headline")
-------------------------------------------------------------------------------------

Application Lifecycle Service serves web applications port 80 and/or 443 at the router, but
within the application container Apache will be running on a different
port. PHP will report this internal IP address and port in the
SERVER\_ADDR and SERVER\_PORT Apache environment variables respectively.

If your application makes use of these variables, you may need to adjust
them by using an [.htaccess
file](http://httpd.apache.org/docs/current/howto/htaccess) to set
one or more
[RewriteRule](http://httpd.apache.org/docs/current/mod/mod_rewrite.html#rewriterule)
directives to correct the server name or port in URLs.

Persistent Sessions (PHP)[](#persistent-sessions-php "Permalink to this headline")
-----------------------------------------------------------------------------------

One of the issues with managing a PHP application running multiple
instances is dealing with user sessions.

If your application uses a [*shared filesystem
service*](/als/v1/user/services/filesystem/#persistent-file-system), you
can store user sessions there. The following *stackato.yml* snippet
creates a persistent filesystem service, creates a directory for
sessions, and writes a PHP config file to set the path to the session
directory:

    services:
      ${name}-fs: filesystem
    hooks:
      post-staging:
      - mkdir -p "$STACKATO_FILESYSTEM"/sessions
      - echo "session.save_path = $STACKATO_FILESYSTEM/sessions" > "$STACKATO_APP_ROOT"/apache/php/sessions.ini

For better performance, use a
[*Memcached*](/als/v1/user/services/memcached/#memcached) service for
session storage instead:

    services:
      ${name}-cache: memcached
    hooks:
      post-staging:
      - echo "session.save_handler = memcached" > "$STACKATO_APP_ROOT"/apache/php/sessions.ini
      - echo "session.save_path = $MEMCACHE_URL" >> "$STACKATO_APP_ROOT"/apache/php/sessions.ini

### [Table Of Contents](/als/v1/index-2/)

-   [PHP](#)
    -   [Deployment](#deployment)
    -   [Application URL](#application-url)
    -   [Worker Applications](#worker-applications)
        -   [Example](#example)
    -   [Database Services](#database-services)
        -   [DATABASE\_URL](#database-url)
        -   [VCAP\_SERVICES](#vcap-services)
    -   [PHP.ini](#php-ini)
    -   [Document Root Access](#document-root-access)
    -   [SERVER\_NAME & SERVER\_PORT](#server-name-server-port)
    -   [Persistent Sessions (PHP)](#persistent-sessions-php)

