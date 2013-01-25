---
layout: default
title: "HP Cloud Services Ruby Fog Binding Installation"
permalink: /bindings/fog/install/
product: fog

---
# HP Cloud Services Ruby Fog Binding Installation

Before you can begin working with the Ruby Fog bindings, you have to install them (of course!).  <!--We recommend installing with the [RVM package](https://rvm.io//).-->  This page provides you with the installation information for the following operating systems:

* [Installation Prerequisites](#Installation)
* [Ubuntu Installation](#Ubuntu)
* [Mac OSX Installation](#MacOS)
* [CentOS Installation](#CentOS)
* [Uninstalling](#Uninstalling)

[Please download the most recent Ruby Fog package (Version 0.0.18)](/file/hpfog-0.0.18.gem)!


##Installation Prerequisites## {#Installation}

To install the HP Cloud Ruby Fog bindings on any of the currently-supported platforms, you need to have RVM installed on your system:

    curl -L get.rvm.io | bash -s stable

<strong>Note</strong>: On a Mac, you can also install RVM using [Jewelry Box](https://unfiniti.com/software/mac/jewelrybox), a RVM graphical user interface (GUI) for Mac OSX.

You are now ready to perform your installation on [Ubuntu](#Ubuntu), [MacOS](#MacOS), or [CentOS](#CentOS).


##Ubuntu Installation## {#Ubuntu}

To install the Ruby Fog bindings on the Ubuntu operating system, follow these steps:

<!--1. Install the packages required by RVM:

        sudo apt-get update
        sudo apt-get install -y build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion

2. Install Ruby:

        #  If you intall rvm as root, you may have to source the /etc/profile.d/rvm.sh file instead of ~/.rvm/scripts/rvm.
        source ~/.rvm/scripts/rvm
        rvm user all
        rvm install 1.9.2

3. Use the Ruby version and make it the default:

        rvm use 1.9.2 --default-->

1. Install Ruby:

        sudo apt-get install ruby1.8

2. Install Ruby-dev:

        sudo apt-get install ruby-dev

3. Install RubyGems:

        sudo apt-get install rubygems

4. Install dependent libraries:

        sudo apt-get install libxml2 libxml2-dev libxslt1-dev libxslt1.1 sgml-base xml-core

5. Download and install the HP Ruby Fog bindings gem package:

        curl -sL https://docs.hpcloud.com/file/hpfog-0.0.18.gem >hpfog-0.0.18.gem
        gem install hpfog-0.0.18.gem

<stonrg>Note</strong>: Substitute the version number of the most current installation package (for example, `0.0.18`), which we have helpfully listed at the top of this page.

##MacOS X Installation## {#MacOS}

Some Ruby packages require C/C++ compiler support.  On the MacOS, if you haven't already installed XCode, we recommend that you install it to provide the needed C/C++ compiler for your system.  The later versions of Xcode do not work smoothly with Ruby yet, so we recommend you install Xcode Version 4.1.  Since this is not the most current version of Xcode, you need to go to the [Apple Developer](https://developer.apple.com/downloads/index.action) site and search for "Xcode".  In the results list, select "Xcode 4.1" and install it on your system before beginning the HP Cloud Ruby Fog Binding installation below.  (If you already have Xcode installed, you do not need to downgrade to version 4.1.)

<strong>Note</strong>:  You need to be signed up as an "Apple Developer" to access the download.  Sign-up is free. 

<!--In addition, to make your installation process easier we recommend that you install [Homebrew](http://wiki.github.com/mxcl/homebrew/installation).  Follow the instructions on the Homebrew page to install the package.-->

To install the Ruby Fog bindings on MacOS X, follow these steps:

1. Install packages required by RVM; the following command lists the required packages:
    
        source ~/.rvm/scripts/rvm
        rvm requirements # install required packages

    <strong>Note</strong>:  You may see a series of advisory messages in your terminal window after executing the <font face="Courier">rvm requirements</font> command; follow the instructions that are desired and/or applicable to your personal environment.  We recommend that you follow the process for For Ruby 1.9.2.  If you decide to install 1.9.3, you must install <font face="Courier">libksba</font>:

        brew install libksba

2. Install Ruby:

        rvm user all
        rvm install 1.9.2

3. Use the Ruby version and make it the default:

        rvm use 1.9.2 --default

4. Download and install the HP Ruby Fog bindings gem:

        curl -sL https://docs.hpcloud.com/file/hpfog-0.0.18.gem >hpfog-0.0.18.gem
        gem install hpfog-0.0.18.gem

For further details, see [Installation Notes](#InstallationNotes).

<stonrg>Note</strong>: Substitute the version number of the most current installation package (for example, `0.0.18`), which we have helpfully listed at the top of this page.

##CentOS Installation ## {#CentOS}

To install the Ruby Fog bindings on CentOS, follow these steps:

1. Install Ruby:

        sudo yum install ruby
        sudo gem install rdoc

2. Download and install the HP Fog gem:

        curl -sL https://docs.hpcloud.com/file/hpfog-0.0.18.gem >hpfog-0.0.18.gem
        sudo gem install hpfog-0.0.18.gem

<stonrg>Note</strong>: Substitute the version number of the most current installation package (for example, `0.0.18`), which we have helpfully listed at the top of this page.

<!--##Installation Notes## {#Installation}

Ensure RVM is loaded into a shell session as a function. For example, if you are using the ~/.bashrc file for your bash, you would need to add the following line to that file:

<code>
\[\[ -s "$HOME/.rvm/scripts/rvm" \]\] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.
</code>
-->
##Uninstalling## {#Uninstalling}

Its recommended that you uninstall a previous version prior to upgrading. To uninstall:

        gem uninstall hpfog
