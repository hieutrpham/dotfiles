# TODO: Softwares need to install manually
* yay (package manager)
* tpm (tmux package manager)
* edge
* anki

Install all packages from requirements.txt
```
sudo pacman -S --needed $(cat requirements.txt | awk '{print $1}')
```
