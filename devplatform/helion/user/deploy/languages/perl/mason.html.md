---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/perl/mason/
published: false
title: "Mason"
---
<!--PUBLISHED-->

# HP Helion Development Platform: Mason[](#mason "Permalink to this headline")
=============================================

Mason is a templating system that can handle web requests directly via
PSGI, or act as the view layer for web frameworks such as Catalyst or
Dancer. In the example below, it is used on its own to create a simple
application.

A basic files needed to create an app using Mason are:

1.  *app.psgi*
2.  *requirements.txt*
3.  *manifest.yml*

Template files are also needed, which you can read about in the Mason
documentation, or in our [Hello World sample
app](https://github.com/Stackato-Apps/mason-helloworld).

In the *requirements.txt* file, list any module requirements, with at
least:

    Mason
    Plack::Builder
    Mason::Plugin::PSGIHandler
    Plack::Middleware::ReverseProxy

In the *app.psgi* file:

    #!/usr/bin/perl
    use Cwd qw(realpath);
    use File::Basename;
    use Mason;
    use Plack::Builder;
    use warnings;
    use strict;

    # Include Mason plugins here
    my @plugins = ('PSGIHandler');

    # Create Mason object
    my $cwd = dirname( realpath(__FILE__) );
    my $interp = Mason->new(
            comp_root => "$cwd/comps",
            data_dir  => "$cwd/data",
            plugins   => \@plugins,
    );

    # PSGI app
    my $app = sub {
            my $env = shift;
            $interp->handle_psgi($env);
    };

    builder {
            # Include PSGI middleware required for Application Lifecycle Service
            enable "Plack::Middleware::ContentLength";
            enable "Plack::Middleware::ReverseProxy";
            $app;
    };

The *manifest.yml* file contains deployment instructions for Application Lifecycle Service. See complete details for this file in the [*Configuration With manifest.yml*](/als/v1/user/deploy/manifestyml/) section.

Examples[](#examples "Permalink to this headline")
---------------------------------------------------

-   [Mason Hello
    World](https://github.com/Stackato-Apps/mason-helloworld): Hello
    World sample.
