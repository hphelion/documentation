---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/python/
---
<!--PUBLISHED-->

Python[](#python "Permalink to this headline")
===============================================

By default, Application Lifecycle Service uses the built-in Python
[*Buildpack*](/als/v1/user/deploy/buildpack/#buildpacks) to deploy Python
applications. To deploy applications using this buildpack, your
application will need the following in the root directory of the
application:

-   a list of module requirements in a
    [*stackato.yml*](/als/v1/user/deploy/stackatoyml/#stackato-yml),
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
a *runtime.txt* file setting the version (i.e. `python-3.3`{.docutils
.literal}) and use the \$PYTHON\_VERSION environment variable in the
Procfile `web:` command. For example:

    web: python$PYTHON_VERSION app.py

See also: <https://github.com/HP/helion-buildpack-python>

Python with the Legacy Buildpack[](#python-with-the-legacy-buildpack "Permalink to this headline")
---------------------------------------------------------------------------------------------------

If your Python application has configuration for running on Application Lifecycle Service
2.10 or earlier, you can deploy it using the [*Legacy
Buildpack*](/als/v1/user/deploy/buildpack/#buildpacks-legacy), which provides an
updated version of the old Python framework.

With the Legacy Buildpack, applications are run with
[uWSGI](http://projects.unbit.it/uwsgi/). Applications are started from
a top-level script called `wsgi.py` defining a
global `application` variable containing the WSGI
application object. For a minimal sample application, see
[wsgi-helloworld](https://github.com/Stackato-Apps/wsgi-helloworld).

You may add additional arguments to uWSGI in your
`stackato.yml`, eg:

    processes:
      web: $STACKATO_UWSGI --mount foo=app.py --import module

It is possible to [*serve static files with
uWSGI*](#uwsgi-python-static-files).

Django[](#django "Permalink to this headline")
-----------------------------------------------

-   [Deploying Django applications](/als/v1/user/deploy/languages/python/django/)
    -   [Getting started](/als/v1/user/deploy/languages/python/django/#getting-started)
    -   [Configuring database](/als/v1/user/deploy/languages/python/django/#configuring-database)
    -   [Configuring static media](/als/v1/user/deploy/languages/python/django/#configuring-static-media)
    -   [Configuring project
        location](/als/v1/user/deploy/languages/python/django/#configuring-project-location)

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
[*command*](/als/v1/user/deploy/stackatoyml/#stackato-yml-command) key and set the
[*proceses:
web*](/als/v1/user/deploy/stackatoyml/#stackato-yml-processes-web-null) key to
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
[*stackato.yml*](/als/v1/user/deploy/stackatoyml/#stackato-yml) file to specify
folders that will be served statically and not by the app.

To make a single folder serve statically, use `--check-static`{.docutils
.literal}:

    processes:
        web: $STACKATO_UWSGI --check-static $HOME/<folder>

To specify multiple folders with static files that do not share a common
root, use `--static-map`:

    processes:
        web: $STACKATO_UWSGI --static-map /foo=$HOME/static --static-map /bar=$HOME/sub

In this case */foo/index.html* would serve *\$HOME/static/index.html*,
and */bar/index.html* would serve *\$HOME/sub/index.html*. If the file
doesn't exist, then uWSGI will forward the request to the app.

**Note**

Serving static files via uWSGI is only available for Perl and Python
frameworks.

Using a custom web server[](#using-a-custom-web-server "Permalink to this headline")
-------------------------------------------------------------------------------------

To use a different web server, instead of uWSGI, specify its startup
command in `stackato.yml`. Here's a sample
stackato.yml used to deploy a Django 1.4 application named "dj14" using
gunicorn:

    name: dj14

    framework:
      type: python

    processes:
      web: gunicorn -b 0.0.0.0:$PORT dj14.wsgi

    requirements:
      pypm: [gunicorn]
      pip: ["http://www.djangoproject.com/download/1.4-beta-1/tarball/#egg=django-1.4b1"]

The custom web server must bind to IP address `0.0.0.0`{.docutils
.literal} and port `$PORT`. The same trick can be
used to serve non-WSGI applications (such as Tornado). See the
[bottle-py3 example](https://github.com/Stackato-Apps/bottle-py3) sample
for an example.

Installing Python Packages[](#installing-python-packages "Permalink to this headline")
---------------------------------------------------------------------------------------

**Note**

To install packages from custom repository/mirror. Use the
[*PIP\_OPTS*](/als/v1/user/reference/environment/#term-pip-opts) or
[*PYPM\_OPTS*](/als/v1/user/reference/environment/#term-pypm-opts)
[*environment
variables*](/als/v1/user/reference/environment/#environment-variables).

Application dependencies such as web frameworks or modules from PyPI can
be installed using [*PyPM*](/als/v1/admin/reference/glossary/#term-pypm)
and/or [*pip*](/als/v1/admin/reference/glossary/#term-pip).

### PyPM[](#pypm "Permalink to this headline")

Definition [*PyPM*](/als/v1/admin/reference/glossary/#term-pypm)

To install packages during application deployment with PyPM, add the
requirements to stackato.yml:

    requirements:
      pypm:
        - tornado
        - pymongo

See the [stackato.yml of
tornado-chat-mongo](https://github.com/Stackato-Apps/tornado-chat-mongo/blob/master/stackato.yml)
sample app for an example.

Alternatively, you can list the modules in a top-level
`requirements-pypm.txt` file. The format is similar,
if not same, as [pip requirements
files](http://www.pip-installer.org/en/latest/requirements) and
accepts version specification. The name of this file can be overriden by
setting the `PYPM_REQUIREMENTS_FILE` environment
variable.

### pip[](#pip "Permalink to this headline")

Definition [*pip*](/als/v1/admin/reference/glossary/#term-pip)

In addition - or as alternative - to
[*PyPM*](/als/v1/admin/reference/glossary/#term-pypm), your application
can also make use of pip to install certain dependencies. The above
tornado-chat-mongo sample installs "pycurl" using
[*pip*](/als/v1/admin/reference/glossary/#term-pip):

    requirements:
      pypm:
        - tornado
        - pymongo
      pip:
        - pycurl

If your application already contains a `requirements.txt`{.docutils
.literal} file, that will be automatically used to install dependencies;
no need to specify them manually in stackato.yml. The name of this file
can be overriden by setting the `PIP_REQUIREMENTS_FILE`{.docutils
.literal} environment variable.

**Note**

A [bug in pip](https://github.com/pypa/pip/issues/219) may prevent the
log file from being accessed by `helion logs`.

PyPy Support[](#pypy-support "Permalink to this headline")
-----------------------------------------------------------

Here is an example of pushing an app using PyPy.

First, clone the <https://github.com/Stackato-Apps/werkzeug-debugger>
repository.

Then add the following `BUILDPACK_URL` to the
*stackato.yml* file:

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

### [Table Of Contents](/als/v1/index-2/)

-   [Python](#)
    -   [Python with the Legacy
        Buildpack](#python-with-the-legacy-buildpack)
    -   [Django](#django)
    -   [Application URL](#application-url)
    -   [Database Services](#database-services)
        -   [DATABASE\_URL](#database-url)
        -   [VCAP\_SERVICES](#vcap-services)
    -   [Worker Applications](#worker-applications)
        -   [Example](#example)
    -   [Serving Static Files with
        uWSGI](#serving-static-files-with-uwsgi)
    -   [Using a custom web server](#using-a-custom-web-server)
    -   [Installing Python Packages](#installing-python-packages)
        -   [PyPM](#pypm)
        -   [pip](#pip)
    -   [PyPy Support](#pypy-support)
    -   [Other Python Frameworks](#other-python-frameworks)

