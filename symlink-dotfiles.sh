#!/bin/bash

dotfiles="$HOME/dotfiles"
bin="/usr/local/bin"

cd "$dotfiles"
git pull origin master

if [[ -d "$dotfiles" ]]; then
  echo "Symlinking dotfiles from $dotfiles"
else
  echo "$dotfiles does not exist"
  exit 1
fi

link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm --force "$to"
  ln -s "$from" "$to"
}

read -p "This will symlink your current dotfiles in HOME. Are you sure? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  for location in home/*; do
    file="${location##*/}"
    file="${file%.*}"
    echo "that will symlink $dotfiles/$location to $HOME/.$file"
    # link "$dotfiles/$location" "$HOME/.$file"
  done
fi

# if [[ `uname` == 'Darwin' ]]; then
#   link "$dotfiles/sublime/Packages/User/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings"
# fi

source ~/.bash_profile