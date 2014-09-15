# Hello World Node.js

To create a Cloud Foundry app in Node.js, the only mandatory files are:
* Your main .js file (e.g. Server.js)
* manifest.yml
* package.json
* Procfile 

Manifest.yml is a config file used to specify settings that would otherwise be
specified by a command-line tool. 

The package.json file is your standard metadata file. Name and version are the 
required fields. 

The Procfile tells the Helion Development Platform how to run your Node.js 
application. An extremely simple one is included with this sample that just 
tells us how to execute the program. 