## GNOME

## `gsettings`

For faster hjkl-ing around and stuff.
Best used in combo with `set ttimeoutlen=50` in your `.vimrc`.

```
gsettings set org.gnome.desktop.peripherals.keyboard delay 300 
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 20
```

Disable animations:
	`gsettings set org.gnome.desktop.interface enable-animations false`

## Misc settings
---
I change them in GUI 'cause I'm a noob

## Default apps

### Switch terminal

`sudo update-alternatives --config x-terminal-emulator`

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

