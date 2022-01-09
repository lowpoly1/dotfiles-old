#
# ~/.bashrc
#

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

PS1='\[\e[34m\]╭\[$(tput setaf 62)\] hist#: \[\!\]\n\[\e[34m\]╞═🢖\[$(tput setaf 41)\] \$ \[$(tput sc)\n\e[34m\]╰ $(tput setaf 173)$(pwd)$(tput rc)\e[0m'
PS0='\[\n\]'

