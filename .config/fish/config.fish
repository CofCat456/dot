set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

source ~/.local/share/nvim/lazy/tokyonight.nvim/extras/fish/tokyonight_moon.fish

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NVM
# Set nvm default

set --universal nvm_default_version v20.10.0
# function __check_rvm --on-variable PWD --description 'Do nvm stuff'
#     status --is-command-substitution; and return
#
#     if test -f .nvmrc; and test -r .nvmrc
#         nvm use
#     else
#     end
# end

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-darwin.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end
