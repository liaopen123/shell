# shell
几种常见的sell:sh,bash,csh,tcsh,ash 

echo用来输出`变量值`。

**赋值号=  前后没有空格！！！！**

**赋值号=  前后没有空格！！！！**

**赋值号=  前后没有空格！！！！**

## 变量 

shell支持变量的三种写法： 

**赋值号的周围不能有空格，这可能和你熟悉的大部分编程语言都不一样。** 



```shell 
variable=value //不能有空格 

variable='value' 

variable="value"

```

 

#### 使用变量 

使用一个定义过的变量，只要在变量前加`$`符号。 

```shell 
author="pony" 

echo $author 

echo ${author} 

```



`{}`加不加都行。某些情况下 加`{}`是为了区分，比如： 

```shell 
skill="Java" 

echo "I am good at ${skill}Script" 

```

#### 单引号 和双引号的 区别 

* 被单引号包围的值，里面是什么就输出什么，它的目的是不希望单引号中的值被改变。 
* 双引号就可以引用变量。 

```shell 
url="http://c.biancheng.net" 

website1='C语言中文网：${url}' 

website2="C语言中文网：${url}" 

echo $website1 

echo $website2  

```



#### 只读变量 `readonly` 

```shell 
myUrl="http://see.xidian.edu.cn/cpp/shell/" 

readonly myUrl 

myUrl="http://see.xidian.edu.cn/cpp/danpianji/" 

```

这样子变量就不会被修改，运行后报错:`/bin/sh: NAME: This variable is read only.` 

#### 删除变量`unset` 

api: 

```shell 
unset variable_name 
```

那么这个变量就会被删除，不能再被使用,但是`unset 命令不能删除只读变量(ReadOnly)`。 

## shell 特殊变量 

查看当前进程id，pid： echo $$ 

其他特殊变量的含义 

| 变量 | 含义 |
| --- | --- |
| $0 | 当前脚本的文件名 |
| $n | 传递给脚本活函数的参数。n表示第几个参数。 |
| $# | 传递给脚本活函数的参数个数 |
| $* | 传递给脚本或函数的所有参数。 |
| $@ | 传递给脚本或函数的所有参数。被双引号(" ")包含时 |
| $? | 上个命令的退出状态，或函数的返回值 |
| $$ | 当前Shell进程ID。对于 Shell 脚本，就是这些脚本所在的进程ID。 |

### $* 和 $@ 的区别 

$* 和 $@ 都表示传递给函数或脚本的所有参数，不被双引号(" ")包含时，都以"$1" "$2" … "$n" 的形式输出所有参数。 

但是当它们本身被双引号(" ")包含时，"$*" 会将所有的参数作为一个整体，以"$1 $2 … $n"的形式输出所有参数；"$@" 会将各个参数分开，以"$1" "$2" … "$n" 的形式输出所有参数。 

## shell 替换 (变量的替换，命令的替换，转义符的替换) 

### 转义符的替换 

**-e 识别转义符 -E 禁用转义符 -n禁止插入换行符。** 

```shell 

a=100 

echo -e "a的值是$a \n" 

echo -E "a的值是$a \n" 

```

### 命令替换 

``对应的command`` 反引号括住 

用反引号括住的内容 会被当做命令来看待 

```shell 

DATE=`date` //date 代表时间 

echo "Date is $DATE" 

USERS=`who | wc -l` // who am i 

echo "Logged in user are $USERS" 

UP=`date ; uptime` //当前时间的指令 

echo "Uptime is $UP" 

```

### 变量替换 

变量替换可以根据变量的状态（是否为空、是否定义等）来改变它的值 

5种替换的形式: 

| 形式 | 说明 |
| --- | --- |
| {var} | 变量本来的值 |
| ${var:-word} | 如果变量 var 为空或已被删除(unset)，那么返回 word，但不改变 var 的值。 |
| ${var:=word} | 如果变量 var 为空或已被删除(unset)，那么返回 word，并将 var 的值设置为 word。 |
| ${var:?message} | 如果变量 var 为空或已被删除(unset)，那么将消息 message 送到标准错误输出，可以用来检测变量 var 是否可以被正常赋值。 若此替换出现在Shell脚本中，那么脚本将停止运行。 |
| ${var:+word} | 如果变量 var 被定义，那么返回 word，但不改变 var 的值。 |

```shell 

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

```

## 运算符 

### 算数运算符 就不说了 

### 关系运算符 

**关系运算符只支持数字！！！！！！！！,不支持字符串，除非字符串也是数字** 



| 运算符 |说明 |
| --- | --- |
| -eq | equals |
| -ne | not equals |
| -gt | greater then大于|
| -lt | less then 小于 |
| -ge | greater equal 大于等于 |
| -le  | less equal 小于等 |





