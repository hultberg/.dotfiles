alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gcb='git checkout'
alias gb='git branch'
alias gbd='git branch -d'
alias gd='git diff'
alias gds='git diff --staged'
alias gc='git commit -m'
alias gcv='git commit -v'
alias gl='git lg'
alias gp='git push'
alias gps='git push'
alias gpl='git pull'
alias gr='git reset'
alias grh='git reset HEAD'
alias gsh='git stash'
alias gm='git merge --no-ff'
alias gf='git fetch'
alias gcp='git cherry-pick -x'
alias grcf='git reset HEAD --hard && git clean -f -d'
alias gpsh='git push -u origin HEAD'

###
# Add all unstaged changelogs, replace author and ammend the previous commit with the changelog entries.
###
function gca {
	git add .changelogs/
	git commit --amend --no-edit
}

###
# Same as "gca", but creates a new commit for changelog entries.
###
function gcc {
	git add .changelogs/
	git commit -m ":memo: update changelog" -m "[ci skip]"
}
