str="没错我就是传说中的字符串hello"
echo "字符串的$str的长度是${#str}"
echo "字符串的$str的截取是${str:0:3}"

index=`expr index $str hello`

echo "字符串的$str的的在$index"
string="alibaba is a great company"
echo `expr index "$string" is`

