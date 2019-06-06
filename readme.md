# Description: 
  
These are simple implementations of CAPS and CAPS-dark on ns-2.35.
We have tested CAPS and CAPS-dark in the ubuntu 16.04 with Linux kernel 4.8.0-36-generic or 4.13.0-41-generic.
  
# Usage:
  
### 1. Place all the files： 

Initially, you need to prepare the NS installation package "ns-allinone-2.35.tar.gz", then please put the following files or folders ('ns-allinone-2.35.tar.gz', 'ls.h', 'CAPS.patch', 'CAPS-dark.patch', ‘CAPS.sh’, 'CAPS-dark.sh', 'many-to-one.sh', 'many-to-many.sh' and ‘testcase’) in the same level directory.
  
### 2. Installing, Patching and Compiling:
	
For CAPS:

	sudo chmod -R 777 *
	sudo ./CAPS.sh
	
For CAPS-dark (Another CAPS version without prior knowledge):
 	
	sudo chmod -R 777 *
	sudo ./CAPS-dark.sh
	
**Note:** All the patch files ('CAPS.patch' and 'CAPS-dark.patch') should be patched on the original ns-2.35.  
Please put the patch files inside the 'ns-allinone-2.35' folder, but outside the 'ns-2.35' folder. 
  
### 3. Now you can run the simple testcases:

	./many-to-one.sh 10 20 30 40 50 60 70 80
	./many-to-many.sh 10 20 30 40 50 60 70 80
	
	
**Note:** Because the following files exceed 25M,   
##### 1. You can download "ns-allinone-2.35.tar.gz" at the following address:
https://pan.baidu.com/s/1ubjwpn19SGgZqQOFJ7lEhg          
Download password： h0hm 

##### 2. You can download the test environment (ubuntu 16.04 with Linux kernel 4.8.0-36-generic) at the following address:
https://pan.baidu.com/s/1zzm32pk5YKivlKxIB1GCVQ      
Download password： gczb    
sudo password: master
 
If you have any questions, please email to jinbinhu@csu.edu.cn.  
