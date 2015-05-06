---
layout: default-devplatform
title: "HP Helion 1.2 Development Platform: Deploying your first .NET Application"
permalink: /helion/devplatform/1.2/windows/deployingnet
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
<!--UNDER REVISION-->

# HP Helion 1.2 Development Platform: Deploying your first .NET Application 

This tutorial demonstrates how to deploy an application to a Windows Server instance running in an HP Helion OpenStack (HOS) environment using the toolset provided. For the purposes of this tutorial, you'll deploy the Microsoft's Contoso University sample application.

## System requirements

This tutorial requires the following software components:

* Visual Studio 2013. Any edition is supported, including the Community (Free) edition.
* Cloud Foundry Explorer and Cloud Foundry MSBuild tasks. See <a href="/helion/devplatform/1.2/windows/tools_guide">Windows and .NET Tools Guide</a> for more details. 
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
			providerName="System.Data.SqlClient" >
	to:

		<add name="SchoolContext" 
			connectionString=
				"Server={ContosoUniversity-db#hostname},
				{ContosoUniversity-db#port};
				Database={ContosoUniversity-db#name};
				User Id={ContosoUniversity-db#username};
				Password={ContosoUniversity-db#password};
				MultipleActiveResultSets=true;" 
			providerName="System.Data.SqlClient" >
5. Save <code>web.config</code>.
6. Right click the project and select **Publish to Cloud Foundry**.
	
	<img src="media/windows_deploy_contextmenu.png">
 
7. In the first **Cloud Foundry Publish Profile** dialog, enter the URL for the ALS cluster, and a user and password with publishing privileges:
	<img src="media/windows_publish_credentials.png" />
 
8. In the second **Cloud Foundry Publish Profile**, enter the following values and click **Publish**:
	* **Organization:** <span style="color:red">How do they determine this value?</span>
	* **Space:** <span style="color:red">How do they determine this value?</span>
	* **Stack:** Leave as <code>win2012r2</code>
	* **Routes**: <span style="color:red">How do they determine this value?</span>
	* **Name:** The friendly name of the application
	* **Memory**: <span style="color:red">How do they determine this value?</span>
	* **Instances**: <span style="color:red">How do they determine this value?</span>
	* **Services**: Enter the services to bind to the application. Example: <code>ContosoUniversity-db,mssql2012,default</code>
	* **Build Locally**: Check to verify that the application builds locally before deploying. The application will build on the server after deployment.
	* **Configuration**: <span style="color:red">How do they determine this value?</span>
	* **Platform:** <span style="color:red">How do they determine this value?</span>

	<span style="color:red">Need updated version of this screenshot</span>:
	<img src="media/windows_publish_deployinfo.png" /> 
 
17. Refresh Cloud Foundry Explorer
 
	<span style="color:red">Screenshot here</span>
18. Right click "Contoso" app and select **Browse**:
 
	<span style="color:red">Screenshot here</span>

That's it! You are ready to use your application.

## Deploy the sample application from the command line

You do not need Visual Studio to deploy your application. You can deploy it using the command line using the Helion client tool. For more information about using the Helion client tool with Windows applications, see <a href="/helion/devplatform/1.2/windows/tools_guide">Windows and .NET Tools Guide</a>.


One advantage of using the command line is that you can use Mac or Linux as well as Windows to deploy your application. By default, the client tool uploads the application, and the application is built on the server.

1. Open <code>Web.config</code> with a text editor
2. Change the following configuration line (this will pull the connection string parameters from environment variables, rather than using hardcoded values):

		<add name="SchoolContext" 
			connectionString=
				"Data Source=(LocalDb)\v11.0;
				Initial Catalog=ContosoUniversity2;
				Integrated Security=SSPI;" 
			providerName="System.Data.SqlClient" >
	to:

		<add name="SchoolContext" 
			connectionString=
				"Server={ContosoUniversity-db#hostname},
				{ContosoUniversity-db#port};
				Database={ContosoUniversity-db#name};
				User Id={ContosoUniversity-db#username};
				Password={ContosoUniversity-db#password};
				MultipleActiveResultSets=true;" 
			providerName="System.Data.SqlClient" >
1. Create a new file called <code>manifest.yml</code> in the same directory as <code>web.config</code>. This is the application manifest file, which the deployment tool will use to determine what to do with the application. Give the file the following contents:
		
		applications:
		- name: ContosoUniversity
 			mem: 512M
  			services:
    		${name}-db:
      		type: mssql-2012

2. Use the <a href="https://docs.hpcloud.com/helion/devplatform/1.1/als/client/download">Helion ALS Client</a> (Helion.exe) to deploy the application. Run this command in the same directory as <code>manifest.yml</code>:
	
		helion push --stack win2012r2 

3. When the push completes, the command line will show the application URL.

	<span style="color:red">Screenshot here</span> 
5. Browse to the application URL to verify the deployment. 

	<span style="color:red">Screenshot here</span> 