# Description: 
  
These are simple implementations of CAPS and CAPS-dark on ns-2.35.  
  
# Usage:
  
### 1. Place all the files： 

Initially, 'CAPS.patch', 'CAPS-dark.patch', ‘CAPS.sh’, 'CAPS-dark.sh', 'many-to-one.sh', 'many-to-many.sh' and ‘testcase’ are in the same level directory.
  
### 2. Installing, Patching and Compiling:
	
For CAPS:
 
	sudo ./CAPS.sh
	
For CAPS-dark:
 
	sudo ./CAPS-dark.sh
	
All the patch files ('CAPS.patch' and 'CAPS-dark.patch') should be patched on the original ns-2.35.  
Please put the patch files inside the 'ns-allinone-2.35' folder, but outside the 'ns-2.35' folder.  
You can download ns-2.35 installation package (ns-allinone-2.35.tar.gz) at the following address: https://pan.baidu.com/s/1ubjwpn19SGgZqQOFJ7lEhg 

Password： h0hm 
  
### 3. Now you can run the simple testcases:

	./many-to-one.sh 10 20 30 40 50 60 70 80
	./many-to-many.sh 10 20 30 40 50 60 70 80
  
If you have any questions, please email to jinbinhu@csu.edu.cn.  
