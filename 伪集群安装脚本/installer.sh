#!/bin/sh

sudo groupadd hadoop
sudo useradd -m -g hadoop hadoop
echo -e "hadoop\nhadoop" | sudo passwd hadoop
touch ./test
echo "master" > ./test
sudo mv ./test /etc/hostname
sudo apt-get install openjdk-8-jdk
sudo sh -c "echo 127.0.0.1  master >> /etc/hosts"
sudo cp ./hadoop-2.7.1.tar.gz /home/hadoop/
su hadoop
tar -zxvf ./hadoop-2.7.1.tar.gz
mkdir ./bigdata
mv hadoop-2.7.1 ./bigdata/hadoop
touch /home/hadoop/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64" >> /etc/profile
echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64" >> /home/hadoop/.bashrc
echo "export HADOOP_HOME=/home/hadoop/bigdata/hadoop" >> /home/hadoop/.bashrc
echo "export HADOOP_USER_NAME=hadoop" >> /home/hadoop/.bashrc
echo "export PATH=/usr/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH" >> /home/hadoop/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64" >> /home/hadoop/bigdata/hadoop/etc/hadoop/hadoop-env.sh
mkdir /home/hadoop/.ssh
cd /home/hadoop/.ssh
ssh-keygen
cat id_rsa.pub >> authorized_keys

