---
layout: default-devplatform
title: "HP Helion 1.2 Development Platform: Adding Services to Windows Applications"
permalink: /helion/devplatform/1.2/windows/adding_services/
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
<!--PUBLISHED-->

# HP Helion 1.2 Development Platform: Adding Services to Windows Applications 

<span style="font-size:70%">*Windows, .NET, SQL Server, and IIS are either registered trademarks or trademarks of Microsoft Corporation in the United States and/or other countries.*</span>

Windows applications can be bound to services running in your deployment environment, such as Redis or MySQL. To do so, you need to have a NuGet package that can communicate with those services. 

The following tutorial demonstrates how to add a Redis collection to your .NET application.

**Note:** The NuGet packages used in this tutorial are for sample purposes only, and are not supported by HP Helion. Verify that packages are working for your application before deploying them to a production environment.

## Adding a service to a .NET application

1. When deploying your application using <a href="/helion/devplatform/1.2/windows/tools_guide/#cloudfoundryexplorer">Cloud Foundry Explorer</a>, in the deployment information window, enter the service information in the **Service** field in the format <code>Service Name, Service Type, Service Plan</code>:

	<img src="media/windows_services.png" />
2. Deploy your application.
3. Once the application gets successfully created, your VCAP_SERVICES file will have a node such as the following:

		"redis-2.8": [
	    {
	      "name": "redistest",
	      "label": "redis-2.8",
	      "plan": "free",
	      "tags": [
	        
	      ],
	      "options": {
	        
	      },
	      "credentials": {
	        "hostname": "0.0.0.0",
	        "host": ".0.0.0",
	        "port": 5001,
	        "password": "f4774d0b-2f8d-45da-ba3e-545f0cb9b35a",
	        "name": "01b32e35-248a-43d7-b90d-ab3f2611e644",
	        "uri": "redis:\/\/01b32e35-248a-43d7-b90d-ab3f2611e644:f4774d0b-2f8d-45da-ba3e-545f0cb9b35a@192.168.1.50:5001\/"
	      }
	    }
4. Add dependencies.
	1. Add a JSON package. In this case, you'll install **JSON.NET**. Open the **Manage NuGet Packages** dialog (under **Tools-&gt;NuGet Package Manager-&gt;Manage NuGet Packages for Solution...**), select the **Online** node, and search for **JSON.NET**. Click **Install**. 
	
		<img src="media/windows_nuget_json.png" />
	2. Add a Redis client. In this case, you'll install **StackExchange.Redis**. Open the **Manage NuGet Packages** dialog, , select the **Online** node, and search for **StackExchange.Redis**. Click **Install**.
	
		<img src="media/windows_nuget_redis.png" />
5. To verify that the services are working, create a new MVC5 View (CSHTML) page with the following contents:

		<p>
		Text from Redis:
		@{
		   try
		    {                    
		        string vcap = Environment.GetEnvironmentVariable("VCAP_SERVICES");
		
		        JObject services = Newtonsoft.Json.Linq.JObject.Parse(vcap);
		        string host = services["redis-2.8"].First["credentials"]["host"].ToString();
		        string port = services["redis-2.8"].First["credentials"]["port"].ToString();
		        string password = services["redis-2.8"].First["credentials"]["password"].ToString();
		        string conn = String.Format("{0}:{1},password={2}", host, port, password);
		
		        ConnectionMultiplexer redis = ConnectionMultiplexer.Connect(conn);
		        IDatabase db = redis.GetDatabase();                
		        string input = "This is an example on how to use redis in .NET";
		        db.StringSet("mykey", input);
		
		        string output = db.StringGet("mykey");
		        @output;
		
		    }
		    catch (Exception e)
		    {
		        @e.ToString();
		    }
		
		}
		</p>
		
	In the above code sample, the application does the following:
		
	1. Reads the Redis connection information from the VCAP_SERVICES environment variable
	2. Creates a connection to the Redis service
	3. Sends a string to the Redis service
	4. Reads a string back from the Redis service
	5. Displays the returned string
6. Deploy and open the application. You will see the following result:

	<img src="media/windows_redis_result.png" />

---
<div align="center"><a href="/helion/devplatform/1.2/windows/">Windows Overview</a> </div>
<div align="center"> <a href="/helion/devplatform/1.2/windows/deployingnet/">Deploying your first .NET Application</a> | <a href="/helion/devplatform/1.2/windows/tools_guide/">Windows and .NET Tools Guide</a> </div>
<div align="center"> <a href="/helion/devplatform/1.2/windows/building_windows/">Building and Deploying Windows DEA and SQL Server Express Images</a> | <a href="/helion/devplatform/1.2/windows/glazier/">Glazier Reference Guide</a></div>
<div align="center">Adding Services to a Windows Application | <a href="/helion/devplatform/1.2/windows/buildpack/">Deploying Windows Applications with the IIS Buildpack</a></div>


