#Hello World Application for Helion OpenStack#

You will download this application from the Marketplace 
*(true?)*, push it to your cluster using ALS, and then run it.
You should then walk through the code and determine what each command does.

## Prerequisites ##
1. Download the package from the marketplace.
There should be four files: `index.php`, `composer.json`, `receive.php`, and `manifest.yml`.
- If you do not have a Stackato instance available, please create one before continuing and install the Stackato CLI. 
- Make sure that RabbitMQ service is enabled. 
Stackato 3.4 has it enabled by default, but Stackato 3.2 does not. 
	- Go to the Admin console (e.g. https://api.15.126.212.172.xip.io, substitute your own instance's link)--> Admin --> Cluster --> Settings (gear icon on right corner) --> Check Rabbit/Rabbit3 --> Save
		
## Deploy the app ##
- In the Stackato CLI, enter: `stackato push -n`
		
## View and run the app ##
- Go to the console (e.g. https://api.15.126.212.172.xip.io, substitute your own instance's link)
- Check the applications link to see the app. 

## Code Breakdown ##
    <?php
    
    require('vendor/autoload.php');
    
    //If you are having issues with your RabbitMQ app, enable (uncomment) AMQP_DEBUG to print  
    //debugging info to the page.   
    //define('AMQP_DEBUG', true);
    
    use PhpAmqpLib\Connection\AMQPConnection;
    use PhpAmqpLib\Message\AMQPMessage;
    
    echo "\n Here's your message:  \n";
    
    // Parse the environment variable for the RabbitMQ URL and use the array that's
    // returned to connect.
    $url = parse_url(getenv('RABBITMQ_URL'));
    $conn = new AMQPConnection($url['host'], $url['port'], $url['user'], $url['pass'], substr($url['path'], 1));
    $ch = $conn->channel();
    
    // Create a queue
    $queue = 'basic_get_queue';
    $ch->queue_declare($queue, false, true, false, false);
    
    // Create an exchange
    $exchange = 'amq.direct';
    $ch->exchange_declare($exchange, 'direct', true, true, false);
    $ch->queue_bind($queue, $exchange);
    
    // Publish the user's message
    $msg_body = $_POST["message"];
    $msg = new AMQPMessage($msg_body, array('content_type' => 'text/plain', 'delivery_mode' => 2));
    $ch->basic_publish($msg, $exchange);
    
    // Retrieve the message that was sent
    $retrived_msg = $ch->basic_get($queue);
    $msgContents = $retrived_msg->body;
    echo $msgContents;
    $ch->basic_ack($retrived_msg->delivery_info['delivery_tag']);
    
    $ch->close();
    $conn->close();
    