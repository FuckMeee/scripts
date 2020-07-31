#!/bin/bash

# 生成秘钥
if [ ! -f ~/.ssh/id_rsa ]
then
    ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa
else
    echo "秘钥已经创建"
fi

# 读取host文件获取所有服务器，遍历分发key
hosts_file=$1
# 判断host文件是否存在，不存在则结束
if [ ! -e ./${hosts_file} ]
then
    echo "不存在hosts文件"
    exit
fi

while read line
do
    echo "========================================"
    host_info=($line)
    host=${host_info[0]}
    user=${host_info[1]}
    passwd=${host_info[2]}
    echo "主机ip:${host}"
    echo "主机名:${user}"
    echo "主机密码:${passwd}"

expect << EOF
    spawn ssh-copy-id -i /root/.ssh/id_rsa.pub ${user}@${host}
    expect {
	"yes/no" { send "yes\n";exp_continue }
	"password" { send "${passwd}\n" }
    }
expect eof
EOF
done < ./${hosts_file}

