# Apache Server Status - Ass

A simple ruby gem that provides a pretty web interface to track apache server status in real time.

![Server Status](http://res.cloudinary.com/dvnjqhdxp/image/upload/v1490048069/ezgif.com-video-to-gif.gif)


## PRE-REQUIREMENT (IMPORTANT)

You need to have mod_status installed in your server. Example of how to install: [CentOs specific example](http://www.tecmint.com/monitor-apache-web-server-load-and-page-statistics/). After installing make sure yoursevername.com/server-status is functioning.

This is a Ruby gem so you need to have [Ruby](https://www.ruby-lang.org/en/) installed. And also make sure you have [Nokogiri](http://www.nokogiri.org/) installed.

NOTE: Chrome is the only supported browser.

## Installation
Install it as:

    $ gem install apache_server_status


## USAGE

Run the following command on your terminal:

    $ ass

You should see the following message:

```
   $ Puma starting in single mode...
     * Version 3.8.2 (ruby 2.3.3-p222), codename: Sassy Salamander
     * Min threads: 0, max threads: 16
     * Environment: development
     * Listening on tcp://localhost:4567
     Use Ctrl-C to stop
```

Now navigate to 'localhost:4567' and you will see a web interface with a form to add domain. Provide full domain without 'http' or 'https', just 'yourDomaninName.com'. You can provide as many you want. And navigate through the servers to track status.


Thanks [Jeff](https://github.com/Jeff-Russ) and [Cody](https://github.com/codyrobbins) For helping with Javascript Monster.
