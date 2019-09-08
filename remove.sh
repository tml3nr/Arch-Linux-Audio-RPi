#!/bin/bash

border()
{
    local title="| $1 |"
    local edge=${title//?/-}
    echo -e "${edge}\e[34m\n${title}\n${edge}"
    sleep 3
}

border 'Removing Linux Audio Tuning'

[[ -f /usr/bin/Sound.sh ]] && rm /usr/bin/Sound.sh
[[ -f /etc/sysctl.d/network-latency.conf ]] && rm /etc/sysctl.d/network-latency.conf
[[ -f /etc/security/limits.conf.bak ]] && mv /etc/security/limits.conf.bak /etc/security/limits.conf
[[ -f /etc/systemd/system/sound.service ]] && rm /etc/systemd/system/sound.service
[[ -f /boot/config.txt ]] && rm /boot/config.txt
[[ -f /boot/config.txt.bak ]] && mv /boot/config.txt.bak /boot/config.txt
[[ -f /etc/systemd/system/spotifyd.service ]] && rm /etc/systemd/system/spotifyd.service
[[ -f /usr/bin/spotifyd ]] && rm /usr/bin/spotifyd
[[ -f ~/.config/spotifyd/spotifyd.conf ]] && rm ~/.config/spotifyd/spotifyd.conf

border 'Cleaning up & Rebooting System'
sleep 1
rm remove.sh
reboot
