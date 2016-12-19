
# Some nice aliases

alias ll='ls -lah'

alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gcb='git checkout'
alias gb='git branch'
alias gc='git commit -m'
alias gcv='git commit -v'
alias gl='git lg'
alias gps='git push'
alias gpl='git pull'
alias gre='git reset'
alias gst='git stash'
alias gm='git merge --no-ff'
alias gf='git fetch'
alias gcp='git cherry-pick -x'
alias grcf='git reset HEAD --hard && git clean -f -d'

# Git Flow Feature
alias gffs='git flow feature start'
alias gfff='git flow feature finish'
alias gffp='git flow feature publish'

# Git Flow Hotfix
alias gfhs='git flow hotfix start'
alias gfhf='git flow hotfix finish'
alias gfhp='git flow hotfix publish'

# Git Flow Release
alias gfrs='git flow release start'
alias gfrf='git flow release finish'
alias gfrp='git flow release publish'
