#!/bin/bash

BREW_PACKAGES=(
	zsh
	curl
	wget
	unzip
	ripgrep
	git
	fd-find
	cargo
	golang-go
	kitty
	tmux
	starship
	zsh-syntax-highlighting
	zsh-autosuggestions
	neovim
)

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$dir/lib/spinner.sh"
packages=("${BREW_PACKAGES[@]}")

# install deb packages
declare -i n=0
for package in "${packages[@]}"; do
	n=$n+1
	spinner start "Installing ${package}... "
	brew install "$package" &>/dev/null
	spinner stop $?
done

spinner start "Installing Volta NodeJS manager..."
curl -s https://get.volta.sh | bash -s -- --skip-setup &>/dev/null
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
volta install node &>/dev/null
spinner stop $?

spinner start "Installing Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc --unattended &>/dev/null
sudo -S chsh -s "/bin/zsh" "${USER}"
spinner stop $?

spinner stop $?
spinner start "Initalizing Neovim..."
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' &>/dev/null
spinner stop $?
