#! /bin/bash
# 服务器iptables操作脚本
#查看入站配置： bash iptablesoper.sh show
#删除配置：bash iptablesoper.sh delete 规则行数
#添加配置：bash iptablesoper.sh add IP 端口
case "${1}" in
  show)
    iptables -L INPUT
  ;;
  delete)
    iptables -D INPUT $2
  ;;
  add)
    iptables -D INPUT -j DROP
    iptables -A INPUT -p tcp -s $2  --dport $3 -j ACCEPT
    iptables -A INPUT -j DROP
esac

