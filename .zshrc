fpath+=$HOME/.nix-profile/share/zsh/site-functions
autoload -U promptinit; promptinit
prompt pure

if [ -e /home/bernt/.nix-profile/etc/profile.d/nix.sh ]; then . /home/bernt/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export ZSH="$HOME/.nix-profile/share/oh-my-zsh"
ZSH_THEME=""
source $ZSH/oh-my-zsh.sh
plugins=(zsh-syntax-highlighting zsh-autosuggestion)

source "$HOME/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
