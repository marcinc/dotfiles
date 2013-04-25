#!/bin/bash

dotfiles="$HOME/dotfiles"
bin="/usr/local/bin"

cd "$dotfiles"
git pull origin master

remove_link() {
  file="$1"
  echo "Removing '$file' from $HOME"
  rm -rf "$file"
}

read -p "This will uninstall dotfiles. Are you sure? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  files=`ls -a home`
  for filename in $files; do 
    if [ "$filename" != .. ] && [ "$filename" != . ]
    then
      remove_link "$HOME/$filename"
    fi
  done
fi

if [ -e "$HOME/.bash_profile" ]; then
  source ~/.bash_profile
fi