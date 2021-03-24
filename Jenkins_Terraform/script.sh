#!/bin/bash
sudo apt-get update

sudo apt-get update -y && sudo apt-get install openjdk-8-jdk openjdk-8-jre -y

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
    
sudo apt-get update

sudo apt-get install jenkins -y

sudo apt-get update

sudo apt-get install awscli -y
