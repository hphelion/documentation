---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/perl/dancer/
published: false
title: "Dancer"
---
<!--PUBLISHED-->

# HP Helion Development Platform: Dancer[](#dancer "Permalink to this headline")
===============================================

An app using the Dancer framework needs an *app.psgi* and
*requirements.txt* file.

In the *requirements.txt* file, list any module requirements, with at
least:

    Dancer
    Plack::Request
    YAML

In the *app.psgi* file, for a simple implementation:

    use Dancer;
    get '/' => sub { "hello world!" };
    dance;

Examples[](#examples "Permalink to this headline")
---------------------------------------------------

-   [Dancer Hello
    World](https://github.com/Stackato-Apps/dancer-helloworld): Hello
    World sample.