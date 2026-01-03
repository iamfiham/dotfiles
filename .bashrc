


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
export PATH="$HOME/.local/bin:$PATH"

# --------------------  Alias  ------------------------------------------

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias mp='mousepad'
alias gt='gnome-text-editor'
alias ll='ls -alhF --color=auto'

alias rcp='rsync -ahv --progress'
alias srcp='sudo rsync -ahv --progress'


# add "SDL_VIDEODRIVER=wayland" env to run scrcpy in wayland
alias scrcpy-screen='scrcpy --max-size=1440 --max-fps=60 --video-codec=h264 --video-bit-rate=4M --video-buffer=50 --print-fps'
alias scrcpy-camera='scrcpy --video-source=camera --max-fps=30 --camera-size=1920x1080 --camera-facing=front --print-fps   --orientation=180'

alias bat='bat --paging=never'

alias dotpush=~/.dotfiles/nosimlink-files/dotpush.sh

alias arduino-ide=arduino-ide --enable-features=UseOzonePlatform --ozone-platform=wayland 

# --------------------  PS1  ------------------------------------------

# Git prompt source
source /usr/share/git/git-prompt.sh

# Colors
FG_LIGHT_GRAY="\[\033[38;5;250m\]"
FG_SOFT_GREEN="\[\033[38;5;113m\]"
FG_MED_GRAY="\[\033[38;5;245m\]"
FG_DARK_GRAY="\[\033[38;5;240m\]"
RESET="\[\033[0m\]"

# Update branch in PROMPT_COMMAND
PROMPT_COMMAND="history -a"

# Set PS1 (with placeholder)
PS1="${FG_LIGHT_GRAY}\u@\h ${FG_SOFT_GREEN}\w${FG_MED_GRAY}\n${FG_DARK_GRAY}❯${RESET} "

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

export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus


