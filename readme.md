# Description: 
  
These are simple implementations of CAPS and CAPS-dark on ns-2.35.  
  
# Usage:
  
### 1. Place all the files： 

Initially, 'CAPS.patch', 'CAPS-dark.patch', ‘CAPS.sh’, 'CAPS-dark.sh', 'many-to-one.sh', 'many-to-many.sh' and ‘testcase’ are in the same level directory.
  
### 2. Installing, Patching and Compiling:
	
For CAPS:

	```Bash  
	sudo ./CAPS.sh
	```
	
For CAPS-dark:

	```Bash  
	sudo ./CAPS-dark.sh
	```
	
All the patch files ('CAPS.patch' and 'CAPS-dark.patch') should be patched on the original ns-2.35.  
Please put the patch files outside the 'ns-2.35' folder, but inside the 'ns-allinone-2.35' folder.  
  
### 3. Now you can run the simple testcases.

	./many-to-one.sh 
	./many-to-many.sh  
  
If you have any questions, please email to jinbinhu@csu.edu.cn.  
