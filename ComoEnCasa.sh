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
    ERROR=0

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

#   Instalación de fzf
sudo apt install fzf -y
if [ "$(echo $?)" = "1" ]; then
    ERROR=1
    ERR_fzf=1
fi
#   FIN Instalación de fzf

#   Instalación de Ranger
sudo apt install ranger -y
if [ "$(echo $?)" = "1" ]; then
    ERROR=1
    ERR_ranger=1
fi
#   FIN Instalación de Ranger

#   Instalación de Xclip
sudo apt install xclip -y
if [ "$(echo $?)" = "1" ]; then
    ERROR=1
    ERR_xclip=1
fi
#   FIN Instalación de Xclip

#   Instalación de Firejail
sudo apt install firejail -y
if [ "$(echo $?)" = "1" ]; then
    ERROR=1
    ERR_firejail=1
fi
#   Fin Instalación de Firejail

#   Instalación de Feh
sudo apt install feh -y
if [ "$(echo $?)" = "1" ]; then
    ERROR=1
    ERR_feh=1
fi
#   FIN Instalación de Feh

#   Instalación de Display
sudo apt install display -y
if [ "$(echo $?)" = "1" ]; then
    ERROR=1
    ERR_display=1
fi
#   FIN Instalación de Display

#   Instalación de VPN [Surfshark]
cd ~/Downloads || cd ~/Descargas
wget https://ocean.surfshark.com/debian/pool/main/s/surfshark-release/surfshark-release_1.0.0-2_amd64.deb
sudo dpkg -i surfshark-release_1.0.0-2_amd64.deb
sudo apt update -y
sudo apt install surfshark-vpn -y
if [ "$(echo $?)" = "1" ]; then
    ERROR=1
    ERR_surfshark=1
fi
#   FIN Instalación de VPN [Surfshark]

#   Instalación de LSD
cd ~/Downloads || cd ~/Descargas
wget https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd_0.20.1_amd64.deb
sudo dpkg -i lsd_0.20.1_amd64.deb
if [ "$(echo $?)" = "0" ]; then
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
else
    ERR_lsd=1
    ERROR=1
fi
#   FIN Instalación de LSD

#   Instalación de bat
cd ~/Downloads || cd ~/Descargas
wget https://github.com/sharkdp/bat/releases/download/v0.18.2/bat_0.18.2_amd64.deb
sudo dpkg -i bat_0.18.2_amd64.deb
if [ "$(echo $?)" = "0" ]; then
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
else
    ERROR=1
    ERR_bat=1
fi

#   FIN Instalación de bat

#   Instalación HTOP
sudo apt install htop -y
if [ "$(echo $?)" = "1" ]; then
    ERROR=1
    ERR_htop=1
fi
#   FIN Instalación HTOP

#   Instalación Geo-IP
sudo apt install geoip-bin -y
if [ "$(echo $?)" = "1" ]; then
    ERROR=1
    ERR_Geo=1
fi
#   FIN Instalación Geo-IP

#   Instalación MediaInfo
sudo apt install mediainfo -y
if [ "$(echo $?)" = "1" ]; then
    ERROR=1
    ERR_MediaInfo=1
fi
#   FIN Instalación MediaInfo

#   Instalación Audacity
sudo apt install Audacity -y
if [ "$(echo $?)" = "1" ]; then
    ERROR=1
    ERR_Audacity=1
fi
#   FIN Instalación Audacity

#   Instalación Zathura
sudo apt install Zathura -y
if [ "$(echo $?)" = "1" ]; then
    ERROR=1
    ERR_Zathura=1
fi
#   FIN Instalación Zathura

#   Instalación shred
sudo apt install shred -y
if [ "$(echo $?)" = "1" ]; then
    ERROR=1
    ERR_shred=1
fi
#   FIN Instalación shred

#   Instalación hollywood
sudo apt install hollywood -y
if [ "$(echo $?)" = "1" ]; then
    ERROR=1
    ERR_Hollywood=1
fi
#   FIN Instalación hollywood

#   Mensaje Final

echo "Recomendaciones:
[*] Si no has instalado FoxyProxy.. Instalalo por favor.
[*] Que no se te olvide aplicar la fuente de letra
"
if [ $ERROR = 1 ]; then
    echo "[!!]Ha habido complicaciones.. Sobre:"
    if [ $ERR_bat = 1 ]; then
        echo "[*] Problema con la instalacion del comando 'BAT'"
    elif [ $ERR_lsd = 1 ]; then
        echo "[*] Problema con la instalacion del comando 'LSD'"
    elif [ $ERR_htop = 1 ]; then
        echo "[*] Problema con la instalacion del comando 'HTOP'"
    elif [ $ERR_surfshark = 1 ]; then
        echo "[*] Problema con la instalacion del comando 'SURFSHARK'"
    elif [ $ERR_rofi = 1 ]; then
        echo "[*] Problema con la instalacion del comando 'ROFI'(sxhkd)"
    elif [ $ERR_ranger = 1 ]; then
        echo "[*] Problema con la instalacion del comando 'RANGER'"
    elif [ $ERR_fzf = 1 ]; then
        echo "[*] Problema con la instalacion del comando 'FZF'"
    elif [ $ERR_xclip = 1 ]; then
        echo "[*] Problema con la instalacion del comando 'XCLIP'"
    elif [ $ERR_display = 1 ]; then
        echo "[*] Problema con la instalacion del comando 'DISPLAY'"
    elif [ $ERR_feh = 1 ]; then
        echo "[*] Problema con la instalacion del comando 'FEH'"
    elif [ $ERR_firejail = 1 ]; then
        echo "[*] Problema con la instalacion del comando 'FIREJAIL'"
    elif [ $ERR_Geo = 1 ]; then
        echo "[*] Problema con la instalacion del comando 'Geo-IP'"
    elif [ $ERR_MediaInfo = 1 ]; then
        echo "[*] Problema con la instalacion del comando 'MediaInfo'"
    elif [ $ERR_Audacity = 1 ]; then
        echo "[*] Problema con la instalacion del comando 'Audacity'"
    elif [ $ERR_Zathura = 1 ]; then
        echo "[*] Problema con la instalacion del comando 'Zathura'"
    elif [ $ERR_shred = 1 ]; then
        echo "[*] Problema con la instalacion del comando 'Shred'"
    elif [ $ERR_Hollywood = 1 ]; then
        echo "[*] Problema con la instalacion del comando 'Hollywood'"
else
    echo "Todo ha salido perfecto, ni un solo error ¡ENHORABUENA!"
fi