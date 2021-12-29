#
# ~/.bashrc
#

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

unimatrix -c green -l S -s 97 -w
