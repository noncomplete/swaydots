#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W] >>> '

alias vim="nvim"
alias vi="/usr/bin/vim"
alias :wq="exit"
alias :q="exit"

export PATH="/home/noncomplete/.local/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/noncomplete/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/noncomplete/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/noncomplete/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/noncomplete/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

