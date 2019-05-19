printHelloWorld(){

echo "hello wolrd 2333"

printAndReturnResult
}


 printAndReturnResult(){

echo "print something"

return "我是lph"
}


printName(){
params=$1

echo "$params"
}


printHelloWorld

ret=$?

echo "得到的rusult:$ret"



printName "会有天使爱你"
