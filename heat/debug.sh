#!/bin/bash

time openstack stack create \
  -e mysql_env.yaml \
  --parameter node_count=3 \
  --parameter image=CentOS7-4 \
  --parameter flavor=p4.medium \
  --parameter key_name=INE \
  --parameter mysql_network=d1a34821-8a48-4739-b468-c6fca61e514c \
  --parameter mysql_security_group=SG_MYSQL \
  --parameter mysql_volume_size=500 \
  -t mysql_stack.yaml \
  fde-mysql-stack