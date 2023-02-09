#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# XDG Base Directories
export XDG_CONFIG_HOME=$HOME/.config       # user-specific configuratio>
export XDG_CACHE_HOME=$HOME/.cache         # user-specific non-essentia>
export XDG_DATA_HOME=$HOME/.local/share    # user-specific data (analog>
export XDG_STATE_HOME=$HOME/.local/state   # user-specific state files >

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

source /home/balaz/.config/broot/launcher/bash/br
