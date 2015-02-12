---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/perl/cgiapppsgi/
published: false
title: "CGI::Application::PSGI"
---
<!--PUBLISHED-->

# HP Helion 1.0 Development Platform: CGI Application::PSGI[](#cgi-application-psgi "Permalink to this headline")
=============================================================================

An app using the CGI::Application::PSGI framework needs an *app.psgi*
and *requirements.txt* file.

In the *requirements.txt* file, list any module requirements, with at
least:

    CGI::Application::PSGI
    Plack::Builder

In the *app.psgi* file, the basic code will be something like:

    #perl

    use lib "lib";

    use strict;
    use Plack::Builder;
    use CGI::Application::PSGI;
    use AppCore;

    my $handler = sub {
      my $env = shift;
      my $app = AppCore->new({ QUERY => CGI::PSGI->new($env) });
      CGI::Application::PSGI->run($app);
    };

    builder {
      enable 'Plack::Middleware::ContentLength';
      $handler;
    };

In the above example, AppCore.pm is located in the local lib folder and
handles processing of the data and the response as per the
[CGI::Application](http://search.cpan.org/~markstos/CGI-Application-4.50/lib/CGI/Application.pm)
documentation.

**Note**

The `Plack::Middleware::ContentLength` code adds the
Content-Length header which is currently required for Perl apps under
Application Lifecycle Service.

Examples[](#examples "Permalink to this headline")
---------------------------------------------------

-   [Rubric](https://github.com/Stackato-Apps/rubric): The winning entry from our Application Lifecycle Service contest.
