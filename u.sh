echo "Top CPU consuming process are............."
echo "pid cpu-load pname"
ps aux|sort -nrk3|head|awk ' { print "$2" $3" "$11 }'>psoout
cat psout
read -p"enter threshold levels" th
while IFS=read line
do
pno=$ ( echo $line|awk '{print $1}' )
cpuload=$ (echo $line|awk '{print $2}' )
if ( ( $(echo "$cpuload > $th"|bc-1 ) ) );
then
kill $pno
fi
done < "psout" 
