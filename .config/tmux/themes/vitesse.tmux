#!/usr/bin/env bash

# Vitesse colors for Tmux

set -g mode-style "fg=#eee8d5,bg=#292929"

set -g message-style "fg=#c98a7d,bg=#292929"
set -g message-command-style "fg=#c98a7d,bg=#292929"

set -g pane-border-style "fg=#292929"
set -g pane-active-border-style "fg=#f0f0f0"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#eee8d5,bg=#292929"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#eee8d5,bg=#383837,bold] #S #[fg=#383837,bg=#292929,nobold,nounderscore,noitalics]"
set -g status-right "#{prefix_highlight} #[fg=#222222,bg=#292929,nobold,nounderscore,noitalics]#[fg=#6394bf,bg=#222222] %Y-%m-%d #[fg=#181818,bg=#222222,nobold,nounderscore,noitalics] #[fg=#6394bf,bg=#181818,bold] #h "

setw -g window-status-activity-style "underscore,fg=#4d9375,bg=#292929"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#4d9375,bg=#292929"
setw -g window-status-format "#[fg=#292929,bg=#292929,nobold,nounderscore,noitalics]#[default] #I  #{b:pane_current_path} #F #[fg=#292929,bg=#292929,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#292929,bg=#4d9375,nobold,nounderscore,noitalics]#[fg=#292929,bg=#4d9375,bold] #I  #{b:pane_current_path} #F #[fg=#4d9375,bg=#292929,nobold,nounderscore,noitalics]"

# tmux-plugins/tmux-prefix-highlight support
set -g @prefix_highlight_output_prefix "#[fg=#ffc777]#[bg=#181818]#[fg=#181818]#[bg=#ffc777]"
set -g @prefix_highlight_output_suffix ""
