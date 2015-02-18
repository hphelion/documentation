---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/perl/mojo/
published: false
title: "Mojolicious"
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer 
role2: ISV Developer
role3: Service Developer
authors: Jayme P

---
<!--PUBLISHED-->

# HP Helion Development Platform: Mojolicious[](#mojolicious "Permalink to this headline")
=========================================================

Mojolicious is a web framework with a native PSGI interface which is
easy to build and run on Application Lifecycle Service.

A simple app using the Mojolicious framework needs four files:

1.  *app.psgi*
2.  *app.pl*
3.  *requirements.txt*
4.  *manifest.yml*

In the *requirements.txt* file, list any module requirements, with at
least:

    Mojolicious

In the *app.psgi* file, for a simple implementation:

    $ENV{MOJO_MODE} = 'production';
    require 'app.pl';

The *app.pl* file contains the core functionality:

    use Mojolicious::Lite;

    # Simple response to display Environment Variables.
    get '/' => sub {
            my $self = shift;
            $self->render_text(join("<br>", map "$_=$ENV{$_}", sort keys %ENV));
    };

    app->start;

The *manifest.yml* file contains deployment instructions for Application Lifecycle Service.
See complete details for this file in the [*Configuration With
manifest.yml*](/als/v1/user/deploy/manifestyml/) section.

Examples[](#examples "Permalink to this headline")
---------------------------------------------------

-   [Mojo Hello
    World](https://github.com/Stackato-Apps/mojo-helloworld): the
    simplest possible Mojolicious demo.
-   [Mojo Photobooth](https://github.com/Stackato-Apps/photobooth):
    Mojolicious webapp to emulate public photobooths.