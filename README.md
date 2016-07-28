# Technius's dotfiles

Today, my primary hard drive completely failed and became a brick. I didn't lose
too much; most of my code is in source control, and I use a secondary hard drive
to store large binary files (images, videos, etc.).

After buying an SSD and reinstalling Debian, I decided to make this repo so it's
easier to 1) recover from future disk failures, 2) keep my configuration files
consistent across all of my devices, and 3) install stuff that I use.

## Layout
* `setup-scripts`: Contains installation scripts.
  * `depends.sh`: Installs runtime dependencies for installed packages.
  * `pkgs.sh`: (Requires root permissions) Installs packages listed in
    `debian-pkgs`.
  * `pkgs-dev.sh`: (Requires root permissions) Installs development tools.
  * `pkgs-extra.sh`: (Requires root permissions) Installs extra stuff like
    media players.
  * `util.sh`: Contains utility functions for the other scripts.
* `makelinks.sh`: Symlinks stuff from `config` and `scripts`. View it to see
  which files are symlinked.
* config: Contains various configuration files (e.g. `.vimrc`,
  `.gitignore`).
* scripts: Contains convenient scripts and other stuff.
  * `workspace`: Creates a new `tmux` session with two panes split vertically. The right
     pane contains `vim` opened up to `NERDTree`; the left pane is just a
     terminal. A session name can be supplied with the first argument (e.g.
     `workspace my-session`).
