---
layout: default-devplatform
title: "HP Helion 1.2 Development Platform: Deploying your first .NET Application"
permalink: /helion/devplatform/preview/deployingnet/
product: devplatform
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
<!--PUBLISHED-->

# HP Helion 1.2 Development Platform Preview: Deploying your first .NET Application 

<span style="font-size:70%">*Windows, .NET, SQL Server, and IIS are either registered trademarks or trademarks of Microsoft Corporation in the United States and/or other countries.*</span>

<span style="color:red">**Note**: Helion Development Platform 1.2 is currently only available on HP Helion Public Cloud as part of the Developer Preview</span>

This tutorial demonstrates how to deploy an application to a Windows Server instance running in an HP Helion OpenStack environment using the toolset provided. For the purposes of this tutorial, you'll deploy Microsoft's Contoso University sample application.

## System requirements

This tutorial requires the following software components:

* Visual Studio 2013. Any edition is supported, including the Community (Free) edition.
* Cloud Foundry Extensions and Cloud Foundry MSBuild tasks. See <a href="/helion/devplatform/preview/tools_guide">Windows and .NET Tools Guide</a> for more details. 
* Download and extract the <a href="https://code.msdn.microsoft.com/ASPNET-MVC-Application-b01a9fe8">Contoso University Sample Application</a>.

## Deploy the sample application from Visual Studio

2. Open <code>&lt;sample directory&gt;/C$/ContosoUniversity.sln</code> in Visual Studio. 
3. In Visual Studio, open <code>web.config</code>.
4. Change the following configuration line (this will pull the connection string parameters from environment variables, rather than using hardcoded values):

		<add name="SchoolContext" 
			connectionString=
				"Data Source=(LocalDb)\v11.0;
				Initial Catalog=ContosoUniversity2;
				Integrated Security=SSPI;" 
			providerName="System.Data.SqlClient" />
	to:

		<add name="SchoolContext" 
			connectionString=
				"Server={ContosoUniversity-db#hostname},
				{ContosoUniversity-db#port};
				Database={ContosoUniversity-db#name};
				User Id={ContosoUniversity-db#username};
				Password={ContosoUniversity-db#password};
				MultipleActiveResultSets=true;" 
			providerName="System.Data.SqlClient" />
5. Save <code>web.config</code>.
6. Build the project locally to verify that it builds correctly, and all NuGet packages successfully install. Once the project builds successfully, go to the next step.

	<img src="media/windows_build.png">
6. Right click the project and select **Publish to Cloud Foundry**.
	
	<img src="media/windows_deploy_contextmenu.png">
 
7. In the **Cloud Foundry Publish Profile** dialog, enter the following values and click **Publish**:
	* **Organization and Space:** Select from one of the provided options.
	* **Name:** The default value is the name of the application.
	* **Stack:** Leave as <code>win2012r2</code>
	* **Routes**: Typically the same as the **Name** entry.
	* **Memory**: The amount of memory the application will use (e.g. 512 MB).
	* **Instances**: The number of separate installations of the application.
	* **Services**: Enter the services to bind to the application, in the form <code>Name, service type, quota</code>, with separate services separated by semicolons. Example: <code>ContosoUniversity-db,mssql2014,default</code>
	
		 **Note:** If you are adding a SQL server service, ensure that the name matches the value set in the config file. Example: <code>ContosoUniversity-db,mssql2014,free</code>  
	* **Build Locally**: Check to test the build by building the application locally before deployment.
	* **Configuration**: Set the build configuration (e.g. Debug). This is only available if the application is built on the server.
	* **Platform**: Set the target CPU platform (e.g. Any CPU). This is only available if the application is built on the server.

	<img src="media/windows_deploy_cf.png" /> 

7. In the **Login Wizard** dialog, enter the URL for the ALS cluster, and a user and password with sufficient privileges. Check the **Skip SSL Validation** checkbox if your Helion OpenStack installation uses self-signed certificates (as it does in HP Helion Public Cloud):
	<img src="media/windows_publish_credentials.png" />
 
17. Open or refresh Cloud Foundry Explorer. You can open Cloud Foundry Explorer under **View-&gt;Other Windows-&gt;Cloud Foundry Explorer**.
 
	<img src="media/windows_refresh.png" />
18. Right click the "Contoso" application and select **View in Browser**:
 
	<img src="media/windows_viewbrowser.png" />

That's it! You are ready to use your application.

## Deploy the sample application from the command line

If you are deploying your application from the command line, you do not need Visual Studio to deploy your application. You can deploy it using the Helion client tool. For more information about using the Helion client tool with Windows applications, see <a href="/helion/devplatform/preview/tools_guide">Windows and .NET Tools Guide</a>.


One advantage of using the command line is that you can use Mac or Linux as well as Windows to deploy your application. Typically, a push is run with the tool in the solution directory, the client tool uploads the application, and the application is built on the server.

1. Open <code>Web.config</code> with a text editor
2. Change the following configuration line (this will pull the connection string parameters from environment variables, rather than using hardcoded values):

		<add name="SchoolContext" 
			connectionString=
				"Data Source=(LocalDb)\v11.0;
				Initial Catalog=ContosoUniversity2;
				Integrated Security=SSPI;" 
			providerName="System.Data.SqlClient" />
	to:

		<add name="SchoolContext" 
			connectionString=
				"Server={ContosoUniversity-db#hostname},
				{ContosoUniversity-db#port};
				Database={ContosoUniversity-db#name};
				User Id={ContosoUniversity-db#username};
				Password={ContosoUniversity-db#password};
				MultipleActiveResultSets=true;" 
			providerName="System.Data.SqlClient" />
1. Create a new file called <code>manifest.yml</code> in the same directory as <code>web.config</code>, with the following contents. This is the application manifest file, which the deployment tool will use to determine what to do with the application.
		
		applications:
		- name: ContosoUniversity
 			mem: 512M
  			services:
    		${name}-db:
      		type: mssql-2014

2. Use the <a href="/helion/devplatform/preview/tools_guide/#helion">Helion ALS Client</a> (Helion.exe) to deploy the application. Run this command in the same directory as <code>manifest.yml</code> (The <code>-n</code> parameter suppresses prompts about defaults that the script uses):
	
		helion target <cluster URL>
		helion login
		helion push --stack win2012r2 -n

3. When the push completes, the command line will show the application URL (e.g. ContosoUniversity.xx.xx.xx.xx.xip.io).

5. Browse to the application URL to verify the deployment. 

---
<div align="center"><a href="/helion/devplatform/preview/">Windows Overview</a> </div>

<div align="center"> Deploying your first .NET Application | <a href="/helion/devplatform/preview/tools_guide">Windows and .NET Tools Guide</a> </div>
<div align="center"><a href="/helion/devplatform/preview/adding_services/">Adding Services to a Windows Application</a> | <a href="/helion/devplatform/preview/buildpack/">Deploying Windows Applications with the IIS Buildpack</a></div>
