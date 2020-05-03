#!/bin/bash

border()
{
    local title="| $1 |"
    local edge=${title//?/-}
    echo -e "${edge}\e[34m\n${title}\n${edge}"
    sleep 3
}

border 'Removing Linux Audio Tuning'

[[ -f /usr/bin/archphile-optimize ]] && rm /usr/bin/archphile-optimize
[[ -f /etc/sysctl.d/archphile-network.conf ]] && rm /etc/sysctl.d/archphile-network.conf
[[ -f /etc/security/limits.conf ]] && rm /etc/security/limits.conf
[[ -f /etc/security/limits.conf.bak ]] && mv /etc/security/limits.conf.bak /etc/security/limits.conf
[[ -f /usr/bin/archphile-optimize.bak ]] && mv /usr/bin/archphile-optimize.bak /usr/bin/archphile-optimize
[[ -f /etc/sysctl.d/archphile-network.conf.bak ]] && mv /etc/sysctl.d/archphile-network.conf.bak /etc/sysctl.d/archphile-network.conf

border 'Cleaning up & Rebooting System'
sleep 1
rm remove.sh
reboot

