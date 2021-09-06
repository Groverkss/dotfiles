# DotFiles

## Setup

This repo contains dotfiles + instructions to install applications I
use on a freshly installed distro

## Instructions

Add ppa usefull for ricing
```bash
sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt-get update
```

Use lightdm as display-manager:
```bash
sudo apt install lightdm
```

Install some usefull stuff:
```bash
sudo apt install git polybar i3-gaps feh htop zsh vim-gtk
chsh -s $(which zsh)
```

Logout and login to i3 after this

Install Oh-My-Zsh:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Copy config files:
```bash
cp .config/i3/config ~/.config/i3/
cp ladkiwallpaper.jpg ~/Pictures/
cp .config/polybar ~/.config/
cp .vimrc .bashrc .zshrc .Xresources .gitconfig ~/
```

Install Chromium and Flameshot
```bash
sudo apt install chromium
sudo apt install flameshot
```

For some reason password store isn't auto-enabled in Chromium. To enable it manually

Add the '--password-store=gnome' in chrome's .desktop file in Exec section

Install more usefull packages
```bash
sudo apt install discord code zathura
```

Install urxvt:
```bash
sudo apt install rxvt-unicode-256color
```

After installing urxvt, to set it to default:

```bash
# Select /usr/bin/urxvt here
sudo update-alternatives --config x-terminal-emulator
```

Install NeoVim:

```bash
sudo apt install neovim
```

Add this in config to enable NaturalScrolling and taptoclick on touchpad:

Edit the Section containing MatchIsTouchpad in `/usr/share/X11/xorg.conf.d/40-libinput.conf` so that it matches this:

```bash
Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Option "NaturalScrolling" "True"
        Option "Tapping" "on"
        Driver "libinput"
EndSection
```

## Not added yet

Enable brightness control via xbacklight:

```bash
sudo apt install xbacklight
```

**THIS WILL MAKE YOUR NVIDIA CARD NOT WORK IF YOU HAVE ONE**

Add this to `/etc/X11/xorg.conf`:

```bash
Section "Device"
    Identifier "Card0"
    Driver "intel"
    Option "Backlight" "intel_backlight"
EndSection
```

TODO: Take a look here and enable xbacklight for NVIDIA card: https://askubuntu.com/questions/1057783/no-brightness-control-18-04-lts-sys-class-backlight-is-empty
