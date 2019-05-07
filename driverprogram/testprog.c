#include <stdio.h>
#include <linux/kernel.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>



int main()
{
	pid_t pid;

	pid = fork();

	if (pid > 0)	//parent
	{
		wait(NULL);		//for child execution.

		long int s = syscall(334);		//334 is the system call number from 
		execlp("./script_main.sh", "./script_main.sh", (char*)0);
		// printf("System call: sys_ice_cream returned %ld\n", s);	

	}
	else
	{
		execlp("./script_title.sh", "./script_title.sh", (char*)0);
	}

	return 0;
}
