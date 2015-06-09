---
layout: default-devplatform
title: "HP Helion 1.2 Development Platform: Deploying your first .NET Application"
permalink: /helion/devplatform/1.2/windows/deployingnet/
product: devplatform2.0
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.2
role1: Systems Administrator 
role2: System Engineer
role3: Cloud Administrator
role4: Network Administrator
role5: Application Developer
Role6: Security Engineer
role7: Application Developer 
role8: ISV Developer
role9: Service Developer
authors: Patrick F

---
<!--PUBLISH-->

# HP Helion 1.2 Development Platform: Deploying your first .NET Application 

<span style="font-size:70%">*Windows, .NET, SQL Server, and IIS are either registered trademarks or trademarks of Microsoft Corporation in the United States and/or other countries.*</span>

This tutorial demonstrates how to deploy an application to a Windows Server instance running in an HP Helion OpenStack environment using the toolset provided. For the purposes of this tutorial, you'll deploy Microsoft's Contoso University sample application.

## System requirements

This tutorial requires the following software components:

* Visual Studio 2013. Any edition is supported, including the Community (Free) edition.
* Cloud Foundry Extensions and Cloud Foundry MSBuild tasks. See <a href="/helion/devplatform/1.2/windows/tools_guide#cloudfoundryexplorer">Windows and .NET Tools Guide: Cloud Foundry Explorer</a> and <a href="/helion/devplatform/1.2/windows/tools_guide#msbuild">Windows and .NET Tools Guide: MSBuild Tasks</a> for more details. 
* Download and extract the <a href="https://code.msdn.microsoft.com/ASPNET-MVC-Application-b01a9fe8">Contoso University Sample Application</a>.

## Deploy the sample application from Visual Studio

<ol>
<li>Open <code>&lt;sample directory&gt;/C#/ContosoUniversity.sln</code> in Visual Studio.</li> 
<li>Install the <strong>Cloud Foundry MSBuild Tasks</strong> following these directions here: <a href="/helion/devplatform/1.2/windows/tools_guide#msbuild" target="blank">Windows and .NET Tools Guide: Cloud Foundry Explorer</a>
<li>In Visual Studio, open <code>web.config</code>.</li>
<li>Change the following configuration line (this will pull the connection string parameters from environment variables, rather than using hardcoded values):

<pre>
  &lt;add name="SchoolContext"
    connectionString= 
      "Data Source=(LocalDb)\v11.0; 
      Initial Catalog=ContosoUniversity2; 
      Integrated Security=SSPI;" 
    providerName="System.Data.SqlClient" 
  /&gt;
</pre>
	
to:
	
