Install all packages from requirements.txt
```
sudo pacman -S --needed $(cat requirements.txt | awk '{print $1}')
```
