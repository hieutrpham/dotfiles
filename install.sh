#!/bin/bash

echo "Install requirements"
sudo pacman -S --needed --noconfirm $(cat requirements.txt | awk '{print $1}')

#install yay
if ! command -v yay &> /dev/null; then
  echo "Installing yay AUR helper..."
  sudo pacman -S --needed git base-devel --noconfirm
  git clone https://aur.archlinux.org/yay.git
  cd yay
  echo "building yay.... yaaaaayyyyy"
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
else
  echo "yay is already installed"
fi

#install tpm
if ! pacman -Q tmux &>/dev/null; then
  echo "tmux is not installed."
  exit 1
fi

TPM_DIR="$HOME/.tmux/plugins/tpm"

# Check if TPM is already installed
if [ -d "$TPM_DIR" ]; then
  echo "TPM is already installed in $TPM_DIR"
else
  echo "Installing Tmux Plugin Manager (TPM)..."
  git clone https://github.com/tmux-plugins/tpm $TPM_DIR
  echo "TPM installed successfully!"
fi

#install edge
yay -S --needed --noconfirm microsoft-edge-stable-bin

#create symlinks using stow
STOW_LIST=(
  "nvim" "fish" "bash" "i3" "i3status" "kitty" "picom" "tmux" "yazi" "rofi"
  )

TO_DELETE=(
  "$HOME/.bashrc"
  "$HOME/.config/i3/config"
  )

read -p "This will delete ${TO_DELETE[*]} Continue? (y/N) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
  for i in "${TO_DELETE[@]}"; do
    if [ -e "$i" ]; then
      echo "Deleting: $i"
      rm -rf "$i"
    else
      echo "Warning: '$i' not found." >&2
    fi
  done
fi

for i in "${STOW_LIST[@]}"; do
  echo "Stowing $i"
  stow "$i"
done