<pre>
  &lt;add name="SchoolContext" 
    connectionString=
      "Server={ContosoUniversity-db#hostname},{ContosoUniversity-db#port};
      Database={ContosoUniversity-db#name};
      User Id={ContosoUniversity-db#username};
      Password={ContosoUniversity-db#password};
      MultipleActiveResultSets=true;" 
    providerName="System.Data.SqlClient" /&gt;
</pre>
</li>
<li>Save <code>web.config</code>.</li>
<li>Build the project locally to verify that it builds correctly, and all NuGet packages successfully install. Once the project builds successfully, go to the next step.
<br/>
	<img src="media/windows_build.png"></li>
<li>Right click the project and select <strong>Publish to Cloud Foundry</strong>.
<br/>	
	<img src="media/windows_deploy_contextmenu.png">
</li> 
<li>In the <strong>Login Wizard</strong> dialog, enter the URL for the ALS cluster, and a user and password with sufficient privileges. Check the <strong>Skip SSL Validation</strong> checkbox if your Helion OpenStack installation uses self-signed certificates (as it does in HP Helion Public Cloud):<br />
<img src="media/windows_publish_credentials.png" />
 </li>
<li> In the <strong>Cloud Foundry Publish Profile</strong> dialog, enter the following values and click <strong>Publish</strong>:
<ul>
<li><strong>Organization and Space:</strong> Select from one of the provided options.</li>
<li><strong>Name:</strong> The default value is the name of the application.</li>
<li><strong>Stack:</strong> Leave as <code>win2012r2</code></li>
<li><strong>Routes</strong>: Typically the same as the **Name** entry.</li>
<li><strong>Memory</strong>: The amount of memory the application will use (e.g. 512 MB).</li>
<li><strong>Instances</strong>: The number of separate installations of the application.</li>
<li><strong>Services</strong>: Enter the services to bind to the application, in the form <code>Name, service type, quota</code>, with separate services separated by semicolons. Example: <code>ContosoUniversity-db,mssql2014,default</code>
<br />
	 <strong>Note:</strong> If you are adding a SQL server service, ensure that the name matches the value set in the config file. Example: <code>ContosoUniversity-db,mssql2014,free</code>  </li>
<li> <strong>Build Locally</strong>: Check to test the build by building the application locally before deployment.</li>
<li> <strong>Configuration</strong>: Set the build configuration (e.g. Debug). This is only available if the application is built on the server.</li>
<li> <strong>Platform</strong>: Set the target CPU platform (e.g. Any CPU). This is only available if the application is built on the server.</li>
</ul>
<img src="media/windows_deploy_cf.png" /> 
</li>

<li>Open or refresh Cloud Foundry Explorer. You can open Cloud Foundry Explorer under <strong>View-&gt;Other Windows-&gt;Cloud Foundry Explorer</strong>.
 
	<img src="media/windows_refresh.png" />
</li>
<li>Right click the "Contoso" application and select <strong>View in Browser</strong>:
 
	<img src="media/windows_viewbrowser.png" />
</li></ol>
That's it! You are ready to use your application.

## Deploy the sample application from the command line

If you are deploying your application from the command line, you do not need Visual Studio to deploy your application. You can deploy it using the Helion client tool. For more information about using the Helion client tool with Windows applications, see <a href="/helion/devplatform/preview/tools_guide">Windows and .NET Tools Guide</a>.


One advantage of using the command line is that you can use Mac or Linux as well as Windows to deploy your application. Typically, a push is run with the tool in the solution directory, the client tool uploads the application, and the application is built on the server.
<ol>
<li> Open <code>Web.config</code> with a text editor</li>
<li> Change the following configuration line (this will pull the connection string parameters from environment variables, rather than using hardcoded values):

<pre>
  &lt;add name="SchoolContext" 
    connectionString="Data Source=(LocalDb)\v11.0;
    Initial Catalog=ContosoUniversity2;
    Integrated Security=SSPI;"
  providerName="System.Data.SqlClient" /&gt;
</pre>

to:
	
<pre>
  &lt;add name="SchoolContext" 
    connectionString=
      "Server={ContosoUniversity-db#hostname},{ContosoUniversity-db#port};
      Database={ContosoUniversity-db#name};
      User Id={ContosoUniversity-db#username};
      Password={ContosoUniversity-db#password};
      MultipleActiveResultSets=true;" 
    providerName="System.Data.SqlClient" /&gt;
</pre>
</li>
<li> Create a new file called <code>manifest.yml</code> in the same directory as your solution file, with the following contents. This is the application manifest file, which the deployment tool will use to determine what to do with the application.
		
<pre>
---
applications:
  -name: ContosoUniversity
  mem: 512M
  services:
    ${name}-db:
      type: mssql2014
</pre>
</li>
<li> Use the <a href="http://docs.hpcloud.com/helion/devplatform/1.2/windows/tools_guide/#helion">Helion ALS Client</a> (Helion.exe) to deploy the application. Run this command in the same directory as <code>manifest.yml</code> (The <code>-n</code> parameter suppresses prompts about defaults that the script uses):
<pre>helion target <cluster URL>
helion login
helion push --stack win2012r2 -n
</pre>

<li> When the push completes, the command line will show the application URL (e.g. ContosoUniversity.xx.xx.xx.xx.xip.io).
</li>
<li> Browse to the application URL to verify the deployment. </li>
</ol>
---
<div align="center"><a href="/helion/devplatform/1.2/windows/">Windows Overview</a> </div>
<div align="center"> Deploying your first .NET Application | <a href="/helion/devplatform/1.2/windows/tools_guide/">Windows and .NET Tools Guide</a> </div>
<div align="center"> <a href="/helion/devplatform/1.2/windows/building_windows/">Building and Deploying Windows DEA and SQL Server Express Images</a> | <a href="/helion/devplatform/1.2/windows/glazier/">Glazier Reference Guide</a></div>
<div align="center"><a href="/helion/devplatform/1.2/windows/adding_services/">Adding Services to a Windows Application</a> | <a href="/helion/devplatform/1.2/windows/buildpack/">Deploying Windows Applications with the IIS Buildpack</a></div>
