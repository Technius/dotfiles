# Technius's dotfiles

Today, my primary hard drive completely failed and became a brick. I didn't lose
too much; most of my code is in source control, and I use a secondary hard drive
to store large binary files (images, videos, etc.).

After buying an SSD and reinstalling Debian, I decided to make this repo so it's
easier to 1) recover from future disk failures, 2) keep my configuration files
consistent across all of my devices, and 3) install stuff that I use.

## Layout
* `setup_pkgs.sh`: (Requires root permissions) Installs packages listed in
  `debian-pkgs` and then installs some PPAs.
* `setup.sh`: Installs user dependencies.
* `makelinks.sh`: Symlinks stuff from `config` and `scripts`. View it to see
  which files are symlinked.
* config: Contains various configuration files (e.g. `.vimrc`,
  `.gitignore`).
* scripts: Contains convenient scripts and other stuff.
** `workspace`: Creates a new `tmux` with two panes split vertically. The right
   pane contains `vim` opened up to `NERDTree` and the left pane is just a
   terminal. A session name can be supplied with the first argument (e.g.
   `workspace my-session`).
