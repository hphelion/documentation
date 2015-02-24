---
layout: default-devplatform
permalink: /helion/devplatform/1.1/als/user/deploy/languages/python/
published: true
title: "Developing In Python"
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer 
role2: ISV Developer
role3: Service Developer
authors: Jayme P

---
<!--PUBLISHED-->

# HP Helion Development Platform: Developing In Python<a class="headerlink" href="#developing-in-python" title="Permalink to this headline"></a></h1>
<p>Whether you&#8217;re deploying an application to the HP Helion Development Platform, a
Cloud Foundry based Platform as a Service (PaaS), or writing applications that take
advantage of HP Helion OpenStack&reg; to manage infrastructure or software services, tools
to enable successful development are available in Python.</p>
<div class="section" id="application-lifecycle-services">
<h2>Application Lifecycle Services<a class="headerlink" href="#application-lifecycle-services" title="Permalink to this headline"></a></h2>
<p>Application Lifecycle Services (ALS), a CloudFoundry-based Platform as a
Service, provides a means to execute Python applications on a managed platform.
Deploying Python applications to the platform is normally done using a built-in
<a class="reference external" href="https://github.com/ActiveState/stackato-buildpack-python">Python buildpack</a>.
In order to deploy an application user a Python buildpack, you will need the
following at the top level of your application:</p>
<ul class="simple">
<li>A Procfile with the command to run the application.  If the <tt class="docutils literal"><span class="pre">wapiti.py</span></tt>
file was the file that started your application, you might use something
like:</li>
</ul>
<div class="highlight-yaml"><div class="highlight"><pre><span class="l-Scalar-Plain">web</span><span class="p-Indicator">:</span> <span class="l-Scalar-Plain">python$PYTHON_VERSION wapiti.py</span>
</pre></div>
</div>
<ul class="simple">
<li>A <tt class="docutils literal"><span class="pre">manifest.yml</span></tt> file with at least your application name.  You may
also place other configuration information in this file such as module
requirements.  The minimal file would look like:</li>
</ul>
<div class="highlight-yaml"><div class="highlight"><pre><span class="l-Scalar-Plain">name</span><span class="p-Indicator">:</span> <span class="l-Scalar-Plain">wapiti</span>
</pre></div>
</div>
<ul class="simple">
<li>If your module requirements are not in the <tt class="docutils literal"><span class="pre">manifest.yml</span></tt> file, you
might need a <tt class="docutils literal"><span class="pre">requirements.txt</span></tt> or <tt class="docutils literal"><span class="pre">requiremenbts.pypm</span></tt> (pypm) file.
For example your <tt class="docutils literal"><span class="pre">requirements.txt</span></tt> may contain:</li>
</ul>
<div class="highlight-yaml"><div class="highlight"><pre><span class="l-Scalar-Plain">cherrypy</span>
</pre></div>
</div>
<ul class="simple">
<li>Possibly a <tt class="docutils literal"><span class="pre">runtime.txt</span></tt> file if the application is going to run some
other version of Python other than Python 2.7 (the default).  If your
application was to use Python 3.3 for example:</li>
</ul>
<div class="highlight-yaml"><div class="highlight"><pre><span class="l-Scalar-Plain">python-3.3</span>
</pre></div>
</div>
<ul class="simple">
<li>Finally, you will need a file to launch your application.  For this
example, we have been talking about a <tt class="docutils literal"><span class="pre">wapiti.py</span></tt> file which would
launch the application.</li>
</ul>
<p>Management of the deployed application and its services happens through a web
user interface or a command line client.  To learn more see:</p>
<ul class="simple">
<li><a class="reference external" href="http://docs.hpcloud.com/helion/devplatform/1.1/als/user/deploy/languages/python/">Working with applications in Python</a></li>
<li>The [manifest.yml](/helion/devplatform/1.1/als/user/deploy/manifestyml/) reference</a></li>
</ul>
</div>
<div class="section" id="controlling-hp-helion-with-your-application">
<h2>Controlling HP Helion with your Application<a class="headerlink" href="#controlling-hp-helion-with-your-application" title="Permalink to this headline"></a></h2>
<p>If your Python application is going to control HP Helion resources, it can
communicate directly with the <a class="reference external" href="http://docs.hpcloud.com/api">Helion REST APIs</a>
with a client or the Python SDK.  Currently, the Python SDK is very
limited in features, so you will probably be forced to use the CLIs.</p>
<p>The unified Python OpenStack Client has pretty good coverage of OpenStack
features except for network (Neutron) and object store (Swift).  To get full
coverage of features you would need to install the following CLIs in your
<tt class="docutils literal"><span class="pre">requirements.txt</span></tt> file (using our earlier cherrypy example):</p>
<div class="highlight-yaml"><div class="highlight"><pre><span class="l-Scalar-Plain">cherrypy</span>
<span class="l-Scalar-Plain">python-neutronclient</span>
<span class="l-Scalar-Plain">python-openstackclient</span>
<span class="l-Scalar-Plain">python-swiftclient</span>
</pre></div>
</div>
<p>Using the cherrypy example, you could implement a simple web server to show
volumes.  Obviously, this needs to run under HTTPS:</p>
<div class="highlight-python"><div class="highlight"><pre><span class="kn">import</span> <span class="nn">os</span>
<span class="kn">import</span> <span class="nn">cherrypy</span>
<span class="kn">import</span> <span class="nn">subprocess</span>

