Prerequisites
- If you do not have a Stackato instance available, please create one before continuing and install the Stackato CLI. 
- Make sure that RabbitMQ service is enabled. Stackato 3.4 appears have it enabled by default but Stackato 3.2 does not. 
- Go to the console (e.g. https://api.15.126.212.172.xip.io, substitute your own instance's link)
- Admin --> Cluster --> Settings (gear icon on right corner) --> Check Rabbit/Rabbit3 --> Save
		
Deploy the app
- From the Stackato CLI: stackato push -n
		
View and run the app
- Go to the console (e.g. https://api.15.126.212.172.xip.io, substitute your own instance's link)
- Check the applications link to see the app. 
