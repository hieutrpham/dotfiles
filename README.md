## Install all packages from requirements.txt
```
sudo pacman -S --needed --noconfirm $(cat requirements.txt | awk '{print $1}')
```
## Softwares need to install manually
* anki (flashcard app)
