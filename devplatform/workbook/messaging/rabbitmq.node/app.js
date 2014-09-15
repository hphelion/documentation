var express = require('express'),
    http = require('http'),
    path = require('path'),
    url = require('url'),
    amqp = require('amqp');

var app = express();

app.configure(function(){
  app.set('port', process.env.VCAP_APP_PORT || 3000);
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.bodyParser());
  app.use(express.static(path.join(__dirname, 'public')));
});

app.connectionStatus = 'No server connection';
app.exchangeStatus = 'No exchange established';
app.queueStatus = 'No queue established';

app.get('/', function(req, res){
  res.render('index.jade', { title: 'Welcome to RabbitMQ and Node/Express',
    connectionStatus: app.connectionStatus,
    exchangeStatus: app.exchangeStatus,
    queueStatus: app.queueStatus
  });
});

function connectionUrl(){
  if (process.env.RABBITMQ_URL){
    return process.env.RABBITMQ_URL
  } else {
    return 'amqp://localhost';
  }
}

app.post('/start-server', function(req, res){
  app.rabbitMqConnection = amqp.createConnection({ url: connectionUrl() });

  app.rabbitMqConnection.on('ready', function(){
    app.connectionStatus = 'Connected!';
    res.redirect('/');
  });
});

app.post('/new-exchange', function(req, res){
  app.e = app.rabbitMqConnection.exchange('test-exchange');
  app.exchangeStatus = 'An exchange has been established!';
  res.redirect('/');
});

app.post('/new-queue', function(req, res){
  app.q = app.rabbitMqConnection.queue('test-queue');
  app.queueStatus = 'The queue is ready for use!';
  res.redirect('/');
});

app.get('/message-service', function(req, res){
  app.q.bind(app.e, '#');
  res.render('message-service.jade',
    {
      title: 'Welcome to the messaging service!',
      sentMessage: ''
    });
});

app.post('/newMessage', function(req, res){
  var newMessage = req.body.newMessage;
  app.e.publish('routingKey', { message: newMessage });

  app.q.subscribe(function(msg){
    var messageToDisplay = msg.message;
    res.render('message-service.jade',
      {
        title: 'You\'ve got mail!',
        sentMessage: messageToDisplay
      });
    app.rabbitMqConnection.end();
  });
});

console.log('**', process.env.RABBITMQ_URL);
http.createServer(app).listen(app.get('port'), function(){
  console.log("Express server listening on port " + app.get('port'));
});
