@echo off
cls
title 黎明之后
setlocal enabledelayedexpansion
mode con cols=56 lines=21

::color 3f
::echo.
::echo                           ####
::echo                          #****#
::echo                          #****#
::echo                           ####
::echo                            II
::echo                       **   II   **
::echo                        **  II  **
::echo                         ***II***
::echo -------------------------------------------------------
::echo -------------------------------------------------------
::echo.
::echo.
::echo.
::echo                        黎 明 之 后
::echo.
::echo.
::echo.
::set /p clown=

:start
set name=黎明
set underearth=0
set gear=0
set gear2=0
set petrol=0
set petrol2=0
set petrol3=0
set wake=0
set offer=0
set step=0
set refuse=0
set heart=0
set hole=0
set agree=0
set chip=0
set spark=0
set power=0
set giveup=0
set moon=0
set mars=0
set chance=5
set holeclose=0

:superstart
color 02
set choice1=》
set choice2=·
set choice3=·
set choice4=·
set choice5=·
set choice6=《
set choice7=·
set choice8=·
set choice9=·
set choice10=·
set nb=1
set nb2=6
:back
cls
echo.
echo                   黎    明    之    后
echo.
echo                           ####
echo                          #****#
echo                          #****#
echo                           ####
echo                            II
echo                       **   II   **
echo                        **  II  **
echo                         ***II***
echo -------------------------------------------------------
echo -------------------------------------------------------
echo.
echo                      %choice1% 开始游戏 %choice6%
echo                      %choice2% 读取存档 %choice7%
echo                      %choice3% 查看规则 %choice8%
echo                      %choice4% 设置名称 %choice9%
echo                      %choice5% 退出游戏 %choice10%
choice /c wse /n
if %errorlevel% == 3 goto check
set choice%nb%=·
set choice%nb2%=·
if %errorlevel% == 1  set /a nb=%nb%-1
if %errorlevel% == 2  set /a nb=%nb%+1
if %nb% lss 1 set /a nb=%nb%+5
if %nb% gtr 5 set /a nb=%nb%-5
set /a nb2=%nb%+5
set choice%nb%=》
set choice%nb2%=《
goto back

:check
if %nb% == 1 goto title
if %nb% == 2 goto load
if %nb% == 3 goto rule
if %nb% == 4 goto name
if %nb% == 5 exit

:load
for /f "tokens=1 delims=;" %%i in (save.wc) do set name=%%i
for /f "tokens=2 delims=;" %%i in (save.wc) do set underearth=%%i
for /f "tokens=3 delims=;" %%i in (save.wc) do set gear=%%i
for /f "tokens=4 delims=;" %%i in (save.wc) do set gear2=%%i
for /f "tokens=5 delims=;" %%i in (save.wc) do set petrol=%%i
for /f "tokens=6 delims=;" %%i in (save.wc) do set petrol2=%%i
for /f "tokens=7 delims=;" %%i in (save.wc) do set petrol3=%%i
for /f "tokens=8 delims=;" %%i in (save.wc) do set wake=%%i
for /f "tokens=9 delims=;" %%i in (save.wc) do set offer=%%i
for /f "tokens=10 delims=;" %%i in (save.wc) do set step=%%i
for /f "tokens=11 delims=;" %%i in (save.wc) do set refuse=%%i
for /f "tokens=12 delims=;" %%i in (save.wc) do set heart=%%i
for /f "tokens=13 delims=;" %%i in (save.wc) do set hole=%%i
for /f "tokens=14 delims=;" %%i in (save.wc) do set agree=%%i
for /f "tokens=15 delims=;" %%i in (save.wc) do set chip=%%i
for /f "tokens=16 delims=;" %%i in (save.wc) do set spark=%%i
for /f "tokens=17 delims=;" %%i in (save.wc) do set power=%%i
for /f "tokens=18 delims=;" %%i in (save.wc) do set giveup=%%i
for /f "tokens=19 delims=;" %%i in (save.wc) do set moon=%%i
for /f "tokens=20 delims=;" %%i in (save.wc) do set mars=%%i
for /f "tokens=21 delims=;" %%i in (save.wc) do set chance=%%i
for /f "tokens=22 delims=;" %%i in (save.wc) do set holeclose=%%i
goto title

:name
cls
echo.
set /p name=你的名字：
goto back

::热身完毕！

:title
cls
color 0f
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                      地球日  第 8 天
echo.
echo.
set /p crown=
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                你从废墟中蒙眬地睁开了双眼
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p crown=
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                    望着黎明深蓝的天空
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p crown=
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                  你却仿佛什么也记不清了
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p crown=
cls

set front=a
set limit=15
call :counter
goto anext

:counter
set nb=0
:return
set /a nb=%nb%+1
set %front%%nb%=□
if %nb% == %limit% goto :eof
goto return

:anext
set a14=∩

set location=2
set adikey=s
set a2=↓
:anext2
set /a alkey=(%location%-1)%%3
set /a arkey=%location%%%3

:aecho
cls
echo.
echo.   废 墟 1
echo.
echo.
echo.
echo.
echo.
echo                         %a1% %a2% %a3%
echo                         %a4% %a5% %a6%
echo                         %a7% %a8% %a9%
echo                         %a10% %a11% %a12%
echo                         %a13% %a14% %a15%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
choice /c wsadebi /n
if %errorlevel% == 5 goto acheck
if %errorlevel% == 6 call :askback
if %errorlevel% == 7 call :asksave

set a%location%=□
if %location% == 14  set a14=∩

if %errorlevel% == 1 set adikey=w&set /a location=%location%-3
if %errorlevel% == 2 set adikey=s&set /a location=%location%+3
if %errorlevel% == 3 set adikey=a
if %errorlevel% == 4 set adikey=d
if %errorlevel% == 3 if not %alkey% == 0 set /a location=%location%-1
if %errorlevel% == 4 if not %arkey% == 0 set /a location=%location%+1
if %location% lss 1 set /a location=%location%+3
if %location% gtr 15 set /a location=%location%-3
set /a alkey=(%location%-1)%%3
set /a arkey=%location%%%3
if %adikey% == w set a%location%=↑
if %adikey% == s set a%location%=↓
if %adikey% == a set a%location%=←
if %adikey% == d set a%location%=→
goto aecho

:acheck
if %location% == 14 set a%location%=□&set front=b&set limit=15&call :counter&goto bnext
goto aecho

:bnext
set b7=∩

set location=2
set b2=↓
set bdikey=s
:bnext2
set /a blkey=(%location%-1)%%3
set /a brkey=%location%%%3

:becho
cls
echo.
echo.   废 墟 2
echo.
echo.
echo.
echo.
echo.
echo                         %b1% %b2% %b3%
echo                         %b4% %b5% %b6%
echo                         %b7% %b8% %b9%
echo                         %b10% %b11% %b12%
echo                         %b13% %b14% %b15%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
choice /c wsadebi /n
if %errorlevel% == 5 goto bcheck
if %errorlevel% == 6 call :askback
if %errorlevel% == 7 call :asksave

set b%location%=□
if %location% == 7 set b7=∩

if %errorlevel% == 1 set bdikey=w&set /a location=%location%-3
if %errorlevel% == 2 set bdikey=s&set /a location=%location%+3
if %errorlevel% == 3 set bdikey=a
if %errorlevel% == 4 set bdikey=d
if %errorlevel% == 3 if not %blkey% == 0 set /a location=%location%-1
if %errorlevel% == 4 if not %brkey% == 0 set /a location=%location%+1
if %location% lss 1 set /a location=%location%+3
if %location% gtr 15 set /a location=%location%-3
set /a blkey=(%location%-1)%%3
set /a brkey=%location%%%3
if %bdikey% == w set b%location%=↑
if %bdikey% == s set b%location%=↓
if %bdikey% == a set b%location%=←
if %bdikey% == d set b%location%=→
goto becho

:bcheck
if %location% == 7 set front=c&set limit=15&call :counter&goto cnext
if %location% == 2 set location=14&set a14=↑&goto anext2
goto becho

:cnext
set c14=∩

set location=9
set c9=←
set cdikey=a
:cnext2
color 0f
set /a clkey=(%location%-1)%%3
set /a crkey=%location%%%3

:cecho
cls
echo.
echo.   废 墟 3
echo.
echo.
echo.
echo.
echo.
echo                         %c1% %c2% %c3%
echo                         %c4% %c5% %c6%
echo                         %c7% %c8% %c9%
echo                         %c10% %c11% %c12%
echo                         %c13% %c14% %c15%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
choice /c wsadebi /n
if %errorlevel% == 5 goto ccheck
if %errorlevel% == 6 call :askback
if %errorlevel% == 7 call :asksave

set c%location%=□
if %location% == 14 set c14=∩

if %errorlevel% == 1 set cdikey=w&set /a location=%location%-3
if %errorlevel% == 2 set cdikey=s&set /a location=%location%+3
if %errorlevel% == 3 set cdikey=a
if %errorlevel% == 4 set cdikey=d
if %errorlevel% == 3 if not %clkey% == 0 set /a location=%location%-1
if %errorlevel% == 4 if not %crkey% == 0 set /a location=%location%+1
if %location% lss 1 set /a location=%location%+3
if %location% gtr 15 set /a location=%location%-3
set /a clkey=(%location%-1)%%3
set /a crkey=%location%%%3
if %cdikey% == w set c%location%=↑
if %cdikey% == s set c%location%=↓
if %cdikey% == a set c%location%=←
if %cdikey% == d set c%location%=→
goto cecho

