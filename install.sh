#!/usr/bin/env bash

set -e

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

check_if_dep_installed () {
  info "Checking if $1 is installed"
  type -p $1 >/dev/null 2>&1 || fail "Required dependency $1 is not installed. Please install it"
}

install_dep () {
  info "Installing $1"
  sudo apt-get -y install $1 && success "Successfully installed $1" || fail "Failed to install $1" 
}

info "Ensuring zsh is the default shell"
echo $SHELL | less -p "zsh" || fail "zsh is not the default shell"

check_if_dep_installed "zsh"
check_if_dep_installed "git"

info "Updating repositories"
sudo apt-get -y update && sudo apt-get -y upgrade && success "Successfully updated repositories" || fail "Failed to update repositories"
  
info "Installing dependencies"

install_dep "curl"
install_dep "tmux"

info "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && success "Successfully installed Oh My Zsh" || fail "Failed to install Oh My Zsh"

info "Installing Powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && success "Successfully installed Powerlevel10k" || fail "Failed to install Powerlevel10k"

info "Installing pyenv"
curl https://pyenv.run | zsh && success "Successfully installed pyenv" || fail "Failed to install pyenv"

info "Cloning dotfiles"
git clone --bare https://github.com/akabinds/.dotfiles.git $HOME/.dotfiles && success "Successfully cloned dotfiles" || fail "Failed to clone dotfiles"
