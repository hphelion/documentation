---
layout: default-devplatform
permalink: /als/v1/user/deploy/buildpack/
product: devplatform
title: "Buildpacks"
---
<!--PUBLISHED-->

Buildpacks[](#buildpacks "Permalink to this headline")
=======================================================

[Buildpacks](https://devcenter.heroku.com/articles/buildpacks) are
bundles of detection and configuration scripts which set up containers
to run applications. For a short introduction to writing buildpacks, see
[this presentation](http://talks.codegram.com/heroku-buildpacks).

Buildpacks are the recommended method for deploying applications to
Application Lifecycle Service. Buildpacks replace the built-in frameworks used in previous versions.

### Built-In Buildpacks[](#built-in-buildpacks "Permalink to this headline")

Application Lifecycle Service will cycle through the `detect` scripts of the built-in buildpacks prior to staging to match the code you are pushing.

### Legacy Buildpack[](#legacy-buildpack "Permalink to this headline")

The legacy buildpack is a special meta-buildpack for deploying applications configured for Cloud Foundry v1 without the need for extensive reconfiguration.

To use the Legacy buildpack: specify the `framework` type for your application (e.g. php,
play, rails3, sinatra, java\_web, java\_ee, etc.). You can optionally
set a specific `runtime:` as well. For example:

    name: bottle-py3
    framework:
      type: python
      runtime: python32

**Note**

When using the Legacy Buildpack, config-defined environment variable
values can only be updated by re-pushing the application with new
settings (see [*Legacy Buildpack and Environment
Variables*](/als/v1/admin/reference/known-issues/#known-issues-legacy-env)).

### Custom Buildpacks[](#custom-buildpacks "Permalink to this headline")

To specify the exact buildpack to use for deploying your application,
set a top-level `buildpack:` key in *manifest.yml*
to the URL of the buildpack's Git repository. For example:

    name: myrubyapp
    mem: 256MB
    buildpack: https://github.com/ActiveState/stackato-buildpack-ruby.git

**Note**

Not all Heroku buildpacks work with Application Lifecycle Service due to environmental
differences (e.g. relying on certain executables or libraries in
Heroku-specific locations). Test any buildpack before using it in
production deployments.