:ccheck
if %location% == 14 set front=d&set limit=55&call :counter&goto dnext
if %location% == 9 set location=7&set b7=→&goto bnext2
goto cecho

:dnext
set location=6
set d6=↓
set d2=∩
set d10=∩
set d33=∩
set d50=∩
set ddikey=s
:dnext2
color 8f
set /a dlkey=(%location%-1)%%11
set /a drkey=%location%%%11

:decho
cls
echo.
echo.   地 球 遗 址
echo.
echo.
echo.
echo.
echo.
echo             %d1% %d2% %d3% %d4% %d5% %d6% %d7% %d8% %d9% %d10% %d11%
echo             %d12% %d13% %d14% %d15% %d16% %d17% %d18% %d19% %d20% %d21% %d22%
echo             %d23% %d24% %d25% %d26% %d27% %d28% %d29% %d30% %d31% %d32% %d33%
echo             %d34% %d35% %d36% %d37% %d38% %d39% %d40% %d41% %d42% %d43% %d44%
echo             %d45% %d46% %d47% %d48% %d49% %d50% %d51% %d52% %d53% %d54% %d55%                             
echo.
echo.
echo.
echo.
choice /c wsadebi /n
if %errorlevel% == 5 goto dcheck
if %errorlevel% == 6 call :askback
if %errorlevel% == 7 call :asksave
set d%location%=□
if %location% == 2 set d%location%=∩
if %location% == 6 set d%location%=∩
if %location% == 10 set d%location%=∩
if %location% == 33 set d%location%=∩
if %location% == 50 set d%location%=∩
if %errorlevel% == 1 set ddikey=w&set /a location=%location%-11
if %errorlevel% == 2 set ddikey=s&set /a location=%location%+11
if %errorlevel% == 3 set ddikey=a
if %errorlevel% == 4 set ddikey=d
if %errorlevel% == 3 if not %dlkey% == 0 set /a location=%location%-1
if %errorlevel% == 4 if not %drkey% == 0 set /a location=%location%+1
if %errorlevel% == 3 if %dlkey% == 0 set /a location=%location%+10
if %errorlevel% == 4 if %drkey% == 0 set /a location=%location%-10
if %location% lss 1 set /a location=%location%+55
if %location% gtr 55 set /a location=%location%-55
set /a dlkey=(%location%-1)%%11
set /a drkey=%location%%%11
if %ddikey% == w set d%location%=↑
if %ddikey% == s set d%location%=↓
if %ddikey% == a set d%location%=←
if %ddikey% == d set d%location%=→
goto decho

:dcheck
if %location% == 2 set front=e&set limit=25&call :counter&goto enext
if %location% == 10 set front=f&set limit=45&call :counter&goto fnext
if %location% == 33 set front=g&set limit=9&call :counter&goto gnext
if %location% == 50 set front=h&set limit=25&call :counter&goto hnext
if %location% == 6 set location=14&set c14=↑&goto cnext2
goto decho

:enext
set location=23
set e23=↑
set e6=⊙
set e7=⊙
set e10=⊙
set e17=⊙
set e19=⊙
set e20=⊙
set e3=∩
set edikey=w
:enext2
color 0f
set /a elkey=(%location%-1)%%5
set /a erkey=%location%%%5

:eecho
cls
echo.
echo.   机 器 人 专 卖 店
echo.
echo.
echo.
echo.
echo.
echo.
echo                      %e1% %e2% %e3% %e4% %e5%
echo                      %e6% %e7% %e8% %e9% %e10%
echo                      %e11% %e12% %e13% %e14% %e15%
echo                      %e16% %e17% %e18% %e19% %e20%
echo                      %e21% %e22% %e23% %e24% %e25%  
echo.
echo.
echo.
echo.
echo.
echo.
choice /c wsadebi /n
if %errorlevel% == 5 goto echeck
if %errorlevel% == 6 call :askback
if %errorlevel% == 7 call :asksave
set e%location%=□
if %location% == 6 set e%location%=⊙
if %location% == 7 set e%location%=⊙
if %location% == 10 set e%location%=⊙
if %location% == 17 set e%location%=⊙
if %location% == 19 set e%location%=⊙
if %location% == 20 set e%location%=⊙
if %location% == 3 set e%location%=∩
if %errorlevel% == 1 set edikey=w&set /a location=%location%-5
if %errorlevel% == 2 set edikey=s&set /a location=%location%+5
if %errorlevel% == 3 set edikey=a
if %errorlevel% == 4 set edikey=d
if %errorlevel% == 3 if not %elkey% == 0 set /a location=%location%-1
if %errorlevel% == 4 if not %erkey% == 0 set /a location=%location%+1
if %location% lss 1 set /a location=%location%+5
if %location% gtr 25 set /a location=%location%-5
set /a elkey=(%location%-1)%%5
set /a erkey=%location%%%5
if %edikey% == w set e%location%=↑
if %edikey% == s set e%location%=↓
if %edikey% == a set e%location%=←
if %edikey% == d set e%location%=→
goto eecho

:echeck
if %location% == 6 set person=%name%&set msg=这个机器人少了头部. . .&call :msgbox
if %location% == 7 set person=%name%&set msg=这个机器人缺了身体. . .&call :msgbox
if %location% == 10 set person=%name%&set msg=里面的电线烧断了好多. . .&call :msgbox
if %location% == 17 set person=%name%&set msg=可以看到它完全生锈了. . .&call :msgbox
if %location% == 19 set person=%name%&set msg=看起来完好无损却开不了机. . .&call :msgbox
if %location% == 20 set person=%name%&set msg=只是一个衣架. . .&call :msgbox
if %location% == 3 set front=i&set limit=15&call :counter&goto inext
if %location% == 23 set location=2&set d2=↓&goto dnext2
goto eecho

:msgbox
cls
echo.
echo %person%
echo.
echo %msg%
set /p clown=
goto :eof

:inext
set location=13
set i13=↑
set i3=⊙
if %gear% == 0 set i2=※
set idikey=w
:inext2
color 06
set /a ilkey=(%location%-1)%%5
set /a irkey=%location%%%5

:iecho
if %wake% == 0 if %gear2% == 1 if %petrol2% == 1 goto wake
if %wake% == 1 set /a step=%step%+1
cls
echo.
echo.   里 屋
echo.
echo.
echo.
echo.
echo.
echo.
echo                      %i1% %i2% %i3% %i4% %i5%
echo                      %i6% %i7% %i8% %i9% %i10%
echo                      %i11% %i12% %i13% %i14% %i15%  
echo.
echo.
echo.
echo.
echo.
echo.
echo.
choice /c wsadebi /n
if %errorlevel% == 5 goto icheck
if %errorlevel% == 6 call :askback
if %errorlevel% == 7 call :asksave
set i%location%=□
if %location% == 3 set i%location%=⊙
if %gear% == 0 if %location% == 2 set i%location%=※
if %errorlevel% == 1 set idikey=w&set /a location=%location%-5
if %errorlevel% == 2 set idikey=s&set /a location=%location%+5
if %errorlevel% == 3 set idikey=a
if %errorlevel% == 4 set idikey=d
if %errorlevel% == 3 if not %ilkey% == 0 set /a location=%location%-1
if %errorlevel% == 4 if not %irkey% == 0 set /a location=%location%+1
if %location% lss 1 set /a location=%location%+5
if %location% gtr 15 set /a location=%location%-5
set /a ilkey=(%location%-1)%%5
set /a irkey=%location%%%5
if %idikey% == w set i%location%=↑
if %idikey% == s set i%location%=↓
if %idikey% == a set i%location%=←
if %idikey% == d set i%location%=→
goto iecho

:icheck
if %wake% == 0 if %location% == 3 if %chip% == 0 goto encounter
if %location% == 3 if %chip% == 1 set person=旁 白&set msg=许欢将她的灵魂托付给你，希望你能顺利. . .&call :msgbox
if %wake% == 1 if %location% == 3 if %chip% == 0 goto question
if %location% == 13 set location=3&set e3=↓&goto enext2
if %gear2% == 0 if %location% == 2 set person=旁 白&set msg=你获得一个齿轮&set gear=1&call :msgbox
goto iecho

:encounter
set person=%name%
set msg=机体的边缘处印刻着“中国制造   2 0 2 9”,整体来看还算保养得挺好。
call :msgbox
set msg=是一个女孩子的形象呢. . .(*v*)
call :msgbox
set msg=可唯一奇怪的是，这么古老的机器人，为什么被保存得这么完好？还被精心地放置在特殊的里屋里？(U_U)
call :msgbox
if %gear% == 1 if %gear2% == 0 call :gear
if %petrol% == 1 if %petrol2% == 0 goto petrol
goto iecho

