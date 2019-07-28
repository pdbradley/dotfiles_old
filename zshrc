# had to preload compdef https://github.com/memborsky/dotfiles/commit/0cd2e69463d25bb0d9fa17710c7a8ed8f54a018f
autoload -U compinit compdef
compinit

# complete g like git
compdef g=git

function g {
   if [[ $# > 0 ]]; then
     git $@
   else
     git status
   fi
}

transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
  tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; } 


export PATH="/Users/philip/dotfiles/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

export PKG_CONFIG_PATH="/usr/local/opt/pkg-config:$PKG_CONFIG_PATH"

export EDITOR='vim'

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

autoload -Uz compinit && compinit

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/bin/jruby-9.1.2.0/bin:$PATH"

export VMAIL_VIM="mvim"


source $HOME/dotfiles/zsh/prompt
source $HOME/dotfiles/zsh/aliases

#export NVM_DIR="/Users/philip/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# added by travis gem
[ -f /Users/philip/.travis/travis.sh ] && source /Users/philip/.travis/travis.sh

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/philipbradley/bin/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/philipbradley/bin/google-cloud-sdk/path.zsh.inc'
fi

#source ~/bin/tmuxinator.zsh

bindkey "^P" up-line-or-search

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
