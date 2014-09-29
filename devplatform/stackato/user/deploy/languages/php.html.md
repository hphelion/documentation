---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/php/
---
<!--UNDER REVISION-->

#Developing In PHP
<p>Whether you&#8217;re deploying an application to the HP Helion Development Platform, a
Cloud Foundry based Platform as a Service (PaaS), or writing applications that take
advantage of HP Helion OpenStack® to manage infrastructure or software services, tools
to enable successful development are available in PHP.</p>
<div class="section" id="application-lifecycle-services">
<h2>Application Lifecycle Services<a class="headerlink" href="#application-lifecycle-services" title="Permalink to this headline"></a></h2>
<p>Application Lifecycle Service (ALS) provides a means to execute PHP applications on a managed platform, controlling application lifecycle through a PaaS tier. Deploying
applications to this platform is as easy as adding details to a YAML configuration file and using
a console application to push the application to ALS.</p>
<p>At its simplest form, the configuration file, <tt class="docutils literal"><span class="pre">stackato.yml</span></tt>, located at the root of a project
would look like:</p>
<div class="highlight-none"><div class="highlight"><pre>name: php-web-app
framework:
    type: php
</pre></div>
</div>
<p>This will set the ALS framework typr for a PHP web application.</p>
<p>To create a worker non-http application set the web process to <strong>null</strong> (~) and specify
the command to <strong>run</strong>. For example:</p>
<div class="highlight-yaml"><div class="highlight"><pre><span class="l-Scalar-Plain">name</span><span class="p-Indicator">:</span> <span class="l-Scalar-Plain">php-app</span>
<span class="l-Scalar-Plain">framework</span><span class="p-Indicator">:</span> <span class="l-Scalar-Plain">php</span>
<span class="l-Scalar-Plain">command</span><span class="p-Indicator">:</span> <span class="l-Scalar-Plain">php worker.php</span>
<span class="l-Scalar-Plain">processes</span><span class="p-Indicator">:</span>
    <span class="l-Scalar-Plain">web</span><span class="p-Indicator">:</span> <span class="l-Scalar-Plain">~</span>
</pre></div>
</div>
<p>Management of the deployed application and its services happens through a web application or
a console application.</p>
<p>To learn more see:</p>
<ul class="simple">
<li><a class="reference external" href="http://docs.hpcloud.com/als/v1/user/deploy/languages/php/">Working with applications in PHP</a></li>
<li><a class="reference external" href="http://docs.hpcloud.com/als/v1/user/deploy/stackatoyml/">The stackato.yml reference</a></li>
</ul>
</div>
<div class="section" id="hp-helion-sdk">
<h2>HP Helion SDK<a class="headerlink" href="#hp-helion-sdk" title="Permalink to this headline"></a></h2>
<p>PHP applications can communicate directly with the <a class="reference external" href="http://docs.hpcloud.com/api">HP Helion APIs</a> through a REST client
or use the SDK. The SDK is designed to provide a well-documented API to simplify working with the
services.</p>
<p>As an example, here is one way of writing and reading from object storage:</p>
<div class="highlight-php"><div class="highlight"><pre><span class="cp">&lt;?php</span>
<span class="c1">// Use the composer autoloader.</span>
<span class="k">require_once</span> <span class="s1">&#39;/vendor/autoload.php&#39;</span><span class="p">;</span>

<span class="k">use</span> <span class="nx">\HPCloud\Bootstrap</span><span class="p">;</span>
<span class="nx">Bootstrap</span><span class="o">::</span><span class="na">useStreamWrappers</span><span class="p">();</span>

<span class="c1">// Provide credentials</span>
<span class="nv">$settings</span> <span class="o">=</span> <span class="k">array</span><span class="p">(</span>
  <span class="s1">&#39;username&#39;</span> <span class="o">=&gt;</span> <span class="nx">YOUR_USERNAME</span><span class="p">,</span>
  <span class="s1">&#39;password&#39;</span> <span class="o">=&gt;</span> <span class="nx">YOUR_PASSWORD</span><span class="p">,</span>
  <span class="s1">&#39;tenantid&#39;</span> <span class="o">=&gt;</span> <span class="nx">YOUR_TENANT_ID</span><span class="p">,</span>
  <span class="s1">&#39;endpoint&#39;</span> <span class="o">=&gt;</span> <span class="nx">IDENTITY_SERVICES_URL</span><span class="p">,</span>
<span class="p">);</span>
<span class="nx">Bootstrap</span><span class="o">::</span><span class="na">setConfiguration</span><span class="p">(</span><span class="nv">$settings</span><span class="p">);</span>