:gear
set choice1=《
set choice2=·
:gear2
cls
echo.
echo 将齿轮放进去吗？
echo.
echo 好的%choice1%
echo 不要%choice2%
echo.
choice /c wse /n
if %errorlevel% == 3 goto check3
if %choice1% == 《 set choice1=·&set choice2=《&goto gear2
if %choice2% == 《 set choice2=·&set choice1=《&goto gear2

:check3
if %choice1% == 《 set gear2=1&goto iecho
if %choice2% == 《 goto :eof

:petrol
set choice1=《
set choice2=·
:petrol2
cls
echo.
echo 将汽油倒进去吗？
echo.
echo 好的%choice1%
echo 不要%choice2%
echo.
choice /c wse /n
if %errorlevel% == 3 goto check6
if %choice1% == 《 set choice1=·&set choice2=《&goto petrol2
if %choice2% == 《 set choice2=·&set choice1=《&goto petrol2

:check6
if %choice1% == 《 set petrol2=1&set petrol=0&goto iecho
if %choice2% == 《 goto iecho

:fnext
set location=41
set f41=↑
set f6=◆
set f11=◆
set f16=◆
set f35=◆
set fdikey=w
:fnext2
color 0f
set /a flkey=(%location%-1)%%5
set /a frkey=%location%%%5

:fecho
cls
echo.
echo.   图 书 馆
echo.
echo.
echo.
echo.
echo.
echo.
echo                %f1% %f2% %f3% %f4% %f5% %f6% %f7% %f8% %f9%
echo                %f10% %f11% %f12% %f13% %f14% %f15% %f16% %f17% %f18%
echo                %f19% %f20% %f21% %f22% %f23% %f24% %f25% %f26% %f27%
echo                %f28% %f29% %f30% %f31% %f32% %f33% %f34% %f35% %f36%
echo                %f37% %f38% %f39% %f40% %f41% %f42% %f43% %f44% %f45%
echo.
echo.
echo.
echo.
echo.
echo.
choice /c wsadebi /n
if %errorlevel% == 5 goto fcheck
if %errorlevel% == 6 call :askback
if %errorlevel% == 7 call :asksave
set f%location%=□
if %location% == 6 set f%location%=◆
if %location% == 16 set f%location%=◆
if %location% == 11 set f%location%=◆
if %location% == 35 set f%location%=◆
if %errorlevel% == 1 set fdikey=w&set /a location=%location%-9
if %errorlevel% == 2 set fdikey=s&set /a location=%location%+9
if %errorlevel% == 3 set fdikey=a
if %errorlevel% == 4 set fdikey=d
if %errorlevel% == 3 if not %flkey% == 0 set /a location=%location%-1
if %errorlevel% == 4 if not %frkey% == 0 set /a location=%location%+1
if %location% lss 1 set /a location=%location%+9
if %location% gtr 45 set /a location=%location%-9
set /a flkey=(%location%-1)%%9
set /a frkey=%location%%%9
if %fdikey% == w set f%location%=↑
if %fdikey% == s set f%location%=↓
if %fdikey% == a set f%location%=←
if %fdikey% == d set f%location%=→
goto fecho

:fcheck
if %location% == 6 goto book1
if %location% == 11 goto book2
if %location% == 16 goto book3
if %location% == 35 goto book4
if %location% == 41 set location=10&set d10=↓&goto dnext2
goto fecho

:book1
cls
echo.
echo 掉页中写道：
echo.
echo       . . .自此，"黎明计划"告一段落，人类文明以另一种独特的方式继续存在于地球. . .
echo.
set /p clown=
cls
echo.
echo %name%：所以说人类已经离开地球了？？？（@_@）
echo.
set /p clown=
goto fecho

:book2
cls
echo.
echo 掉页中写道：
echo.
echo       . . .难以想象的是，它竟然开始说话了！我们尽管好奇，却从来也没有如此期待过. . .
echo.
set /p clown=
goto fecho

:book3
cls
echo.
echo 掉页中写道：
echo.
echo       . . .要我说，还是约翰·葛瑞本的那句老话："混沌导致复杂，复杂开启生命。"
echo.
set /p clown=
goto fecho

:book4
cls
echo.
echo 掉页中写道：
echo.
echo       “妈妈，我好害怕. . .”
echo.
echo       “傻孩子，不用怕，只要我们赶紧离开地球，就不会有事了。”
echo.
echo       “可是妈妈，你看它们飞得这么快. . .”
echo.
echo       “妈妈. . .”
echo.
echo       “妈妈？”
echo.
echo       “妈妈！”
echo.
echo         天空中又多了一朵绽放的花，无比地耀眼. . .
echo.
set /p clown=
cls
echo.
echo %name%：噢. . .真是一个悲惨的故事. . .（ToT）
echo.
set /p clown=
goto fecho

:hnext
set location=3
set h3=↓
set h11=∩
set h15=∩
set h23=∩
set h13=●
set hdikey=s
:hnext2
color 0f
set /a hlkey=(%location%-1)%%5
set /a hrkey=%location%%%5

:hecho
cls
echo.
echo.   公 园
echo.
echo.
echo.
echo.
echo.
echo.
echo                      %h1% %h2% %h3% %h4% %h5%
echo                      %h6% %h7% %h8% %h9% %h10%
echo                      %h11% %h12% %h13% %h14% %h15%
echo                      %h16% %h17% %h18% %h19% %h20%
echo                      %h21% %h22% %h23% %h24% %h25%  
echo.
echo.
echo.
echo.
echo.
echo.
choice /c wsadebi /n
if %errorlevel% == 5 goto hcheck
if %errorlevel% == 6 call :askback
if %errorlevel% == 7 call :asksave
set h%location%=□
if %location% == 11 set h%location%=∩
if %location% == 15 set h%location%=∩
if %location% == 23 set h%location%=∩
if %location% == 13 set h%location%=●
if %errorlevel% == 1 set hdikey=w&set /a location=%location%-5
if %errorlevel% == 2 set hdikey=s&set /a location=%location%+5
if %errorlevel% == 3 set hdikey=a
if %errorlevel% == 4 set hdikey=d
if %errorlevel% == 3 if not %hlkey% == 0 set /a location=%location%-1
if %errorlevel% == 4 if not %hrkey% == 0 set /a location=%location%+1
if %location% lss 1 set /a location=%location%+5
if %location% gtr 25 set /a location=%location%-5
set /a hlkey=(%location%-1)%%5
set /a hrkey=%location%%%5
if %hdikey% == w set h%location%=↑
if %hdikey% == s set h%location%=↓
if %hdikey% == a set h%location%=←
if %hdikey% == d set h%location%=→
goto hecho

:hcheck
if %location% == 13 goto model
if %location% == 3 set location=50&set a50=↑&goto dnext2
if %location% == 23 set front=l&set limit=9&call :counter&goto lnext
if %location% == 11 set front=j&set limit=9&call :counter&goto jnext
if %location% == 15 set front=k&set limit=9&call :counter&goto knext
goto hecho

:model
set person=%name%
set msg=一座很普通的雕像啊。
call :msgbox
set /a randomkey=%random%%%3
if %randomkey% == 0 goto rs
goto hecho

:rs
set person=%name%
set msg=诶？等等！这里刻着几行字！
call :msgbox
cls
echo.
echo 上面写着：
echo.
echo 虫洞：
echo.
echo 地球到月球的距离
echo 月球到火星的距离
echo.
set /p clown=
cls
set msg=这到底是什么意思呢?
call :msgbox
goto hecho

:jnext
set location=6
set j6=←
set /a randomkey=%random%%%10
if %randomkey% == 0 set j4=∩
set jdikey=a
:jnext2
set /a jlkey=(%location%-1)%%3
set /a jrkey=%location%%%3

:jecho
cls
echo.
echo.   公 园 左 苑
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                         %j1% %j2% %j3%
echo                         %j4% %j5% %j6%
echo                         %j7% %j8% %j9%
echo.  
echo.
echo.
echo.
echo.
echo.
echo.
choice /c wsadebi /n
if %errorlevel% == 5 goto jcheck
if %errorlevel% == 6 call :askback
if %errorlevel% == 7 call :asksave
set j%location%=□
if %randomkey% == 0 if %location% == 4 set j%location%=∩
if %errorlevel% == 1 set jdikey=w&set /a location=%location%-3
if %errorlevel% == 2 set jdikey=s&set /a location=%location%+3
if %errorlevel% == 3 set jdikey=a
if %errorlevel% == 4 set jdikey=d
if %errorlevel% == 3 if not %jlkey% == 0 set /a location=%location%-1
if %errorlevel% == 4 if not %jrkey% == 0 set /a location=%location%+1
if %location% lss 1 set /a location=%location%+3
if %location% gtr 9 set /a location=%location%-3
set /a jlkey=(%location%-1)%%3
set /a jrkey=%location%%%3
if %jdikey% == w set j%location%=↑
if %jdikey% == s set j%location%=↓
if %jdikey% == a set j%location%=←
if %jdikey% == d set j%location%=→
goto jecho

:jcheck
if %randomkey% == 0 if %location% == 4 set front=m&set limit=9&call :counter&goto mnext
if %location% == 6 set location=11&set h11=→&goto hnext2
goto jecho

:knext
set location=4
set k4=→
set k6=∩
set kdikey=d
:knext2
color 0f
set /a klkey=(%location%-1)%%3
set /a krkey=%location%%%3

