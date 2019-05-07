#!/bin/bash


echo "$(tput setaf 2) [+] $(tput sgr 0) The system call icecream return 0. $(tput setaf 2) Success exection. $(tput sgr 0)"

echo -e "\t $(tput setaf 6) ---The dmesg(kernel log) for the system call is as: $(tput sgr 0) "

#tail shows the last # lines.
dmesg | tail -95

sleep 5

echo "Thank you" | figlet




