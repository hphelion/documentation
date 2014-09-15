package org.hp.samples;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URISyntaxException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rabbitmq.client.AMQP;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.ConsumerCancelledException;
import com.rabbitmq.client.GetResponse;
import com.rabbitmq.client.QueueingConsumer;
import com.rabbitmq.client.ShutdownSignalException;

public class ProcessMessage extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        response.setStatus(200);
        PrintWriter writer = response.getWriter();
        writer.println("Here's your message:");
        System.out.println("Test 1");

        String uri = System.getenv("RABBITMQ_URL");
        // if (uri == null) uri = "amqp://guest:guest@localhost";

        ConnectionFactory factory = new ConnectionFactory();
        try {
            factory.setUri(uri);
        } catch (KeyManagementException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        Connection connection = factory.newConnection();
        Channel channel = connection.createChannel();
        channel.queueDeclare("hello", false, false, false, null);
        System.out.println("Test 2");

        String routingKey = "thekey";
        String exchangeName = "exchange";
        // fanout doesn't work?
        channel.exchangeDeclare(exchangeName, "direct", true);
        System.out.println("Test 2.1");
        channel.queueBind("hello", exchangeName, routingKey);
        System.out.println("Test 2.2");

        String message = request.getParameter("message");
        System.out.println("Test 2.3 - getParameter: " + message);
        channel.basicPublish(exchangeName, routingKey, null, message.getBytes());
        System.out.println(" [x] Sent '" + message + "'");
        System.out.println("Test 3");
        writer.println(" [x] Sent '" + message + "'");

        boolean autoAck = false;

        for (int i = 0; i < 20; i++) {
            GetResponse responseMsg = channel.basicGet("hello", autoAck);
            System.out.println("Test 3.1 - after basicGet");
            if (responseMsg == null) {
                System.out.println("Test 3.2 - no msg");
                // No message retrieved.
            } else {
                System.out.println("Test 3.3 - got msg");
                AMQP.BasicProperties props = responseMsg.getProps();
                byte[] body = responseMsg.getBody();
                // Since getBody() returns a byte array, convert to a string for
                // the user
                String bodyString = new String(body);
                long deliveryTag = responseMsg.getEnvelope().getDeliveryTag();

                System.out.println("Message received: " + bodyString);
                writer.println("Message received: " + bodyString);

                // @TODO Need to acknowledge the msg so the queue is cleared out
                // for users who send msgs many times.

                // Acknowledge that we received the message so that the queue
                // removes the message so that it's not sent to us again.
                channel.basicAck(deliveryTag, false);
            }
        }

        // QueueingConsumer consumer = new QueueingConsumer(channel);
        // System.out.println("Test 4 - after QueueingConsumer new");
        // channel.basicConsume("hello", true, consumer);
        // System.out.println("Test 5 - after consume");
        //
        // QueueingConsumer.Delivery delivery = null;
        // try {
        // System.out.println("Test 6 - after try");
        // delivery = consumer.nextDelivery();
        // } catch (ShutdownSignalException e) {
        // // TODO Auto-generated catch block
        // System.out.println("Test 6.1 - after catch shutdown");
        // e.printStackTrace();
        // } catch (ConsumerCancelledException e) {
        // // TODO Auto-generated catch block
        // System.out.println("Test 6.2 - after catch consumer");
        // e.printStackTrace();
        // } catch (InterruptedException e) {
        // // TODO Auto-generated catch block
        // System.out.println("Test 6.3 - after catch interrupted");
        // e.printStackTrace();
        // } catch (Exception e) {
        // System.out.println("Test 6.4 - after catch Exception");
        // e.printStackTrace();
        // }
        //
        // System.out.println("Test 7 - after consumer nextDelivery");
        // String receivedMessage = new String(delivery.getBody());
        // System.out.println(" [x] Received '" + receivedMessage + "'");

        // writer.println(" [x] Received '" + receivedMessage + "'");

        writer.close();

    }
}
