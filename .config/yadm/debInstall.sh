#!/bin/bash
set -e

trap 'catch' ERR
catch() {
  echo "Bootstrapping failed!"
  kill $!
}

trap cleanUp SIGHUP SIGINT SIGTERM
cleanUp() {
  echo "cleaning up"
}

DEB_PACKAGES=(
	zsh
	build-essential
	curl
	unzip
	ripgrep
	git
	fd-find
	cargo
	golang-go
	kitty
	tmux
	zsh-syntax-highlighting
	zsh-autosuggestions
	neovim
)

sudo echo

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$dir/lib/spinner.sh"
packages=("${DEB_PACKAGES[@]}")

spinner start "Preparing package installation..."
sudo add-apt-repository ppa:neovim-ppa/stable -y &>/dev/null
sudo apt-get update &>/dev/null
spinner stop $?

# install deb packages
declare -i n=0
for package in "${packages[@]}"; do
	n=$n+1
	spinner start "Installing ${package}... "
	sudo apt-get install "$package" &>/dev/null
	spinner stop $?
done

spinner start "Installing Volta NodeJS manager..."
curl -s https://get.volta.sh | bash -s -- --skip-setup &>/dev/null
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
volta install node &>/dev/null
spinner stop $?

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
spinner start "Installing LazyGit ${LAZYGIT_VERSION}..."
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" &>/dev/null
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit &>/dev/null
rm -rf lazygit.tar.gz
spinner stop $?

spinner start "Installing startship-prompt..."
curl -sS https://starship.rs/install.sh | sh -s -- --yes &>/dev/null
spinner stop $?

spinner start "Installing Oh-My-Zsh..."
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc --unattended &>/dev/null
  sudo -S chsh -s "/bin/zsh" "${USER}"
fi
spinner stop $?

spinner start "Installing Hack Nerd font..."
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip &>/dev/null
unzip -o Hack.zip -d "$HOME/.local/share/fonts" &>/dev/null
fc-cache -fv &>/dev/null
rm Hack.zip
spinner stop $?

spinner start "Initalizing Neovim..."
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
spinner stop $?
