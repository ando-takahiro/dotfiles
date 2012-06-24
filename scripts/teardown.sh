DOTFILES=$(dirname $0)/..

pushd ~/
for f in $DOTFILES/files/.*
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
    rm $f
done
popd