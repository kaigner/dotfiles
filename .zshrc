# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$(brew --prefix)/opt/python@3.12/libexec/bin:$PATH"

ZSH_THEME="robbyrussell"
plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source /Users/kla/.profile
export HISTSIZE=2000000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space




# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/kla/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/kla/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/kla/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/kla/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<



brew() {
    local -a conda_envs
    while [ "$CONDA_SHLVL" -gt 0  ]; do
        conda_envs=("$CONDA_DEFAULT_ENV" $conda_envs)
        conda deactivate
    done
    command brew $@
    local brew_status=$?
    for env in $conda_envs; do
        conda activate "$env"
    done
    unset env
    return "$brew_status"
}

function cd() {
  builtin cd $1

  if [[ -n "$VIRTUAL_ENV" && -d ./venv ]] ; then
    deactivate
    . ./venv/bin/activate
  fi
}
eval "$(starship init zsh)"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
