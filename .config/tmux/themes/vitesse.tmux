#!/usr/bin/env bash

# Vitesse-like colors for Tmux, inspired by vscode-theme-vitesse

set -g mode-style "fg=#4d9375,bg=#121212"

set -g message-style "fg=#4d9375,bg=#121212"
set -g message-command-style "fg=#4d9375,bg=#121212"

set -g pane-border-style "fg=#121212"
set -g pane-active-border-style "fg=#4d9375"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#4d9375,bg=#121212"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#121212,bg=#4d9375,bold] #S #[fg=#4d9375,bg=#121212,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#121212,bg=#121212,nobold,nounderscore,noitalics]#[fg=#4d9375,bg=#121212] #{prefix_highlight} #[fg=#292929,bg=#121212,nobold,nounderscore,noitalics]#[fg=#4d9375,bg=#292929] %Y-%m-%d  %I:%M %p #[fg=#4d9375,bg=#292929,nobold,nounderscore,noitalics]#[fg=#121212,bg=#4d9375,bold] #h "
if-shell '[ "$(tmux show-option -gqv "clock-mode-style")" == "24" ]' {
  set -g status-right "#[fg=#121212,bg=#121212,nobold,nounderscore,noitalics]#[fg=#4d9375,bg=#121212] #{prefix_highlight} #[fg=#292929,bg=#121212,nobold,nounderscore,noitalics]#[fg=#4d9375,bg=#292929] %Y-%m-%d #[fg=#121212,bg=#4d9375,bold] #h "
}

setw -g window-status-activity-style "underscore,fg=#5eaab5,bg=#121212"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#5eaab5,bg=#121212"
setw -g window-status-format "#[fg=#121212,bg=#121212,nobold,nounderscore,noitalics]#[default] #I  #{b:pane_current_path} #F #[fg=#121212,bg=#121212,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#121212,bg=#292929,nobold,nounderscore,noitalics]#[fg=#4d9375,bg=#292929,bold] #I  #{b:pane_current_path} #F #[fg=#292929,bg=#121212,nobold,nounderscore,noitalics]"

# tmux-plugins/tmux-prefix-highlight support
set -g @prefix_highlight_output_prefix "#[fg=#ffc777]#[bg=#121212]#[fg=#121212]#[bg=#ffc777]"
set -g @prefix_highlight_output_suffix ""
