b=""
a="gaga11111111"
c="hello"
if [[ $a = $b ]]
then
   echo "$a = $b : a is equal to b"
else
   echo "$a = $b: a is not equal to b"
fi




if [ -z $b]
then
   echo "${b:-"哈哈哈哈没有了"}长度为空"
fi



if [ -n $c]
then 
   echo "$c 的长度不为空"
else
   echo "$c 的长度为空"
fi
