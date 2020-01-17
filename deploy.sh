#!/bin/bash

set -v

read -p "Enter the source you want to use(aliyun / [default: tsinghua]): " src

deploy_repo(){
    k=$1
    mkdir /etc/yum.repos.d/bak
    mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/bak/
    ls *.repo |grep $k |while read i;do
        cp $i /etc/yum.repos.d/
    done
}

case $src in
    aliyun)  deploy_repo $src;;
    *)       deploy_repo tsinghua;;
esac
