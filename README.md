# Icecream Factory System call

## Brief Overview

The Program(system call) simulates the working of an ice cream factory that gets multiple orders from customers demanding multiple ice cream cones. The process of creating/making an ice cream is complex and can be carried out at different speed depending upon the number of machines of various types. The procedure of making an ice cream cone is:

- Boiling the milk.
- Adding sugar.
- Adding flavor.
- Putting it into the cone.
- Freezing.
- Wrapping the cone.

## Installation/Setup Notes

The file `ice_cream_userlevelfinal.c` is user level implementation of the same problem.
Run `gcc ice_cream_userlevelfinal.c -lpthread` to compile this program and execute.

The kernel level implementation is in icecream systemcall folder.

### Kernel System Call Setup

As this is a built in system call you've to recompile the kernel for it to work.
You can make changes to your current kernel and recompile or download a fresh copy of kernel from [This link](https://mirrors.edge.kernel.org/pub/linux/kernel/).
The installated kernels are in `\usr\src`. 

Refer to this video tutorial for compiling a simple Hello World call. [Youtube Link](https://www.youtube.com/watch?v=AP-tBd84vbM). 
The process is pretty similar for icecream system call too. Just have to change a few names.

- Make a directory inside your kernel folder named `icecream` and copy the contents of `icecream systemcall` into it. (Both the .c and Makefile).
- Become root by running this command. `sudo -i`
- Get back to the parent directory (kernel folder) and run `gedit Makefile`
	- Search for `core-y` and on the second search find append your folder name of system call at the end. It will look like this after addding. `core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/ icecream/`
- Then go to `include/linux/` in your kernel folder and find `syscalls.h`
	- Edit this file and append `asmlinkage long sys_icecream(void);` at the end of the file. (function prototype)
- Get back to kernel directory and go to `arch/x86/entry/syscalls/` and edit `syscall_64.tbl`
	- Before x32-specific system call listing, append your system call with the number that comes next in order. In my case it was like this: `334	64	icecream		sys_icecream`
	- **NOTE:** 334 is my system call number. I will use this number to call my system call. Note this number in your case too.
- Now go back to your kernel folder and run `make menuconfig`, save and exit.
- Run `make oldconfig` and then run `make`. This will start compiling. Compilations takes quite a lot of time(1-3hrs). 
	- **Speedup Tip:** run `make -j $(nproc)` for faster compiling. The will use all the resources that can be availed for compiling.
- If you have followed the setup correctly compilation would be a success. Then run `make modules_install && make install` for installation.
	- **Speedup Tip:** run `make modules_install && make install -j $(nproc)` for faster installation.
- Now restart your computer. If you have edited a fresh copy of kernel then on the boot time press and hold SHIFT to get to the grub menu. Go the the advanced option and select the kernel version you have installed.
- You can run `uname -r` to find the kernel version (checking your installation).
- Now go to the driverprogram directory. Run `gcc testprog.c` and then execute it.
	- **NOTE:** Remember to change the system call number in syscall(#) in the testprog.c if your system call number is different.
	- **NOTE:** I have done a little bash scripting to make the output more representable. Run `sudo apt-get install figlet` before executing the program so that you don't get error related to it.
	- Kernel logs can be shown by this command: `dmesg`

This is the output you are expected to get:

![](https://github.com/4markumar/Icecream-Factory-Sytem-call/blob/master/Screenshots/screenshot_1.png)
![](https://github.com/4markumar/Icecream-Factory-Sytem-call/blob/master/Screenshots/screenshot_2.png)