<span class="k">class</span> <span class="nc">VolumeShow</span><span class="p">:</span>
    <span class="nd">@cherrypy.expose</span>
    <span class="k">def</span> <span class="nf">index</span><span class="p">(</span><span class="bp">self</span><span class="p">):</span>
        <span class="k">return</span> <span class="s">&quot;&quot;&quot;</span>
<span class="s">        &lt;html&gt;&lt;body&gt;</span>
<span class="s">        &lt;form method=&#39;post&#39; action=&#39;/posted/&#39;&gt;</span>
<span class="s">        User: &lt;input name=&quot;username&quot;/&gt;&lt;br&gt;</span>
<span class="s">        Password: &lt;input type=&quot;password&quot; name=&quot;password&quot;/&gt;&lt;br&gt;</span>
<span class="s">        Project: &lt;input name=&quot;project&quot;/&gt;&lt;br&gt;</span>
<span class="s">        Auth URL: &lt;input name=&quot;url&quot;/&gt;&lt;br&gt;</span>
<span class="s">        Region: &lt;input name=&quot;region&quot;/&gt;&lt;br&gt;</span>
<span class="s">        Volume: &lt;input name=&quot;name&quot;/&gt;&lt;br&gt;</span>
<span class="s">        &lt;input type=&#39;submit&#39; value=&#39;Submit&#39; /&gt;</span>
<span class="s">        &lt;/form&gt;&lt;/body&gt;</span>
<span class="s">        &lt;/html&gt;</span>
<span class="s">        &quot;&quot;&quot;</span>

    <span class="nd">@cherrypy.expose</span>
    <span class="k">def</span> <span class="nf">posted</span><span class="p">(</span><span class="bp">self</span><span class="p">,</span> <span class="n">username</span><span class="p">,</span> <span class="n">password</span><span class="p">,</span> <span class="n">project</span><span class="p">,</span> <span class="n">url</span><span class="p">,</span> <span class="n">region</span><span class="p">,</span> <span class="n">name</span><span class="p">):</span>
        <span class="n">os</span><span class="o">.</span><span class="n">environ</span><span class="p">[</span><span class="s">&#39;OS_USERNAME&#39;</span><span class="p">]</span> <span class="o">=</span> <span class="n">username</span>
        <span class="n">os</span><span class="o">.</span><span class="n">environ</span><span class="p">[</span><span class="s">&#39;OS_PASSWORD&#39;</span><span class="p">]</span> <span class="o">=</span> <span class="n">password</span>
        <span class="n">os</span><span class="o">.</span><span class="n">environ</span><span class="p">[</span><span class="s">&#39;OS_REGION_NAME&#39;</span><span class="p">]</span> <span class="o">=</span> <span class="n">region</span>
        <span class="n">os</span><span class="o">.</span><span class="n">environ</span><span class="p">[</span><span class="s">&#39;OS_PROJECT_NAME&#39;</span><span class="p">]</span> <span class="o">=</span> <span class="n">project</span>
        <span class="n">os</span><span class="o">.</span><span class="n">environ</span><span class="p">[</span><span class="s">&#39;OS_AUTH_URL&#39;</span><span class="p">]</span> <span class="o">=</span> <span class="n">url</span>
        <span class="n">p</span> <span class="o">=</span> <span class="n">subprocess</span><span class="o">.</span><span class="n">Popen</span><span class="p">([</span><span class="s">&quot;openstack&quot;</span><span class="p">,</span> <span class="s">&quot;volume&quot;</span><span class="p">,</span> <span class="s">&quot;show&quot;</span><span class="p">,</span> <span class="n">name</span><span class="p">],</span>
                             <span class="n">env</span><span class="o">=</span><span class="n">os</span><span class="o">.</span><span class="n">environ</span><span class="p">,</span> <span class="n">stdout</span><span class="o">=</span><span class="n">subprocess</span><span class="o">.</span><span class="n">PIPE</span><span class="p">)</span>
        <span class="n">result</span> <span class="o">=</span> <span class="n">p</span><span class="o">.</span><span class="n">communicate</span><span class="p">()[</span><span class="mi">0</span><span class="p">]</span>
        <span class="k">return</span> <span class="s">&quot;&lt;title&gt;Volume </span><span class="si">%s</span><span class="s">&lt;/title&gt;</span><span class="se">\n</span><span class="s">&lt;pre&gt;</span><span class="si">%s</span><span class="s">&lt;/pre&gt;&quot;</span> <span class="o">%</span> <span class="p">(</span><span class="n">name</span><span class="p">,</span> <span class="n">result</span><span class="p">)</span>
</pre></div>
</div>
<p>That example used the unified OpenStack CLI.  A similar thing would work for
the network or object store clients.</p>
   
By default, Application Lifecycle Service uses the built-in Python
[*Buildpack*](/helion/devplatform/1.1/als/user/deploy/buildpack/#buildpacks) to deploy Python
applications. To deploy applications using this buildpack, your
application will need the following in the root directory of the
application:

-   a list of module requirements in a
    [*manifest.yml*](/helion/devplatform/1.1/als/user/deploy/manifestyml/),
    [requirements.txt
    (pip)](http://www.pip-installer.org/en/latest/cookbook.html#requirements-files),
    or *requirements.pypm* ([pypm](http://code.activestate.com/pypm/))
    file.

-   a Procfile specifying the command to run the application server. For
    example, the
    [example-python-django](https://github.com/Stackato-Apps/example-python-django)
    Application Lifecycle Service sample has the following simple *Procfile*:

        web: gunicorn helion.wsgi -b 0.0.0.0:$PORT

This buildpack uses Python 2.7 by default. To specify Python 3.3, create
a *runtime.txt* file setting the version (i.e. `python-3.3`) and use the \$PYTHON\_VERSION environment variable in the
Procfile `web:` command. For example:

    web: python$PYTHON_VERSION app.py

See also: <https://github.com/ActiveState/stackato-buildpack-python>

Python with the Legacy Buildpack[](#python-with-the-legacy-buildpack "Permalink to this headline")
---------------------------------------------------------------------------------------------------

If your Python application has configuration for running on Application Lifecycle Service
2.10 or earlier, you can deploy it using the [*Legacy
Buildpack*](/helion/devplatform/1.1/als/user/deploy/buildpack/#buildpacks-legacy), which provides an
updated version of the old Python framework.

With the Legacy Buildpack, applications are run with
[uWSGI](http://projects.unbit.it/uwsgi/). Applications are started from
a top-level script called `wsgi.py` defining a
global `application` variable containing the WSGI
application object. For a minimal sample application, see
[wsgi-helloworld](https://github.com/Stackato-Apps/wsgi-helloworld).

You may add additional arguments to uWSGI in your
`manifest.yml`, eg:

    processes:
      web: $HELION_UWSGI --mount foo=app.py --import module

It is possible to [*serve static files with
uWSGI*](#uwsgi-python-static-files).

Django[](#django "Permalink to this headline")
-----------------------------------------------

-   [Deploying Django applications](/helion/devplatform/1.1/als/user/deploy/languages/python/django/)
    -   [Getting started](/helion/devplatform/1.1/als/user/deploy/languages/python/django/#getting-started)
    -   [Configuring database](/helion/devplatform/1.1/als/user/deploy/languages/python/django/#configuring-database)
    -   [Configuring static media](/helion/devplatform/1.1/als/user/deploy/languages/python/django/#configuring-static-media)
    -   [Configuring project
        location](/helion/devplatform/1.1/als/user/deploy/languages/python/django/#configuring-project-location)

Application URL[](#application-url "Permalink to this headline")
-----------------------------------------------------------------

Some applications require the user to specify the APP\_URL. Below is an
example on how to obtain the correct urls:

    import json
    vcap_app = json.loads(os.environ['VCAP_APPLICATION'])
    APP_URL = 'http://' + vcap_app['uris'][0]

Database Services[](#database-services "Permalink to this headline")
---------------------------------------------------------------------

Some minor edits are required to make your application work with a
database. Python database configurations are located inside
`settings.py`.

### DATABASE\_URL[](#database-url "Permalink to this headline")

Authentication details for your configured database services can be
found in the `os.environ` variable, under
`DATABASE_URL`. Here is an example of getting the
correct credentials.

    import urlparse
    DATABASES = {}
    if 'DATABASE_URL' in os.environ:
        url = urlparse.urlparse(os.environ['DATABASE_URL'])
        DATABASES['default'] = {
            'NAME': url.path[1:],
            'USER': url.username,
            'PASSWORD': url.password,
            'HOST': url.hostname,
            'PORT': url.port,
            }
        if url.scheme == 'postgres':
            DATABASES['default']['ENGINE'] = 'django.db.backends.postgresql_psycopg2'
        elif url.scheme == 'mysql':
            DATABASES['default']['ENGINE'] = 'django.db.backends.mysql'
    else:
        DATABASES['default'] = {
            'ENGINE': 'django.db.backends.sqlite3', # Add 'postgresql_psycopg2', 'postgresql', 'mysql', 'sqlite3' or 'oracle'.
            'NAME': 'dev.db',                      # Or path to database file if using sqlite3.
            'USER': '',                      # Not used with sqlite3.
            'PASSWORD': '',                  # Not used with sqlite3.
            'HOST': '',                      # Set to empty string for localhost. Not used with sqlite3.
            'PORT': '',                      # Set to empty string for default. Not used with sqlite3.
            }

### VCAP\_SERVICES[](#vcap-services "Permalink to this headline")

    import json
    vcap_services = json.loads(os.environ['VCAP_SERVICES'])
    srv = vcap_services['mysql'][0]
    cred = srv['credentials']
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': cred['name'],
            'USER': cred['user'],
            'PASSWORD': cred['password'],
            'HOST': cred['hostname'],
            'PORT': cred['port'],
        }
    }

Worker Applications[](#worker-applications "Permalink to this headline")
-------------------------------------------------------------------------

Non-HTTP apps that run as an Application Lifecycle Service application under the control of
the Health Manager.

To deploy worker applications, you need to use the
[*command*](/helion/devplatform/1.1/als/user/deploy/manifestyml/#command) key and set the
[*processes:
web*](/helion/devplatform/1.1/als/user/deploy/manifestyml/#web) key to
Null ("\~").

### Example[](#example "Permalink to this headline")

    name: python-app
    framework:
      type: python
      runtime: python27
    command: python worker.py
    processes:
      web: ~

Serving Static Files with uWSGI[](#serving-static-files-with-uwsgi "Permalink to this headline")
-------------------------------------------------------------------------------------------------

It is possible to serve static files with uWSGI using
`processes: web:` in the
[*manifest.yml*](/helion/devplatform/1.1/als/user/deploy/manifestyml/) file to specify
folders that will be served statically and not by the app.

To make a single folder serve statically, use `--check-static`:

    processes:
        web: $HELION_UWSGI --check-static $HOME/<folder>

To specify multiple folders with static files that do not share a common
root, use `--static-map`:

    processes:
        web: $HELION_UWSGI --static-map /foo=$HOME/static --static-map /bar=$HOME/sub

In this case */foo/index.html* would serve *\$HOME/static/index.html*,
and */bar/index.html* would serve *\$HOME/sub/index.html*. If the file
doesn't exist, then uWSGI will forward the request to the app.

**Note**

Serving static files via uWSGI is only available for Perl and Python
frameworks.

Using a custom web server[](#using-a-custom-web-server "Permalink to this headline")
-------------------------------------------------------------------------------------

To use a different web server, instead of uWSGI, specify its startup
command in `manifest.yml`. Here's a sample
manifest.yml used to deploy a Django 1.4 application named "dj14" using
gunicorn:

    name: dj14

    framework:
      type: python

    processes:
      web: gunicorn -b 0.0.0.0:$PORT dj14.wsgi

    requirements:
      pypm: [gunicorn]
      pip: ["http://www.djangoproject.com/download/1.4-beta-1/tarball/#egg=django-1.4b1"]

The custom web server must bind to IP address `0.0.0.0` and port `$PORT`. The same trick can be
used to serve non-WSGI applications (such as Tornado). See the
[bottle-py3 example](https://github.com/Stackato-Apps/bottle-py3) sample
for an example.

Installing Python Packages[](#installing-python-packages "Permalink to this headline")
---------------------------------------------------------------------------------------

**Note**

To install packages from custom repository/mirror. Use the
[*PIP\_OPTS*](/helion/devplatform/1.1/als/user/reference/environment/#term-pip-opts) or
[*PYPM\_OPTS*](/helion/devplatform/1.1/als/user/reference/environment/#term-pypm-opts)
[*environment
variables*](/helion/devplatform/1.1/als/user/reference/environment/#environment-variables).

Application dependencies such as web frameworks or modules from PyPI can
be installed using [*PyPM*](/helion/devplatform/1.1/als/admin/reference/glossary/#term-pypm)
and/or [*pip*](/helion/devplatform/1.1/als/admin/reference/glossary/#term-pip).

### PyPM[](#pypm "Permalink to this headline")

Definition [*PyPM*](/helion/devplatform/1.1/als/admin/reference/glossary/#term-pypm)

To install packages during application deployment with PyPM, add the
requirements to manifest.yml:

    requirements:
      pypm:
        - tornado
        - pymongo

See the [manifest.yml of
tornado-chat-mongo](https://github.com/Stackato-Apps/tornado-chat-mongo/blob/master/stackato.yml)
sample app for an example.

Alternatively, you can list the modules in a top-level
`requirements-pypm.txt` file. The format is similar,
if not same, as [pip requirements
files](http://www.pip-installer.org/en/latest/requirements) and
accepts version specification. The name of this file can be overridden by
setting the `PYPM_REQUIREMENTS_FILE` environment
variable.

### pip[](#pip "Permalink to this headline")

Definition [*pip*](/helion/devplatform/1.1/als/admin/reference/glossary/#term-pip)

In addition - or as alternative - to
[*PyPM*](/helion/devplatform/1.1/als/admin/reference/glossary/#term-pypm), your application
can also make use of pip to install certain dependencies. The above
tornado-chat-mongo sample installs "pycurl" using
[*pip*](/helion/devplatform/1.1/als/admin/reference/glossary/#term-pip):

    requirements:
      pypm:
        - tornado
        - pymongo
      pip:
        - pycurl

If your application already contains a `requirements.txt` file, that will be automatically used to install dependencies;
no need to specify them manually in manifest.yml. The name of this file
can be overridden by setting the `PIP_REQUIREMENTS_FILE` environment variable.

**Note**

A [bug in pip](https://github.com/pypa/pip/issues/219) may prevent the
log file from being accessed by `helion logs`.

PyPy Support[](#pypy-support "Permalink to this headline")
-----------------------------------------------------------

Here is an example of pushing an app using PyPy.

First, clone the <https://github.com/Stackato-Apps/werkzeug-debugger>
repository.

Then add the following `BUILDPACK_URL` to the
*manifest.yml* file:

    env:
      BUILDPACK_URL: git://github.com/HP/heroku-buildpack-pypy.git

Finally, push the app to Application Lifecycle Service:

    $ helion push -n

Other Python Frameworks[](#other-python-frameworks "Permalink to this headline")
---------------------------------------------------------------------------------

Examples of deploying other frameworks are included in the [GitHub
samples repo](https://github.com/Stackato-Apps):

-   Bottle framework
    -   [Bottle
        Currency](https://github.com/Stackato-Apps/bottle-currency)
    -   [Python 3](https://github.com/Stackato-Apps/bottle-py3)
-   Django
    -   [django-gtd](https://github.com/Stackato-Apps/django-gtd)
    -   [pinax-social](https://github.com/Stackato-Apps/pinax-social)
-   Pylons Pyramid
    -   [virginia](https://github.com/Stackato-Apps/pyramid-virginia)
    -   [default](https://github.com/Stackato-Apps/pyramid-default)
-   Tornado
    -   [chat](https://github.com/Stackato-Apps/tornado-chat-mongo)
-   Werkzeug
    -   [werkzeug-debugger](https://github.com/Stackato-Apps/werkzeug-debugger)
-   Celery
    -   [celery-demo](https://github.com/Stackato-Apps/celery-demo)
