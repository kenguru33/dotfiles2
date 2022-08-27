set OS (uname -s)
if test $OS = "Linux"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fenv source /home/bernt/.nix-profile/etc/profile.d/nix.sh 
else if $OS = "Darwin" 
  eval "$(/opt/hombrew/bin/brew shellenv)"
end
