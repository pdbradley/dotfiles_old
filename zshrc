
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
