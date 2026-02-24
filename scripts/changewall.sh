#!/bin/bash
############################################################################################################
##   ______  __      __  _______   ________  _______    ______   __    __   ______   __    __  ________   ##
##  /      \|  \    /  \|       \ |        \|       \  /      \ |  \  |  \ /      \ |  \  /  \|        \  ##
## |  $$$$$$\\$$\  /  $$| $$$$$$$\| $$$$$$$$| $$$$$$$\|  $$$$$$\| $$\ | $$|  $$$$$$\| $$ /  $$| $$$$$$$$  ##
## | $$   \$$ \$$\/  $$ | $$__/ $$| $$__    | $$__| $$| $$___\$$| $$$\| $$| $$__| $$| $$/  $$ | $$__      ##
## | $$        \$$  $$  | $$    $$| $$  \   | $$    $$ \$$    \ | $$$$\ $$| $$    $$| $$  $$  | $$  \     ##
## | $$   __    \$$$$   | $$$$$$$\| $$$$$   | $$$$$$$\ _\$$$$$$\| $$\$$ $$| $$$$$$$$| $$$$$\  | $$$$$     ##
## | $$__/  \   | $$    | $$__/ $$| $$_____ | $$  | $$|  \__| $$| $$ \$$$$| $$  | $$| $$ \$$\ | $$_____   ##
##  \$$    $$   | $$    | $$    $$| $$     \| $$  | $$ \$$    $$| $$  \$$$| $$  | $$| $$  \$$\| $$     \  ##
##   \$$$$$$     \$$     \$$$$$$$  \$$$$$$$$ \$$   \$$  \$$$$$$  \$$   \$$ \$$   \$$ \$$   \$$ \$$$$$$$$  ##
##                                                                                                        ##
##                                                                                                        ##
## Wallpaper Switcher                                                                                     ##
## Created by Cybersnake                                                                                  ##
############################################################################################################

#!/bin/bash

WALLPAPER_DIR="$HOME/Hypr/Wallpapers"
shopt -s nullglob
IMAGES=("$WALLPAPER_DIR"/*.png "$WALLPAPER_DIR"/*.jpg "$WALLPAPER_DIR"/*.jpeg)

if [ ${#IMAGES[@]} -eq 0 ]; then
  notify-send "Sin fondos" "No se encontraron imágenes en $WALLPAPER_DIR"
  exit 1
fi

RANDOMPIC="${IMAGES[RANDOM % ${#IMAGES[@]}]}"

# Inicia el daemon swww si no está corriendo
swww query || swww init

# Aplica el fondo con transición
swww img "$RANDOMPIC" --transition-type wipe --transition-angle 45 --transition-fps 60 --transition-step 90

# Notificación
notify-send "Fondo actualizado" "$(basename "$RANDOMPIC")"

