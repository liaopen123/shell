echo "我是要输出的文本内容"  > ./outputfile.txt
who > ./users.txt    #要不要echo都一个样  还是有区别的  最好加上  肯定不会出问题 不加反而有可能会报错  command not found
#使用单箭头>是覆盖源文件  如果没有就创建
#使用 >>箭头就表示在末尾追加
echo "我是追加在末尾的content" >> outputfile.txt

