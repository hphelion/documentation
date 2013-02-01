---
layout: default
title: "HP Cloud Services FAQ"
permalink: /faq/

---
# HP Cloud Services FAQ

What is a web site without an FAQ or two?  Well, a pain in the neck to use, honestly; that's why we've tried to provide you with a comprehensive one here.  If you have any suggestions on additions or improvements to our little effort here, please let us know on the forums!

<!--reference ruby fog and unix cli to install pages
after uninstalling, you can install a new gem from [wherever]-->

For your edification and delectation, we have FAQs in the following areas:

* [UNIX CLI](#UnixCLI)
* [Ruby Fog Bindings](#RubyFogBindings)

## UNIX CLI## {#UnixCLI}

The questions we address in the UNIX CLI section of this FAQ are:

* [How do I install or upgrade HP Cloud Unix CLI?](#HowdoIinstallHPCloudUnixCLI)
* [How do I get help with HP Cloud Unix CLI?](#HowdoIgethelpwithHPCloudUnixCLI)
* [How do I diagnose a problem with the CLI?](#HowdoIDebugHPCloudUnixCLI)
* [How do I install HP Cloud Unix CLI without RVM?](#HowdoIinstallHPCloudUnixCLIwithoutRVM)
* [How do I uninstall HP Cloud Unix CLI?](#HowdoIuninstallHPCloudUnixCLI)
* [What if these FAQs didn't answer my questions?](#WhereelsecanIgoformoreinformationUnixCLI)

### How do I install or upgrade HP Cloud Unix CLI?### {#HowdoIinstallHPCloudUnixCLI}

Please surf on over to the [installation page](/cli/unix/install) for full installation information.

### How do I get help with HP Cloud Unix CLI?### {#HowdoIgethelpwithHPCloudUnixCLI}

You can get a list of commands at any time by calling the hpcloud command without any arguments:

    hpcloud

Each command has help built in which includes specific examples of use, aliases you can use and more. To see help for a specific command use:

    hpcloud help <command>

Where `command` is the command for which you want help.  If you want to check which version of the tool you have installed:

    hpcloud info

### How do I diagnose problems with the HP Cloud Unix CLI?### {#HowdoIDebugHPCloudUnixCLI}
 
There is an article that covers how to run the HP Cloud Unix CLI with [verbose debugging output](/cli/unix/articles/debugging).
 
 
### How do I install HP Cloud Unix CLI without RVM?### {#HowdoIinstallHPCloudUnixCLIwithoutRVM}

If you choose not to use RVM, you must install the [gem](/glossary#gem) as a super user.

### How do I uninstall HP Cloud Unix CLI?### {#HowdoIuninstallHPCloudUnixCLI}

To uninstall the UNIX CLI, all you have to do is run the uninstall command:

    gem uninstall hpcloud

### Where else can I go for more information?### {#WhereelsecanIgoformoreinformationUnixCLI}

Plenty of places!  You might consider starting with the [Ruby Fog documentation](/bindings/fog) itself.  If what you're looking for isn't there, you can also try [our community forums](https://community.hpcloud.com/).  If you're still baffled, you can [open a support case](https://console.hpcloud.com/cases), or click the "Chat Now" icon in the upper-right corner of this page to chat with our support folks.  And of course, feel free to browse [our entire site](https://www.hpcloud.com/)!

<!--I need the HTML for launching a support chat window-->

##Ruby Fog Bindings## {#RubyFogBindings}

The questions we address in the Ruby Fog bindings section of this FAQ are:

* [How do I install HP Cloud Ruby Fog?](#HowdoIinstallHPCloudRubyFog)
* [How do I install HP Cloud Ruby Fog without RVM?](#HowdoIinstallHPCloudRubyFogwithoutRVM)
* [How do I upgrade HP Cloud Ruby Fog?](#HowdoIupgradeHPCloudRubyFog)
* [How do I uninstall HP Cloud Ruby Fog?](#HowdoIuninstallHPCloudRubyFog)
* [What if these FAQs didn't answer my questions?](#WhereelsecanIgoformoreinformationRubyFog)

### How do I install HP Cloud Ruby Fog?### {#HowdoIinstallHPCloudRubyFog}

Please surf on over to the [installation page](/bindings/fog/install) for full installation information.

### How do I install HP Cloud Ruby Fog without RVM?### {#HowdoIinstallHPCloudRubyFogwithoutRVM}

If you choose not to use RVM, you must install all required dependencies before you install the HP Cloud Ruby Fog [gem](/glossary#gem).

<!--link to nokogiri package and install information?-->

### How do I upgrade HP Cloud Ruby Fog?### {#HowdoIupgradeHPCloudRubyFog}

To upgrade HP Cloud Ruby Fog, you first must uninstall the gem and then install the new gem:

    gem uninstall hpfog
    gem install $(wget -q --no-check-certificate -O - https://docs.hpcloud.com/sites/default/files/downloads/hpfog_3.tar | tar -xvzf -)

### How do I uninstall HP Cloud Ruby Fog?### {#HowdoIuninstallHPCloudRubyFog}

To uninstall Ruby Fog, all you have to do is run the uninstall command:

    gem uninstall hpfog

### Where else can I go for more information?### {#WhereelsecanIgoformoreinformationRubyFog}

Plenty of places!  You might consider starting with the [Ruby Fog documentation](/bindings/fog) itself.  If what you're looking for isn't there, you can also try [our community forums](https://community.hpcloud.com/).  If you're still baffled, you can [open a support case](https://console.hpcloud.com/cases), or click the "Chat Now" icon in the upper-right corner of this page to chat with our support folks.  And of course, feel free to browse [our entire site](https://www.hpcloud.com/)!

<!--I need the HTML for launching a support chat window-->

<!--
## Installation

## Deployment

## Windows CLI
-->
