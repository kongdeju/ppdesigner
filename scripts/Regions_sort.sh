Bin=`dirname $(readlink -f $0)`
for a in `ls *.xls`
do 
`sort -k5,5n -k3,3n $a > "$a.sort"`
done