:kecho
cls
echo.
echo.   公 园 右 苑
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                         %k1% %k2% %k3%
echo                         %k4% %k5% %k6%
echo                         %k7% %k8% %k9%
echo.  
echo.
echo.
echo.
echo.
echo.
echo.
choice /c wsadebi /n
if %errorlevel% == 5 goto kcheck
if %errorlevel% == 6 call :askback
if %errorlevel% == 7 call :asksave
set k%location%=□
if %location% == 6 set k%location%=∩
if %errorlevel% == 1 set kdikey=w&set /a location=%location%-3
if %errorlevel% == 2 set kdikey=s&set /a location=%location%+3
if %errorlevel% == 3 set kdikey=a
if %errorlevel% == 4 set kdikey=d
if %errorlevel% == 3 if not %klkey% == 0 set /a location=%location%-1
if %errorlevel% == 4 if not %krkey% == 0 set /a location=%location%+1
if %location% lss 1 set /a location=%location%+3
if %location% gtr 9 set /a location=%location%-3
set /a klkey=(%location%-1)%%3
set /a krkey=%location%%%3
if %kdikey% == w set k%location%=↑
if %kdikey% == s set k%location%=↓
if %kdikey% == a set k%location%=←
if %kdikey% == d set k%location%=→
goto kecho

:kcheck
if %location% == 4 set location=15&set h15=←&goto hnext2
if %location% == 6 set front=n&set limit=30&call :counter&goto nnext
goto kecho

:lnext
set location=2
set l2=↓
set ldikey=s
set l7=◆
:lnext2
set /a llkey=(%location%-1)%%3
set /a lrkey=%location%%%3

:lecho
cls
echo.
echo.   公 园 后 苑
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                         %l1% %l2% %l3%
echo                         %l4% %l5% %l6%
echo                         %l7% %l8% %l9%
echo.  
echo.
echo.
echo.
echo.
echo.
echo.
choice /c wsadebi /n
if %errorlevel% == 5 goto lcheck
if %errorlevel% == 6 call :askback
if %errorlevel% == 7 call :asksave
set l%location%=□
if %location% == 7 set l%location%=◆
if %errorlevel% == 1 set ldikey=w&set /a location=%location%-3
if %errorlevel% == 2 set ldikey=s&set /a location=%location%+3
if %errorlevel% == 3 set ldikey=a
if %errorlevel% == 4 set ldikey=d
if %errorlevel% == 3 if not %llkey% == 0 set /a location=%location%-1
if %errorlevel% == 4 if not %lrkey% == 0 set /a location=%location%+1
if %location% lss 1 set /a location=%location%+3
if %location% gtr 9 set /a location=%location%-3
set /a llkey=(%location%-1)%%3
set /a lrkey=%location%%%3
if %ldikey% == w set l%location%=↑
if %ldikey% == s set l%location%=↓
if %ldikey% == a set l%location%=←
if %ldikey% == d set l%location%=→
goto lecho

:lcheck
if %location% == 2 set location=23&set h23=↑&goto hnext2
if %location% == 7 goto letter
goto lecho

:letter
set person=%name%
set msg=这里有一张纸。
call :msgbox
set choice1=《
set choice2=·
:letter2
cls
echo.
echo 将纸拿起来看吗？
echo.
echo 好的%choice1%
echo 不要%choice2%
echo.
choice /c wse /n
if %errorlevel% == 3 goto check4
if %choice1% == 《 set choice1=·&set choice2=《&goto letter2
if %choice2% == 《 set choice2=·&set choice1=《&goto letter2

:letter3
cls
echo.
echo 纸上写道：
echo.
echo       距离人类离开地球，已经整整过去5天了呢. . .
echo       然而我被遗忘在这个角落里，也整整5天了呢. . .
echo.
echo.
echo                                    许   欢
echo.
set /p clown=
cls
if %wake% == 0 set msg=难道说，地球上还有其他人(⊙o⊙?!)
if %wake% == 1 set msg=许欢也真是的-_-b
call :msgbox
goto lecho

:check4
if %choice1% == 《 goto letter3
if %choice2% == 《 goto lecho

:mnext
set location=6
set m6=←
set mdikey=a
set m4=♀
:mnext2
set /a mlkey=(%location%-1)%%3
set /a mrkey=%location%%%3

:mecho
cls
echo.
if %underearth% == 1 echo.   地 下 入 口
if %underearth% == 0 echo.   ? ? ?
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                         %m1% %m2% %m3%
echo                         %m4% %m5% %m6%
echo                         %m7% %m8% %m9%
echo.  
echo.
echo.
echo.
echo.
echo.
echo.
choice /c wsadebi /n
if %errorlevel% == 5 goto mcheck
if %errorlevel% == 6 call :askback
if %errorlevel% == 7 call :asksave
set m%location%=□
if %location% == 4 set m%location%=♀
if %errorlevel% == 1 set mdikey=w&set /a location=%location%-3
if %errorlevel% == 2 set mdikey=s&set /a location=%location%+3
if %errorlevel% == 3 set mdikey=a
if %errorlevel% == 4 set mdikey=d
if %errorlevel% == 3 if not %mlkey% == 0 set /a location=%location%-1
if %errorlevel% == 4 if not %mrkey% == 0 set /a location=%location%+1
if %location% lss 1 set /a location=%location%+3
if %location% gtr 9 set /a location=%location%-3
set /a mlkey=(%location%-1)%%3
set /a mrkey=%location%%%3
if %mdikey% == w set m%location%=↑
if %mdikey% == s set m%location%=↓
if %mdikey% == a set m%location%=←
if %mdikey% == d set m%location%=→
goto mecho

:mcheck
if %location% == 6 set location=4&set j23=→&goto jnext2
if %location% == 4 goto ueperson
goto mecho

:ueperson
set choice1=《
set choice2=·
:ueperson2
cls
echo.
echo 地下城守卫
echo.
echo 欢迎光临地下人类庇护所！自从陨石撞击地球后，一部分像我们这样的贫苦人民买不起飞船票，就会来到这里避难。我们只欢迎像您这样的有缘人光临！
set underearth=1
echo.
echo 就到此为止吧%choice1%
echo 啊我待会再来%choice2%
echo.
choice /c wse /n
if %errorlevel% == 3 goto check5
if %choice1% == 《 set choice1=·&set choice2=《&goto ueperson2
if %choice2% == 《 set choice2=·&set choice1=《&goto ueperson2

:check5
if %choice1% == 《 goto ueend
if %choice2% == 《 goto refuse

:refuse
cls
set person=地下城守卫
set msg=OK！期待您的下次光临！
call :msgbox
goto mecho

:ueend
echo 话说，就这样结束了，你是不是有些不甘心？不甘心就继续吧！许欢永远在等着你哦:-D>结局\结_局-地下庇护所.txt
背景音乐\oddend.flac
set person=旁 白
set msg=就这样，你找到了地下城，平安地生活了下去。
call :msgbox
set person=旁 白
set msg=达成结局：地下庇护所
call :msgbox
goto end

:end
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                      游戏制作：问 存
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p crown=
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                      bgm挑选：问 存
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p crown=
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                      游戏检测：问 存
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p crown=
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                      特别鸣谢：许 欢
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p crown=
cls
goto start

:nnext
set location=11
set n11=→
if %petrol% == 0 set n10=■
set ndikey=d
:nnext2
color 06
set /a nlkey=(%location%-1)%%10
set /a nrkey=%location%%%10

:necho
cls
echo.
echo.   防 空 洞
echo.
echo.
echo.
echo.
echo.
echo.
echo             %n1% %n2% %n3% %n4% %n5% %n6% %n7% %n8% %n9% %n10% 
echo             %n11% %n12% %n13% %n14% %n15% %n16% %n17% %n18% %n19% %n20%
echo             %n21% %n22% %n23% %n24% %n25% %n26% %n27% %n28% %n29% %n30%                             
echo.
echo.
echo.
echo.
echo.
choice /c wsadebi /n
if %errorlevel% == 5 goto ncheck
if %errorlevel% == 6 call :askback
if %errorlevel% == 7 call :asksave
set n%location%=□
if %petrol% == 0 if %location% == 10 set n%location%=■
if %errorlevel% == 1 set ndikey=w&set /a location=%location%-10
if %errorlevel% == 2 set ndikey=s&set /a location=%location%+10
if %errorlevel% == 3 set ndikey=a
if %errorlevel% == 4 set ndikey=d
if %errorlevel% == 3 if not %nlkey% == 0 set /a location=%location%-1
if %errorlevel% == 4 if not %nrkey% == 0 set /a location=%location%+1
if %location% lss 1 set /a location=%location%+10
if %location% gtr 30 set /a location=%location%-10
set /a nlkey=(%location%-1)%%10
set /a nrkey=%location%%%10
if %ndikey% == w set n%location%=↑
if %ndikey% == s set n%location%=↓
if %ndikey% == a set n%location%=←
if %ndikey% == d set n%location%=→
goto necho

:ncheck
if %petrol% == 0 if %location% == 10 goto petrol3
if %location% == 11 set location=6&set k6=←&goto knext2
goto necho

