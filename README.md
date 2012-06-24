## Files

 - files
    - bin
     - tmux.start : create or attach session
    - dotfiles
 - scripts
    - setup.sh : make symbolic links to install(run in ~/)
    - teardown.sh : remove symbolic links to uninstall(run in ~/)

## How to

### Install

 1. clear dot files in your home directory
 1. install git, zsh, tmux
 1. chsh -s zsh
 1. relogin
 1. git clone $(THIS_REPO)
 1. cd
 1. $(THIS_REPO)/scripts/setup.sh
 1. vim . (you will get warnings on vim boot)
 1. :NeoBundleInstall (in vim)

### Update

 1. git pull
 1. $(THIS_REPO)/scripts/teardown.sh && $(THIS_REPO)/scripts/setup.sh
