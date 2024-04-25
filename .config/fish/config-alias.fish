# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim && alias vim nvim

# -------------------------------- #
# Node Package Manager
# -------------------------------- #
# https://github.com/antfu/ni

alias nio "ni --prefer-offline"
alias s "nr start"
alias d "nr dev"
alias b "nr build"
alias bw "nr build --watch"
alias t "nr test"
alias tu "nr test -u"
alias tw "nr test --watch"
alias w "nr watch"
alias p "nr play"
alias c "nr typecheck"
alias lint "nr lint"
alias lintf "nr lint --fix"
alias release "nr release"
alias re "nr release"

# Use github/hub
alias git hub

alias gs 'git status'
alias gp 'git push'
alias gpf 'git push --force'
alias gpft 'git push --follow-tags'
alias gpl 'git pull --rebase'
alias gcl 'git clone'
alias gst 'git stash'
alias grm 'git rm'
alias gmv 'git mv'

alias main 'git checkout main'

alias gco 'git checkout'
alias gcob 'git checkout -b'

alias gb 'git branch'
alias gbd 'git branch -d'

alias grb 'git rebase'
alias grbom 'git rebase origin/master'
alias grbc 'git rebase --continue'

alias gl 'git log'
alias glo 'git log --oneline --graph'

alias grh 'git reset HEAD'
alias grh1 'git reset HEAD~1'

alias ga 'git add'
alias gA 'git add -A'

alias gc 'git commit'
alias gcm 'git commit -m'
alias gca 'git commit -a'
alias gcam 'git add -A && git commit -m'
alias gfrb 'git fetch origin && git rebase origin/master'

alias gxn 'git clean -dn'
alias gx 'git clean -df'
