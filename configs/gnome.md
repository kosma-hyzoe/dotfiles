## GNOME

## Misc settings
---
I change them in GUI 'cause I'm a noob

## Default apps

### [Switch terminal](https://askubuntu.com/questions/1364954/make-alacritty-the-default-terminal-permanently)

```
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /path/to/ur/terminal 50 # install add the alternative if needed
sudo update-alternatives --config x-terminal-emulator

sudo update-alternatives --remove "x-terminal-emulator" "/usr/bin/alacritty" # remove if needed
```

### [Switch to nemo](https://mfcallahan.blog/2022/06/24/make-nemo-the-default-file-manager-on-ubuntu/)
```
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search

gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.nemo.desktop show-desktop-icons true

# reverse
gsettings set org.gnome.desktop.background show-desktop-icons true
gsettings set org.nemo.desktop show-desktop-icons false
xdg-mime default nautilus.desktop inode/directory application/x-gnome-saved-search
sudo apt purge nemo nemo*
```
