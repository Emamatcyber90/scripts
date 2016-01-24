### This incorporates default commands from zsh and various other sources.
### While I'd like to attribute them all, I don't remember where I got them from.
### If you notice something that's yours, let me know and I can throw a URL in here.

### THEN AGAIN WHO THE HECK IS GONNA READ THIS BESIDES MYSELF LOL

##### Seriously though folks.  Take the credit.
## But I mean, if you try saying "take that out it's mine" you're nuts.
## It's a freakin .*rc file.

## Cheers!  :)

#---------------------#

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history_zsh

# Use modern completion system
autoload -Uz compinit
compinit

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

export CFLAGS="-march=native -mtune=native -O1"
export CPPFLAGS="${CFLAGS}"
export CXXFLAGS="${CFLAGS}"
export JAVA_HOME=$HOME/jre
#export GOROOT=$HOME/go
export PATH=./node_modules/.bin:$HOME/node/bin:$HOME/npm/bin:$HOME/bin:$JAVA_HOME/bin:/usr/local/go/bin:$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:/usr/local/cuda-7.0/bin:$HOME/z/idea-IU-143.1821.5/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-7.0/lib64:$LD_LIBRARY_PATH

eval "$(rbenv init -)"

alias make='make CFLAGS="${CFLAGS}" CPPFLAGS="${CFLAGS}" CXXFLAGS="${CFLAGS}" -j'
alias ls='ls --color=auto'
alias ll='ls -lha'
alias lll='ll | less'
alias l='ls -a'
alias gitlog='git log --pretty=format:"%h : %an : %ar : %s"'
alias webfs='sshfs -o nonempty,noatime jay@72.14.185.190:/home/jay/web /home/jay/web'
alias devfs='sshfs -o nonempty,noatime devvm:/ /home/jay/zvm'
alias gst='git status'
alias gcmt='git add -A && git commit -m'
alias scr='screen -r'
alias scd='screen -dmS'

if [ -s ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
	source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
	git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
	source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
