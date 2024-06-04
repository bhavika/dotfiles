# Path to your oh-my-zsh installation.
export ZSH="/Users/bhavika/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="cloud"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="mm/dd/yyyy"

plugins=(git cd-ls fzf)

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


alias zshconfig="open -e ~/.zshrc"
alias zprofile="open -e ~/.zprofile"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && { type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; } }
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

alias gs="git status"

function ver {
	pip list | grep $1
}

source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell

# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}/Users/bhavika/.kube/config:/Users/bhavika/.kube/config.shopify.cloudplatform
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
for file in /Users/bhavika/src/github.com/Shopify/cloudplatform/workflow-utils/*.bash; do source ${file}; done
kubectl-short-aliases

eval "$(starship init zsh)"

function update_repos {
    echo $1
    /Users/bhavika/tools/update_repos.sh $1
}

alias reload="source ~/.zshrc"

function clean_local_branches {
    git branch --merged main | grep -v '^[ *]*main$' | xargs git branch -d
}

alias k=kubectl

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/bhavika/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/bhavika/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/bhavika/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/bhavika/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/bhavika/miniconda3/etc/profile.d/mamba.sh" ]; then
    . "/Users/bhavika/miniconda3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(atuin init zsh)"

# For SkyPilot shell completion
. ~/.sky/.sky-complete.zsh

HISTORY_IGNORE="(ls|pwd)*"

setopt EXTENDED_HISTORY      # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY         # Share history between all sessions.
setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE     # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt HIST_VERIFY           # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY        # append to history file (Default)
setopt HIST_NO_STORE         # Don't store history commands
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history.
[ -s "/Users/bhavika/.scm_breeze/scm_breeze.sh" ] && source "/Users/bhavika/.scm_breeze/scm_breeze.sh"

# Created by `pipx` on 2024-05-01 20:42:43
export PATH="$PATH:/Users/bhavika/.local/bin"
alias uvenv="source .venv/bin/activate"
alias uvset="uv pip install -r requirements.txt"