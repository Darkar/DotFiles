# DotFiles 

## Applications

- Operating system: ArchLinux
- Windowing system: Wayland
- Window manager: Sway
- Wayland bar: Waybar
- Notifications: Mako
- Terminal: Kittyl
- Application launcher: Wofi
- File manager: Thunar
- Editeur de fichier: LeadPad
- Terminal monitor: bashtop

## Theme

- GTK:Flat Remix GTK Blue Dark
- VS Code: Github Dark

## Icons

- GTK: Remix GTK Blue Dark
- VS Code: Material Icon Theme

## Required

### ZSH

- zsh-autosuggestions 
- zsh-syntax-highlighting

## Laptop

### Battery notifications 

>/etc/udev/rules.d/99-batify.rules

```bash
ACTION=="change", KERNEL=="BAT0", \
SUBSYSTEM=="power_supply", \
ATTR{status}=="Discharging", \
ATTR{capacity}=="[0-9]", \
IMPORT{program}="/usr/bin/xpub", \
RUN+="/bin/su $env{XUSER} -c 'notify-send -u critical \"Batterie\" \"Il reste $attr{capacity}%\"'"

ACTION=="change", KERNEL=="BAT0", \
SUBSYSTEM=="power_supply", \
ATTR{status}=="Charging", \
ATTR{capacity}=="100", \
IMPORT{program}="/usr/bin/xpub", \
RUN+="/bin/su $env{XUSER} -c 'notify-send -u normal \"Batterie\" \"Charge terminé !\"'"

SUBSYSTEM=="power_supply", ACTION=="change", \
ENV{POWER_SUPPLY_ONLINE}=="0", ENV{POWER}="off", \
OPTIONS+="last_rule", \
IMPORT{program}="/usr/bin/xpub", \
RUN+="/bin/su $env{XUSER} -c 'notify-send -u low \"Batterie\" \"Chargeur débranché !\"'"

SUBSYSTEM=="power_supply", ACTION=="change", \
ENV{POWER_SUPPLY_ONLINE}=="1", ENV{POWER}="on", \
OPTIONS+="last_rule", \
IMPORT{program}="/usr/bin/xpub", \
RUN+="/bin/su $env{XUSER} -c 'notify-send -u low \"Batterie\" \"Chargeur branché !\"'"
```
