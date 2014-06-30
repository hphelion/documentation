---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/perl/perlcgi/
---

Perl CGI[](#perl-cgi "Permalink to this headline")
===================================================

The 'perlcgi' framework can be used to run *any* CGI script, but (like
the [*perl*](index.html#perl-index) framework) it provides ActivePerl in
the default PATH and supports module installation via
[*PPM*](index.html#perl-ppm) and [*cpanm*](index.html#perl-cpanm).

Unlike the 'perl' framework, setting the
[*start-file*](/als/v1/user/deploy/stackatoyml/#stackato-yml-start-file) option
has no effect, as there is no permanently running application. A new
instance of a CGI script is started for each request.

Perl scripts deployed with this framework should begin with:

    #!/usr/bin/env perl

Example[](#example "Permalink to this headline")
-------------------------------------------------

-   [perlcgi-env](https://github.com/Stackato-Apps/perlcgi-env): A
    simple Perl CGI script that shows environment variables.

### [Table Of Contents](/als/v1/index-2/)

-   [Perl CGI](#)
    -   [Example](#example)

