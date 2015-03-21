# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
#set fish_theme clearance

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
set fish_plugins node jump extract theme

# Path to your custom folder (default path is $FISH/custom)
set fish_custom $HOME/.oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish


# Change Fish Greeting
set fish_greeting
#archey3 &

# User Variables
set -U BROWSER 'firefox-developer'
set -U TERMINAL 'urxvt'
set -U QT_X11_NO_MITSHM 1
set -x EDITOR 'nvim'
set -U SCRIPTS $HOME/.scripts
#set -U TERM 'xterm-256color'

#alias try='theme'
alias nd='nextd'
alias pd='prevd'
alias vim='nvim'
alias terminal='urxvtc'
alias reload_profile='source ~/.config/fish/config.fish'
alias aur='yaourt'
alias compy='pkill compton; compton -b --unredir-if-possible --paint-on-overlay --vsync opengl --config /home/uncledozer/.config/compton.conf'
alias clocky='tty-clock -cC 1'
alias ll='ls --format single-column'
alias la='ls -lA'
alias cd.='cd ../'
alias cd..='cd ../../'
alias cd...='cd ../../../'
alias tm='tmux'
#alias &&=';'

## My Fish Functions
# Author: UncleDozer
# 2015

# Start Netflix Chrome App in FullScreen
function flix
  setsid /opt/google/chrome-unstable/google-chrome-unstable --user-data-dir=/home/uncledozer/.config/google-chrome-unstable "--profile-directory=Profile 1" --app-id=deceagebecbceejblnlcjooeohmmeldh ^^ /dev/null
end

# Skype with alsa fix
function skype
  setsid apulse32 skype-with-poll-fix &
end

# Quicker than typing
function calc
	speedcrunch &
end

# Update Vundle Plugins for Vim
function upvim
    set SHELL (which sh)
    nvim +BundleInstall! +BundleClean +qall
    set SHELL (which fish)
end

# Resource Fish File
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


# Start work apps
function work
		set tpath $HOME/public_html/$argv
		urxvtc --hold -cd $tpath -e grunt server;
		urxvtc --hold -cd $tpath -e grunt php server;
		echo "Grunt PHP server started at $tpath";
		echo "Grunt Watch started at $tpath";
		urxvtc --hold -cd $tpath -e $EDITOR;
    urxvtc -cd $tpath;
		urxvtc --hold -cd $tpath -e $EDITOR
end

# Set Brightness of screens
function xbright
		xrandr --output DVI-0 --brightness $argv &
		xrandr --output HDMI-0 --brightness .9 &
end


#set -x PANEL_FIFO "/tmp/panel-fifo";
set -x PATH $PATH /usr/local/bin  /usr/bin /bin /usr/local/sbin /usr/sbin /sbin /usr/share/awesome/themes /opt/awemenugen /usr/bin /home/uncledozer/.gem/ruby/2.2.0/bin /home/uncledozer/.config/bspwm /usr/share/awesome /home/uncledozer/.gem/ruby/2.1.0/bin /etc/php /home/uncledozer/public_html/webapps/phpMyAdmin /opt/android-sdk/platform-tools $SCRIPTS /usr/lib/python2.7 /usr/bin/core_perl
set -x STEAM_FRAME_FORCE_CLOSE 1;
set -x fish_color_command blue -bold
#set -x fish_color_search_match black -bold

# Source Home Profile
. ~/.profile &

# Set Vi_Keybindings for Fish

# set FLINE_PATH $HOME/.config/fish/fishline
# source $FLINE_PATH/fishline.fish
# source $FLINE_PATH/themes/default.fish

# set FLINE_PROMPT CLOCK PWD WRITE N GIT ARROW
# set FLINE_PROMPT PWD GIT ARROW

##############
### TO RUN ###
##############


# eval (dircolors -c ~/.dircolors | sed 's/>&\/dev\/null$//') &

## DIRCOLORS
