#!/bin/bash

# Script for printing the Title 
# NOTE: If figlet is not installed. Run the following command.
# sudo apt-get install figlet

#For 'tput' command. setab for background. setaf for foreground.
#sgr 0 for reset.
# Num  Colour    #define         R G B
# 0    black     COLOR_BLACK     0,0,0
# 1    red       COLOR_RED       1,0,0
# 2    green     COLOR_GREEN     0,1,0
# 3    yellow    COLOR_YELLOW    1,1,0
# 4    blue      COLOR_BLUE      0,0,1
# 5    magenta   COLOR_MAGENTA   1,0,1
# 6    cyan      COLOR_CYAN      0,1,1
# 7    white     COLOR_WHITE     1,1,1


tput setaf 2
echo "OS Project" | figlet

tput sgr 0
echo "--------"
sleep 1
tput setaf 6
echo "IceCream Factory Solution" | figlet

tput sgr 0

