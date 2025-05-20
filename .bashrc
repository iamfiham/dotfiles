


# ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
# ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
# ██████╔╝███████║███████╗███████║██████╔╝██║     
# ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║     
# ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
# ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
                                                


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ----------------------------------------------------------------------

HISTSIZE=10000
XDG_CONFIG_HOME=~/.config/

# --------------------  Alias  ------------------------------------------

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias mp='mousepad'
alias ll='ls -al'


# --------------------  PS1  ------------------------------------------

BG_COLOR1="\[\033[48;2;52;54;56m\]"
FG_COLOR1="\[\033[38;2;52;54;56m\]"

BG_COLOR2="\[\033[48;2;200;200;200m\]"
FG_COLOR2="\[\033[38;2;200;200;200m\]"

FG_BLACK="\[\033[01;30m\]"


RESET="\[\033[00m\]" 


# PS1='\u@\h \w \$ '

PS1="╭─${FG_COLOR1}◖${RESET}${BG_COLOR1}\u   ${RESET}${BG_COLOR2}${FG_COLOR1}${RESET}${BG_COLOR2}${FG_BLACK} 📁 \w${RESET}${FG_COLOR2}◗${RESET} \n╰─❯ "

# --------------------  bind  ------------------------------------------


bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# ----------------------------------------------------------------------
	
# cd on quit in nnn
if [ -f /usr/share/nnn/quitcd/quitcd.bash_sh_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_sh_zsh
fi





