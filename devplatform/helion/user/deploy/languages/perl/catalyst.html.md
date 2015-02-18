---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/perl/catalyst/
published: false
title: "Catalyst"
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer 
role2: ISV Developer
role3: Service Developer
authors: Jayme P

---
<!--PUBLISHED-->

# HP Helion Development Platform: Catalyst[](#catalyst "Permalink to this headline")
===================================================

Catalyst is a framework for building web applications, which will run on
Application Lifecycle Service. To learn more about Catalyst, see the [Catalyst
documentation](https://metacpan.org/module/Catalyst). Also, take a look
at the Application Lifecycle Service sample apps listed below to see some working code
examples.

Home Directory[](#home-directory "Permalink to this headline")
---------------------------------------------------------------

Catalyst makes different assumptions on its Home directory depending on
whether or not it is installed in @INC. It makes this distinction based
on the presence of a *Makefile.PL* or *BUILD.PL* file in the app
directory, so it is important to have one even if all prerequisites are
installed via *requirements.txt*.

Alternatively, the Home directory can be [set
explicitly](https://metacpan.org/module/Catalyst#Home) with environment
variables. For example, you could set CATALYST\_HOME in *manifest.yml*:

    env:
      CATALYST_HOME: $HOME

Examples[](#examples "Permalink to this headline")
---------------------------------------------------

-   [Catalyst Tutorial
    2](https://github.com/Stackato-Apps/catalyst-tut2): Sample
    application from chapter 2 of the Catalyst-Manual.
-   [Catalyst Tutorial
    3](https://github.com/Stackato-Apps/catalyst-tut3): Another Catalyst
    tutorial.
-   [Catalyst Hello
    World](https://github.com/Stackato-Apps/catalyst-welcome): A simple
    Catalyst example.