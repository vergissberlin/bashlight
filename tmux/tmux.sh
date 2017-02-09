#!/bin/bash                                                                                 â
SESSION=ala                                                                                 â
tmux="tmux -2 -f tmux.conf"                                                                 â
                                                                                            â
# if the session is already running, just attach to it.                                     â
$tmux has-session -t $SESSION                                                               â
if [ $? -eq 0 ]; then                                                                       â
       echo "Session $SESSION already exists. Attaching."                                   â
       sleep 1                                                                              â
       $tmux attach -t $SESSION                                                             â
       exit 0;                                                                              â
fi                                                                                          â
                                                                                            â
# create a new session, named $SESSION, and detach from it                                  â
$tmux new-session -d -s $SESSION                                                            â
$tmux new-window    -t $SESSION:0                                                           â
$tmux split-window  -h -t $SESSION:0                                                        â
$tmux new-window    -t $SESSION:1                                                           â
$tmux new-window    -t $SESSION:2                                                           â
$tmux new-window    -t $SESSION:3                                                           â
$tmux split-window  -h -t $SESSION:3                                                        â
$tmux new-window    -t $SESSION:4                                                           â
$tmux select-window -t $SESSION:0                                                           â
$tmux attach -t $SESSION
