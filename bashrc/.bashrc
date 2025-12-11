# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# Auto-launch zsh shell if in interactive bash
if command -v zsh &> /dev/null; then
  if [[ $(ps --no-header --pid=$PPID --format=comm) != "zsh" && -z ${BASH_EXECUTION_STRING} && ${SHLVL} == 1 ]]
  then
    shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
    exec zsh $LOGIN_OPTION
  fi
fi

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc


# Add your own exports, aliases, and functions below.
alias vim="nvim"
alias tmux-keybinds="glow ~/Scripts/tmux-cheatsheet.md"
#alias fix-workstations="hyprctl dispatch moveworkspacetomonitor 1 DVI-I-1"
alias fix-workstations='hyprctl dispatch moveworkspacetomonitor 1 DVI-I-1; for ws in {2..7}; do hyprctl dispatch moveworkspacetomonitor "$ws" DP-1; done'

export PATH="$HOME/.config/composer/vendor/bin:$PATH"


export PATH="$HOME/.local/bin:$PATH"
