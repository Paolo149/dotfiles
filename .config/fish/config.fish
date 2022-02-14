# Start X at login
if status --is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end

set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "exa -l -g --icons"
alias llt "ll --tree --level=2 -a"
alias lla "ll -a"
alias c "clear"
alias g git
alias ide "sh ~/.config/scripts/ide.sh"
alias factorio "sh ~/Downloads/Torrents/Factorio/run.sh"
alias matlab "sh ~/Downloads/Torrents/Matlab/bin/matlab -nodesktop"
alias spelunky2 "cd ~/Downloads/Torrents/Spelunky2/ && ./start.sh"
alias rpcs3 "cd ~/Downloads/Random/ && ./rpcs3-v0.0.19-13137-cb2748ae_linux64.AppImage"
set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# Texlab
fish_add_path -aP /home/paolo/.cargo/bin/

# NodeJS
set -gx PATH node_modules/.bin $PATH
# Alsamixer settings load
alsactl --file ~/.config/asound.state restore

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

# opam configuration
source /home/paolo/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
