# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
set fish_plugins jump extract

# Path to your custom folder (default path is $FISH/custom)
set fish_custom $HOME/.oh-my-fish

function fish_title
end

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Clear Fish Greeting
function fish_greeting
end

# User Variables
set -x BROWSER 'firefox-developer'
set -x TERMINAL 'urxvt'
set -x QT_X11_NO_MITSHM 1
set -x EDITOR 'nvim'
set -x SCRIPTS $HOME/.scripts
set -x STEAM_FRAME_FORCE_CLOSE 1
set -x PATH $PATH /usr/local/bin /usr/bin /bin /usr/local/sbin /usr/sbin /sbin /usr/bin /home/uncledozer/.gem/ruby/2.2.0/bin /home/uncledozer/.config/bspwm /usr/share/awesome /home/uncledozer/.gem/ruby/2.1.0 /etc/php /home/uncledozer/public_html/webapps/phpMyAdmin /opt/android-sdk/platform-tools /usr/lib/python2.7 /usr/bin/core_perl /usr/bin/site_perl /usr/bin/vendor_perl /usr/lib /usr/lib/php /usr/lib/php/modules $SCRIPTS $SCRIPTS/colorscripts

# Fish Colors
set -x fish_color_command blue --bold
set -x fish_color_autosuggestion magenta
set -x fish_color_redirection magenta --bold
set -x fish_color_param green --bold

set -x fish_color_search_match --background=blue --bold
set -x fish_pager_color_progress magenta --bold
set -x fish_pager_color_description green --bold
set -x fish_pager_color_prefix green --bold

# Aliases
alias j='jump'
alias nd='nextd'
alias pd='prevd'
alias vim='nvim'
alias terminal='urxvtc'
alias aur='yaourt'
alias compy='pkill compton; compton -b --unredir-if-possible --paint-on-overlay --vsync opengl --config /home/uncledozer/.config/compton.conf'
alias clocky='tty-clock -cC 1'
alias ll='ls -A --format single-column'
alias la='ls -lhAogZ'
alias cd.='cd ../'
alias cd..='cd ../../'
alias cd...='cd ../../../'
alias tm='tmux'

# Resource fish profile
function repro
  source ~/.config/fish/config.fish
end

# Google Chrome Fixes
function chrome
  set MESA_GL_VERSION_OVERRIDE 3.3
  set MESA_GLSL_VERSION_OVERRIDE 330
  google-chrome-unstable --force-device-scale-factor=1
end

# Start Netflix Chrome App in FullScreen
function flix
  setsid /opt/google/chrome-unstable/google-chrome-unstable --user-data-dir=/home/uncledozer/.config/google-chrome-unstable "--profile-directory=Profile 1" --app-id=deceagebecbceejblnlcjooeohmmeldh ^^ /dev/null
end

# Skype with alsa fix
function skype
  setsid apulse32 skype-with-poll-fix ^^ /dev/null &
end

# Run speedcrunch
function calc
  setsid speedcrunch &
end

# Update Vundle Plugins for Vim
function upvim
  nvim +PlugUpgrade +PlugInstall +PlugClean
end

# Re-Source Fish File
function repro
  source $HOME/.config/fish/config.fish
end

# Run Filemanager at Location
function files
  setsid rox (pwd) &
end

# Change rm to trash-cli
function rm
  trash $argv
end

# Run Vim in a new window
function newvim
  urxvtc --hold -e $EDITOR $argv
end

# Link my root .editorconfig
function edconf
  ln $dots/.editorconfig (pwd)
end

# Vim autodownloads via curl when supplied a url
function vimhub
  set -l githuburl https://raw.githubusercontent.com/$argv
  nvim $githuburl
end

# Set Brightness of screens
function xbright
  xrandr --output DVI-0 --brightness $argv &
  xrandr --output HDMI-0 --brightness .9 &
end

# Run Multiples of a program
function run
  switch (count $argv)
    case 2
      for i in (seq $argv[1] -1 1); eval $argv[2]; end
  end
end

# Multiple Terminals
function multiterm
  switch (count $argv)
    case 1
      run $argv "urxvtc -hold -cd (pwd)"
    case 2
      run $argv[1] "urxvtc -hold -cd $argv[2]"
  end
end

# Source Home Profile
. ~/.profile &
