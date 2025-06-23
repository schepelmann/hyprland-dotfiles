autoload -Uz vcs_info
setopt prompt_subst

zstyle ':vcs_info:*' enable git 
zstyle ':vcs_info:git*' formats " %F{blue}%b%f %m%u%c %a "
zstyle ':vcs_info:*' check-for-changes true 
zstyle ':vcs_info:*' stagedstr ' %F{green}✚%f'
zstyle ':vcs_info:*' unstagedstr ' %F{red}●%f'

# PROMPT='%B%F{51}%n%f%b:~$'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/marcel/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/marcel/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/marcel/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/marcel/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

precmd_conda_info() {
  if [[ -n $CONDA_DEFAULT_ENV ]]; then
    CONDA_ENV="🐍 ($CONDA_DEFAULT_ENV)  "
  # When no conda environment is active, don't show anything
  else
    CONDA_ENV=""
  fi
}

precmd() { 
  vcs_info
  precmd_conda_info
  print -P "\nΓ %~ %B%F{cyan}$CONDA_ENV%f%b${vcs_info_msg_0_}"
}

PROMPT='↳ %B%(!.#.$)%b '

