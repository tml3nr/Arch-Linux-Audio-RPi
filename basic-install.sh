#!/bin/bash

border()
{
    local title="| $1 |"
    local edge=${title//?/-}
    echo -e "${edge}\e[34m\n${title}\n${edge}"
    sleep 3
}

border 'Downloading Sound File'
sleep 1
[[ -f /usr/bin/archphile-optimize ]] && mv /usr/bin/archphile-optimize /usr/bin/archphile-optimize.bak
wget https://github.com/dynobot/Arch-Linux-Audio-RPi/raw/beta/archphile-optimize -O /usr/bin/archphile-optimize
chmod 755 /usr/bin/archphile-optimize

border 'Increasing Sound Group Priority'
sleep 1
[[ -f /etc/security/limits.conf ]] && mv /etc/security/limits.conf /etc/security/limits.conf.bak
echo '#New Limits' > /etc/security/limits.conf
echo '@audio - rtprio 99' >> /etc/security/limits.conf
echo '@audio - memlock 512000' >> /etc/security/limits.conf

border 'Improving Network Latency'
sleep 1
[[ -f /etc/sysctl.d/archphile-network.conf ]] && /etc/sysctl.d/archphile-network.conf /etc/sysctl.d/archphile-network.conf.bak
echo "#New Network Latency" > /etc/sysctl.d/archphile-network.conf
echo 'net.core.rmem_max = 16777216' >> /etc/sysctl.d/archphile-network.conf
echo 'net.core.wmem_max = 16777216' >> /etc/sysctl.d/archphile-network.conf
echo 'net.ipv4.tcp_rmem= 4096 87380 16777216' >> /etc/sysctl.d/archphile-network.conf
echo 'net.ipv4.tcp_wmem= 4096 87380 16777216' >> /etc/sysctl.d/archphile-network.conf

border 'Installation Finished'
border 'Please update spotifyd.conf with your credentials and reboot'
sleep1
exit 0

border 'Cleaning Up & Rebooting System Enjoy the Music'
sleep 3
rm basic-install.sh

#reboot
