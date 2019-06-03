#! /bin/bash
/opt/docker/install.sh && echo "Ok install"
/usr/sbin/httpd
/usr/sbin/vsftpd
/usr/sbin/xinetd -dontfork 

