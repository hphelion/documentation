---
layout: default
title: "UNIX CLI LBaaS Examples"
permalink: /cli/unix/lbaas/
product: unix-cli

---
# UNIX CLI Load Balancer Examples

This page gives you a few examples of how to perform various load balancer tasks using the HP Cloud service CLI.

Remember that you can get detailed help for any command or task with the following command:

    $ hpcloud help <TASK>

##LBaaS Commands## {#LBaaSCommands}

To list available load balancers:

    $ hpcloud lb
    +--------+--------------+-------------------+----------+------+--------+
    | id     | name         | algorithm         | protocol | port | status |
    +--------+--------------+-------------------+----------+------+--------+
    | 230417 | cli_test_lb8 | ROUND_ROBIN       | HTTP     | 80   | ACTIVE |
    | 230420 | cliupdate2   | LEAST_CONNECTIONS | HTTP     | 80   | ACTIVE |
    +--------+--------------+-------------------+----------+------+--------+

To add a load balancer:

    $ hpcloud lb:add scales LEAST_CONNECTIONS HTTP 80 -n '10.1.1.1:80;10.1.1.2:81'
    Created load balancer 'scales' with id '273174'.


Listing load balancer nodes:

    $ hpcloud lb:nodes scales
    +---------+----------+------+-----------+--------+
    | id      | address  | port | condition | status |
    +---------+----------+------+-----------+--------+
    | 1220066 | 10.1.1.1 | 80   | ENABLED   | ONLINE |
    | 1220067 | 10.1.1.2 | 81   | ENABLED   | ONLINE |
    +---------+----------+------+-----------+--------+


Add a load balancer node:

    $ hpcloud lb:nodes:add scales 10.1.1.3 82
    Created node '10.1.1.3:82' with id '1220068'.


Remove a load balancer node:

    $ hpcloud lb:nodes:remove scales 1220067
    Removed node '1220067' from load balancer 'scales'.
    

List the load balancer virtual IPs:

    $ hpcloud lb:virtualips scales
    +-----+---------------+-----------+--------+
    | id  | address       | ipVersion | type   |
    +-----+---------------+-----------+--------+
    | 521 | 15.182.227.47 | IPV4      | PUBLIC |
    +-----+---------------+-----------+--------+

To remove a load balancer:

    $ hpcloud lb:remove scales
    Removed load balancer 'scales'.

List the available load balancer algorithms:

    $ hpcloud lb:algorithms
    +-------------------+
    | name              |
    +-------------------+
    | ROUND_ROBIN       |
    | LEAST_CONNECTIONS |
    +-------------------+

List the load balancer limits:

    $ hpcloud lb:limits
    +-------------------------------+--------------------+-----------------------------+----------------------------+
    | max_load_balancer_name_length | max_load_balancers | max_nodes_per_load_balancer | max_vips_per_load_balancer |
    +-------------------------------+--------------------+-----------------------------+----------------------------+
    | 128                           | 20                 | 50                          | 1                          |
    +-------------------------------+--------------------+-----------------------------+----------------------------+

