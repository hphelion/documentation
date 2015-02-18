---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/go/
product: devplatform
title: "Go"
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer 
role2: ISV Developer
role3: Service Developer
authors: Jayme P

---
<!--PUBLISHED-->

# HP Helion 1.0 Development Platform: Go {#go}

Go applications ([golang](http://golang.org/)) are supported through a
BuildPack framework, and can be pushed to Application Lifecycle Service with a basic setup.

Local Install[](#local-install "Permalink to this headline")
-------------------------------------------------------------

To build Go code, install it locally using one of the [Go
packages](http://code.google.com/p/go/downloads/list).

Deployment[](#deployment "Permalink to this headline")
-------------------------------------------------------

Here is a basic deployment setup based on the ["Hello World" Go sample
application](https://github.com/Stackato-Apps/go-hello-buildpack).

### Files[](#files "Permalink to this headline")

You will need the following files to deploy a Go app on Application Lifecycle Service:

    app.go
    Procfile
    .godir
    manifest.yml

#### app.go[](#app-go "Permalink to this headline")

The Go buildpack recognizes Go apps by the existence of a .go source
file anywhere in the repository:

    package main

    import (
            "fmt"
            "log"
            "net/http"
            "os"
    )

    func main() {
            http.HandleFunc("/", hello)
            err := http.ListenAndServe(":"+os.Getenv("PORT"), nil)
            if err != nil {
                    log.Fatal("ListenAndServe:", err)
            }
    }

    func hello(w http.ResponseWriter, req *http.Request) {
            fmt.Fprintln(w, "hello, world!")
    }

#### Procfile[](#procfile "Permalink to this headline")

To run your web process, you need to declare what command to use. In
this case, we simply need to execute our Go program. Use Procfile to
declare how your web process type is run:

    web: server

#### .godir[](#godir "Permalink to this headline")

The `go` tool uses the directory name of your
project to name executables and determine package import paths. Create
a file called .godir, in your project root, containing the path from
*\$GOPATH/src* to your project root:

    example.com/hello

#### manifest.yml[](#manifest-yml "Permalink to this headline")

This file is optional, as the framework will automatically be detected
by Application Lifecycle Service. However, it can still be used to set the app name,
configure settings, create services, etc. See the [*manifest.yml
docs*](/als/v1/user/deploy/manifestyml/).

> name:
> :   hello-go

Examples[](#examples "Permalink to this headline")
---------------------------------------------------

-   ["Hello World" Go sample
    application](https://github.com/Stackato-Apps/go-hello-buildpack).
-   [Getting Started with Go on
    Heroku](http://mmcgrana.github.com/2012/09/getting-started-with-go-on-heroku).
