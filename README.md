# Dotfiles

My dotfiles, configs and backups.


## Usage

Use at your own risk! This is all very work-in-progress and somewhat improvised.

Run the scripts from `installs` and `scripts` directories. Some are
platform-agnostic, some only support apt-based distros for now.
Run `fln.sh` form the repo dir to hard-link the rc's to your `$HOME`.
`installs/gui-essentials.sh`. For now some of the software installs works for
apt-based distros only.

## CLI essentials

For now, the `cli-essentials.sh` install script covers:

* `nvim` in `appimage` format
* the `lf` binary
* `zsh` pure prompt
* `exa` (installed with cargo) + `exa-wrapper.sh` script for `ls` flags

## Todo

* non-cargo exa?
* Install history script
* `fln.sh` -> `lnocp.sh`
* non-appimage nvim?

