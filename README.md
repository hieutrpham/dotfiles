## Installation process
```
#install from requirement list
sudo pacman -S --needed --noconfirm $(cat requirements.txt | awk '{print $1}')

#run install script
chmod +x install.sh
./install.sh
```
## Softwares need to install manually
* anki (flashcard app)
