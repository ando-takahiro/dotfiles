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
    ([ -f $f ] || [ -d $f ]) && rm $(basename $f)
done
