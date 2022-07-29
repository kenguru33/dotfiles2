if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
