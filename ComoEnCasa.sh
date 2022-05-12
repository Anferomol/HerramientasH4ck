#!/bin/bash 

#   ------ COLORES --------

#   rojo: \e[0;31mtexto\e[0m
#   azul: \e[1;34mtexto\e[0m
#   verde: \e[1;32mtexto\e[0m
#   amarillo:   \e[1;33mtexto\e[0m
#   morado: \e[0;35mtexto\e[0m
#   cian:   \e[0;36mtexto\e[0m
#   gris:   \e[0;37mtexto\e[0m
#   blanco: \e[1;37mtexto\e[0m
#   gris oscuro: \e[1;30mtexto\e[0m
#   negro:  \e[0;30mtexto\e[0m
#   rojo resaltado: \e[1;31mtexto\e[0m
#   cian resaltado: \e[1;36mtexto\e[0m
#   morado resaltado: \e[1;35mtexto\e[0m

#   ------- FIN COLORES -----------

#   Default Variables

    Terminal = qterminal
    Directory = $(pwd)

#   Actualizar todo el sistema
sudo apt update 2>/dev/null
sleep 1s
sudo apt dist-upgrade -y 2>/dev/null
sleep 1s
sudo apt autoremove -y 2>/dev/null
sleep 1s
sudo 
sudo apt install build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev -y 2>/dev/null
#   FIN Actualizar todo el sistema

sleep 1s

errores = ()

function install {
    sudo apt install $1 -y
    if [ $? -eq 1 ]; then
        errores+=($1)
    fi
}

#   Instalación de fzf
install fzf

#   Instalación de Ngrok
install ngrok

#   Instalación de Ranger
install ranger

#   Instalación de Xclip
install xclip

#   Instalación de Firejail
install firejail

#   Instalación de Feh
install feh

#   Instalación de Display
install display

#   Instalación HTOP
install htop

#   Instalación Geo-IP
install geoip-bin

#   Instalación MediaInfo
install mediainfo

#   Instalación Audacity
install Audacity

#   Instalación Zathura
install Zathura

#   Instalación shred
install shred

#   Instalación hollywood
install hollywood

#   Instalación de Neovim
install neovim

mkdir -p ~/.config/nvim
mkdir ~/.config/nvim/autoload
mkdir ~/.config/nvim/plugins
cd ~/.config/nvim/autoload
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cd $Directory



#   FIN instalación de Neovim

#   Instalación de Impacket
install python3-Impacket

if [ "$(echo $?)" = "0" ]; then
    if [[ $(cat ~/.zshrc | grep 'ALIAS COMPARTIR') = "" ]]; then
    echo "#    ALIAS COMPARTIR - impacket-smbserver
    alias compartir='/usr/bin/impacket-smbserver Carpeta $(pwd) -smb2support -username Andres -password Andres123" >> ~/.zshrc
    fi
fi
#   Instalación de VPN [Surfshark]
cd ~/Downloads || cd ~/Descargas
wget https://ocean.surfshark.com/debian/pool/main/s/surfshark-release/surfshark-release_1.0.0-2_amd64.deb
sudo dpkg -i surfshark-release_1.0.0-2_amd64.deb
sudo apt update -y
sudo apt install surfshark-vpn -y
if [ "$(echo $?)" = "1" ]; then
    errores+=("Surfshark")
fi

#   Instalación de LSD
cd ~/Downloads || cd ~/Descargas
wget https://github.com/Peltoche/lsd/releases/download/0.21.0/lsd_0.21.0_amd64.deb
sudo dpkg -i lsd_0.21.0_amd64.deb
if [ "$(echo $?)" = "0" ]; then
    if [[ $(cat ~/.zshrc | grep 'ALIAS LSD') = "" ]]; then
        if [ "$(which lsd)" = "/bin/lsd" ]; then
            sudo echo "#    ALIAS LSD
            alias ls='/bin/lsd'" >> ~/.zshrc
        elif [ $(which lsd) = "/usr/sbin/lsd" ]; then
            sudo echo "#    ALIAS LSD
            alias ls='/usr/sbin/lsd'" >> ~/.zshrc
        elif [ $(which lsd) = "/usr/bin/lsd" ]; then
            sudo echo "#    ALIAS LSD
            alias ls='/usr/bin/lsd'" >> ~/.zshrc
        fi
    fi
else
    errores+=("LSD")
fi


#   Instalación de bat
cd ~/Downloads || cd ~/Descargas
wget https://github.com/sharkdp/bat/releases/download/v0.21.0/bat_0.21.0_amd64.deb
sudo dpkg -i bat_0.21.0_amd64.deb
if [ "$(echo $?)" = "0" ]; then
    if [[ $(cat ~/.zshrc | grep 'ALIAS BAT') = "" ]]; then
        if [ "$(which bat)" = "/bin/bat" ]; then
            sudo echo "#    ALIAS BAT
            alias cat='/bin/bat'
            alias catn='/bin/cat'
            alias catnl='/bin/bat --paging=never'" >> ~/.zshrc
        elif [ $(which bat) = "/usr/sbin/bat" ]; then
            sudo echo "#    ALIAS BAT
            alias cat='/usr/sbin/bat'
            alias catn='$(which cat)'
            alias catnl='/usr/sbin/bat --paging=never'" >> ~/.zshrc
        elif [ $(which bat) = "/usr/bin/bat" ]; then
            sudo echo "#    ALIAS BAT
            alias cat='/usr/bin/bat'
            alias catn='$(which cat)'
            alias catnl='/usr/bin/bat --paging=never'" >> ~/.zshrc
        fi
    fi
else
    errores+=("Bat")
fi

#   FIN Instalación de bat

#   Instalacion de fuentes de letra

mkdir -p ~/.local/share/fonts/Cascadia
mkdir ~/.local/share/fonts/NotoColorEmoji
cd ~/Downloads || cd ~/Descargas
mkdir TEMP_fonts
cd TEMP_fonts
wget https://github.com/googlefonts/noto-emoji/raw/main/fonts/NotoColorEmoji.ttf
mv NotoColorEmoji.ttf ~/.local/share/fonts/NotoColorEmoji
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip
unzip CascadiaCode.zip
mv *.ttf ~/.local/share/fonts/Cascadia/

#   FIN Instalación de fuentes de letra

############### impacket-smbserver smbFolder $(pwd) -smb2support -username Andres -password Andres123

#   Mensaje Final

echo "Recomendaciones:
[*] Si no has instalado FoxyProxy.. Instalalo por favor.
[*] Falta aplicar las fuentes de letra en la terminal.
"

if [ ${#errores} -gt 0 ]; then
    clear
    echo "[!!] Ha habido complicaciones.. [!!]"
    for i in "${errores[@]}"
    do
        echo -e "[*] Failed to install the packet: \e[1;33$i\e[0m \n"
    done
else
    echo "Todo ha salido perfecto, ni un solo error ¡ENHORABUENA!"
fi
