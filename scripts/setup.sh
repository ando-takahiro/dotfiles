DOTFILES=$(dirname $0)/..

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Setup a vim plugin, dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/dein

# Symlinks
for f in $DOTFILES/files/.*
do
    echo $f | awk "/\/\.$/{exit 1}" || continue
    echo $f | awk "/\/\.\.$/{exit 1}" || continue
    echo $f | awk "/~$/{exit 1}" || continue
    [ $f = .DSStore ] && continue
    ln -s $f
done
ln -s $DOTFILES/files/util

# Setup vim
vim -c ':call dein#install()' -c ':q!'

# pyinvoke completion
git clone git@github.com:pyinvoke/invoke.git ~/pyinvoke
