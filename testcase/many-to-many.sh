#!/bin/bash
## Usage: ./many-to-many.sh sfnum1 sfnum2 ....
## e.g.   ./many-to-many.sh 10 20 30 40 50 60 70 80 >result

cd ./testcase
CAPSPATH= ../ns-allinone-2.35/ns-2.35/ns

if [ -f "./timeout.txt" ];then
rm -f timeout.txt
fi

if [ -f "./AFCT.txt" ];then
rm -f AFCT.txt
fi

echo "run CAPS NS2 ..."
echo " "
echo "sfnum=10"
$CAPSPATH ./many-to-many.tcl 40 10 3 256 50 0.1101 0.1102 10 2 >result
./FCT.sh
perl sffct.pl FCT.txt $1
perl AFCT.pl FCT-SF.txt $1
perl timeout.pl FCT-SF.txt $1
echo ""

echo "sfnum=20"
$CAPSPATH ./many-to-many.tcl 40 20 3 256 50 0.1101 0.1102 10 2 >result
./FCT.sh
perl sffct.pl FCT.txt $2
perl AFCT.pl FCT-SF.txt $2
perl timeout.pl FCT-SF.txt $2
echo ""

echo "sfnum=30"
$CAPSPATH ./many-to-many.tcl 40 30 3 256  50 0.1101 0.1102 10 2  >result
./FCT.sh
perl sffct.pl FCT.txt $3
perl AFCT.pl FCT-SF.txt $3
perl timeout.pl FCT-SF.txt $3
echo ""

echo "sfnum=40"
$CAPSPATH ./many-to-many.tcl 40 40 3 256  50 0.1101 0.1102 10 2 >result
./FCT.sh
perl sffct.pl FCT.txt $4
perl AFCT.pl FCT-SF.txt $4
perl timeout.pl FCT-SF.txt $4
echo ""

echo "sfnum=50"
$CAPSPATH ./many-to-many.tcl 40 50 3 256  50 0.1101 0.1102 10 2  >result
./FCT.sh
perl sffct.pl FCT.txt $5
perl AFCT.pl FCT-SF.txt $5
perl timeout.pl FCT-SF.txt $5
echo ""

echo "sfnum=60"
$CAPSPATH ./many-to-many.tcl 40 60 3 256  50 0.1101 0.1102 10 2  >result
./FCT.sh
perl sffct.pl FCT.txt $6
perl AFCT.pl FCT-SF.txt $6
perl timeout.pl FCT-SF.txt $6
echo ""

echo "sfnum=70"
$CAPSPATH ./many-to-many.tcl 40 70 3 256  50 0.1101 0.1102 10 2 >result
./FCT.sh
perl sffct.pl FCT.txt $7
perl AFCT.pl FCT-SF.txt $7
perl timeout.pl FCT-SF.txt $7
echo ""

echo "sfnum=80"
$CAPSPATH ./many-to-many.tcl 40 80 3 256  50 0.1101 0.1102 10 2  >result
./FCT.sh
perl sffct.pl FCT.txt $8
perl AFCT.pl FCT-SF.txt $8
perl timeout.pl FCT-SF.txt $8
echo ""


echo "plot AFCT & timeout ..."
gnuplot plotAFCT
gnuplot plottimeout
