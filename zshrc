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

eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"


autoload -Uz compinit && compinit


export VMAIL_VIM="mvim"


source $HOME/dotfiles/zsh/prompt
source $HOME/dotfiles/zsh/aliases

export NVM_DIR="/Users/philip/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
