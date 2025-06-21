


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
export XDG_CONFIG_HOME=~/.config/

# --------------------  Alias  ------------------------------------------

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias mp='mousepad'
alias ll='ls -alhF'

alias rcp='rsync -ahv --progress'
alias srcp='sudo rsync -ahv --progress'

alias bat='bat --paging=never'
alias dotpush=~/.dotfiles/nosimlink-files/dotpush.sh

# --------------------  PS1  ------------------------------------------

BG_COLOR1="\[\033[48;2;52;54;56m\]"
FG_COLOR1="\[\033[38;2;52;54;56m\]"

BG_COLOR2="\[\033[48;2;200;200;200m\]"
FG_COLOR2="\[\033[38;2;200;200;200m\]"

FG_BLACK="\[\033[01;30m\]"


RESET="\[\033[00m\]" 


if [[ $(tty) == /dev/tty* ]]; then
    # You are in a real TTY
    PS1='\u@\h \w \$ '
else
    # You are in a terminal emulator (like Kitty/Alacritty)
    PS1="╭─${FG_COLOR1}◖${RESET}${BG_COLOR1}\u   ${RESET}${BG_COLOR2}${FG_COLOR1}${RESET}${BG_COLOR2}${FG_BLACK} 📁 \w${RESET}${FG_COLOR2}◗${RESET} \n╰─❯ "
fi


# --------------------  bind  ------------------------------------------

bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# ----------------------------------------------------------------------
	
# cd on quit in nnn
if [ -f /usr/share/nnn/quitcd/quitcd.bash_sh_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_sh_zsh
fi


# cheat.sh 
cheat() {
  if [ -z "$1" ]; then
    echo "Usage: cheat <command>"
  else
    curl -s "https://cheat.sh/$1"
  fi
}

# ------------------------ fzf -----------------------------------------

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

export FZF_DEFAULT_OPTS='-m -e --inline-info --border --preview "bat {}"'
export FZF_DEFAULT_COMMAND='fd --hidden --exclude .cache --exclude .git'

export FZF_CTRL_T_COMMAND='fd --hidden --exclude .cache --exclude .git'
export FZF_ALT_C_COMMAND=''

# ----------------------------------------------------------------------

