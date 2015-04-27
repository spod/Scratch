#!/bin/bash
# set up some crap which I do every time
#touch ~/.hushlogin
(
cat <<'EOF'
set expandtab
set ts=4
set background=dark
set nu
syntax on
EOF
) > ~/.vimrc
(
cat <<'EOF'
set-option -g prefix C-a
setw -g mode-keys vi
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
EOF
) > ~/.tmux.conf
mkdir ~/.ssh
(
cat <<'EOF'
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCUJ4zBIqdnCm65DyzVY6gdEciky27+DmbZzPTNYgjtD3vJlYjSIRWwI9MMLdmti1hVzXJG1z8hqzuBDYG+nkZYpaJwQh7ElMxIAr6RXSXAxJCZRuUxhq+R9mbHzeA2au5WKHLEhBb6Nn4HWCgLLvoAsy2/rA5+CYnI1smE6Skie8f1K6FfnF5tAd+oexegv1JTGHsj4uWoRhbnyIKBS8tsMcOa8smx8RibFK5fC3/x5vJfdxIjwh9YH+LrE0DCQLM85IzW9wxQqnYEX3/HOhPNuvGAXdccmrHh4j7Iz26lqHu/ilfgEW4bh9VIoRiy34Z+/8IW4UgPMWqx/tUfQa5v michael@tabernac.nologin.net
EOF
) > ~/.ssh/authorized_keys
chmod go-rwx ~/.ssh/authorized_keys
chmod go-rwx ~/.ssh/

(
cat <<'EOF'
export TERM=xterm
EOF
) >> ~/.bashrc