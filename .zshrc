# start off with loading the default profile
. /etc/profile
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh-history
HISTSIZE=5000
SAVEHIST=5000
APPEND_HISTORY=1
setopt appendhistory extendedglob nomatch notify CLOBBER DVORAK hist_ignore_dups
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload zmv
autoload -Uz compinit
compinit

## Auto Complete
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# My startup
if [[ ! -n "$ZSHRUN" ]]; then
	export REPORTTIME=20

	function setcolors()
	{
		local reset=$'%{\e[0m%}'
		local darkred=$'%{\e[0;31m%}'
		local red=$'%{\e[1;31m%}'
		local green=$'%{\e[1;32m%}'
		local blue=$'%{\e[1;34m%}'
		local white=$'%{\e[0;39m%}'
		local yellow=$'%{\e[1;33m%}'
		local darkcyan=$'%{\e[0;36m%}'
		local blackbg=$'%{\e[40m%}'
		local randcol=$'%{\e[0;32m%}'

		# {hh:mm:ss:~/foo}% text goes here                  'tty number' 'number of jobs' 'error status'
		PS1="$reset$green{$randcol%*$white:$darkcyan%n$white@$darkcyan%M$white:$darkred%40<...<$red%~%<<$green}$blue%#$reset "
		RPS1="$blue$TTY:t%(1j.$yellow %j jobs.)%(?.. $red$blackbg%?)$reset"
		setopt transientrprompt

		PS2="$reset$yellow<$darkcyan%_$white:$darkred%40<...<$red%~%<<$yellow>$blue$TTY:t%# %(1j.$yellow%j jobs .)%(?.$reset.$red$blackbg%?$reset )"

		PS3="$red?#$reset "
		unset reset darkred red green blue white yellow darkcyan blackbg randcol
	}

	setcolors
	unfunction setcolors
else
	PS1="{%* %40<...<%~%<<}# "
fi


### My Key bindings ###

## Go stuff
export GOPATH="$HOME/.go"
export GOROOT="$GOPATH/go"
export GOGIT="$GOPATH/src/github.com"
export GOBIN=$HOME/bin
export GOROOT_BOOTSTRAP="$GOPATH"
export PATH="$PATH:$GOPATH/bin"

## Aliases

# Wine aliases
alias winbox="wine $HOME/Software/winbox.exe"

# Linux only aliases
if [ "$(uname -s)" = "Linux" ]; then
	alias ls="ls --color"
	alias nls="ls --color=none"
	alias mv='mv -n'
elif [ "$(uname -s)" = "FreeBSD" ]; then
	alias ls="ls -G"
	alias nls="command ls"
else
	alias nls="ls"
fi

# diagnostic pings
alias ping="ping -OD"

alias mmv='noglob zmv -W'

function randompassword() {
cd $HOME/Projects/random_word_password/moonscript;
moon randompassword.moon;
}

alias rp="randompassword"

# Signup alias
alias signup="CFG=$HOME/.config/signup.json $GOPATH/src/git.ics-llc.net/802-1x/signup/signup"

## Shell Variables
export EDITOR="gvim -f"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

PATH=$PATH:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin:~/bin:

export XAUTHORITY=$HOME/.Xauthority

## Functions

## Other stuff
# Remove console beeps
[ "$(uname -s)" = "Linux" -a $TERM != "xterm" ] && setterm -blength 0

[ -e "$HOME/.zshrc.local" ] && . $HOME/.zshrc.local


# ruby path
export PATH="$PATH:$HOME/.gem/ruby/2.1.0/bin"
export GEM_HOME="$HOME/.gem"
export GEM_PATH="$HOME/.gem"
export BUNDLE_PATH="$HOME/.gem"

# veewee path
alias veewee='bundle exec veewee'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Initialization for FDK command line tools.Fri Jan 23 08:53:33 2015
FDK_EXE="/opt/FDK/Tools/linux"
PATH=${PATH}:"/opt/FDK/Tools/linux"
export PATH
export FDK_EXE
