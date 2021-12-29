#!/bin/bash

cmds(){
  echo
  echo "      Title: $(playerctl metadata xesam:title)"
  echo "      Album: $(playerctl metadata xesam:album)"
  echo "      Artist: $(playerctl metadata xesam:artist)"
}

 while (true)
 do
   out="$(cmds)"
   sleep 0.5
   clear
   echo "$out"
 done
