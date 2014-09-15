// Load the http module 
var http = require('http');

// The  HTTP server will respond with Hello World to all requests.
var server = http.createServer(function (request, response) {
  response.writeHead(200, {"Content-Type": "text/plain"});
  response.end("\n Hello World \n");
});

// Listen to the port being used by this app. The call to process.env.PORT will
// return the port that has been assigned to the app from the Helion Development
// Platform.
var port = process.env.PORT || 8888;
server.listen(port);

// Print to the terminal
console.log("Server listening to port: " + port);