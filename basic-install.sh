#!/bin/bash

border()
{
    local title="| $1 |"
    local edge=${title//?/-}
    echo -e "${edge}\e[34m\n${title}\n${edge}"
    sleep 3
}

border 'Stopping current Archphile Service'
sleep 1
systemctl stop archphile.service

border 'Downloading Sound File'
sleep 1
[[ -f /usr/bin/archphile-optimize ]] && mv /usr/bin/archphile-optimize /usr/bin/backup-archphile-optimize.bak
wget https://github.com/dynobot/Arch-Linux-Audio-RPi/raw/archphile-alpha/archphile-optimize -O /usr/bin/archphile-optimize
chmod 755 /usr/bin/archphile-optimize

border 'Increasing Sound Group Priority'
sleep 1
[[ -f /etc/security/limits.conf ]] && mv /etc/security/limits.conf /etc/security/limits.conf.bak
wget https://github.com/dynobot/Arch-Linux-Audio-RPi/raw/archphile-alpha/limits.conf -O /etc/security/limits.conf
chmod 755 /etc/security/limits.conf

border 'Improving Network Latency'
sleep 1
[[ -f /etc/sysctl.d/archphile-network.con ]] && mv /etc/sysctl.d/archphile-network.conf /etc/sysctl.d/archphile-network.conf.bak
wget https://github.com/dynobot/Arch-Linux-Audio-RPi/raw/archphile-alpha/archphile-network.conf -O /etc/sysctl.d/archphile-network.conf
chmod 755 /etc/sysctl.d/archphile-network.conf

border 'Improveing Kernel Latency'
sleep 1
wget https://github.com/dynobot/Arch-Linux-Audio-RPi/raw/archphile-alpha/60-mmc-scheduler.rules  -O /etc/udev/rules.d/60-mmc-scheduler.rules 
chmod 755 /etc/udev/rules.d/60-mmc-scheduler.rules

border 'Installation Finished'
sleep 1

border 'Restarting Archphile Service'
sleep 1
systemctl restart archphile.sevice

border 'Cleaning Up & Rebooting System Enjoy the Music'
sleep 3
rm basic-install.sh

reboot
exit 0
