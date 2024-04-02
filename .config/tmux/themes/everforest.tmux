set -g mode-style "fg=#999f93,bg=#4a555b"

set -g message-style "fg=#999f93,bg=#4a555b"
set -g message-command-style "fg=#999f93,bg=#4a555b"

set -g pane-border-style "fg=#4a555b"
set -g pane-active-border-style "fg=#a7c080"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#999f93,bg=#374247"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#2f383e,bg=#a7c080,bold] #S #[fg=#a7c080,bg=#374247,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#374247,bg=#374247,nobold,nounderscore,noitalics]#[fg=#999f93,bg=#374247] #{prefix_highlight} #[fg=#4a555b,bg=#374247,nobold,nounderscore,noitalics]#[fg=#999f93,bg=#4a555b] %Y-%m-%d  %I:%M %p #[fg=#a7c080,bg=#4a555b,nobold,nounderscore,noitalics]#[fg=#2f383e,bg=#a7c080,bold] #h "

setw -g window-status-activity-style "underscore,fg=#a7c080,bg=#374247"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#999f93,bg=#374247"
setw -g window-status-format "#[fg=#374247,bg=#374247,nobold,nounderscore,noitalics]#[default] #I  #{b:pane_current_path} #F #[fg=#374247,bg=#374247,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#374247,bg=#4a555b,nobold,nounderscore,noitalics]#[fg=#999f93,bg=#4a555b,bold] #I  #{b:pane_current_path} #F #[fg=#4a555b,bg=#374247,nobold,nounderscore,noitalics]"

# tmux-plugins/tmux-prefix-highlight 支持
set -g @prefix_highlight_output_prefix "#[fg=#ffc777]#[bg=#374247]#[fg=#374247]#[bg=#ffc777]"
set -g @prefix_highlight_output_suffix ""
