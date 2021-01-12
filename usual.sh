#!/bin/bash
# set up some crap which I do every time
set -x
set -e

[ ! -f ~/.hushlogin ] && touch ~/.hushlogin

[ ! -f ~/.vimrc ] && (
cat <<'EOF'
set expandtab
set ts=4
set background=dark
set nu
syntax on
EOF
) > ~/.vimrc

[ ! -f ~/.tmux.conf ] && (
cat <<'EOF'
# set-option -g prefix C-a # make tmux use ctrl-a instead of ctrl-b
setw -g mode-keys vi
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
EOF
) > ~/.tmux.conf

[ ! -d ~/.ssh ] && mkdir ~/.ssh
[ -f ~/.ssh/authorized_keys ] && touch ~/.ssh/authorized_keys && \
chmod go-rwx ~/.ssh/authorized_keys && \
chmod go-rwx ~/.ssh/

grep ixon ~/.bashrc || (
cat <<'EOF'
#export TERM=xterm
# disable ctrl s/q
stty -ixon
EOF
) >> ~/.bashrc

[ ! -d ~/bin ] && mkdir ~/bin

[ ! -f ~/bin/git-git ] && (
cat <<'EOF'
#!/bin/bash
git $*
EOF
) >> ~/bin/git-git && chmod +x ~/bin/git-git

[ ! -f ~/bin/git-what-branch ] && (
cat <<'EOF'
#! /bin/bash
git rev-parse --abbrev-ref HEAD
EOF
) >> ~/bin/git-what-branch  && chmod +x ~/bin/git-what-branch

[ ! -f ~/bin/git-branch-by-date ] && (
cat <<'EOF'
#! /bin/bash
git for-each-ref --sort='-committerdate' --format='%(refname)%09%(committerdate)' refs/heads | sed -e 's-refs/heads/--'
EOF
) >> ~/bin/git-branch-by-date && chmod +x ~/bin/git-branch-by-date
