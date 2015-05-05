---
layout: default-devplatform
permalink: /helion/devplatform/als/user/deploy/languages/go/
product: devplatform2.0
title: "HP Helion 1.2 Development Platform: Go "
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer 
role2: ISV Developer
role3: Service Developer
authors: Jayme P

---
<!--UNDER REVISION-->

# HP Helion 1.2 Development Platform: Go {#go}
[See the Helion 1.0 Development Platform version of this page](/als/v1/user/deploy/languages/go/)

Go applications ([golang](http://golang.org/)) are supported through a
BuildPack framework and can be pushed using the Application Lifecycle Service.

## Local Installation {#local-install}

To build Go code, install it locally using one of the [Go packages](http://code.google.com/p/go/downloads/list).

## Deployment {#deployment}

Here is a basic deployment setup based on the ["Hello World" Go sample
application](https://github.com/Stackato-Apps/go-hello-buildpack).

### Files {#files}

You will need the following files to deploy a Go app on Application Lifecycle Service:

    app.go
    Procfile
    .godir
    manifest.yml

#### app.go {#app-go}

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

#### Procfile {#procfile}

To run your web process, you need to declare what command to use. In
this case, we simply need to execute our Go program. Use Procfile to
declare how your web process type is run:

    web: server

#### .godir {#godir}

The `go` tool uses the directory name of your
project to name executables and determine package import paths. Create
a file called .godir, in your project root, containing the path from
*\$GOPATH/src* to your project root:

    example.com/hello

#### manifest.yml {#manifest-yml}

This file is optional, as the framework will automatically be detected
by Application Lifecycle Service. However, it can still be used to set the app name,
configure settings, create services, etc. See the [*manifest.yml*](/helion/devplatform/als/user/deploy/manifestyml/) documentation.

	name:
	   hello-go

## Examples {#examples}

-   ["Hello World" Go sample
    application](https://github.com/Stackato-Apps/go-hello-buildpack).
-   [Getting Started with Go on
    Heroku](http://mmcgrana.github.com/2012/09/getting-started-with-go-on-heroku).
