if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Aliases
alias vim="nvim"
alias vi="/usr/bin/vim"
alias :q="exit"
alias :wq="exit"
alias :x="exit"
alias zel="zellij"
alias cat="bat"
alias ls="exa --color=always --color-scale --icons --all"
alias ll="exa --color=always --color-scale --icons --long --all"
alias nnn="nnn -de"
alias jd="zellij --layout ~/layout_julia_zel.kdl"
alias rsd="zellij --layout ~/layout_rust_zel.kdl"
alias ipd="zellij --layout ~/layout_ipy_zel.kdl"
alias nvd="neovide"
alias neofetch="fastfetch"

# Paths
fish_add_path /home/noncomplete/.local/bin
fish_add_path /home/noncomplete/.juliaup/bin
fish_add_path /home/noncomplete/.elan/bin
fish_add_path /home/noncomplete/.cargo/bin

# Variables
set -x NNN_TMPFILE "/home/noncomplete/.config/nnn/.lastd"
set -x EDITOR nvim
set -x NNN_OPTS deH
set fish_greeting
set -x CARGO_TARGET_DIR "/home/noncomplete/.cache/cargo"
set -x SHELL "/usr/bin/fish"

# Zoxide
zoxide init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/noncomplete/miniconda3/bin/conda
    eval /home/noncomplete/miniconda3/bin/conda "shell.fish" hook $argv | source
end
# <<< conda initialize <<<

# <<< nnn file manager >>>

# Rename this file to match the name of the function
# e.g. ~/.config/fish/functions/n.fish
# or, add the lines to the 'config.fish' file.

function n --wraps nnn --description 'support nnn quit and change directory'
    # Block nesting of nnn in subshells
    if test -n "$NNNLVL" -a "$NNNLVL" -ge 1
        echo "nnn is already running"
        return
    end

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "-x" from both lines below,
    # without changing the paths.
    if test -n "$XDG_CONFIG_HOME"
        set -x NNN_TMPFILE "$XDG_CONFIG_HOME/nnn/.lastd"
    else
        set -x NNN_TMPFILE "$HOME/.config/nnn/.lastd"
    end

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command function allows one to alias this function to `nnn` without
    # making an infinitely recursive alias
    command nnn $argv

    if test -e $NNN_TMPFILE
        source $NNN_TMPFILE
        rm $NNN_TMPFILE
    end
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
