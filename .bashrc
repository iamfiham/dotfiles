


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
export PATH="~/.local/bin:$PATH"

# --------------------  Alias  ------------------------------------------

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias mp='mousepad'
alias ll='ls -alhF'

alias rcp='rsync -ahv --progress'
alias srcp='sudo rsync -ahv --progress'
alias scrcpy-screen='SDL_VIDEODRIVER=wayland scrcpy --max-size=944 --max-fps=60 --video-codec=h264 --video-bit-rate=4M --video-buffer=50 --print-fps'
alias scrcpy-camera='SDL_VIDEODRIVER=wayland scrcpy --video-source=camera --max-fps=30 --camera-size=1920x1080 --camera-facing=front --print-fps'

alias bat='bat --paging=never'
alias dotpush=~/.dotfiles/nosimlink-files/dotpush.sh

# --------------------  PS1  ------------------------------------------

BG_DARK="\[\033[48;2;52;54;56m\]"
FG_DARK="\[\033[38;2;52;54;56m\]"

BG_LIGHT="\[\033[48;2;180;180;180m\]"
FG_LIGHT="\[\033[38;2;180;180;180m\]"

FG_BLACK="\[\033[01;30m\]"


RESET="\[\033[00m\]" 


if [[ $(tty) == /dev/tty* ]]; then
    # You are in a real TTY
    PS1='\u@\h \w \$ '
else
    # You are in a terminal emulator (like Kitty/Alacritty)
    PS1="${FG_LIGHT}╭─◖${RESET}${BG_LIGHT}${FG_BLACK}\u  ${RESET}${FG_LIGHT}◗ -${RESET} ${FG_LIGHT}◖${RESET}${BG_LIGHT}${FG_BLACK}\w${RESET}${FG_LIGHT}◗\n╰─❯${RESET} "
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
export FZF_DEFAULT_COMMAND='fd --hidden --exclude .cache --exclude .git --exclude .venv --exclude .cargo'

export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND=''

# ----------------------------------------------------------------------

