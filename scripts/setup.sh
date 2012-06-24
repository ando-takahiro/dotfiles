DOTFILES=$(dirname $0)/..

pushd
ln -s $DOTFILES/*
popd
