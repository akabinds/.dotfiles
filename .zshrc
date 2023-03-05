#!/bin/zsh

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

# Pyenv Setup
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYTHON_CONFIGURE_OPTS="--enable-shared"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set the zsh theme. See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes for a list of themes.
ZSH_THEME="typewritten"
export TYPEWRITTEN_PROMPT_LAYOUT="pure_verbose"
export TYPEWRITTEN_RELATIVE_PATH="adaptive"
export TYPEWRITTEN_LEFT_PROMPT_PREFIX_FUNCTION=(date +"%T")
export TYPEWRITTEN_CURSOR="beam"

# Options
zstyle ':omz:update' mode auto # update automatically without asking 
zstyle ':omz:update' frequency 7 # update every 7 days
ENABLE_CORRECTION="true" # enable command autocorrection

# Load plugins
plugins=(git)

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Node Version Manager Setup
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

# Znap
source ~/repos/zsh-snap/znap.zsh
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

# Aliases
alias dotfiles="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias hxc="cargo install --locked --path $HOME/code/opensource/helix/helix-term && $HOME/.cargo/bin/hx"

# Environment Variables
export UNTAR_DIR="$HOME/untar"
export PATH="$UNTAR_DIR/nvim/bin:$PATH"
export PATH="$UNTAR_DIR/helix:$PATH"
export PATH="$UNTAR_DIR/lua-language-server/bin:$PATH"
