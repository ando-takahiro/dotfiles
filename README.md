## Files

 - files
    - bin
     - tmux-start : create or attach session
     - tmux-new : create session
    - dotfiles
 - scripts
    - setup.sh : make symbolic links to install(run in ~/)
    - teardown.sh : remove symbolic links to uninstall(run in ~/)

## How to

### Install

 1. clear dot files in your home directory
 1. install git, zsh, tmux, [solarized](https://github.com/altercation/solarized)
   - for tmux: install tpm(tmux package manager), and do `CTRL+T SHIFT+I`
   - on linux: xclip
 1. chsh -s /bin/zsh
 1. relogin
 1. CTRL+T SHIFT+I (to install tmux plugins)
 1. git clone $(THIS_REPO)
 1. cd
 1. $(THIS_REPO)/scripts/setup.sh

### Update

 1. git pull
 1. $(THIS_REPO)/scripts/teardown.sh && $(THIS_REPO)/scripts/setup.sh
