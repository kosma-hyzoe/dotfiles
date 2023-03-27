## Based on Luke Smith's and Ubuntu 22.04's default .zshrc

# && [ -z "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ]; then


if [ "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ]; then 
   ZSH_TMUX_AUTOSTART=true
else
    ZSH_TMUX_AUTOSTART=false
fi

if [ "$ZSH_TMUX_AUTOSTART" = true ] && command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

## Configure PATH
export PATH=$HOME/.local/share/JetBrains/Toolbox/scripts:/home/kosma/.local/bin:$HOME/.cargo/bin:$PATH

## Configure history:
setopt histignorealldups sharehistory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

## vi mode
bindkey -v
export KEYTIMEOUT=1

## Reverse Search
bindkey '^R' history-incremental-search-backward

## Use modern completion system
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
comp_options+=(globdots) # Include hidden files.
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

## Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

## Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

## Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

## Configure Pure
fpath+=($HOME/.config/zsh/pure)

autoload -U promptinit; promptinit

PURE_PROMPT_SYMBOL="$"
PURE_PROMPT_VICMD_SYMBOL="%%"
zstyle :prompt:pure:path color cyan
zstyle ':prompt:pure:prompt:*' color '#FFAA00'
zstyle :prompt:pure:suspended_jobs color '#FFAA00'

prompt pure


## Bind ctrl + arrow right/left arrow keys to forward-word/backward word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

## Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
