 1 #!/bin/bash
 2
 3 border()
 4 {
 5     local title="| $1 |"
 6     local edge=${title//?/-}
 7     echo -e "${edge}\n${title}\n${edge}"
 8     sleep 1
 9 }
10
11 border 'Downloading Sound File'
12
13 wget https://github.com/dynobot/Linux-Audio-Adjustments/raw/master/Sound.$
14 chmod 755 /usr/bin/Sound.sh
15
16 border 'Increasing Sound Group Priority'
17
18 [[ -f /etc/security/limits.conf ]] && mv /etc/security/limits.conf /etc/s$
19 echo '#New Limits' > /etc/security/limits.conf
20 echo '@audio - rtprio 99' >> /etc/security/limits.conf
21 echo '@audio - memlock 512000' >> /etc/security/limits.conf
22 echo '@audio - nice -20' >> /etc/security/limits.conf
23
24 border 'Improving Network Latency'
25
26 echo "#New Network Latency" > /etc/sysctl.d/network-latency.conf
27 echo 'net.core.rmem_max = 16777216' >> /etc/sysctl.d/network-latency.conf
28 echo 'net.core.wmem_max = 16777216' >> /etc/sysctl.d/network-latency.conf
29
30 border 'Creating System Service'
31
32 [[ -f /etc/rc.local ]] || echo -e '#/bin/bash\n\nexit 0' > /etc/rc.local
33 grep -q '/usr/bin/Sound.sh' /etc/rc.local || sed -i '\|^#!/bin/.*sh|a\/us$
34 chmod +x /etc/rc.local
35 #systemctl enable rc-local || systemctl enable rc.local
36
37 border 'Rebooting System'
38
39
40 reboot
41

