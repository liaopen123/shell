empty_name=""

echo "调用-----${empty_name:-jay}"
echo "现在的empty_name值是${empty_name}"
echo "调用=====${empty_nam:=lph}"
echo "现在的empty_name值是${empty_name}"
echo "调用+++++值是${empty_name+能不能不要说}"
echo "现在的empty_name值是${empty_name}
unset empty_name
echo "现在的被unset之后的值是${empty_name}"
echo "调用????的错误信息是${empty_name?报错了啊}""
