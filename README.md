# Arch Linux-Audio Sound Tweaks
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
 
**Should work on any SBC running Arch Linux based OS, has been tested on:**

- Raspberry Pi (v1) model B
- Raspberry Pi 2 model B
- Raspberry Pi 3 model B and B+

## Spotify Connect Install - Ropieee Only
### Prerequisites 
 1) The ability to use nano text editor - see nano documentation for details.
 2) 7zip must be installed first: `pacman -S p7zip`

Once the install finishes update spotifyd.conf file with your Spotify credentials, then reboot.

`cd ~/.config/spotifyd` then `nano spotifyd.config`

 ______________________________________________________________________________________________________________________________
 ## Automated Install
 `wget https://github.com/dynobot/Arch-Linux-Audio-RPi/raw/beta/basic-install.sh`
 
 `chmod 755 basic-install.sh`
 
 `./basic-install.sh`
 
 ## Automated Removal
 `wget https://github.com/dynobot/Arch-Linux-Audio-RPi/raw/beta/remove.sh`
 
 `chmod 755 remove.sh`
 
 `./remove.sh`
 
 ____________________________________________________________________________________________________________________________