<span class="c1">// Create a new file and write it to the object store.</span>
<span class="nv">$newfile</span> <span class="o">=</span> <span class="nb">fopen</span><span class="p">(</span><span class="s1">&#39;swift://mycontainer/my_file.txt&#39;</span><span class="p">,</span> <span class="s1">&#39;w&#39;</span><span class="p">);</span>
<span class="nb">fwrite</span><span class="p">(</span><span class="nv">$newfile</span><span class="p">,</span> <span class="s2">&quot;Good Morning!&quot;</span><span class="p">);</span>
<span class="nb">fclose</span><span class="p">(</span><span class="nv">$newfile</span><span class="p">);</span>

<span class="c1">// Check for an object:</span>
<span class="k">if</span> <span class="p">(</span><span class="nb">file_exists</span><span class="p">(</span><span class="s1">&#39;swift://mycontainer/my_file.txt&#39;</span><span class="p">))</span> <span class="p">{</span>
  <span class="k">print</span> <span class="s2">&quot;Found my_file.txt.&quot;</span> <span class="o">.</span> <span class="nx">PHP_EOL</span><span class="p">;</span>
<span class="p">}</span>

<span class="c1">// Get an entire object at once:</span>
<span class="nv">$file</span> <span class="o">=</span> <span class="nb">file_get_contents</span><span class="p">(</span><span class="s1">&#39;swift://mycontainer/my_file.txt&#39;</span><span class="p">);</span>
<span class="k">print</span> <span class="s1">&#39;File: &#39;</span> <span class="o">.</span> <span class="nv">$file</span> <span class="o">.</span> <span class="nx">PHP_EOL</span><span class="p">;</span>
</pre></div>
</div>
<p>The example above uses PHP <a class="reference external" href="http://www.php.net/manual/en/book.stream.php">stream wrappers</a>. Access to
the low level API is available in the SDK as well. For example,</p>
<div class="highlight-php"><div class="highlight"><pre><span class="cp">&lt;?php</span>
<span class="c1">// Set up.</span>
<span class="k">require_once</span> <span class="s1">&#39;/vendor/autoload.php&#39;</span><span class="p">;</span>
<span class="k">use</span> <span class="nx">\HPCloud\Bootstrap</span><span class="p">;</span>

<span class="c1">// Authenticate to HP Cloud</span>
<span class="nv">$username</span> <span class="o">=</span> <span class="s1">&#39;YOUR_USERNAME&#39;</span><span class="p">;</span>
<span class="nv">$password</span> <span class="o">=</span> <span class="s1">&#39;YOUR_PASSWORD&#39;</span><span class="p">;</span>
<span class="nv">$tenantId</span> <span class="o">=</span> <span class="s1">&#39;ADD TENANT ID HERE&#39;</span><span class="p">;</span>
<span class="nv">$endpoint</span> <span class="o">=</span> <span class="s1">&#39;ADD ENDPOINT URL HERE&#39;</span><span class="p">;</span>

<span class="nv">$idService</span> <span class="o">=</span> <span class="k">new</span> <span class="nx">\HPCloud\Services\IdentityServices</span><span class="p">(</span><span class="nv">$endpoint</span><span class="p">);</span>
<span class="nv">$token</span> <span class="o">=</span> <span class="nv">$idService</span><span class="o">-&gt;</span><span class="na">authenticateAsUser</span><span class="p">(</span><span class="nv">$username</span><span class="p">,</span> <span class="nv">$password</span><span class="p">,</span> <span class="nv">$tenantId</span><span class="p">);</span>

<span class="c1">// Connect to Object Storage.</span>
<span class="nv">$catalog</span> <span class="o">=</span> <span class="nv">$idService</span><span class="o">-&gt;</span><span class="na">serviceCatalog</span><span class="p">();</span>
<span class="nv">$store</span> <span class="o">=</span> <span class="nx">ObjectStorage</span><span class="o">::</span><span class="na">newFromServiceCatalog</span><span class="p">(</span><span class="nv">$catalog</span><span class="p">,</span> <span class="nv">$token</span><span class="p">);</span>

<span class="c1">// Create a Container.</span>
<span class="nv">$store</span><span class="o">-&gt;</span><span class="na">createContainer</span><span class="p">(</span><span class="s1">&#39;Example&#39;</span><span class="p">);</span>
<span class="nv">$container</span> <span class="o">=</span> <span class="nv">$store</span><span class="o">-&gt;</span><span class="na">container</span><span class="p">(</span><span class="s1">&#39;Example&#39;</span><span class="p">);</span>

<span class="c1">// Create an Object.</span>
<span class="nv">$name</span> <span class="o">=</span> <span class="s1">&#39;hello.txt&#39;</span><span class="p">;</span>
<span class="nv">$content</span> <span class="o">=</span> <span class="s1">&#39;Hello World&#39;</span><span class="p">;</span>
<span class="nv">$mime</span> <span class="o">=</span> <span class="s1">&#39;text/plain&#39;</span><span class="p">;</span>
<span class="nv">$localObject</span> <span class="o">=</span> <span class="k">new</span> <span class="nx">Object</span><span class="p">(</span><span class="nv">$name</span><span class="p">,</span> <span class="nv">$content</span><span class="p">,</span> <span class="nv">$mime</span><span class="p">);</span>

<span class="c1">// Put the Object in the Container.</span>
<span class="nv">$container</span><span class="o">-&gt;</span><span class="na">save</span><span class="p">(</span><span class="nv">$localObject</span><span class="p">);</span>

<span class="c1">// And get the Object back out again.</span>
<span class="nv">$object</span> <span class="o">=</span> <span class="nv">$container</span><span class="o">-&gt;</span><span class="na">proxyObject</span><span class="p">(</span><span class="s1">&#39;hello.txt&#39;</span><span class="p">);</span>

<span class="nb">printf</span><span class="p">(</span><span class="s2">&quot;Name: %s </span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">,</span> <span class="nv">$object</span><span class="o">-&gt;</span><span class="na">name</span><span class="p">());</span>
<span class="nb">printf</span><span class="p">(</span><span class="s2">&quot;Size: %d </span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">,</span> <span class="nv">$object</span><span class="o">-&gt;</span><span class="na">contentLength</span><span class="p">());</span>
<span class="nb">printf</span><span class="p">(</span><span class="s2">&quot;Type: %s </span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">,</span> <span class="nv">$object</span><span class="o">-&gt;</span><span class="na">contentType</span><span class="p">());</span>
<span class="k">print</span> <span class="nv">$object</span><span class="o">-&gt;</span><span class="na">content</span><span class="p">()</span> <span class="o">.</span> <span class="nx">PHP_EOL</span><span class="p">;</span>
</pre></div>
</div>
<!-- until i get the locs and syntax nailed down
<p>To learn more about getting and using the SDK:</p>
<ul class="simple">
<li><a class="reference internal" href="sdk-getting-started.html#get-started-php-sdk"><em>Get Started With The PHP Library</em></a></li>
<li><a class="reference internal" href="sdk-authentication.html#auth-php-sdk"><em>Identity Service, Authentication, and the Service Catalog</em></a></li>
<li><a class="reference internal" href="sdk-object-store.html#object-store-php-sdk"><em>Working With Object Storage in PHP</em></a></li>
</ul>
-->

PHP applications are supported through Apache and mod\_php, and require
very little configuration to deploy.

Deployment[](#deployment "Permalink to this headline")
-------------------------------------------------------

You will need at least two files to deploy a PHP app on Application Lifecycle Service:
*index.php*, and *manifest.yml*.

The *manifest.yml* must specify `php` as the framework type:

    framework:
            type: php

For full details on the manifeststackato.yml and all possible options, see
[*Configuration With manifest.yml*](/als/v1/user/deploy/stackatoyml/#stackato-yml).

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
main application directory, the information stored in 
*manifest.yml* is exposed to the browser.

To prevent exposing this information, you can use an *.htaccess* file in
the document root directory with the following rule:

    <filesmatch "^(manifest)\.yml$">
      order allow,deny
      deny from all
    </filesmatch>

Alternatively, move your application into a subdirectory (e.g. move
*index.php* to *www/index.php*) and explicitly set your document-root in
*manifest.yml*:

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
can store user sessions there. The following *manifest.yml* snippet
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