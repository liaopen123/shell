arrays=(1 2 3 4 5 6)
	arrays[0]=100
echo ${arrays[*]}
echo ${arrays[@]}
for item in ${arrays[@]}
do
echo $item
done


length=${#arrays[@]}
echo  "长度是$length"

