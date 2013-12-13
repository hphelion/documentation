---
layout: default
title: "Updates and Extensions"
permalink: /cloudos/install/updates-and-extensions/
product: cloudos

---

<a name="_top"> </a>

<script> 

function PageRefresh { 
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/install/hot-fixes/">&#9664; PREV</a> | <a href="/cloudos/install/">&#9650; UP</a> | <a href="/cloudos/install/advanced-cloud-setup/">NEXT &#9654;</a> </p>

# Updates and Extensions

This topic explains how to obtain patches and other relevant functionality from the HP Cloud OS Distribution Network (CODN).

* [Start in the HP Cloud OS Operational Dashboard](#start-in-the-hp-cloud-os-operational-dashboard)
* [Modify the CODN Runtime Configuration](#modify-the-codn-runtime-configuration) 
  * [Service Commands](#service-commands)
  * [Server Host and Port](#server-host-and-port)
  * [Proxy Configuration](#proxy-configuration)
  * [Logging](#logging)
* [Next Step](#next-step)


## Start in the HP Cloud OS Operational Dashboard

1. From the Cloud tab in the Operational Dashboard, click the **Updates and Extensions** panel. If you are accessing this page for the first time, there is no data to display in the table.

2. Click the **Configure** button.

3. On the Configure dialog, if you are using it for the first time, sign up for the CODN catalog store.

4. After registering or logging in, you are returned to the Updates and Extensions panel. The Operational Dashboard presents the available downloads that are relevant to your HP Cloud OS environment.

5. Click the **Download** button that is located next to an item you want to acquire.  

6. Before installing an install module's hot fix, such as one labeled (for example) "Keystone Token Expiration Hotfix", verify that 
the install module you're about to update does exist for your cloud. To do this, access the HP Cloud OS Installation Dashboard. 
In Mozilla Firefox or Google Chrome, open http://192.168.124.10:3000. <!-- The login is crowbar / crowbar. --> 

7. In the Installation Dashboard, open the proposal for the hot fix by clicking the **Edit** button next to the listed item.   

8. Return to the Operational Dashboard and its Updates and Extensions panel. Click **Install** next to the hot fix. The installation process starts. 

9. To check on the progress of the installation, click **More > View Progress**.  

10. Verify the patch installation. Once the job is in its completed state, reopen the patched proposal in the Installation Dashboard.  Click **Edit**. For example, you should see the name of the hot fix, such as 
"Token-Expiration Hotfix Enabled." To apply the hot fix in your cloud, set its attribute Boolean value to **true**, click **Apply** and then **Save**.

New patches may be available periodically. Be sure to revisit the Updates and Extensions panel on a regular basis. 

## Modify the CODN Runtime Configuration

CODN is a web service that provides catalog integration and content download services for the HP Cloud OS Operational Dashboard and 
HP Cloud OS Administration Dashboard. 

On your cloud controller node, the CODN configuration file is here:

<pre>
/etc/codn/codn.conf
</pre>

It contains parameters that can be used to change the runtime behavior of the CODN server. 

### Service Commands

You can start, monitor, and stop the CODN service with the following commands:

<pre>
service codn start  
service codn status 
service codn stop
</pre> 

If you edit codn.conf, be sure to stop and then start the service again:

<pre>
service codn stop 
service codn start
</pre>

Then check its status:

<pre>
service codn status
</pre>

If the service does not restart, check the codn.conf file for syntax errors.

### Server Host and Port

In /etc/codn/codn.conf, you can configure the host and port and proxy information for the web service.

<pre>
server = 
    'port': '21131',  
    'host': '0.0.0.0' 
}
</pre>
	
### Proxy Configuration

In /etc/codn/codn.conf, you can configure the proxy for connecting to the CODN Web catalog. For example:

<pre>
http_proxy = 'http://myproxy.myco.com:8080'
https_proxy = http_proxy
</pre>

### Logging

You can also configure the logging level and related parameters for the CODN service.

<pre>
logging = {
    'loggers': {
        'root': {'level': 'INFO', 'handlers': ['console']},
        'codn': {'level': 'DEBUG', 'handlers': ['console', 'file']},
        'py.warnings': {'handlers': ['console']},
        '__force_dict__': True
    },
    'handlers': {
        'console': {
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
            'formatter': 'simple'
        },
        'file': {
            'level': 'DEBUG',
            'class': 'logging.handlers.RotatingFileHandler',
            'filename': '/var/log/codn/codn.log',
            'maxBytes': 1048576,
            'backupCount': 5,
            'formatter': 'simple'
        }
    },
    'formatters': {
        'simple': {
            'format': ('%(asctime)s %(levelname)-5.5s [%(name)s]'
                       '[%(threadName)s] %(message)s')
        }
    }
}
</pre>

## Next Step

If you have not already done so, proceed to [Launch the Administration Dashboard](/cloudos/install/launch-admin-dashboard).

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

