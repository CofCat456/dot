set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

source ~/.config/fish/themes/tokyonight_moon.fish

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NVM
# Set nvm default

set --universal nvm_default_version lts

source (dirname (status --current-filename))/config-alias.fish

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-darwin.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end
