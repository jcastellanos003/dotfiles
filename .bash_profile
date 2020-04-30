alias ap="cd /Users/juliancastellanos/Documents/apps"
alias lalapp="cd /Users/juliancastellanos/Documents/apps/draw_devs/lalapp"
alias parking="cd /Users/juliancastellanos/Documents/apps/draw_devs/parking"
alias yiwu="cd /Users/juliancastellanos/Documents/apps/draw_devs/yiwu"
alias battery="cd /Users/juliancastellanos/Documents/apps/draw_devs/battery"
alias vital="cd /Users/juliancastellanos/Documents/apps/uruit/vitalngx-app && nvm use vital && code ."
alias gp="git pull"
alias gu="git push"
alias gall="git add ."
alias gc="git commit -m"
alias gcb="git checkout -b"
alias gmd="git merge develop"
alias gcd="git checkout develop"
alias gcm="git checkout master"
alias gcb="git checkout build"
alias gs="git status"
alias cz="git cz"
alias wee="cd /Users/juliancastellanos/Documents/apps/draw_devs"
alias c="clear"
alias ns="npm start"
alias nb="npm run build"
alias nd="npm run dev"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8) # java home

# get current branch in git repo
function parse_git_branch() {
    BRANCH=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    if [ ! "${BRANCH}" == "" ]; then
        STAT=$(parse_git_dirty)
        echo "[${BRANCH}${STAT}]"
    else
        echo ""
    fi
}

# get current status of git repo
function parse_git_dirty() {
    status=$(git status 2>&1 | tee)
    dirty=$(
        echo -n "${status}" 2>/dev/null | grep "modified:" &>/dev/null
        echo "$?"
    )
    untracked=$(
        echo -n "${status}" 2>/dev/null | grep "Untracked files" &>/dev/null
        echo "$?"
    )
    ahead=$(
        echo -n "${status}" 2>/dev/null | grep "Your branch is ahead of" &>/dev/null
        echo "$?"
    )
    newfile=$(
        echo -n "${status}" 2>/dev/null | grep "new file:" &>/dev/null
        echo "$?"
    )
    renamed=$(
        echo -n "${status}" 2>/dev/null | grep "renamed:" &>/dev/null
        echo "$?"
    )
    deleted=$(
        echo -n "${status}" 2>/dev/null | grep "deleted:" &>/dev/null
        echo "$?"
    )
    bits=''
    if [ "${renamed}" == "0" ]; then
        bits=">${bits}"
    fi
    if [ "${ahead}" == "0" ]; then
        bits="*${bits}"
    fi
    if [ "${newfile}" == "0" ]; then
        bits="+${bits}"
    fi
    if [ "${untracked}" == "0" ]; then
        bits="?${bits}"
    fi
    if [ "${deleted}" == "0" ]; then
        bits="x${bits}"
    fi
    if [ "${dirty}" == "0" ]; then
        bits="!${bits}"
    fi
    if [ ! "${bits}" == "" ]; then
        echo " ${bits}"
    else
        echo ""
    fi
}

export PS1="\[\e[33;40m\]\u\[\e[m\] - \[\e[36m\]\W\[\e[m\] : \[\e[35m\]\`parse_git_branch\`\[\e[m\] "
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/juliancastellanos/exec -l /bin/bash/google-cloud-sdk/path.bash.inc' ]; then source '/Users/juliancastellanos/exec -l /bin/bash/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/juliancastellanos/exec -l /bin/bash/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/juliancastellanos/exec -l /bin/bash/google-cloud-sdk/completion.bash.inc'; fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
    # if not found in /usr/local/etc, try the brew --prefix location
    [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] &&
        . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}
