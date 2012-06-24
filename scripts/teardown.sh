DOTFILES=$(dirname $0)/..

for f in $DOTFILES/files/* $DOTFILES/files/.*
do
    if echo $f | grep -e \/\.$ ; then
        continue
    fi
    if echo $f | grep -e \/\.\.$ ; then
        continue
    fi
    if echo $f | grep -e \~$ ; then
        continue
    fi
    [ -e $f ] && rm $(basename $f)
done
