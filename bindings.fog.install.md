---
layout: default
title: "HP Cloud Services Ruby Fog Binding Installation"
permalink: /bindings/fog/install/
product: fog

---
# HP Cloud Services Ruby Fog Binding Installation

Before you can begin working with the Ruby Fog bindings, you have to install them (of course!).  <!--We recommend installing with the [RVM package](https://rvm.io//).-->  This page provides you with the installation information for the following operating systems:

* [Ubuntu Installation](#Ubuntu)
* [Mac OSX Installation](#MacOS)
* [CentOS Installation](#CentOS)
* [Uninstalling](#Uninstalling) 

[Please **download** the most recent Ruby Fog package (Version 0.0.20)](/file/hpfog-0.0.20.gem)!


<!--##Installation Prerequisites## {#Installation}

To install the HP Cloud Ruby Fog bindings on any of the currently-supported platforms, you need to have RVM installed on your system:

    curl -L get.rvm.io | bash -s stable

**Note**: On a Mac, you can also install RVM using [Jewelry Box](https://unfiniti.com/software/mac/jewelrybox), a RVM graphical user interface (GUI) for Mac OSX.

You are now ready to perform your installation on [Ubuntu](#Ubuntu), [MacOS](#MacOS), or [CentOS](#CentOS).-->


##Ubuntu Installation## {#Ubuntu}

If you plan on using the Ruby Fog binding on Ubuntu, we recommend you use Ubuntu versions 12.04 or 12.10.  The Ruby Fog bindings may work on other versions, but are not supported. 

To install the Ruby Fog bindings on the Ubuntu operating system, follow these steps while logged in as the root user:

1. Install Ruby and Ruby-dev:

        apt-get install ruby1.8 ruby-dev

2. Install RubyGems:

        apt-get install rubygems

3. Install the dependent libraries:

        apt-get install libxml2 libxml2-dev libxslt1-dev libxslt1.1 sgml-base xml-core

4. Install the RDoc Ruby source documenation generator package:

        gem install rdoc

5. Download and install the HP Cloud Ruby Fog bindings gem package:

        curl -sL https://docs.hpcloud.com/file/hpfog-0.0.20.gem >hpfog-0.0.20.gem
        gem install hpfog-0.0.20.gem

**Note**: Substitute the version number of the most current installation package (for example, `0.0.20`), which we have helpfully listed at the top of this page, in to the `curl` and `gem install` commands above.

##MacOS X Installation## {#MacOS}

Some Ruby packages require C/C++ compiler support.  On the MacOS, if you haven't already installed XCode, we recommend that you install it to provide the needed C/C++ compiler for your system.  

To install the Ruby Fog bindings on MacOS X, follow these steps while logged in as the root user:

1. Download and install Xcode.  You can [download the most recent version of XCode through the Mac App Store](https://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12).  If you want to install an earlier version of Xcode, go to the [Apple Developer](https://developer.apple.com/downloads/index.action) site and search for "Xcode".  In the results list, select the version of Xcode that you want and install it.  (Note that you need to be signed up as an "Apple Developer" to access the download.  Sign-up is free.)

2. To make your installation process easier we recommend that you install [Homebrew](http://wiki.github.com/mxcl/homebrew/installation).  Follow the instructions on the Homebrew page to install the package.  After you have downloaded Homebrew, the CLI command to install it is:

        homebrew install - ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

3. Add the Homebrew path to your $PATH environment variable.  You can either do this via the CLI command line:

        export PATH=:/usr/local/sbin:$PATH
        
    (The default Homebrew installation location is the `/usr/local/sbin` directory.)  Or you can add the Homebrew path (`/usr/local/sbin`) to your $PATH environment variable in your local `.profile` file.
    
4. Install RVM on your system:

        curl -L get.rvm.io | bash -s stable

    **Note**: You can also install RVM using [Jewelry Box](https://unfiniti.com/software/mac/jewelrybox), a RVM graphical user interface (GUI) for Mac OSX.

5. Install the packages required by RVM; the following command lists the required packages:
    
        source ~/.rvm/scripts/rvm
        rvm requirements # install required packages
        
6. Install the required packages listed in Step 5:

        brew install <packages>
        
    Where `<packages>` are the packages that you need to install.
    
7. Install the `libksba` library:

        brew install libksba

8. Install Ruby:

        rvm user all
        rvm install ruby-1.9.2 --with-gcc=clang
        
9. Use the Ruby version and make it the default:

        rvm use 1.9.2 --default

10. Download and install the HP Cloud Ruby Fog bindings gem:

        curl -sL https://docs.hpcloud.com/file/hpfog-0.0.20.gem >hpfog-0.0.20.gem
        gem install hpfog-0.0.20.gem

For further details, see [Installation Notes](#InstallationNotes).  See the [Connecting to the Cloud Service](/bindings/fog/connect) page for details on how to connect.

**Note**: Substitute the version number of the most current installation package (for example, `0.0.20`), which we have helpfully listed at the top of this page, in to the `curl` and `gem install` commands above.

##CentOS Installation ## {#CentOS}

If you plan on using the Ruby Fog binding on CentOS, we recommend you use CentOS versions 6.2 or 6.3.  The Ruby Fog bindings may work on other versions, but are not supported. 

To install the Ruby Fog bindings on CentOS, follow these steps while logged in as the root user:

1. Install Ruby and Ruby Dev:

        yum install -y ruby ruby-devel
    
2. Install Rubygems:

        yum install -y rubygems

3. Install the dependent libraries:

        yum install -y gcc make libxml2 libxml2-devel libxslt libxslt-devel

4. Install RDoc Ruby source documentation generator package:

        gem install rdoc

5. Download and install the HP Ruby Fog gem package:

        curl -sL https://docs.hpcloud.com/file/hpfog-0.0.20.gem >hpfog-0.0.20.gem
        gem install hpfog-0.0.20.gem

**Note**: Substitute the version number of the most current installation package (for example, `0.0.20`), which we have helpfully listed at the top of this page, in to the `curl` and `gem install` commands above.

<!--##Installation Notes## {#Installation}

Ensure RVM is loaded into a shell session as a function. For example, if you are using the ~/.bashrc file for your bash, you would need to add the following line to that file:

<code>
\[\[ -s "$HOME/.rvm/scripts/rvm" \]\] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.
</code>
-->
##Uninstalling## {#Uninstalling}

Its recommended that you uninstall a previous version prior to upgrading. To uninstall, execute the followin command while logged in as the root user:

        gem uninstall hpfog