```shell 

#注意要加空格啊 if后面的空格 

a=345 

b=123 

c=40 

d=50 

e=40 

if [ $a -eq $b ] 

then 

echo "$a -eq $b : a is equal to b" 

else 

echo "$a -eq $b: a is not equal to b" 

fi 

```


### 或与运算符

-o  stand for ||  options

-a stand for  && and





### 字符串运算符

| 运算符 | 说明                                                      | 举例                     |
| ------ | --------------------------------------------------------- | ------------------------ |
| =      | 检测两个字符串是否相等，相等返回 true。                   | [ $a = $b ] 返回 false。 |
| !=     | 检测两个字符串是否相等，不相等返回 true。                 | [ $a != $b ] 返回 true。 |
| -z     | 检测字符串长度是否为0，为0返回 true。stand for zero       | [ -z $a ] 返回 false。   |
| -n     | 检测字符串长度是否为0，不为0返回 true。stand for not zero | [ -z $a ] 返回 true。    |
| str    | 检测字符串是否为空，不为空返回 true。                     | [ $a ] 返回 true。       |

```shell

a="gaga"
b="haha"
if [[ $a = $b ]]
then
   echo "$a = $b : a is equal to b"
else
   echo "$a = $b: a is not equal to b"
fi




if [ -z $b]   #这个注意 -z 前面的空格 
then
   echo "${b:-"哈哈哈哈没有了"}长度为空"
fi



if [ -n $c] 
then 
   echo "$c 的长度不为空"
else
   echo "$c 的长度为空"
fi

```



## 字符串

### 单引号

缺点

 * 直接原样输出，里面的变量也是无效的....
 * 单引号中不能包含单引号(暗示：不能包含转义符)

那么要单引号干啥?

当然有用，可以用它存一些不变的常量。

双引号

优点

 *  可以有变量在里面
 *  可以出现转义字符

###  相关api

```shell
str="没错我就是传说中的字符串hello"
echo "字符串的$str的长度是${#str}"
echo "字符串的$str的截取是${str:0:3}"

index=`expr index $str hello`

echo "字符串的$str的的在$index"
string="alibaba is a great company"
echo `expr index "$string" is`
```



## array

定义数组 **不能要, 要就出问题**

```shell
array=(1 2 3 4 5 6)
```

基本api:

```shell
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
```



## if else

语法:

```shell
if [ expression ]
then
   Statement(s) to be executed if expression is true
else
	Statement
fi



```

## 函数

直接看代码 和java语言的函数没啥太大的区别 

唯一要注意的是

 * 调用方法 直接是变量名 不需要加`()`
 * 方法有返回值的  使用`return 语句`,接受的话，在调用方法的下面写上：`ret=$? `进行接收。
 * 方法接收接收参数,通过 调用方法名 params1 params2 params3 …进行传值，`#$1` 第1个参数, `$#`参数的格式, `$*`传递给所有参数。
 * 方法的嵌套 见下面demo

```shell
printHelloWorld(){

echo "hello wolrd 2333"

printAndReturnResult
}


 printAndReturnResult(){

echo "print something"

return "我是lph"
}


printHelloWorld

ret=$?    # 接收有返回值的方法

echo "得到的rusult:$ret"

printName(){
params=$1   #$1 第几个参数   $#参数的格式   $* 传递给所有参数

echo "$params"
}
printName "会有天使爱你"  #调用有变量的方法
```

## 输入输出重定向

### 输出重定向

主要通过`>`和`>>`对文件进行输出

 * `>`如果有文件  就直接覆盖 如果没有就创建新的文件
 * `>>`在源文件末尾进行追加

用法api：

```shell
echo "我是要输出的文本内容"  > ./outputfile.txt
who > ./users.txt    #要不要echo都一个样  还是有区别的  最好加上  肯定不会出问题
 不加反而有可能会报错  command not found
#使用单箭头>是覆盖源文件  如果没有就创建
#使用 >>箭头就表示在末尾追加
echo "我是追加在末尾的content" >> outputfile.txt
```



#### 

#### tips 

1. 如果报出警告:unary operator expected

​     如果报这个错 那么就把

​       if [ $a = $b ]  改成     if [[ $a = $b ]]

2. $@和$*的区别:*$* 和 $@ 都表示传递给函数或脚本的所有参数，不被双引号(" ")包含时，都以"$1" "$2" … "$n" 的形式输出所有参数。  但是当它们被双引号(" ")包含时，"$*" 会将所有的参数作为一个整体，以"$1 $2 … $n"的形式输出所有参数；"$@" 会将各个参数分开，以"$1" "$2" … "$n" 的形式输出所有参数。


参考资料:[30分钟玩转Shell脚本编程](http://c.biancheng.net/cpp/view/2491.html)
