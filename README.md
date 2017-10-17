## Files

 - files
    - dotfiles
 - scripts
    - setup.sh : make symbolic links to install(run in ~/)
    - teardown.sh : remove symbolic links to uninstall(run in ~/)

## How to

### Install

 1. Clear dot files in your home directory
 1. Install *git, zsh, vim, tmux (on LInux: xdg-utils)*
 1. `chsh -s /bin/zsh`
 1. Relogin
 1. `git clone $(THIS_REPO)`
 1. `cd`
 1. `$(THIS_REPO)/scripts/setup.sh`
 1. `tmux`
 1. press CTRL+B, SHIFT+I to install tmux plugins

### Update

 1. git pull
 1. $(THIS_REPO)/scripts/teardown.sh && $(THIS_REPO)/scripts/setup.sh

## Known issues

 - fzf vim plugin installion might freeze.  press CTRL + C, maybe it's installed
