set OS (uname -s)
if test $OS = "Linux"
  fenv source /home/bernt/.nix-profile/etc/profile.d/nix.sh 
else if test $OS = "Darwin" 
  eval $(/opt/homebrew/bin/brew shellenv)
end

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
