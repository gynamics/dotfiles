# z-shell configuration file
# forked from kali linux

# options
setopt autocd              # automatically change directory
setopt automenu            # automatically use menu completion
setopt completeinword      # complete in word when expanding
#setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

# Keybindings
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action

# Completion features
autoload -Uz compinit
compinit -d ${HOME}/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
#zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:processes' command 'ps -au$USER'

# History configurations
HISTFILE=${HOME}/.cache/zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
#setopt share_history         # share command history data
# force zsh to show the complete history
alias history="history 0"
# history search
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '!\t' history-beginning-search-menu

# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto' 
    alias pacman="sudo pacman --color=auto" #archlinux special

    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

    # Take advantage of $LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
fi

# archlinux-style prompt
PROMPT="%B%F{white}(%B%F{blue}%~ %B%F{cyan}%#%b%f%k "
RPROMPT="%B%(?.%F{blue}⦮.%F{red}%?) %B%F{white}%n%B%F{blue}@%B%F{yellow}$(ip route show |cut -d' ' -f9 |sed -n 1p)%B%F{white} <- %B%F{cyan}$(who am i|cut -d'(' -f2|cut -d ')' -f1)%B%F{blue} <%B%F{white})"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"

# For applications
alias e="emacs -q -nw"
alias mg="emacs -nw"
alias sue="sudo emacs -q -nw"
alias ec="emacsclient -a 'emacs -nw'"
alias v="vim"
alias suv="sudo vim"

# command aliases
alias ...="../.."
alias ....="../../.."
alias .....="../../../.."
alias d="dirs -v"
alias l="ls -Fh"
alias ll="ls -lFh"
alias la="ls -AFh"
alias lr="ls -tRFh"
alias lla="ls -lAFh"
alias lsp="ps -ef"
# alias fd="find . -type d -name"
alias ff="find . -type f -name"
alias sgrep="grep -R -nH -C 5 --exclude-dir={.git,.svn,CVS}"
alias cls="clear"

# for kitty if you use it
if [[ $KITTY_WINDOW_ID ]]; then
    alias kt='kitty +kitten'
    alias icat='kitty +kitten icat'
    alias kid='kitty +kitten diff'
    alias klip='kitty +kitten clipboard'
    alias nyaaa='kitty +kitten broadcast'
fi

# https proxy
export https_proxy=http://127.0.0.1:8889/

# personal script forks
ZSH_SCRIPT_DIR="${HOME}/.zsh-scripts"
source $ZSH_SCRIPT_DIR/dirstack.zsh
source $ZSH_SCRIPT_DIR/gitneko.zsh

# setup develop environments dynamically
ghc-setup-env(){  . "$HOME/.ghcup/env" }
rust-setup-env(){ . "$HOME/.cargo/env" }

# some sweet plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
