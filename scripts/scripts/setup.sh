#!/bin/bash

# ----------- install packages --------
echo "updating package list and upgrading existing packages..."
sudo apt update && sudo apt upgrade -y

echo "installing git and stow..."
sudo apt install git stow -y

# --- clone dotfiles repo ---
if [ ! -d "$HOME/dotfiles" ]; then
  echo "cloning dotfiles repository..."
  git clone <your_dotfiles_repo_url >"$HOME/dotfiles"
else
  echo "dotfiles directory already exists! pulling latest changes..."
  cd "$HOME/dotfiles"
  git pull origin main
  cd
fi

# ------ install tools ----------
echo "installing required applications..."
sudo apt install neovim -y
sudo apt install tmux -y
sudo add-apt-repository ppa:mmk2410/alacritty -y
sudo apt update
sudo apt install alacritty -y

# --- stow dotfiles ---
echo "stowing dotfiles..."
cd "$HOME/dotfiles"
stow alacritty
stow nvim
stow tmux

echo "dotfiles setup complete!"
echo "you may need to restart your terminal or log out/in for some changes to take effect."
