#!/bin/zsh

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

# Znap
source ~/znap/repo/znap.zsh
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

# Pyenv Setup
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYTHON_CONFIGURE_OPTS="--enable-shared"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set the zsh theme. See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes for a list of themes.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Options
zstyle ':omz:update' mode auto # update automatically without asking 
zstyle ':omz:update' frequency 7 # update every 7 days
ENABLE_CORRECTION="true" # enable command autocorrection

# Load plugins
plugins=(git)

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Aliases
alias dotfiles="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"

# Environment Variables
export SOURCE_BUILD_DIR="$HOME/source"
export PATH="$SOURCE_BUILD_DIR/nvim/bin:$PATH"
export PATH="$SOURCE_BUILD_DIR/helix:$PATH"
export PATH="$SOURCE_BUILD_DIR/lua-language-server/bin:$PATH"
