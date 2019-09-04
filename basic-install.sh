#!/bin/bash

border()
{
    local title="| $1 |"
    local edge=${title//?/-}
    echo -e "${edge}\e[1m\e[34m\n${title}\n${edge}"
    sleep 3
}

border 'Downloading Sound File'

wget https://github.com/dynobot/Arch-Linux-Audio-RPi/raw/master/Sound.sh -O /usr/bin/Sound.sh
chmod 755 /usr/bin/Sound.sh

border 'Increasing Sound Group Priority'
sleep 1
[[ -f /etc/security/limits.conf ]] && mv /etc/security/limits.conf /etc/security/limits.conf.bak
echo '#New Limits' > /etc/security/limits.conf
echo '@audio - rtprio 99' >> /etc/security/limits.conf
echo '@audio - memlock 512000' >> /etc/security/limits.conf
echo '@audio - nice -20' >> /etc/security/limits.conf

border 'Improving Network Latency'
sleep 1
echo "#New Network Latency" > /etc/sysctl.d/network-latency.conf
echo 'net.core.rmem_max = 16777216' >> /etc/sysctl.d/network-latency.conf
echo 'net.core.wmem_max = 16777216' >> /etc/sysctl.d/network-latency.conf


border 'Creating System Service'

wget https://github.com/dynobot/Arch-Linux-Audio-RPi/raw/master/sound.service -O /etc/systemd/system/sound.service
systemctl enable sound.service


border 'Rebooting System Enjoy the Music'
sleep 3

reboot
