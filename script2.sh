#!/bin/bash
echo "script running..."
sudo apt-get update
sudo apt-get upgrade
sudo cp /tmp/shared/java.tar.gz /opt
sudo cp /tmp/shared/maven.tar.gz /opt
cd /opt
sudo tar zxvf java.tar.gz
sudo tar zxvf maven.tar.gz

echo "files moved"
update-alternatives --install /usr/bin/java java /opt/jdk1.8.0_45/bin/java 100
update-alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_45/bin/javac 100
update-alternatives --config java
echo "java unpacked"
sudo update-alternatives --install "/usr/bin/mvn" "mvn" "/opt/apache-maven-3.3.9/bin/mvn" 1
sudo update-alternatives --set mvn /opt/apache-maven-3.3.9/bin/mvn
sudo wget https://raw.github.com/dimaj/maven-bash-completion/master/bash_completion.bash

sudo apt-get -y install git

wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt-get update

sudo apt-get install -y jenkins

echo "nexus installing..."

sudo wget http://www.sonatype.org/downloads/nexus-latest-bundle.zip -P /home/vagrant/Downloads
cd /home/vagrant/Downloads
sudo chmod 777 nexus-latest-bundle.zip
sudo unzip nexus-latest-bundle.zip
cd nexus-2.14.8-01/bin
sudo RUN_AS_USER=root ./nexus start