#!/bin/bash
# ALL FCT

awk '$5 == "tcp" && $1 == "+" && $4 == 0 && $6 != 40' ps.tr > process_start.txt
sort -g -t ' ' -k 8n -k 2n process_start.txt >1st.txt
awk '!a[$8]++' 1st.txt >process1.txt
awk '{print $8"\t"$2}' process1.txt >fid_FCT_start.txt
awk '$5 == "ack" && $1 == "r" && $3 == 0' ps.tr > process_compete.txt
sort -g -t ' ' -k 8n -k 2nr -k 11nr  process_compete.txt >2nd.txt 
awk '!a[$8]++' 2nd.txt >process2.txt
awk '{print $2}' process2.txt >fid_FCT_end.txt
paste fid_FCT_start.txt fid_FCT_end.txt > fid_FCT.txt
awk '{$4 = $3 - $2}{print}' fid_FCT.txt >FCT.txt
