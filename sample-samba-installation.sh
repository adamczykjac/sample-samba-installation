#!/usr/bin/env bash


# This script installs Samba server with a basic configuration

echo "Installing Samba package"
apt-get update
apt-get install -y samba --no-install-recommends

echo "Configuring smb.conf"
echo "[share]
  comment = Sample Samba Share
  path = /srv/samba/share
  guest ok = yes
  browsable = yes
  read only = no
  create mask = 0755" >> /etc/samba/smb.conf

echo "Changing shared folder permissions"
mkdir -p /srv/samba/share
chown nobody.nogroup /srv/samba/share
chmod 755 /srv/samba/share

echo "Restarting daemons"
service smbd restart
service nmbd restart
