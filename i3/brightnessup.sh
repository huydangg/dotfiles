# /bin/bash

brightnessctl s +5% | awk 'BEGIN { "brightnessctl g" | getline g; close("brightnessctl g");"brightnessctl m" | getline m; close("brightnessctl m"); print (g/m) *100 }' > ~/.config/brightness
