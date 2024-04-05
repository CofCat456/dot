#!/usr/bin/env bash

# oxocarbon colors for Tmux

set -g mode-style "fg=#ffffff,bg=#161616"

set -g message-style "fg=#b3ebff,bg=#161616"
set -g message-command-style "fg=#b3ebff,bg=#161616"

set -g pane-border-style "fg=#161616"
set -g pane-active-border-style "fg=#f0f0f0"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#ffffff,bg=#161616"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#ffffff,bg=#78a9ff,bold] #S #[fg=#78a9ff,bg=#161616,nobold,nounderscore,noitalics]"
set -g status-right "#{prefix_highlight} #[fg=#222222,bg=#161616,nobold,nounderscore,noitalics]#[fg=#78a9ff,bg=#222222] %Y-%m-%d #[fg=#393939,bg=#222222,nobold,nounderscore,noitalics] #[fg=#78a9ff,bg=#393939,bold] #h "

setw -g window-status-activity-style "underscore,fg=#ee5396,bg=#161616"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#ee5396,bg=#161616"
setw -g window-status-format "#[fg=#161616,bg=#161616,nobold,nounderscore,noitalics]#[default] #I  #{b:pane_current_path} #F #[fg=#161616,bg=#161616,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#161616,bg=#ee5396,nobold,nounderscore,noitalics]#[fg=#161616,bg=#ee5396,bold] #I  #{b:pane_current_path} #F #[fg=#ee5396,bg=#161616,nobold,nounderscore,noitalics]"

# tmux-plugins/tmux-prefix-highlight support
set -g @prefix_highlight_output_prefix "#[fg=#ffc777]#[bg=#181818]#[fg=#181818]#[bg=#ffc777]"
set -g @prefix_highlight_output_suffix ""
