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

# Setup vim
vim -c ':call dein#install()' -c ':q!'
