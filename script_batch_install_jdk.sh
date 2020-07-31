#!/bin/bash

if [ ! -d "/zwh/software/" ];then
    mkdir /zwh/software
fi


if [ ! -d "/zwh/software/java" ];then
    mkdir /zwh/software/java
fi

if [ ! -f "/zwh/software/$1" ];then
    echo "缺少jdk安装包"
    exit
fi

tar -zxvf /zwh/software/$1 -C /zwh/software/java

cat >> /etc/profile << EOF
    export JAVA_HOME=/zwh/software/java/jdk1.8.0_251/
    export PATH=$PATH:/zwh/software/java/jdk1.8.0_251/bin
EOF

source /etc/profile

java -version