:petrol3
set person=%name%
set msg=防空洞里的灯，大概用的就是这里的汽油吧. . .
call :msgbox
set person=旁 白
set msg=你获得一罐汽油
set petrol=1
call :msgbox
goto necho

:wake
if %offer% == 0 set offer=xuhuan
set wake=1
set person=旁 白
set msg=你将齿轮安进了机器人的身体里，又在油箱里倒满汽油，稍等片刻后，机器人发出了"嘀，嘀，嘀"的提示声. . .
call :msgbox
set msg=机器人果然启动了！！
call :msgbox
set msg=只见她逐渐睁开了双眼，好像刚刚睡醒似的。
call :msgbox
set person=机器人
set msg=你. . .你是. . .
call :msgbox
set person=%name%
set msg=呃. . .我叫%name%，很高兴认识你，请问你叫什么名字？
call :msgbox
set person=机器人
set msg=. . . . . .('_')
call :msgbox
set person=许 欢
set msg=en. . .许欢的主人给许欢起的名字叫许欢. . .('v')
call :msgbox
set person=%name%
set msg=你就是在公园里写信的许欢？(/⊙w⊙?)
call :msgbox
set person=许 欢
set msg=没错°v°，许欢前几天突然醒过来，发现许欢一个人躺在公园里。但是许欢好饿，而且又很害怕，所以许欢就用尽最后一丝力气跑回了家里。
call :msgbox
set msg=对了，%name%，谢谢你救了许欢一命，以后有什么想问的可以来找许欢哦*'v'*许欢这边随时都欢迎的呢M*'w'*M
call :msgbox
set person=%name%
set msg=感谢招待'v'！一切都OK的L'_'*
call :msgbox
goto iecho

:question
if %step% gtr 20 goto unchargeed
cls
echo.
echo 可以问的问题有：
echo.
echo 1.什么是“黎明计划”？
echo.
echo 2.你有办法联系到人类吗？
echo.
if %offer% == xuhuan echo 3.你知道哪里还有燃油吗？
if %hole% == 1 echo 3.你知道火星上的虫洞通向哪吗？
if %hole% == 1 echo.
if %agree% == 0 if %hole% == 1 echo 4.你要陪我一起去虫洞吗？
if %agree% == 1 if %hole% == 1 echo 4.走吧，带上你的芯片。
echo.
choice /c 1234b /n /m 要问的问题序号是：
if %errorlevel% == 1 set person=许 欢&set msg=非常抱歉许欢这边也不知道呢TvT&call :msgbox
if %errorlevel% == 2 set person=许 欢&set msg=非常抱歉许欢这边没能接收到任何信号呢O_O&call :msgbox
if %hole% == 1 if %errorlevel% == 3 set person=许 欢&set msg=火星上的虫洞(/⊙v⊙?)噢. . .好像有一部分人类就是从那儿离开的呢，但许欢也不知道它通往哪里qvq&call :msgbox
if %agree% == 0 if %hole% == 1 if %errorlevel% == 4 goto chip
if %agree% == 1 if %hole% == 1 if %errorlevel% == 4 goto getchip
if %offer% == xuhuan if %errorlevel% == 3 set person=许 欢&set msg=上次许欢和博士一起去公园里的防空洞探险时好像看到了一罐汽油呢. . . . . &call :msgbox
if %errorlevel% == 5 goto iecho
goto question

:unchargeed
背景音乐\expresslove.flac
set person=许 欢
if %refuse% == 1 set msg=呜呜. . . .&call :msgbox
set msg=那. . .那个. . .
call :msgbox
set person=%name%
set msg=怎么了？
call :msgbox
set person=许 欢
set msg=如果地球上只剩我们两个，你愿意留下来陪着许欢吗ini
if %hole% == 1 set msg=如果虫洞打开了，你愿意陪着许欢哪都不去吗ini
call :msgbox
set person=旁 白
set msg=(许欢羞红了脸，低下头来,双手紧紧地握在一起)
call :msgbox
set person=许 欢
set msg=哼-'_'-要不是我的能量即将耗尽，我才不会问你呢. . .
call :msgbox
set person=%name%
set msg=啊. . .这. . .让我考虑一下V_V
call :msgbox
set choice1=《
set choice2=·
:consider
cls
echo.
echo 同意许欢的要求吗？
echo.
echo 好的%choice1%
echo 不了%choice2%
echo.
choice /c wse /n
if %errorlevel% == 3 goto check7
if %choice1% == 《 set choice1=·&set choice2=《&goto consider
if %choice2% == 《 set choice2=·&set choice1=《&goto consider

:check7
if %choice1% == 《 goto forever
if %choice2% == 《 set refuse=1&goto iecho

:forever
set person=许 欢
set msg=我就知道你会愿意的！
call :msgbox
set person=旁 白
set msg=(许欢紧紧的扑到你怀里，眼泪不住地流下来. . .)
call :msgbox
set person=旁 白
set msg=可是就在这时，许欢的低电警报铃突然响了起来. . .
call :msgbox
set person=许 欢
set msg=如果. . .如果你真的愿意的话，就把这粒胶囊吞下去吧. . .然后我们的大脑将永远相连。
call :msgbox
set person=旁 白
set msg=说着，许欢从口袋里取出一粒胶囊，颤抖的递给你. . .
call :msgbox
set person=旁 白
set msg=你举起胶囊，透过里屋的黄灯，毫不犹豫地把胶囊吞了下去。渐渐地，你感到越来越累，直接倒在了里屋的地板上. . .
call :msgbox
set person=旁 白
set msg=当你再次醒过来时，你已经躺在一片柔软的草地上了. . .
call :msgbox
set front=o
set limit=100
call :counter
goto onext

:onext
set location=23
set o23=↓
set o34=◆
set o68=◆
set ddikey=s
:onext2
color 2f
set /a olkey=(%location%-1)%%10
set /a orkey=%location%%%10

:oecho
cls
echo.
if %heart% == 0 echo.   虚 拟 世 界
if %heart% == 1 echo.   许 欢 心 里
echo.
echo.
echo.
echo.
echo               %o1% %o2% %o3% %o4% %o5% %o6% %o7% %o8% %o9% %o10%
echo               %o11% %o12% %o13% %o14% %o15% %o16% %o17% %o18% %o19% %o20%
echo               %o21% %o22% %o23% %o24% %o25% %o26% %o27% %o28% %o29% %o30%
echo               %o31% %o32% %o33% %o34% %o35% %o36% %o37% %o38% %o39% %o40%
echo               %o41% %o42% %o43% %o44% %o45% %o46% %o47% %o48% %o49% %o50%
echo               %o51% %o52% %o53% %o54% %o55% %o56% %o57% %o58% %o59% %o60%
echo               %o61% %o62% %o63% %o64% %o65% %o66% %o67% %o68% %o69% %o70%
echo               %o71% %o72% %o73% %o74% %o75% %o76% %o77% %o78% %o79% %o80%
echo               %o81% %o82% %o83% %o84% %o85% %o86% %o87% %o88% %o89% %o90%
echo               %o91% %o92% %o93% %o94% %o95% %o96% %o97% %o98% %o99% %o100%
echo.
echo.
echo.
choice /c wsadebi /n
if %errorlevel% == 5 goto ocheck
if %errorlevel% == 6 call :askback
if %errorlevel% == 7 call :asksave
set o%location%=□
if %location% == 34 set o%location%=◆
if %location% == 68 set o%location%=◆
if %errorlevel% == 1 set odikey=w&set /a location=%location%-10
if %errorlevel% == 2 set odikey=s&set /a location=%location%+10
if %errorlevel% == 3 set odikey=a
if %errorlevel% == 4 set odikey=d
if %errorlevel% == 3 if not %olkey% == 0 set /a location=%location%-1
if %errorlevel% == 4 if not %orkey% == 0 set /a location=%location%+1
if %location% lss 1 set /a location=%location%+10
if %location% gtr 100 set /a location=%location%-10
set /a olkey=(%location%-1)%%10
set /a orkey=%location%%%10
if %odikey% == w set o%location%=↑
if %odikey% == s set o%location%=↓
if %odikey% == a set o%location%=←
if %odikey% == d set o%location%=→
goto oecho

:ocheck
if %location% == 34 goto expresslove
if %location% == 68 goto memory
goto oecho

:expresslove
set heart=1
cls
echo.
echo 这里有一封信，信中写道：
echo.
echo 非常可惜的是，为了能让许欢大脑中的虚拟世界永远地运行下去，许欢不能再耗费其他的能量陪着博士您了呢. . .但只要博士心里想着许欢，许欢就一定会陪在博士身旁。
echo.
echo.
echo                                    by  许 欢
set /p clown=
cls
goto oecho

