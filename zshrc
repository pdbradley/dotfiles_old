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





source $HOME/dotfiles/zsh/prompt
source $HOME/dotfiles/zsh/aliases
