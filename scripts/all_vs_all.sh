Bin=`dirname $(readlink -f $0)`
formatdb -i region.fna -p F
blastall -p blastn -i probe.fna -d region.fna -o pro_reg.bsp -e 100 -W 7 -S 1
perl $Bin/Bsp_to_xls1.pl pro_reg.bsp
formatdb -i probe.fna -p F
blastall -p blastn -i region.fna -d probe.fna -o reg_pro.bsp -e 100 -W 7 -S 1
perl $Bin/Bsp_to_xls1.pl reg_pro.bsp
blastall -p blastn -i primer1.fna -d region.fna -o p1_reg.bsp -e 100 -W 7
perl $Bin/Bsp_to_xls1.pl p1_reg.bsp
blastall -p blastn -i primer2.fna -d region.fna -o p2_reg.bsp -e 100 -W 7
perl $Bin/Bsp_to_xls1.pl p2_reg.bsp