:memory
背景音乐\memory.flac
cls
echo.
echo                      许 欢 的 记 忆
echo.
echo 2092.9.2
echo 博士发明了许欢，并且还给许欢起了名字（可真是一个好听的名字呢M*'v'*M）
echo.
echo 2092.9.3
echo 许欢的生日被博士刻错了（讨厌'v'连人家生日都会记错的呢）
echo.
echo 2092.9.14
echo 和博士一起玩游戏（许欢这么优秀，完全没有输过呢(*'/'*)）
echo.
echo 2092.9.23
echo 和博士一起去超市买水果，博士给许欢买了水蜜桃味的电池（'w'）
echo.
echo 2092.10.5
echo 和博士一起去防空洞探险，好害怕（'-'?!）
echo.
echo 2092.10.17
echo 在公园里遇到一位怪蜀黍(/'_'?）
echo.
echo 2092.10.26
echo 和博士一起去图书馆看书呢（-'v'-）
echo.
echo 2092.11.9
echo 和博士一起去餐厅吃饭，博士给许欢点了一个巧克力味的电池("-_-)，虽然有点苦，但还是好甜啊*'v'*
echo.
echo 2092.11.30
echo 博士给了我一粒神秘的胶囊，只要吃了它就可以永远地和我活在一起（那如果我自己吃了可以长生不老吗/'灬'?）
echo.
echo 2092.12.2
echo 和博士一起堆雪人，博士堆了一个和许欢长得一模一样的雪人呢-v-
echo.
echo 2092.12.3
echo 博士感冒了，许欢负责照顾博士（博士一定要快快好起来呀L'v'*）
echo.
echo 2092.12.31
echo 博士和许欢在路上被陨石击中，许欢和博士走散了. . .
echo.
echo 地球日  第 5 天 
echo 许欢醒过来了，写了一封信希望有人能看到
echo.
echo 地球日  第 7 天 
echo 许欢终于回到家了，但却依旧找不到博士. . .
echo.
echo 地球日  第 8 天 
echo 博士终于找到许欢了，但好像完全忘记我了QnQ
echo.
echo 地球日  第 9 天 
echo 和博士永远在一起
echo.
set /p clown=
echo 当男主到达了许欢的虚拟世界以后，又会有什么样的精彩故事呢？让我们一起期待《黎明之后2》吧！兑换码：许欢生日>结局\结_局-和博士永远在一起.txt
set person=旁 白
set msg=达成结局：和博士永远在一起
call :msgbox
color 0f
goto end

:chip
set person=许 欢
set msg=好诶M*'v'*M可是. . .飞船好像只有一个位置呀. . .v_v
call :msgbox
if %spark% == 1 goto chip2
goto question

:chip2
set person=%name%
set msg=没有关息哦~你愿意让我带上你的芯片吗？
call :msgbox
set person=许 欢
set msg=对哟*v*那如果你没有什么话想对许欢说的话，就赶紧把许欢的芯片取出来吧L'_'*
call :msgbox
set agree=1
goto question

:getchip
set person=许 欢
set msg=好的呢'v'也请%name%一定要安全抵达哦~
call :msgbox
set chip=1
goto iecho

:rule
cls
echo.
echo 规   则
echo.
echo 按 下 "Enter" 可 以 跳 过 当 前 文 字
echo.
echo 按 下 "W A S D" 可 以 使 人 物 移 动 
echo.
echo 按 下 "F11" 可 以 全 屏 显 示 游 戏
echo.
echo 按 下 "B" 可 以 返 回 上 一 步
echo.
echo 按 下 "E" 可 以 继 续 游 戏
echo.
echo 按 下 "I" 可 以 存 储 进 度
echo.
set /p clown=
cls
goto back

:gnext
set location=4
set g4=→
set g5=▲
set gdikey=d
:gnext2
set /a glkey=(%location%-1)%%3
set /a grkey=%location%%%3

:gecho
color 8f
cls
echo.
echo.   飞 船 残 骸
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                         %g1% %g2% %g3%
echo                         %g4% %g5% %g6%
echo                         %g7% %g8% %g9%
echo.  
echo.
echo.
echo.
echo.
echo.
echo.
choice /c wsadebi /n
if %errorlevel% == 5 goto gcheck
if %errorlevel% == 6 call :askback
if %errorlevel% == 7 call :asksave
set g%location%=□
if %location% == 5 set g%location%=▲
if %errorlevel% == 1 set gdikey=w&set /a location=%location%-3
if %errorlevel% == 2 set gdikey=s&set /a location=%location%+3
if %errorlevel% == 3 set gdikey=a
if %errorlevel% == 4 set gdikey=d
if %errorlevel% == 3 if not %glkey% == 0 set /a location=%location%-1
if %errorlevel% == 4 if not %grkey% == 0 set /a location=%location%+1
if %location% lss 1 set /a location=%location%+3
if %location% gtr 9 set /a location=%location%-3
set /a glkey=(%location%-1)%%3
set /a grkey=%location%%%3
if %gdikey% == w set g%location%=↑
if %gdikey% == s set g%location%=↓
if %gdikey% == a set g%location%=←
if %gdikey% == d set g%location%=→
goto gecho

:gcheck
if %location% == 4 set location=33&set d33=←&goto dnext2
if %location% == 5 goto spaceship
goto gecho

:spaceship
if %petrol3% == 1 goto destination
set person=旁 白
set msg=飞船残骸其实除了表面有被刮花的痕迹外，并没有其他明显的损坏了。
call :msgbox
if %petrol% == 1 goto petrol3
goto gecho

:petrol3
set choice1=《
set choice2=·
:petrol4
cls
echo.
echo 将汽油倒进去吗？
echo.
echo 好的%choice1%
echo 不要%choice2%
echo.
choice /c wse /n
if %errorlevel% == 3 goto check8
if %choice1% == 《 set choice1=·&set choice2=《&goto petrol4
if %choice2% == 《 set choice2=·&set choice1=《&goto petrol4

:check8
if %choice1% == 《 set petrol3=1&set petrol=0&set offer=spaceship&goto giveup
if %choice2% == 《 goto gecho

:destination
set choice1=《
set choice2=·
:destination2
cls
echo.
echo 你要坐飞船去哪？
echo.
echo 月球%choice1%
echo 火星%choice2%
echo.
choice /c wseb /n
if %errorlevel% == 3 goto check9
if %errorlevel% == 4 goto gecho
if %choice1% == 《 set choice1=·&set choice2=《&goto destination2
if %choice2% == 《 set choice2=·&set choice1=《&goto destination2

:check9
if %choice1% == 《 set destination=moon&set difficulty=5
if %choice2% == 《 set destination=mars&set difficulty=15

:pnext
color 0f
set /a power=%power%+1
if %wake% == 1 if %spark% == 0 if %hole% == 1 if %power% gtr 4 call :spark
::这里是这样的，乘坐飞船不少于五次即可获得灵感
set live=3
set liveblock=▲▲▲
:pnext3
set step2=-1
set front=p
set limit=9
call :counter
set location2=8
set p8=▲
:pnext2
set /a plkey=(%location2%-1)%%3
set /a prkey=%location2%%%3

:pecho
set /a step2=%step2%+1
if %step2% == %difficulty% goto %destination%
cls
echo.
echo.   生命值：%liveblock%
echo.
echo.
echo.
echo.
echo.
echo.
echo                         %p1% %p2% %p3%
echo                         %p4% %p5% %p6%
echo                         %p7% %p8% %p9%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
choice /t 1 /c ade /n /d e
if %errorlevel% == 3 goto move
set p%location2%=□
if %errorlevel% == 1 if not %plkey% == 0 set /a location2=%location2%-1
if %errorlevel% == 2 if not %prkey% == 0 set /a location2=%location2%+1
if %location2% lss 1 set /a location2=%location2%+3
if %location2% gtr 15 set /a location2=%location2%-3
set /a plkey=(%location2%-1)%%3
set /a prkey=%location2%%%3
if !p%location2%! == ■ goto die
set p%location2%=▲

:move
set nb=0
:return2
set /a nb=%nb%+1
if !p%nb%! == ■ call :indeed
if %nb% == 9 goto produce
goto return2

:produce
set /a randomkey=%random%%%3+1
if %randomkey% gtr 2 goto recreate
set /a producekey=%random%%%3+1
set p%producekey%=■
goto recreate

:indeed
set p%nb%=□
set midnb=%nb%
set /a nb2=%nb%+3
if %nb2% == %location2% goto die
set z%nb2%=x
set nb=%midnb%
goto :eof

:recreate
set nb=0
:return3
set /a nb=%nb%+1
if !z%nb%! == x set p%nb%=■&set z%nb%=x2
if %nb% == 9 goto pecho
goto return3

:die
set /a live=%live%-1
if %live% == 2 set liveblock=▲▲
if %live% == 1 set liveblock=▲
if %live% == 0 goto accidentend
goto pnext3

:accidentend
echo 不要气馁呀L'_'*许欢一直在等着你哟~>结局\结_局-只是一场意外.txt
背景音乐\accident.flac
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                当你碰到最后一块陨石的时候
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p crown=
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                天空中又多了一朵绽放的花. . .
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p crown=
set person=旁 白
set msg=达成结局：只是一场意外
call :msgbox
goto end

:giveup
set choice1=《
set choice2=·
:giveup2
cls
echo.
echo 用剩的空汽油罐可能会影响到飞船的驾驶，要将空汽油罐丢弃吗？
echo.
echo 好的%choice1%
echo 不要%choice2%
echo.
choice /c wse /n
if %errorlevel% == 3 goto check10
if %choice1% == 《 set choice1=·&set choice2=《&goto giveup2
if %choice2% == 《 set choice2=·&set choice1=《&goto giveup2

:check10
if %choice1% == 《 set giveup=1&goto gecho
if %choice2% == 《 goto gecho

:spark
set person=旁 白
set msg=你走上飞船，无意间产生了一个能带许欢一起离开地球的方法. . .
call :msgbox
set spark=1
goto :eof

:moon
if %moon%  == 0 call :moonbeginer
set front=q
set limit=49
call :counter
:qnext
set location=22
set q22=→
set q25=∩
set qdikey=d
:qnext2
set /a qlkey=(%location%-1)%%7
set /a qrkey=%location%%%7

:qecho
cls
echo.
echo.   月 球 遗 址
echo.
echo.
echo.
echo.
echo.
echo                   %q1% %q2% %q3% %q4% %q5% %q6% %q7%
echo                   %q8% %q9% %q10% %q11% %q12% %q13% %q14% 
echo                   %q15% %q16% %q17% %q18% %q19% %q20% %q21% 
echo                   %q22% %q23% %q24% %q25% %q26% %q27% %q28% 
echo                   %q29% %q30% %q31% %q32% %q33% %q34% %q35% 
echo                   %q36% %q37% %q38% %q39% %q40% %q41% %q42% 
echo                   %q43% %q44% %q45% %q46% %q47% %q48% %q49% 
echo.  
echo.
echo.
echo.
echo.
choice /c wsadeb /n
if %errorlevel% == 5 goto qcheck
if %errorlevel% == 6 call :askback
set q%location%=□
if %location% == 25 set q%location%=∩
if %location% == 22 set q%location%=▲
if %errorlevel% == 1 set qdikey=w&set /a location=%location%-7
if %errorlevel% == 2 set qdikey=s&set /a location=%location%+7
if %errorlevel% == 3 set qdikey=a
if %errorlevel% == 4 set qdikey=d
if %errorlevel% == 3 if not %qlkey% == 0 set /a location=%location%-1
if %errorlevel% == 4 if not %qrkey% == 0 set /a location=%location%+1
if %errorlevel% == 3 if %qlkey% == 0 set /a location=%location%+6
if %errorlevel% == 4 if %qrkey% == 0 set /a location=%location%-6
if %location% lss 1 set /a location=%location%+49
if %location% gtr 49 set /a location=%location%-49
set /a qlkey=(%location%-1)%%7
set /a qrkey=%location%%%7
if %qdikey% == w set q%location%=↑
if %qdikey% == s set q%location%=↓
if %qdikey% == a set q%location%=←
if %qdikey% == d set q%location%=→
goto qecho

:qcheck
if %location% == 22 goto destination3
if %location% == 25 set front=r&set limit=30&call :counter&goto rnext 
goto qecho

:moonbeginer
set moon=1
set person=旁 白
set msg=经过长途跋涉，你终于来到了月球. . .
call :msgbox
set person=%name%
set msg=看来作为卫星的月球也几乎是面目全非了呢v_v
call :msgbox
goto :eof

:rnext
set location=20
set r20=←
set r21=∏
set rdikey=a
:rnext2
set /a rlkey=(%location%-1)%%10
set /a rrkey=%location%%%10

:recho
cls
echo.
echo.   废 弃 矿 井
echo.
echo.
echo.
echo.
echo.
echo.
echo             %r1% %r2% %r3% %r4% %r5% %r6% %r7% %r8% %r9% %r10% 
echo             %r11% %r12% %r13% %r14% %r15% %r16% %r17% %r18% %r19% %r20%
echo             %r21% %r22% %r23% %r24% %r25% %r26% %r27% %r28% %r29% %r30%                             
echo.
echo.
echo.
echo.
echo.
choice /c wsadeb /n
if %errorlevel% == 5 goto rcheck
if %errorlevel% == 6 call :askback
set r%location%=□
if %location% == 21 set r%location%=∏
if %errorlevel% == 1 set rdikey=w&set /a location=%location%-10
if %errorlevel% == 2 set rdikey=s&set /a location=%location%+10
if %errorlevel% == 3 set rdikey=a
if %errorlevel% == 4 set rdikey=d
if %errorlevel% == 3 if not %rlkey% == 0 set /a location=%location%-1
if %errorlevel% == 4 if not %rrkey% == 0 set /a location=%location%+1
if %location% lss 1 set /a location=%location%+10
if %location% gtr 30 set /a location=%location%-10
set /a rlkey=(%location%-1)%%10
set /a rrkey=%location%%%10
if %rdikey% == w set r%location%=↑
if %rdikey% == s set r%location%=↓
if %rdikey% == a set r%location%=←
if %rdikey% == d set r%location%=→
goto recho

:rcheck
if %petrol% == 0 if %location% == 21 goto oilprovide
if %petrol% == 1 if %location% == 21 set person=%name%&set msg=已经没汽油了. . .&call :msgbox
if %location% == 20 set location=25&set q25=←&goto qnext2
goto recho

:oilprovide
set person=%name%
set msg=这是以前矿井里的工人用的汽油供给管，或许我可以从里面取一些汽油。
call :msgbox
if %giveup% == 1 set msg=要是我当时没有把用剩的汽油箱扔掉就好了. . .&call :msgbox&goto recho
set petrol=1
set person=旁 白
set msg=你获得一罐汽油
call :msgbox
goto recho

:destination3
set choice1=《
set choice2=·
:destination4
cls
echo.
echo 你要坐飞船去哪？
echo.
echo 地球%choice1%
echo 火星%choice2%
echo.
choice /c wseb /n
if %errorlevel% == 3 goto check11
if %errorlevel% == 4 goto qecho
if %choice1% == 《 set choice1=·&set choice2=《&goto destination4
if %choice2% == 《 set choice2=·&set choice1=《&goto destination4

:check11
if %choice1% == 《 set location=5&set g5=←&set destination=gnext2&set difficulty=5
if %choice2% == 《 set destination=mars&set difficulty=10
goto pnext

:mars
if %mars%  == 0 call :marsbeginer
set front=s
set limit=54
call :counter
:snext
set location=46
set s46=→
set s32=∩
set sdikey=d
:snext2
set /a slkey=(%location%-1)%%9
set /a srkey=%location%%%9

:secho
cls
echo.
echo.   火 星（侧视图）
echo.
echo.
echo.
echo.
echo.
echo                %s1% %s2% %s3% %s4% %s5% %s6% %s7% %s8% %s9%
echo                %s10% %s11% %s12% %s13% %s14% %s15% %s16% %s17% %s18% 
echo                %s19% %s20% %s21% %s22% %s23% %s24% %s25% %s26% %s27% 
echo                %s28% %s29% %s30% %s31% %s32% %s33% %s34% %s35% %s36% 
echo                %s37% %s38% %s39% %s40% %s41% %s42% %s43% %s44% %s45% 
echo                %s46% %s47% %s48% %s49% %s50% %s51% %s52% %s53% %s54%
echo.  
echo.
echo.
echo.
echo.
choice /c wadeb /n
if %errorlevel% == 4 goto scheck
if %errorlevel% == 5 call :askback
set s%location%=□
if %location% == 46 set s%location%=▲
if %location% == 32 set s%location%=∩
if %errorlevel% == 1 set change=0&set updown=up&goto jumb
if %errorlevel% == 2 set sdikey=a
if %errorlevel% == 3 set sdikey=d
if not %location% == 32 if %errorlevel% == 2 if not %slkey% == 0 set /a location=%location%-1
if not %location% == 32 if %errorlevel% == 3 if not %srkey% == 0 set /a location=%location%+1
if %errorlevel% == 2 if %slkey% == 0 set /a location=%location%+8
if %errorlevel% == 3 if %srkey% == 0 set /a location=%location%-8
if %location% lss 1 set /a location=%location%+9
if %location% gtr 54 set /a location=%location%-9
set /a slkey=(%location%-1)%%9
set /a srkey=%location%%%9
if %sdikey% == a set s%location%=←
if %sdikey% == d set s%location%=→
goto secho

:scheck
if %location% == 46 goto destination5
if %location% == 32 goto reachhole 
goto secho

:marsbeginer
set mars=1
set person=旁 白
set msg=刚来到火星，头顶上漆黑的一片吸引了你的注意力. . .
call :msgbox
set person=旁 白
set msg=你抬头一看，愣住了. . .
call :msgbox
set person=%name%
set msg=这. . .这好像是虫洞诶'o'
call :msgbox
set person=旁 白
set msg=（你决定上去看看）
call :msgbox
set person=旁 白
set msg=注意：选好方向起跳
call :msgbox
goto :eof

:destination5
set choice1=《
set choice2=·
:destination6
cls
echo.
echo 你要坐飞船去哪？
echo.
echo 地球%choice1%
echo 月球%choice2%
echo.
choice /c wseb /n
if %errorlevel% == 3 goto check12
if %errorlevel% == 4 goto secho
if %choice1% == 《 set choice1=·&set choice2=《&goto destination6
if %choice2% == 《 set choice2=·&set choice1=《&goto destination6

:check12
if %choice1% == 《 set location=5&set g5=←&set destination=gnext2&set difficulty=15
if %choice2% == 《 set location=22&set q22=→&set destination=qnext2&set difficulty=10
goto pnext

:jumb
set /a y=%location%/9+1
if %location% == 54 set y=6
set /a x=%location%%%9
if %x% == 0 set x=9
:foresee
if %sdikey% == a set /a x=%x%-1
if %sdikey% == d set /a x=%x%+1
if %x% lss 1 set /a x=%x%+9
if %x% gtr 9 set /a x=%x%-9
if %updown% == up set /a y=%y%-1
if %updown% == down set /a y=%y%+1
if %y% lss 1 set /a y=%y%+2&set updown=down&set change=1
if %sdikey% == a if %y% gtr 6 set /a y=%y%-1&set updown=up&set /a x=%x%+1
if %sdikey% == d if %y% gtr 6 set /a y=%y%-1&&set updown=up&call :twogtrpredict
set /a nextlocation=(%y%-1)*9+%x%
if %sdikey% == d if %updown% == up if %nextlocation% == 32 set /a x=%x%-1&set /a y=%y%+2&set change=1
if %sdikey% == a if %updown% == up if %nextlocation% == 32 set /a x=%x%+1&set /a y=%y%+2&set change=1
if %updown% == down if %location% == 32 goto set
set /a location=(%y%-1)*9+%x%
set /a slkey=(%location%-1)%%9
set /a srkey=%location%%%9
if %sdikey% == a set s%location%=←
if %sdikey% == d set s%location%=→
cls
echo.
echo.   火 星（侧视图）
echo.
echo.
echo.
echo.
echo.
echo                %s1% %s2% %s3% %s4% %s5% %s6% %s7% %s8% %s9%
echo                %s10% %s11% %s12% %s13% %s14% %s15% %s16% %s17% %s18% 
echo                %s19% %s20% %s21% %s22% %s23% %s24% %s25% %s26% %s27% 
echo                %s28% %s29% %s30% %s31% %s32% %s33% %s34% %s35% %s36% 
echo                %s37% %s38% %s39% %s40% %s41% %s42% %s43% %s44% %s45% 
echo                %s46% %s47% %s48% %s49% %s50% %s51% %s52% %s53% %s54%
echo.  
echo.
echo.
echo.
echo.
set nb2=0
:delay
set /a nb2=%nb2%+1
if not %nb2% == 10 goto delay
:goon
if %change% == 1 if %updown% == up goto secho
set s%location%=□
if %location% == 32 set s%location%=∩
if %location% == 46 set s%location%=▲
goto foresee

:set
if %sdikey% == a set s%location%=←
if %sdikey% == d set s%location%=→
goto secho

:twogtrpredict
if %x% == 1 set /a x=%x%+9
set /a x=%x%-1
goto :eof

:reachhole
if %chance% == 0 goto holeclose
set hole=1
set pw1=0
set pw2=0
set pw3=0
set behind=1
set person=%name%
set msg=这果然是一个虫洞呢. . .
call :msgbox
set person=%name%
set msg=什么啊？！竟然还要输入密码？！
call :msgbox
:input
color 0f
if %behind% == 4 goto pwcheck
cls
echo.
echo 请输入密码(你还剩%chance%次机会)：
echo.
echo.
echo.
echo.
echo.
echo                        %pw1%   %pw2%   %pw3%
echo.
echo                        ①  ②  ③
echo.
echo                        ④  ⑤  ⑥
echo.
echo                        ⑦  ⑧  ⑨
echo.
echo.
echo.
echo.
choice /c wseb /n
if %errorlevel% == 4 goto secho
if %errorlevel% == 3 set /a behind=%behind%+1&goto input
if %errorlevel% == 1 set /a pw%behind%=!pw%behind%!+1
if %errorlevel% == 2 set /a pw%behind%=!pw%behind%!-1
if !pw%behind%! gtr 9 set pw%behind%=0
if !pw%behind%! lss 0 set pw%behind%=9
goto input

:pwcheck
if %pw1%%pw2%%pw3% == 510 set person=旁 白&set msg=才刚刚输入了密码，虫洞立即放出了耀眼的白光，你毫无防备地被它强大的引力拖了进去. . .&call :msgbox&goto open
set /a chance=%chance%-1
if %chance% == 0 goto holeclose
color 4f
echo 密码错误！请重新输入. . .
set /p clown=
set behind=1
goto input

:holeclose
set holeclose=1
set person=旁 白
set msg=密码输入窗口红光一闪，你无论如何都再也输入不了任何密码了. . .
call :msgbox
if %giveup% == 1 goto spacewander
goto secho

:open
if %chip% == 1 goto goodend
背景音乐\so-soend.mp3
set person=旁 白
set msg=就好像儿时滑滑梯一般，不一会儿你就从虫洞里冲了出来，人们簇拥着你，满是鲜花和欢声笑语. . .
call :msgbox
set person=群 众
set msg=老张你知道吗，还有一分钟小行星π-2就要撞上地球了，幸亏你来得早啊！
call :msgbox
set person=旁 白
set msg=而你却似乎突然间想起了什么，脸上刚刚升起的笑容又渐渐收了回去，一脸的茫然和惋惜. . .
call :msgbox
set person=旁 白
set msg=达成结局：你想起了什么呢
call :msgbox
echo '~'别问我，我才不知道你想起了什么呢. . .>结局\结_局-你想起了什么呢.txt
goto end

:goodend
背景音乐\goodend.flac
set msg=而虫洞的另一边果然传来了人声. . .
call :msgbox
set person=？？？
set msg=快看！博士好像要回来了！
call :msgbox
set person=？？？
set msg=真的？！快给我看看！！
call :msgbox
set person=旁 白
set msg=话还没说完，你就从虫洞里冲了出来，好像小时候的你从滑梯里滑出来似的，一脸顿悟的模样. . .
call :msgbox
set person=%name%
set msg=哦. . .我想起来了！
call :msgbox
set person=同事小李
set msg=你怎么了？一周没见，你就失忆了？
call :msgbox
set person=%name%
set msg=确实失忆了，不过现在想起来了*'v'*
call :msgbox
set person=同事小吴
set msg=你不要吓我们啊博士，再过一分钟小行星π-2就要撞击地球了，我们这几天真的好担心你呢~
call :msgbox
set person=%name%
set msg=又有陨石？啊. . .幸好，幸好我已经把许欢带过来了. . .
call :msgbox
set person=同事小李
set msg=我就知道博士，心里第一个想的肯定还是许欢呀. . .
call :msgbox
set person=同事小王
set msg=那你家许欢现在去哪了？
call :msgbox
set person=%name%
set msg=别担心啦~在我口袋里呢。
call :msgbox
set person=旁 白
set msg=达成结局：最完美的结局
call :msgbox
echo 恭喜主人通关！不过这个结局的唯一缺点就是太完美了呢-'v'->结局\结_局-最完美的结局.txt
goto end

:spacewander
背景音乐\spacewander.flac
set person=旁 白
set msg=唯一的希望就这样破灭了，你全身一震，一下子从虫洞上掉下来. . .
call :msgbox
set msg=许久，你终于睁开了眼. . .
call :msgbox
set person=%name%
set msg=唉. . .我不就是一个被遗忘在地球上的没用的家伙吗？连这点都搞不定. . .
call :msgbox
set msg=罢了罢了. . .谁叫我真的这么没用呢. . .
call :msgbox
set msg=可. . .可我还是好想念从前地球上生机勃勃的气息啊. . .
call :msgbox
set msg=好想念那种有些陌生又有些熟悉的温暖啊. . .
call :msgbox
set msg=可惜我到死. . .都不知道那种温暖. . .从何而来呢. . .
call :msgbox
set person=旁 白
set msg=就这样你微笑着，成为了人世间最易逝的一道光，从这儿流向远方. . .
call :msgbox
set person=旁 白
set msg=达成结局：流向远方
call :msgbox
echo 这个故事告诉我们不能乱丢垃圾. . .不是吗-'v'->结局\结_局-流向远方.txt
goto end

:askback
set choice1=《
set choice2=·
:askback2
cls
echo.
echo 要返回菜单吗？
echo.
echo 好的%choice1%
echo 不要%choice2%
echo.
choice /c wse /n
if %errorlevel% == 3 goto check13
if %choice1% == 《 set choice1=·&set choice2=《&goto askback2
if %choice2% == 《 set choice2=·&set choice1=《&goto askback2

:check13
if %choice1% == 《 goto superstart
if %choice2% == 《 goto :eof

:asksave
set choice1=《
set choice2=·
:asksave2
cls
echo.
echo 要储存进度吗？
echo.
echo 好的%choice1%
echo 不要%choice2%
echo.
choice /c wse /n
if %errorlevel% == 3 goto check14
if %choice1% == 《 set choice1=·&set choice2=《&goto asksave2
if %choice2% == 《 set choice2=·&set choice1=《&goto asksave2

:check14
if %choice1% == 《 echo %name%;%underearth%;%gear%;%gear2%;%petrol%;%petrol2%;%petrol3%;%wake%;%offer%;%step%;%refuse%;%heart%;%hole%;%agree%;%chip%;%spark%;%power%;%giveup%;%moon%;%mars%;%chance%;%holeclose%;>save.wc
if %choice2% == 《 goto :eof