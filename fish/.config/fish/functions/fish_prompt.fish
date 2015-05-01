# name: RobbyRussel
# Modified by: Kristopher Watts <kristopher.a.watts@gmail.com>

function _git_branch_name
    echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
    echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
    set -l last_status $status
    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l red (set_color -o red --bold)
    set -l blue (set_color -o blue --bold)
    set -l green (set_color -o green)
    set -l bgreen (set_color -o green --bold)
    set -l normal (set_color normal)
    set -l d_red (set_color red)
    set -l d_blue (set_color blue)

    set arrow "$blue❱$green❱$yellow❱ "

    set -l cwd $blue(basename (prompt_pwd))

    if [ (_git_branch_name) ]
        set -l git_branch "$normal$d_blue"(_git_branch_name)
        set git_info " $git_branch"

        if [ (_is_git_dirty) ]
            set -l dirty "$d_red ‡"
            set git_info "$git_info$dirty"
        end
    end

    echo -n -s $cwd $git_info $normal\  $arrow ' '
end
