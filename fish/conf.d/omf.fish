# Path to Oh My Fish install.
###  Oh My Fish config  ###

## Path to OMF install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

## Load OMF
source $OMF_PATH/init.fish

## Env vars
export LC_ALL=en_US.utf8
export EDITOR=nvim

# Manpager
if command -vq bat
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
end

# LSColors
if command -vq vivid
    export LS_COLORS=(vivid generate gruvbox-dark-soft) # Needs `vivid`
end

## Other vars/overrides
set fish_greeting # Disbale the startup intro message

## Exec on startup
# python3 /home/anchous/.config/fish/conf.d/start_program.py

## change neofetch ascii art
alias neofetch='neofetch --source ~/.config/neofetch/ascii_file.txt'
