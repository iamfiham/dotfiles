#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='\u@\h \w \$ '

PS1='\[\033[01;32m\]┌──(\[\033[00m\]\u@\h\[\033[01;32m\])-[\[\033[01;34m\]\w\[\033[01;32m\]]\n└─\[\033[00m\]\$ '

# personal user commands
	bind 'set completion-ignore-case on'
	bind 'set show-all-if-ambiguous on'
	bind 'TAB:menu-complete'
	
	

