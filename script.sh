#!/bin/bash
echo "script running..."
sudo apt-get update
sudo apt-get upgrade
sudo cp /tmp/shared/java.tar.gz /opt

echo "files moved"
cd /opt
sudo tar zxvf java.tar.gz

echo "java unpacked"
update-alternatives --install /usr/bin/java java /opt/jdk1.8.0_45/bin/java 100
update-alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_45/bin/javac 100
update-alternatives --config java


sudo apt-get -y install git

echo "git installed"

echo "nexus installing..."

sudo wget http://www.sonatype.org/downloads/nexus-latest-bundle.zip -P /home/vagrant/Downloads
cd /home/vagrant/Downloads
sudo chmod 777 nexus-latest-bundle.zip
sudo unzip nexus-latest-bundle.zip
cd nexus-latest-bundle/bin
sudo RUN_AS_USER=root ./nexus start