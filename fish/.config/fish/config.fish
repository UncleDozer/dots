# {{{
 # @Author  Kristopher Watts <kristopher.a.watts@gmail.com>
 # @Website http://Webtastic-Development.net
 # @Github  https://Github.com/UncleDozer
# }}}

# Path to oh my fish
set fish_path ~/.oh-my-fish

# Source outside config files
. $fish_path/oh-my-fish.fish
. ~/.profile

# Plugins
Plugin 'jump'
Plugin 'extract'
Plugin 'bundler'
Plugin 'theme'
Plugin 'gem'

# Clear Fish Title for Easier window management via i3
function fish_title
end


# Clear Fish Greeting
function fish_greeting
end

# User Variables ---{{{
set -x BROWSER 'iceweasel'
set -x TERMINAL 'urxvtc'
set -x QT_X11_NO_MITSHM 1
set -x EDITOR 'nvim'
set -x SCRIPTS $HOME/.scripts
set -x STEAM_FRAME_FORCE_CLOSE 1
set -x PATH $PATH /usr/local/bin /usr/bin /bin /usr/local/sbin /usr/sbin /sbin /usr/bin /home/uncledozer/.gem/ruby/2.2.0/bin /home/uncledozer/.config/bspwm /usr/share/awesome /home/uncledozer/.gem/ruby/2.1.0 /etc/php /home/uncledozer/public_html/webapps/phpMyAdmin /opt/android-sdk/platform-tools /lib /lib64 /usr/lib/python2.7 /usr/bin/core_perl /usr/bin/site_perl /usr/bin/vendor_perl /usr/lib /usr/lib/php /usr/lib/php/modules $SCRIPTS $SCRIPTS/colorscripts /usr/bin/perl /usr/lib64/python2.7
set --global --export LC_CTYPE en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x TMP /tmp/
# ---}}}

# Fish Colors ---{{{
set -x fish_color_command blue --bold
set -x fish_color_autosuggestion magenta
set -x fish_color_redirection magenta --bold
set -x fish_color_param green --bold

set -x fish_color_search_match --background=blue --bold
set -x fish_pager_color_progress magenta --bold
set -x fish_pager_color_description green --bold
set -x fish_pager_color_prefix green --bold
# ---}}}

# Alias Functions ---{{{
# Jump plugin
# Keep alias for autocompletion
alias j='jump'
alias mpv='mpv --hwdec=vdpau'

function ncmpcpp
    command ncmpcpp --config ~/.config/ncmpcpp/config
end

function gvim
    pynvim
end

# nextd
function nd
    nextd
end

# prevd
function pd
    prevd
end

# vim to nvim
function vim
    command nvim $argv
end

# I can never seem to remember yaourt
alias aur='yaourt'

# ls functions
function ll
    command ls -A --format single-column --color=auto $argv
end

function la
    command ls -lhAogZX --color=auto $argv
end

# Quick change directory
function cd.
    cd ../
end

function cd..
    cd ../../
end

function cd...
    cd ../../../
end
# ---}}}

# Functions ---{{{
# Re-source fish profile
function repro
    source ~/.config/fish/config.fish
end

# Run NetHack4 in sdl
function nethack4
    command nethack4 -U ~/.config/NetHack4 -H /usr/share/nethack4 --interface sdl
end

# Google Chrome Unstable Fixes
function chrome
    env 'MESA_GL_VERSION_OVERRIDE=3.3' 'MESA_GLSL_VERSION_OVERRIDE=330' google-chrome-unstable --force-device-scale-factor=1
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
    setsid urxvtc --hold -e ranger (pwd)
end

# Change rm to trash-cli
function rm
    trash $argv
end

# Set Brightness of screens
function xbright
    switch (count $argv)
        case 1
            xrandr --output DVI-0 --brightness $argv &
            xrandr --output HDMI-0 --brightness .9 &
        case 2
            xrandr --output DVI-0 --brightness $argv[ 1 ] &
            xrandr --output HDMI-0 --brightness $argv[ 2 ] &
    end
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
        case 0
            run 1 "urxvtc -hold -cd (pwd)"
        case 1
            run $argv "urxvtc -hold -cd (pwd)"
        case 2
            run $argv[1] "urxvtc -hold -cd $argv[2]"
    end
end

function autorefresh
    switch ( count $argv )
        case 0
            ls **.less **.css **.php **.html **.js **.rb **.txt | entr reload-browser iceweasel
        case 1
            ls $argv[ 1 ] | entr reload-browser iceweasel
    end
end

function compileScss
    switch ( count $argv )
        case 0
            ls **.scss | entr sassc -m main.scss ../css/main.css
        case 1
            ls **.scss | entr sassc -m $argv.scss ../css/$argv.css
        case 2
            ls **.scss | entr sassc -m $argv[ 1 ] $argv[ 2 ]
    end
end

function rtv
    set -lx BROWSER 'w3m'
    command rtv
end

# ---}}}
