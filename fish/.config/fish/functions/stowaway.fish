#{{{
 # Author: Kristopher Watts <kristopher.a.watts@gmail.com>
 #
 # Uses: simple script to auto stow my dotfiles
 #
 # TODO: Automate the process a bit more.
 #       Maybe use a global variable so I can set stowables on the fly.
# }}}*/

function stowaway
    set -l stowaways compton firefox-developer fish i3 misc nvim vimperator scripts;
    for stowable in $stowaways; stow $stowable -vvv; echo "$stowable on board captain!"; end
end
