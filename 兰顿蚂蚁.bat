@echo off
setlocal enabledelayedexpansion
title 兰顿蚂蚁

set nb=0
:back
set /a nb+=1
set a%nb%=□
if %nb% == 100 goto next
goto back

:next
set step=0

call :echo

set /p lc=蚂蚁位置(r随机):
set /p di=蚂蚁方向:

if %lc% == r set /a lc=%random%%%100+1
set /a lrkey=%lc%%%10

:go
set /a step+=1

if !a%lc%! == □ goto white
if !a%lc%! == ■ goto black

:white
set a%lc%=■
if %di% == w set di=a&set /a lc-=1&goto check
if %di% == a set di=s&set /a lc+=10&goto check
if %di% == s set di=d&set /a lc+=1&goto check
if %di% == d set di=w&set /a lc-=10&goto check
goto check

:black
set a%lc%=□
if %di% == w set di=d&set /a lc+=1&goto check
if %di% == d set di=s&set /a lc+=10&goto check
if %di% == s set di=a&set /a lc-=1&goto check
if %di% == a set di=w&set /a lc-=10&goto check

:check
if %di% == w if %lc% lss 1 set /a lc+=100
if %di% == s if %lc% gtr 100 set /a lc-=100
if %lrkey% == 1 if %di% == a set /a lc+=10
if %lrkey% == 0 if %di% == d set /a lc-=10

if %di% == w set d2=↑
if %di% == s set d2=↓
if %di% == a set d2=←
if %di% == d set d2=→
title 当前步数:%step%，蚂蚁位置:%lc%，方向为%d2%

call :echo
pause>nul
goto go

:echo
cls
echo %a1%%a2%%a3%%a4%%a5%%a6%%a7%%a8%%a9%%a10%
echo %a11%%a12%%a13%%a14%%a15%%a16%%a17%%a18%%a19%%a20%
echo %a21%%a22%%a23%%a24%%a25%%a26%%a27%%a28%%a29%%a30%
echo %a31%%a32%%a33%%a34%%a35%%a36%%a37%%a38%%a39%%a40%
echo %a41%%a42%%a43%%a44%%a45%%a46%%a47%%a48%%a49%%a50%
echo %a51%%a52%%a53%%a54%%a55%%a56%%a57%%a58%%a59%%a60%
echo %a61%%a62%%a63%%a64%%a65%%a66%%a67%%a68%%a69%%a70%
echo %a71%%a72%%a73%%a74%%a75%%a76%%a77%%a78%%a79%%a80%
echo %a81%%a82%%a83%%a84%%a85%%a86%%a87%%a88%%a89%%a90%
echo %a91%%a92%%a93%%a94%%a95%%a96%%a97%%a98%%a99%%a100%
echo.
goto :eof



