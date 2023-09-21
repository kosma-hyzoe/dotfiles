
sudo apt-get build-dep libvte-2.91-0 gnome-terminal
sudo apt-get install g++

git clone https://gitlab.gnome.org/GNOME/gnome-terminal

# Change to the toplevel directory
cd gnome-terminal

# Run the configure script (choose an appropriate path instead of "/some/where"!)
# Don't forget to make sure that pkg-config can find your self-build vte!
# e.g. by doing:
# export PKG_CONFIG_PATH=/some/where/lib64/pkg-config:$PKG_CONFIG_PATH
#
# If you compiled gnome-shell into the same prefix, you can omit disabling
# the search provider.
#
meson _build --prefix=/usr/bin -Dsearch_provider=false

# Build
ninja -C _build

# Install
ninja -C _build install
