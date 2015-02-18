---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/perl/dancer/
published: false
title: "Dancer"
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer 
role2: ISV Developer
role3: Service Developer
authors: Jayme P

---
<!--PUBLISHED-->

# HP Helion 1.0 Development Platform: Dancer[](#dancer "Permalink to this headline")
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
