# Dotfiles

## Installation

### Using Git and the install script

Clone the repository in your home directory i.e. `~/Users/{username}/dotfiles`. The install script will pull in the latest version and symlink the files to your home folder.

```bash
git clone https://github.com/marcinc/dotfiles.git && cd dotfiles && source install.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source install.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source install.sh
```

### Git-free install

To install these dotfiles without Git:

```bash
cd; rm -rf dotfiles; mkdir -p dotfiles; cd dotfiles; curl -#L https://github.com/marcinc/dotfiles/tarball/master | tar -xzv --strip-components 1; source install.sh
```

To update later on, just run that command again.

### How to uninstall

To uninstall, `cd` into your local `dotfiles` repo and then:

```bash
source uninstall.sh
```

This will automatically remove all previously created symlinks.

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/mathiasbynens/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-26)) takes place.

Here’s an example `~/.path` file that adds `~/utils` to the `$PATH`:

```bash
export PATH="$HOME/utils:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

Example `~/.extra` file:

```bash
# PATH additions
export PATH="~/bin:$PATH"

# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Joe Doe"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="joe@example.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/marcinc/dotfiles/fork_select) instead, though.

### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common Homebrew formulae (after installing Homebrew, of course):

```bash
./.brew
```

## CREDITS

This project was heavily influenced by [Mathias Bynens dotfiles](https://github.com/mathiasbynens/dotfiles). In fact most of the underlying code was borrowed / copied from his original work.
