#!/bin/bash

a=F
while [ $a = F ];do
    echo -n "请确认操作系统版本为CentOS 7, [(Y|y) 或者 (N|n)]: "
    read lsb
    case $lsb in
    Y|y) a=T;;
    N|n) exit 1;;
    *)   echo "输入有误, 请重新输入。";;
    esac
done

set -x

read -p "Enter the source you want to use(aliyun / [default: tsinghua]): " src

deploy_repo(){
    k=$1
    [ ! -d /etc/yum.repos.d/bak ] && mkdir /etc/yum.repos.d/bak
    mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/bak/
    ls *.repo |grep $k |while read i;do
        cp $i /etc/yum.repos.d/
    done
}

case $src in
    aliyun)  deploy_repo $src;;
    *)       deploy_repo tsinghua;;
esac
