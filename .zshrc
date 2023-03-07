#!/bin/zsh

# ################################### #
#        CONSOLE I/O REQUIRED         #
# ################################### #

# attach back to defualt tmux session if possible, otherwise create a new session.
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


# ################################### #
#                THEME                #
# ################################### #

# Enable Powerlevel10k instant prompt. Initialization requiring console I/O should go above.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source Powerlevel10k configuration.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set ZSH theme.
ZSH_THEME="powerlevel10k/powerlevel10k"


# ################################### #
#              OH MY ZSH              #
# ################################### #

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Plugins
plugins=(git)

# Options
zstyle ':omz:update' mode auto # update automatically without asking 
zstyle ':omz:update' frequency 7 # update every 7 days


# ################################### #
#               GENERAL               #
# ################################### #

aliases () {
    alias dotfiles="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
}

precmd () {
    aliases
}

# Options
ENABLE_CORRECTION="true" # enable command autocorrection

# Environment Variables
export SOURCE_BUILD_DIR="$HOME/source"
export PATH="$SOURCE_BUILD_DIR/nvim/bin:$PATH"
export PATH="$SOURCE_BUILD_DIR/helix:$PATH"
export PATH="$SOURCE_BUILD_DIR/lua-language-server/bin:$PATH"
