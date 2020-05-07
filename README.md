
<p align="center">
  <img width="250" height="250" src="https://github.com/dynobot/Arch-Linux-Audio-RPi/blob/archphile-alpha/images/dbaudio.png">
</p>

# Archphile Linux-Audio Sound Tweaks
Arch Linux Based RPi tweaks for improved sound. 
- For TinyCore Linux based systems see [TinyCore Sound Tweaks](https://github.com/dynobot/TinyCore-Sound-Adjustments)
- For Debian Linux base systems see [Debian Sound Tweaks](https://github.com/dynobot/Linux-Audio-Adjustments)

 Purpose is to improve the sound of the Raspberry Pi using Linux based systems by:
 1) Improving the priority of the Audio group
 2) Improving the audio thread priority
 3) Improving the latency of the Operating System with Kernel adjustments
 4) Improve network latency
 ______________________________________________________________________________________________________________________________
 ### Prerequisites 
 1) The ability to ssh into your Raspberrypi - see your OS documentation for details.
 
 *Note: System will reboot after install and removal*
 
 ### Post Install
 1) If you are using and have configured Wifi before you installed this tweak you will need to go back into the archphile-optimize file and update your country code.
 
`nano /usr/bin/archphile-optimize` 

iw reg set US

 2) By default Archphile creates cpu affinity for MPD and/or Squeezelite. This creates an unnecessary bottle neck, forcing the audio program to use only one core. This is not necessary as the audio program is the only program running. Commenting this section out in the archphile-optimze file will give your audio software full access to all cores and provide a more stable output under various loads.
 
`nano /usr/bin/archphile-optimize` 

#taskset -c -a -p 1 $(pidof mpd)

#taskset -c -a -p 1 $(pidof squeezelite)

**Should work on any SBC running Arch Linux based OS, has been tested on:**

- Raspberry Pi (v1) model B
- Raspberry Pi 2 model B
- Raspberry Pi 3 model B and B+


 ______________________________________________________________________________________________________________________________
 ## Automated Install
 `wget https://github.com/dynobot/Arch-Linux-Audio-RPi/raw/archphile-alpha/basic-install.sh`
 
 `chmod 755 basic-install.sh`
 
 `./basic-install.sh`
 
 ## Automated Removal
 `wget https://github.com/dynobot/Arch-Linux-Audio-RPi/raw/archphile-alpha/remove.sh`
 
 `chmod 755 remove.sh`
 
 `./remove.sh`
 
 ____________________________________________________________________________________________________________________________


