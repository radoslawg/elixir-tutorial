#!/bin/bash

apt update
apt dist-upgrade -y
apt install -y --no-install-recommends \
  man \
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
  sudo \
  bzip2 \
  file \
  fonts-dejavu-core \
  g++ \
  less \
  libz-dev \
  locales \
  make \
  netbase \
  openssh-client \
  patch \
  tzdata \
  uuid-runtime

/bin/bash -c "NONINTERACTIVE=1 $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

mkdir "/home/linuxbrew/.linuxbrew/bin"
ln -s "/home/linuxbrew/.linuxbrew/Homebrew/bin/brew" "/home/linuxbrew/.linuxbrew/bin"
chown -R ${USERNAME} "/home/linuxbrew/.linuxbrew"
export HOMEBREW_PREFIX=/home/linuxbrew/.linuxbrew
export HOMEBREW_CELLAR=/home/linuxbrew/.linuxbrew/Cellar
export HOMEBREW_REPOSITORY=/home/linuxbrew/.linuxbrew/Homebrew
export PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH
export MANPATH=/home/linuxbrew/.linuxbrew/share/man:$MANPATH
export INFOPATH=/home/linuxbrew/.linuxbrew/share/info:$INFOPATH

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
printf "\nexport HOMEBREW_PREFIX=/home/linuxbrew/.linuxbrew" >> "$HOME/.zshrc"
printf "\nexport HOMEBREW_CELLAR=/home/linuxbrew/.linuxbrew/Cellar" >> "$HOME/.zshrc"
printf "\nexport HOMEBREW_REPOSITORY=/home/linuxbrew/.linuxbrew/Homebrew" >> "$HOME/.zshrc"
printf "\nexport PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH" >> "$HOME/.zshrc"
printf "\nexport MANPATH=/home/linuxbrew/.linuxbrew/share/man:$MANPATH" >> "$HOME/.zshrc"
printf "\nexport INFOPATH=/home/linuxbrew/.linuxbrew/share/info:$INFOPATH\n" >> "$HOME/.zshrc"

printf "\ncd $(pwd)\n" >> "$HOME/.zshrc"


sudo chsh -s "$(which zsh)" "$USER"

/home/linuxbrew/.linuxbrew/bin/brew install fd ripgrep npm neovim fzf zoxide

#tic -x -o ~/.terminfo .config/xterm-kitty.ti
#tic -x -o ~/.terminfo .config/foot.ti
#tic -x -o ~/.terminfo .config/alacritty.ti
