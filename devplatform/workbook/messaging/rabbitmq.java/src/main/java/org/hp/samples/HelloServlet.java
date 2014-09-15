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

import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.Channel;

public class HelloServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setStatus(200);

        PrintWriter writer = response.getWriter();
        writer.println("Hello World");

        // Create an HTML form for the user to input a message for the queue
        String docType = "<!doctype html public \"-//w3c//dtd html 4.0 "
                + "transitional//en\">\n";
        writer.println(docType + "<html>" + "<body>"
                + "<p>RabbitMQ for PHP</p>"
                + "<form action='ProcessMessage' method='post'>"
                + "Message to send: <input type='text' name='message'><br>"
                + "<input type='submit' value='Send Message'>" + "</form>"
                + "</body>" + "</html>");

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

        writer.close();
    }
}
