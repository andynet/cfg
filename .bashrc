# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias hx='helix'

alias ..='cd ..'
alias ...='cd ../../'

alias ls='ls --color=auto'
alias la='ls -a --color=auto --group-directories-first'
alias ll='ls -l --color=auto --group-directories-first'
alias l.='ls -d .!(|.) --color=auto --group-directories-first'
# alias l.='ls -la | grep -E " \."'

PS1='[\u@\h \W]\$ '

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/balaz/.local/share/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/balaz/.local/share/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/balaz/.local/share/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/balaz/.local/share/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} ]]
# then
    # exec fish
# fi

source /home/balaz/.config/broot/launcher/bash/br
alias config='/usr/bin/git --git-dir=/home/balaz/.cfg/ --work-tree=/home/balaz'
