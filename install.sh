#!/usr/bin/env bash

set -e

info () {
  printf "\r  [ \033[00;34mINFO\033[0m ] $1\n"
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
  sudo apt-get -y install $1 >/dev/null && success "Installed $1" || fail "Could not install $1" 
}

info "Ensuring zsh is the default shell"
echo $SHELL | grep -q "zsh" || fail "zsh is not the default shell"

check_if_dep_installed "zsh"
check_if_dep_installed "git"
check_if_dep_installed "curl"

info "Updating repositories"
sudo apt-get -y update >/dev/null && sudo apt-get -y upgrade >/dev/null && success "Updated apt repositories" || fail "Could not update apt repositories"
  
info "Installing dependencies"

install_dep "tmux"
install_dep "gh"

info "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && success "Installed Oh My Zsh" || fail "Could not install Oh My Zsh"

info "Installing Powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && success "Installed Powerlevel10k" || fail "Could not install Powerlevel10k"

info "Installing pyenv"
curl https://pyenv.run | zsh && success "Installed pyenv" || fail "Could not install pyenv"

info "Cloning bare dotfiles repository"
git clone --bare https://github.com/akabinds/.dotfiles.git $HOME/.dotfiles && success "Cloned bare dotfiles repository" || fail "Could not clone bare dotfiles repository"

dotfiles () {
  git --git-dir=$HOME/.dotfiles --work-tree=$HOME $1
}

info "Checking out dotfiles"
dotfiles checkout -f && success "Checked out dotfiles" || fail "Could not checkout dotfiles"
