DOTFILES=$(dirname $0)/..

for f in $DOTFILES/files/* $DOTFILES/files/.*
do
    echo $f | awk "/\/\.$/{exit 1}" || continue
    echo $f | awk "/\/\.\.$/{exit 1}" || continue
    echo $f | awk "/~$/{exit 1}" || continue
    [ $f = .DSStore ] && continue
    [ -e $f ] && rm -rf $(basename $f)
done
