#!/bin/bash

set -e #Hiba esetén leáll

echo 'A csomagtárolók szinkronizálása és frissítése'

sudo pacman -Syy --noconfirm

echo 'A rendszer frissítése'

sudo pacman -Syu --noconfirm

echo 'A kötelező szoftverek telepítése'

sudo pacman -S --needed --noconfirm base-devel multilib-devel git

echo 'A yay telepítése'

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

echo 'A yay gyorsítótár kiürítése'

printf 'I\nI\nY\n' | yay -Scc

echo 'A szükséges KDE szoftverek telepítése'

sudo pacman -S --needed --noconfirm ark bluedevil bluez-obex breeze breeze-gtk cdrdao cdrtools discover dosfstools dvd+rw-tools exfatprogs ffmpegthumbs frameworkintegration flatpak-kcm isoimagewriter k3b kaccounts-integration kactivitymanagerd kde-cli-tools kdeclarative kdeconnect kdecoration kded kdenlive kdesu kholidays konsole kdeplasma-addons kglobalacceld kinfocenter kmenuedit kpipewire kscreen kscreenlocker ksystemstats kwayland kwin layer-shell-qt libappindicator-gtk2 libappindicator-gtk3 lib32-libappindicator-gtk2 lib32-libappindicator-gtk3 libkcddb libkscreen libksysguard lm_sensors mtools networkmanager ntfs-3g plasma-activities plasma-activities-stats plasma-desktop plasma-integration plasma-nm plasma-pa plasma-systemmonitor plasma-wayland-protocols plasma-workspace plasma5support polkit-kde-agent pop-sound-theme powerdevil sddm sddm-kcm spectacle systemsettings phonon-qt6 xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-kde xorg-xwayland

yay -S --needed --noconfirm protonup-qt-bin

echo 'Az SDDM bejelentkezéskezelő a Bluetooth és a NetworkManager indítása'

sudo systemctl enable sddm.service
sudo systemctl enable bluetooth.service
sudo systemctl enable NetworkManager.service
systemctl --user enable obex.service

echo 'A szükséges hétköznapi szoftverek telepítése'

sudo pacman -S --needed --noconfirm 7zip bash-completion doublecmd-qt5 fastfetch gimp gparted hblock leafpad libreoffice-still-hu lutris mesa noise-suppression-for-voice nvidia-dkms obs-studio ristretto steam tenacity qbittorrent unrar unzip vivaldi vivaldi-ffmpeg-codecs vlc

echo 'A pacman gyorsítótár kiürítése'

printf 'I\nI\n' | sudo pacman -Scc

echo 'Az utótelepítő befejezte a munkálatokat. Újraindítás'

reboot
