---
layout: default
title: "View Updates and Extensions"
permalink: /cloudos/moonshot/install/updates-and-extensions/
product: moonshot

---

<!--PUBLISH--> 


<script> 

function PageRefresh { 
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/install/customize-user-settings/">&#9664; PREV</a> | 
<a href="/cloudos/moonshot/install/">&#9650; UP</a> | <a href="/cloudos/moonshot/install/launch-admin-dashboard/">NEXT &#9654;</a> </p>

# View Updates and Extensions

This topic explains how to obtain patches and other relevant functionality from the HP Cloud OS Distribution Network (CODN).

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:600px;"> <b>Note:</b> The same <b>Updates and Extensions</b> 
functionality is available in the Administration Dashboard, which is the new dashboard that you will use.  For introductory information, you can read this topic. It is 
presented in the Operational Dashboard context. However you can perform the steps later, if you want, in the Administration Dashboard. In most cases, 
you will not need to take any action (at this point) on this Updates and Extensions page of the Operational Dashboard.
</p>


* [Signup for Cloud OS Distribution Network Access](#signup-for-cloud-os-distribution-network-access)
* [Configure Credentials](#configure-credentials)
* [Download and Install](#download-and-install)
* [Import an Update](#import-an-update)
* [Next Step](#next-step)

<!--
* [Modify the CODN Runtime Configuration](#modify-the-codn-runtime-configuration) 
  * [Server Host and Port](#server-host-and-port)
  * [Proxy Configuration](#proxy-configuration)
  * [Logging](#logging)
* [CODN Service Commands](#codn-service-commands)
-->


##Signup for Cloud OS Distribution Network Access {#signup-for-cloud-os-distribution-network-access}

You cannot access the updates from the HP Cloud OS for Moonshot Distribution Network unless you are a registered user. 

Perform the following steps to Sign up to the Cloud OS Distribution Network:

1. On the Operational Dashboard, click **Cloud** Tab to select it. The Cloud Tab is activated and the options are displayed in the left panel.

2. Click **Updates and Extensions** to open the Updates and Extensions page.

3. Click **Configure** displayed at the top right side of the page to display the Configure dialog box.

4. Click **Signup Now** displayed at the bottom of the page. It displays the HP Cloud OS Distribution Network Page. Perform the following:
	*  Click **Sign In** displayed at the top of the page to open the HP Web ID dialog box.

	*  Click **Sign Up** for Web ID to open create a HP Web ID dialog box.

	*  Enter the required details.

	*  Click the check box  against **I agree to the Terms of Use** to accept the terms and conditions.

	*  Click **Submit**. The credentials are authenticated and the account is created.
5. You can now configure your credentials.

##Configure Credentials {#configure-credentials}

Once you register yourself on the HP Cloud OS Distribution Network, you are required to configure your credentials. 

Perform the following steps to configure your credentials:

1. On the **Operational Dashboard**, click **Cloud** Tab to select it. The Cloud Tab is activated and the options are displayed in the left panel.

2. Click **Updates and Extensions** to open the Updates and Extensions page.

3. Click **Configure** displayed at the top right corner of the page to display the Configure dialog box.

4. In the **User Name** box, enter the email ID that you used while setting up your account in HP Cloud OS for Moonshot Distribution Network.

5. In the **Password** box, enter the password that you used for your account in the HP Cloud OS for Moonshot Distribution Network.

6. Click **OK** to save the details. The Updates and Extensions page is displayed with the list of available patches.<br>
OR<br>
Click **Cancel** to cancel the process.


##Download and Install {#download-and-install}

**Note:** Before you apply patch 1.2, ensure no operations are being performed using the Administration Dashboard or log out of the Administration Dashboard.

Perform the following steps to download the packages:

1. On the Operational Dashboard, click **Cloud** Tab to select it. The Cloud Tab is activated and the options are displayed in the left panel.

2. Click **Updates and Extensions** to open the Updates and Extensions page.

3. Click **Configure** displayed at the top right corner of the page to display the Configure dialog box.

4. Enter your credentials.

5. Click **OK** to save the details. The updates are displayed in the Updates and Extensions page.<br>
OR<br>
Click **Cancel** to cancel the process.

6. Click **Download** against the package that you want to download on your local system.

7. (Optional) To view the installation progress, click **More** drop-down list and select **View Progress**.

8. Click **More** drop-down list and select **Install** once the download is complete. The installation process starts and a message is displayed on completion. Wait for five minutes for the changes to be implemented to all the managed nodes (controller and compute).

##Import an Update {#import-an-update}

To import an update that is stored on your local system, do the following:

1. On the Operational Dashboard, click **Cloud** Tab to select it. The Cloud Tab is activated and the options are displayed in the left panel.

2. Click **Updates and Extensions** to open the Updates and Extensions page.

3. Click **Import** displayed on the top right corner of the page. An Import dialog box is displayed.

4. Click **Choose File** to display a dialog box to browse and select the update. The file displays in the Import dialog box.

5. Click **Import**. The file is imported to your local cloud and displayed in the Updates and Extensions page.<br>
OR<br>
Click **Cancel** to cancel the process.

6. Click **Download** to download the update. Once the download is successfully completed, **Publish** button displays.

7. Click **Publish** to publish the update.


Once the region is successfully created, more options are available in the Manage Clouds page. Select the desired option based on your requirements.
<!--
## Configure and Download Steps 

1. From the Cloud tab in the Operational Dashboard, click the **Updates and Extensions** panel. If you are accessing this page for the first time, 
there is no data to display in the table. <br> **Note:** The Operational Dashboard displays a warning message indicating that your credentials are not 
configured or there is no active session with the CODN. A session may timeout after 20 minutes.

2. Click the **Configure** button.

3. On the Configure dialog, if you are using it for the first time, sign up for the CODN.

4. After registering or logging in, you are returned to the Updates and Extensions panel. The Operational Dashboard presents the available downloads 
that are relevant to your HP Cloud OS for Moonshot environment.

5. Click the **Download** button located next to the item you want to download.  

6. Before installing an install module's hot fix, such as one labeled (for example) "Keystone Token Expiration Hotfix", verify that the install module you're about to update does exist for your cloud. To do this, access the HP Cloud OS for Moonshot Installation Dashboard. In Mozilla Firefox or Google 
Chrome, open https://192.168.124.10:3000. 

7. In the Installation Dashboard, open the proposal for the hot fix by clicking the **Edit** button next to the listed item.   

8. Return to the Operational Dashboard and its Updates and Extensions panel. Click **Install** next to the hot fix. The installation process starts. 

9. To check on the progress of the installation, click **More > View Progress**.  

10. Verify the patch installation. Once the job is in its completed state, reopen the patched proposal in the Installation Dashboard.  
Click **Edit**. For example, you should see the name of the hot fix, such as "Token-Expiration Hotfix Enabled." To apply the hot fix in your cloud, 
set its attribute Boolean value to **true**, click **Apply** and then **Save**.
--->
New patches may be available periodically. When you use the Administration Dashboard, be sure to revisit the Updates and Extensions panel on a regular basis. 

<!--
## Modify the CODN Runtime Configuration

CODN is a web service that provides catalog integration and content download services for the HP Cloud OS for Moonshot Operational Dashboard and 
HP Cloud OS for Moonshot Administration Dashboard. 

On your cloud controller node, the CODN configuration file is here:

<pre>
/etc/codn/codn.conf
</pre>

It contains parameters that set the runtime behavior of the CODN server. You can modify some, but not all, of the parameters. 

**Note:** Do not modify these sections of codn.conf:

* **codn_data**: this is the location of the job data information. 

* **codn_cache**: this is the location of the downloaded catalog entries. There is a directory for each catalog entry. 

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

You will probably not have to change the default logging configuration.
                
<pre>
logging = {
    'loggers': {
        'root': {'level': 'INFO', 'handlers': ['console']},
        'codn': {'level': 'INFO', 'handlers': ['console', 'file']},
        'py.warnings': {'handlers': ['console']},
        '__force_dict__': True
    },
    'handlers': {
        'console': {
            'class': 'logging.StreamHandler',
            'formatter': 'simple'
        },
        'file': {
            'class': 'logging.handlers.RotatingFileHandler',
            'filename': '/var/log/codn/codn.log',
            'maxBytes': 1048576,
            'backupCount': 5,
            'formatter': 'simple'
        }
    },
</pre>

The **INFO** level logging will look like following examples. The formats shown below were modified to avoid long line breaks.

The following shows the CODN start time:

<pre>
2013-12-13 13:45:09,755 INFO  [codn.api.app][MainThread] *** CODN service started ***
</pre>

The following shows CODN getting all the catalog entries:

<pre>
2013-12-13 13:45:18,283 INFO  [codn.api.controllers.hooks][MainThread]  
Response  to: 10.1.34.33 "GET /v1/catalog" 200 3485
</pre>

Here CODN gets catalog entry 470:

<pre>
2013-12-13 13:45:53,846 INFO  [codn.api.controllers.hooks][MainThread]  
Request from: 10.1.34.33 "GET /v1/catalog/470"

2013-12-13 13:45:54,699 INFO  [codn.api.controllers.hooks][MainThread]  
Response  to: 10.1.34.33 "GET /v1/catalog/470" 200 414
</pre>

CODN requests download of catalog entry 470:

<pre>
2013-12-13 13:45:58,263 INFO  [codn.api.controllers.hooks][MainThread]  
Request from: 10.1.34.33 "POST /v1/catalog/470/download"

2013-12-13 13:45:58,290 INFO  [codn.api.controllers.hooks][MainThread]  
Response  to: 10.1.34.33 "POST /v1/catalog/470/download" 200 51
</pre>

The next log entry shows the progress of the download for catalog entry 470:

<pre>
2013-12-13 13:45:58,306 INFO  [codn.common.util.job][MainThread] 
Download job(id=f386e918-643f-11e3-969d-0050569f1ba4) for catalog entry(id=470) 
changed status from CREATED to PROCESSING

2013-12-13 13:45:58,361 INFO  [codn.api.controllers.hooks][MainThread]  
Request from: 10.1.34.33 "GET /v1/catalog"

2013-12-13 13:45:59,501 INFO  [codn.api.controllers.hooks][MainThread]  
Response  to: 10.1.34.33 "GET /v1/catalog" 200 3489
</pre>

Here the download of catalog entry 470 has completed:

<pre>
2013-12-13 13:46:07,945 INFO  [codn.common.util.job][MainThread] 
Download job(id=f386e918-643f-11e3-969d-0050569f1ba4) for catalog entry(id=470) 
changed status from PROCESSING to COMPLETED
</pre>

The next log entry shows the install of downloaded catalog entry 470:

<pre>
2013-12-13 13:48:33,464 INFO  [codn.common.util.job][MainThread] 
Install job(id=50020722-6440-11e3-969d-0050569f1ba4) for catalog entry(id=470) 
changed status from CREATED to PROCESSING

2013-12-13 13:48:33,777 INFO  [codn.handlers.content.image][MainThread] 
Image Content Handler 
var/cache/codn/470/cirros.d/component/cirros-0.3.0-x86_64-disk.img
</pre>

Here in the log is the completed installation of catalog entry 470:

<pre>
2013-12-13 13:49:48,914 INFO  [codn.common.util.job][MainThread] 
Install job(id=50020722-6440-11e3-969d-0050569f1ba4) for catalog entry(id=470) 
changed status from PROCESSING to COMPLETED
</pre>

The CODN service should always be running, but if it is ever 'stopped' or restarted then you will see that also in the log:

<pre>
2013-12-13 14:00:56,921 INFO  [codn.api.app]  *** CODN service stopping ***
</pre>

### Setting Verbose Logging with DEBUG

If you need more detailed logging information, change 'codn' level logging from INFO to DEBUG, which would result in verbose logging: 

<pre>
'codn': {'level': 'DEBUG', 'handlers': ['console', 'file']},
</pre>


## CODN Service Commands

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
--> 

## Next Step

Having completed the installation steps, created your cloud, licensed the dashboards, and at least viewed Updated and Extensions and the CODN, 
you should now launch the Administration Dashboard to perform a set of post-deployment tasks. The steps that we'll describe are designed to familiarize 
you with the Administration Dashboard, and also verify that your deployed cloud is operating properly. 
See [Launch Administration Dashboard for Post-Deployment Tasks](/cloudos/moonshot/install/launch-admin-dashboard/). 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

