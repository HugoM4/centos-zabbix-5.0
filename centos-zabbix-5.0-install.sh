#!/bin/bash
yum install -y policycoreutils-python
rpm -ivh https://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-agent-5.0.25-1.el7.x86_64.rpm
yum -y install zabbix-agent
systemctl stop zabbix-agent.service
sed -i 's/Server=127.0.0.1/Server=10.100.111.5/' /etc/zabbix/zabbix_agentd.conf
firewall-cmd --zone=public --permanent --add-port=10050/tcp
firewall-cmd --zone=public --add-port=10050/tcp
systemctl start zabbix-agent.service
systemctl enable zabbix-agent.service
