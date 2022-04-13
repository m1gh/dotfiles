# exports
export CLICOLOR=1 # set color
export EDITOR="vi"
# export MANPAGER="less -X" # Don't clear screen after quitting a man page
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# prompt 
PS1='%F{red}%~%f %F{green}'$'\U03BB%f '

# iterm shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# completions
if type brew &>/dev/null; then
        FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
        autoload -Uz compinit
        compinit
fi

# exports
[ -d "$HOME/Applications" ] && export PATH=$PATH:"~/Applications"
[ -d "$HOME/.local/bin" ] && export PATH="~/.local/bin":$PATH
[ -d "/usr/local/opt/llvm/bin" ] && export PATH="/usr/local/opt/llvm/bin":$PATH

# commands
[ -x "$(! command -v doom)" ] && export PATH="~/.emacs.d/bin:$PATH"
#[ -x "$(! command -v yarn)" ] && export PATH="$(yarn global bin):$PATH"
[ -x "$(! command -v python3)" ] && export PATH="/usr/local/opt/python@3.9/bin:$PATH"
[ -x "$(! command -v cargo)" ] && export PATH="~/.cargo/bin":$PATH

# curl
if [ -x "$(! command -v curl)" ]; then
        export PATH="/usr/local/opt/curl/bin:$PATH"
        export LDFLAGS="-L/usr/local/opt/curl/lib"
        export CPPFLAGS="-I/usr/local/opt/curl/include"
        export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig"
fi

# go
if [ -x "$(! command -v go)" ]; then
        export GOPATH=$HOME/go
        export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH
fi

# java
if [ -x "$(! command -v java)" ] && [ -f '/usr/libexec/java_home' ] && [ ! -z "$JAVA_HOME" ]; then
    	export JAVA_HOME=`/usr/libexec/java_home`
    	export PATH=$PATH:$JAVA_HOME/bin
fi

# ruby
if [ -x "$(! command -v gem)" ]; then
        export PATH="/usr/local/opt/ruby/bin:$PATH"
        export GEM_HOME="$HOME/.gem"
fi

# node
if [ -x "$(! command -v node)" ]; then
        export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
fi

# check if a command exist
cmdexist() { command -v "$1" >/dev/null 2>&1 }

# Create a folder and move into it in one command
mkd() { mkdir -p "$@" && cd "$_"; }

jdk() {
	version=$1
	export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
	java -version
}

trash() { command mv "$@" ~/.Trash ; }

# Creates an archive (*.tar.gz) from given directory.
maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
makezip() { zip -r "${1%%/}.zip" "$1" ; }

# Make your directories and files access rights sane.
sanitize() { chmod -R u=rwX,g=rX,o= "$@" ;}

## gitignore.io functionality
gi() { curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/\$@ ;}

## open man pages in separate window or preview
manx() { open x-man-page://$@ ; }
manp() { man -t "$@" | open -f -a "Preview" ;}

# mans:   Search manpage given in argument '1' for term given in argument '2' (case insensitive)
# displays paginated result with colored search terms and two lines surrounding each hit. Example: mans mplayer codec
#   --------------------------------------------------------------------
mans () {
	man $1 | grep -iC2 --color=always $2 | less
}

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xjf $1     ;;
			*.tar.gz)    tar xzf $1     ;;
			*.bz2)       bunzip2 $1     ;;
			*.rar)       unrar e $1     ;;
			*.gz)        gunzip $1      ;;
			*.tar)       tar xf $1      ;;
			*.tbz2)      tar xjf $1     ;;
			*.tgz)       tar xzf $1     ;;
			*.zip)       unzip $1       ;;
			*.Z)         uncompress $1  ;;
			*.7z)        7z x $1        ;;
			*)     echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

dmg(){
	hdiutil create -fs HFS+ -srcfolder "$1" -volname "$1" "$1.dmg"
}

iso() {
	hdiutil makehybrid -iso -joliet -o "$1" "$1"
}

jsons() {
	echo "$1" | python -m json.tool
}

jsonf() {
	python -m json.tool "$1"
}

jsonw() {
	curl "$1" | python -m json.tool
}
