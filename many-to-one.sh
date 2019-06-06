#!/bin/bash
## Usage: ./many-to-one.sh sfnum1 sfnum2 ....
## e.g.   ./many-to-one.sh 10 20 30 40 50 60 70 80 >result

cd ./testcase
chmod 777 *

if [ -f "./timeout.txt" ];then
rm -f timeout.txt
fi

if [ -f "./AFCT.txt" ];then
rm -f AFCT.txt
fi

echo "run CAPS NS2 ..."
echo " "
echo "sfnum=10"
../ns-allinone-2.35/ns-2.35/ns ./many-to-one.tcl 40 10 3 256 16 0.11 0.110004 16 0 >result
./FCT.sh
perl sffct.pl FCT.txt $1
perl AFCT.pl FCT-SF.txt $1
perl timeout.pl FCT-SF.txt $1
echo ""

echo "sfnum=20"
../ns-allinone-2.35/ns-2.35/ns ./many-to-one.tcl 40 20 3 256 18 0.10575 0.105750004 4 4  >result
./FCT.sh
perl sffct.pl FCT.txt $2
perl AFCT.pl FCT-SF.txt $2
perl timeout.pl FCT-SF.txt $2
echo ""

echo "sfnum=30"
../ns-allinone-2.35/ns-2.35/ns ./many-to-one.tcl 40 30 3 256 16 0.1056 0.10560004 16 35  >result
./FCT.sh
perl sffct.pl FCT.txt $3
perl AFCT.pl FCT-SF.txt $3
perl timeout.pl FCT-SF.txt $3
echo ""

echo "sfnum=40"
../ns-allinone-2.35/ns-2.35/ns ./many-to-one.tcl 40 40 3 256 20 0.104 0.104004 4 1  >result
./FCT.sh
perl sffct.pl FCT.txt $4
perl AFCT.pl FCT-SF.txt $4
perl timeout.pl FCT-SF.txt $4
echo ""

echo "sfnum=50"
../ns-allinone-2.35/ns-2.35/ns ./many-to-one.tcl 40 50 3 256 20 0.104 0.1045 4 1  >result
./FCT.sh
perl sffct.pl FCT.txt $5
perl AFCT.pl FCT-SF.txt $5
perl timeout.pl FCT-SF.txt $5
echo ""

echo "sfnum=60"
../ns-allinone-2.35/ns-2.35/ns ./many-to-one.tcl 40 60 3 256 15 0.105 0.10550001 2 1  >result
./FCT.sh
perl sffct.pl FCT.txt $6
perl AFCT.pl FCT-SF.txt $6
perl timeout.pl FCT-SF.txt $6
echo ""

echo "sfnum=70"
../ns-allinone-2.35/ns-2.35/ns ./many-to-one.tcl 40 70 3 256 10 0.10554 0.1056 2 1  >result
./FCT.sh
perl sffct.pl FCT.txt $7
perl AFCT.pl FCT-SF.txt $7
perl timeout.pl FCT-SF.txt $7
echo ""

echo "sfnum=80"
../ns-allinone-2.35/ns-2.35/ns ./many-to-one.tcl 40 80 3 256 10 0.1055 0.105550004 4 1  >result
./FCT.sh
perl sffct.pl FCT.txt $8
perl AFCT.pl FCT-SF.txt $8
perl timeout.pl FCT-SF.txt $8
echo ""


echo "plot AFCT & timeout ..."
gnuplot plotAFCT
gnuplot plottimeout

