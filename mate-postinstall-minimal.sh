#!/bin/bash
set -e

echo 'A csomagtárolók szinkronizálása és frissítése'
sudo pacman -Syy --noconfirm

echo 'A rendszer frissítése'
sudo pacman -Syu --noconfirm

echo 'A kötelező csomagok telepítése'

sudo pacman -S --needed --noconfirm base-devel multilib-devel git

echo 'A yay telepítése'

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

echo 'A yay gyorsítótár kiürítése'

printf 'I\nI\nY\n' | yay -Scc

echo 'A szükséges MATE szoftverek telepítése'
sudo pacman -S --needed --noconfirm dosfstools exfatprogs lm_sensors mate mate-extra mtools networkmanager ntfs-3g sddm sddm-kcm polkit-gnome

yay -S --needed --noconfirm protonup-qt-bin

echo 'Az SDDM bejelentkezéskezelő a Bluetooth és a NetworkManager indítása'

sudo systemctl enable sddm.service
sudo systemctl enable bluetooth.service
sudo systemctl enable NetworkManager.service
systemctl --user enable obex.service

echo 'A hétköznapi szoftverek telepítése'

sudo pacman -S --needed --noconfirm 7zip bash-completion doublecmd-qt5 fastfetch gimp gparted hblock leafpad libreoffice-still-hu lutris mesa noise-suppression-for-voice nvidia-dkms obs-studio ristretto steam tenacity unrar unzip qbittorrent vlc

echo 'A pacman gyorsítótár kiürítése'

printf 'I\nI\n' | sudo pacman -Scc

echo 'Az utótelepítő befejezte a munkálatokat. Újraindítás'

reboot
