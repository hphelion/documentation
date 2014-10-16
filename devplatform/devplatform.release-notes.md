---
layout: default-devplatform
title: "HP Helion Development Platform Documentation"
permalink: /helion/devplatform/release-notes/
product: devplatform

---
<!--UNDER REVISION-->

#HP Helion Development Platform Release Notes


The following release notes are for the HP Helion Development Platform 1.0 released on 10/14/2014. We hope you enjoy the release!
Known Issues:

1. **Intermittent Authentication Errors from Keystone**. Some requests to keystone will intermittently fail to authenticate. Retrying the request will generally succeed. This is a known issue and will be fixed in the next release.
1. **Database Service will not install if there are more than three availability zones**. You need to have only three availability zones to install the database service. 
1. **Database Instance deletion not available from the Horizon UI**. The Horizon UI is not able to delete database instances. This is a known issue and will be fixed in the next release.
2. **Password Field is not used when creating a RabbitMQ cluster**. The password field in the Horizon panel is not necessary when creating a RabbitMQ cluster, and will be ignored. This is a known issue and will be fixed in the next release.



----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
