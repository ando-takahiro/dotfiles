DOTFILES=$(dirname $0)/..

for f in $DOTFILES/files/*
do
    if [[ $f =~ \/\.$ ]] ; then
        continue
    fi
    if [[ $f =~ \/\.\.$ ]] ; then
        continue
    fi
    if [[ $f =~ \~$ ]] ; then
        continue
    fi
    ln -s $f
done
