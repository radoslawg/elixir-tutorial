#!/bin/bash

sudo apt update
sudo apt dist-upgrade -y
sudo apt install -y --no-install-recommends \
  build-essential \
  git \
  sudo \
  openssh-client \
  zsh \
  gcc \
  curl \
  ca-certificates \
  unzip  \
  luarocks \

export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"

ln -sf "$PWD/.config/nvim" "$XDG_CONFIG_HOME"/nvim

pushd "$HOME"
export EDITOR=nvim 
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
printf 'ZSH_THEME="robbyrussell"\nENABLE_CORRECTION="false"\nplugins=(git copyfile extract colorize dotenv encode64 golang)\n' | cat .zshrc > .zshrc2
rm .zshrc
mv .zshrc2 .zshrc
popd
printf "\ncd $(pwd)\n" >> "$HOME/.zshrc"
echo "source $HOME/.ghcup/env" >> $HOME/.zshrc

sudo chsh -s "$(which zsh)" "$USER"

packages=(
    fd
    ripgrep
    npm
    neovim 
    fzf 
    zoxide 
)

# Iterate over the array and install each package
for package in "${packages[@]}"; do
  echo "Installing $package..."
  /home/linuxbrew/.linuxbrew/bin/brew install "$package"
done

tic -x -o ~/.terminfo .config/xterm-kitty.ti
tic -x -o ~/.terminfo .config/foot.ti
tic -x -o ~/.terminfo .config/alacritty.ti
