#! /bin/bash
useradd pere
echo "pere" | passwd --stdin pere
cp -rf /opt/docker/pamimap /etc/pam.d/imap
cp -rf /opt/docker/pamimap /etc/pam.d/pop
cp -rf /opt/docker/imap* /etc/xinetd.d/
cp -rf /opt/docker/*pop* /etc/xinetd.d/
