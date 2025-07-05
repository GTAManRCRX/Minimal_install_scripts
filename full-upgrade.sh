echo -e "\e[1;32mTeljes rendszerfrissítés indítása!\e[0m"
yay -Syyu --noconfirm
sudo pacman -Rcns $(pacman -Qtdq) --noconfirm
sudo pacman -Sc --noconfirm
if command -v flatpak &> /dev/null; then
    flatpak update -y
    flatpak uninstall --unused -y
    sudo flatpak update -y
    sudo flatpak uninstall --unused -y
fi
printf 'I\nI\nY\n' | yay -Scc
hblock
echo -e "\e[1;33mMegtörtént a rendszer frissítése!\e[0m"
