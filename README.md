# Dragon OS
Repository for the Dragon OS Linux distribution.

## Installation
1. Download the [Debian](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.4.0-amd64-netinst.iso) and install it onto your system.
2. Switch to the root user using ``sudo -s``
3. Begin the installation by using the following command:
```bash
wget https://raw.githubusercontent.com/jelle619/dragonos/master/install.sh -O /tmp/install.sh && bash /tmp/install.sh
```
or, alternatively
```bash
curl -o /tmp/install.sh https://raw.githubusercontent.com/jelle619/dragonos/master/install.sh && bash /tmp/install.sh
```
