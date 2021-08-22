# Dragon System
Repository for the Dragon System Linux distribution.

## Installation
1. Download the [Debian network installer](https://www.debian.org/distrib/netinst) and install it onto your system.
2. Switch to the root user using ``sudo -s``
3. Begin the installation by using the following command:
```bash
apt install wget -y && wget https://raw.githubusercontent.com/dragonprojects/dragonsystem/master/install.sh -O /tmp/install.sh && bash /tmp/install.sh
```
4. Enjoy using Dragon OS!

## FAQ
### Can I use this script on anything other than Debian stable?
Yes, you can, but it is not guaranteed to work properly. You will likely have the most luck with distributions based on Debian like Ubuntu.

### Where are the maximise and minimise buttons in my windows?
This is currently an [ongoing issue](https://github.com/dragonprojects/dragonos/issues/4). To make the buttons visible, run ``gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'`` in the Terminal after running the script.
