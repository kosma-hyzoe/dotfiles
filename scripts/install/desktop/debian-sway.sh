#!/bin/sh

cd ~/

### Sway packages
sudo apt install -y sway waybar swaylock swayidle swaybg
sudo apt install -y gvfs-backends

### File manager (thunar)
sudo apt install -y thunar thunar-archive-plugin thunar-volman file-roller

###
sudo apt install -y mtools dosfstools acpi acpid avahi-daemon
sudo systemctl enable acpid
sudo systemctl enable avahi-daemon

### Polkit
sudo apt install -y policykit-1-gnome # (doesn't work on wayland; @debian)
# sudo apt install -y polkit-kde-agent-1

### Network Manager
sudo apt install -y network-manager network-manager-gnome

### Volume and brightness utilities
sudo apt install -y light pamixer

### Sound packages
sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa pulsemixer

### Launcher and notification daemon
sudo apt install -y wofi sway-notification-center wob libnotify-bin suckless-tools vim
### Bisa juga pakai mako-notifier tapi swaync lebih better

### Clipboard manager
sudo apt install -y  clipman

### Redshift replacement for wayland
sudo apt install -y wlsunset

### Screenshot stuff

sudo apt install -y grim grimshot slurp imagemagick zenity wl-clipboard

# Build wl-color-picker
[ ! -d "~/.stuff/" ] && mkdir -p ~/.stuff && cd ~/.stuff
git clone https://github.com/jgmdev/wl-color-picker
cd wl-color-picker
sudo make install

# Build swappy
sudo apt install -y meson ninja-build libcairo2-dev pango1.0-tools libgtk-3-dev libglib2.0-0 scdoc
[ ! -d "~/.stuff/" ] && mkdir -p ~/.stuff && cd ~/.stuff
git clone https://github.com/jtheoof/swappy.git
cd swappy
meson setup build
ninja -C build
sudo cp build/swappy /usr/local/bin
cd ~/

# Build nwg-look
sudo apt install -y golang
sudo apt install -y libglib2.0-dev
sudo apt install -y libcairo2-dev
sudo apt install -y libwebkit2gtk-4.0-dev
# sudo apt install -y libcairo-gobject2 # sudah include sama yg atas?
git clone https://github.com/nwg-piotr/nwg-look
cd nwg-look
make build # (take long time)
sudo make install

# # Build SwayOSD (testing, failed, use wob)
# sudo apt install -y sassc libudev-dev
# git clone https://github.com/ErikReider/SwayOSD
# cd SwayOSD
# # Please note that the command below might require `--prefix /usr` on some systems
# meson setup build
# ninja -C build
# meson install -C build


sudo apt install -y wayland-protocols xwayland
sudo apt install -y xdg-desktop-portal-wlr
sudo apt install -y libpam0g-dev libxcb1-dev
xdg-user-dirs-update

### Microcode for Intel/AMD
# sudo apt install -y amd64-microcode
sudo apt install -y intel-microcode

#### For GTK setting
#### using gsettings command
sudo apt install -y libglib2.0-bin

### it will also install adwaita icon
sudo apt install -y arc-theme

### PDF viewer
sudo apt install -y zathura

### Image viewer
sudo apt install -y mirage

### Fonts and icons for now
sudo apt install -y fonts-firacode fonts-liberation2
sudo apt install -y fonts-noto-color-emoji fonts-font-awesome

### Printing and bluetooth (if needed)
sudo apt install -y cups system-config-printer simple-scan
sudo apt install -y bluez blueman

sudo systemctl enable cups
sudo systemctl enable bluetooth


# on 'open terminal here' - create keyboard shortcut (ex: F4)


