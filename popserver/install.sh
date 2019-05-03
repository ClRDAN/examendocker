#! /bin/bash
# Aitor Galilea@edt ASIX M11 2018-2019
# Examen UF4
# - crear usuarios locales
#----------------------------
cp /opt/docker/imap /etc/xinetd.d/
cp /opt/docker/ipop3 /etc/xinetd.d/
cp /opt/docker/pop3s /etc/xinetd.d/
cp /opt/docker/pamimap /etc/pam.d/imap
