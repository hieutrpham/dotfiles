```
sudo pacman -S stow tmux neovim fzf picom gcc make tree man-pages man-db git fish bat ghostty nitrogen thunar unzip xorg-xrandr xclip
yay -S  microsoft-edge-stable-bin
```
Additional Software I use:
* yay (package manager)
* kitty (terminal emulator)

Install all packages from requirements.txt
```
sudo pacman -S --needed $(cat requirements.txt | awk '{print $1}')
```
