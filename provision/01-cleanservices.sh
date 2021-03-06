#!/usr/bin/env bash

service snapd stop
systemctl disable snapd.service

systemctl stop iscsid.service
systemctl disable iscsid.service

systemctl stop lxd-containers.service
systemctl disable lxd-containers.service

systemctl stop open-iscsi.service
systemctl disable open-iscsi.service

systemctl stop apport.service
systemctl disable apport.service

systemctl stop lxd.socket
systemctl disable lxd.socket

systemctl stop snapd.autoimport.service
systemctl disable snapd.autoimport.service

service lxcfs stop
systemctl disable lxcfs.service

apt-get purge -y snapd snap-confine ubuntu-core-launcher lxd lxd-client open-iscsi lxcfs lxc-common accountsservice

apt-get purge -y apport python3-apport

apt-get autoremove --purge -y