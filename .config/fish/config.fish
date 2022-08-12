if status is-interactive
    # Commands to run in interactive sessions can go here
end

set OS (uname -s)
if test $OS = "Linux"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else if $OS = "Darwin" 
  eval "$(/opt/hombrew/bin/brew shellenv)"
end

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH



