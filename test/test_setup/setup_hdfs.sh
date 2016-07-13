#!/bin/bash

# required packages: ssh, wget, jdk(openjdk-7-jdk), libssl-dev

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/env.sh
echo "using JAVA_HOME=$JAVA_HOME"
echo "using HADOOP_VER=$HADOOP_VER"

# install
sudo mkdir /hadoop && sudo chmod 777 /hadoop
sudo mkdir /data && sudo chmod 777 /data

curl -s -L http://apache.cs.utah.edu/hadoop/common/hadoop-${HADOOP_VER}/hadoop-${HADOOP_VER}.tar.gz | tar -C /hadoop -x -z -f -

# configure
cp $DIR/standalone/* /hadoop/hadoop-${HADOOP_VER}/etc/hadoop/
cp $DIR/env.sh /hadoop/env.sh
echo ". /hadoop/env.sh" | sudo tee --append /etc/environment
echo ". /hadoop/env.sh" >> ~/.bashrc
echo ". /hadoop/env.sh" >> /hadoop/hadoop-${HADOOP_VER}/etc/hadoop/hadoop-env.sh

# setup ssh for passwordless login
ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' \
    && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

cat <<EOF > ~/.ssh/config
Host localhost
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null

Host 127.0.0.1
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null

Host 0.0.0.0
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
EOF
chmod 644 ~/.ssh/config
chmod 644 ~/.ssh/authorized_keys
ls -la ~/.ssh/

# start all services
sudo service ssh restart && sleep 5
$HADOOP_PREFIX/bin/hdfs namenode -format
$HADOOP_PREFIX/sbin/start-dfs.sh
sleep 5
$HADOOP_PREFIX/sbin/start-yarn.sh
sleep 5
