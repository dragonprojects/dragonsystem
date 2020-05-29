# Dragon OS
Repository for the Dragon OS Linux distribution.

## Installation
1. Download the [Debian network installer](https://www.debian.org/distrib/netinst) and install it onto your system.
2. Switch to the root user using ``sudo -s``
3. Begin the installation by using the following command:
```bash
apt install wget -y && wget https://raw.githubusercontent.com/jelle619/dragonos/master/install.sh -O /tmp/install.sh && bash /tmp/install.sh
```
