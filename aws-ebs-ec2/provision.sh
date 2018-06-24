#!/usr/bin/env bash

set -e

# Upgrade to latest
sudo yum update -y
sudo yum upgrade -y

# Install Apache
sudo yum install httpd mod_ssl -y
sudo echo ServerName demo >> /etc/httpd/conf/httpd.conf
sudo iptables -I INPUT -p tcp --dport 80 -j ACCEPT
sudo service iptables save
sudo /sbin/chkconfig httpd on

# Install PHP
sudo yum install php php-mysql php-devel php-gd php-pecl-memcache php-pspell php-snmp php-xmlrpc php-xml -y

