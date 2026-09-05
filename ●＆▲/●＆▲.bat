@echo off
setlocal enabledelayedexpansion
title ●＆▲

:start
color 3f

set nb=1
set cctotal=4
set ccnb=28
set turn2=
set turn3=
set turn4=
:cc28
cls
set turn%nb%=←
echo ●＆▲
echo.
echo.
echo 重新开始  %turn1%
echo.
echo 继续游戏  %turn2%
echo.
echo 查看规则  %turn3%
echo.
echo 离开游戏  %turn4%
call :ccchange

:check28
if %nb% == 1 set gamemode=new&goto restartask
if %nb% == 2 set gamemode=goon&goto read
if %nb% == 3 goto controlrule
if %nb% == 4 exit

:controlrule
cls
echo 【规 则】
echo.
echo 通过“WASD”控制移动
echo.
echo 通过“UJHK”触发目标
echo.
echo 通过“UJKIM”移动松果
echo.
echo 通过“E”键确认
echo.
echo 通过“Q”键返回
echo.
echo 可以在Music中自行选择背景音乐
echo.
pause>nul
goto start

:restartask
set nb=1
set cctotal=2
set ccnb=29
set turn2=
:cc29
cls
set turn%nb%=←
echo 【*】
echo.
echo 重新开始会覆盖之前的存档，要继续吗？
echo.
echo 要    %turn1%
echo 不要  %turn2%
call :ccchange

:check29
if %nb% == 1 goto restart
if %nb% == 2 goto start

:restart
echo 0;0;0;>apple.jy
echo 1;18;0;>condition.jy
echo 0;0;0;0;0;0;0;0;>own.jy
echo 0;0;0;0;0;>pscore.jy
echo 0;0;0;0;0;0;>rscore.jy
echo 0;0;0;0;0;0;0;0;0;riverwest;>switch.jy
echo 0;>switch2.jy
goto read

:nobefore
set name=*
set word=没有找到之前的存档...
call :msgbox
goto start

:read
for /f "tokens=1 delims=;" %%i in (switch.jy) do set alllife=%%i
for /f "tokens=2 delims=;" %%i in (switch.jy) do set turndown=%%i
for /f "tokens=3 delims=;" %%i in (switch.jy) do set hidecat=%%i
for /f "tokens=4 delims=;" %%i in (switch.jy) do set encountercat=%%i
for /f "tokens=5 delims=;" %%i in (switch.jy) do set night=%%i
for /f "tokens=6 delims=;" %%i in (switch.jy) do set snow=%%i
for /f "tokens=7 delims=;" %%i in (switch.jy) do set alsohide=%%i
for /f "tokens=8 delims=;" %%i in (switch.jy) do set endworld=%%i
for /f "tokens=9 delims=;" %%i in (switch.jy) do set join=%%i
for /f "tokens=10 delims=;" %%i in (switch.jy) do set boat=%%i

if %gamemode% == goon if %join% == 0 goto nobefore

for /f "tokens=1 delims=;" %%i in (condition.jy) do set level=%%i
for /f "tokens=2 delims=;" %%i in (condition.jy) do set hp=%%i
for /f "tokens=3 delims=;" %%i in (condition.jy) do set exp=%%i

for /f "tokens=1 delims=;" %%i in (wordspeed.jy) do set wordelay=%%i

for /f "tokens=1 delims=;" %%i in (own.jy) do set juice=%%i
for /f "tokens=2 delims=;" %%i in (own.jy) do set bread=%%i
for /f "tokens=3 delims=;" %%i in (own.jy) do set firestone=%%i
for /f "tokens=4 delims=;" %%i in (own.jy) do set flashlight=%%i
for /f "tokens=5 delims=;" %%i in (own.jy) do set knife=%%i
for /f "tokens=6 delims=;" %%i in (own.jy) do set greatreemap=%%i
for /f "tokens=7 delims=;" %%i in (own.jy) do set battery=%%i
for /f "tokens=8 delims=;" %%i in (own.jy) do set fish=%%i

if %gamemode% == new goto home

set lable=a
set total=20
call :build
color 8f
set a6=●
set a11=▲
set a10=∩
set lc=6
set mid=11
set a=5
goto amap

:home
set lable=a
set total=20
set a=5
color 8f
call :build

:anext
set a12=●
set a3=▲
set lc=12
set tail=3

:amap
call :homemap
goto control

:acheck
if !%lable%%aim%! == ▲ goto firstmeet
if !%lable%%aim%! == ∩ goto crossroad
goto %lable%map

:firstmeet
if %turndown% == 1 goto rejoin
set name=▲
set word=干嘛？
call :msgbox

set nb=1
set cctotal=3
set ccnb=1
set turn2=
set turn3=
:cc1
cls
set turn%nb%=←
echo 【●】
echo.
echo 你是...？  %turn1%
echo 这是哪儿？ %turn2%
echo 没干嘛     %turn3%
call :ccchange

:check1
if %nb% == 1 goto unknown
if %nb% == 2 goto unknown
if %nb% == 3 goto amap

:unknown
set nbmid=%nb%
set name=▲
set word=我也不知道，一睡醒就在这了QwQ
call :msgbox
if %nbmid% == 2 goto amap

::set /a randomkey=%random%%%2
::if %randomkey% == 0 

goto reask
goto amap

:reask
set name=▲
set word=你又是谁？
call :msgbox
set name=●
set word=我叫●，很高兴认识你:D
call :msgbox
set name=▲
set word=你是说...你的名字是一个图形O_O
call :msgbox
set name=▲
set word=好巧...我也是，我的名字叫▲
call :msgbox
set name=▲
set word=缺朋友吗？让我加入你的队伍吧⊙v⊙
call :msgbox

:cc2start
set nb=1
set cctotal=2
set ccnb=2
set turn2=
:cc2
cls
set turn%nb%=←
echo 【●】
echo.
echo 好   %turn1%
echo 不好 %turn2%
call :ccchange

:check2
if %nb% == 1 goto join
if %nb% == 2 goto turndown

:join
set join=1
set a3=□
set name=*
set word=左叶_已加入队伍
call :msgbox
set a10=∩
set name=*
set word=门_打开了
call :msgbox
goto amap

:turndown
set turndown=1
set name=▲
set word=那就等你什么时候需要我再来找我吧:)
call :msgbox
goto amap

:rejoin
set name=▲
set word=果然还是少不了我吧-v-
call :msgbox
goto cc2start

:crossroad
set lable=b
set total=81
call :build

:bnext
set b39=●
set b38=▲
set b5=∩
set b37=∩
set b45=∩
set b77=∩
set lc=39
set mid=38
set a=9

:bmap
if %night% == 0 if %snow% == 0 color 2f
if %night% == 1 color 02
if %snow% == 1 color f7
cls
echo 十 字 路 口
echo.
echo       %b4%%b5%%b6%
echo       %b13%%b14%%b15%
echo       %b22%%b23%%b24%
echo %b28%%b29%%b30%%b31%%b32%%b33%%b34%%b35%%b36%
echo %b37%%b38%%b39%%b40%%b41%%b42%%b43%%b44%%b45%
echo %b46%%b47%%b48%%b49%%b50%%b51%%b52%%b53%%b54%
echo       %b58%%b59%%b60%
echo       %b67%%b68%%b69%
echo       %b76%%b77%%b78%
echo.
goto control

:bcheck
if %aim% == 5 goto forest
if %aim% == 37 goto baset
if %aim% == 45 goto river
if %aim% == 77 goto corridor
goto %lable%map

:bairwall
::upwall
if %udkey% == 4 if %errorlevel% == 1 if %lrkey% gtr 6 set lc=%mid%&set mid=%tail%
if %udkey% == 4 if %errorlevel% == 1 if %lrkey% lss 4 set lc=%mid%&set mid=%tail%
::downwall
if %udkey% == 6 if %errorlevel% == 2 if %lrkey% gtr 6 set lc=%mid%&set mid=%tail%
if %udkey% == 6 if %errorlevel% == 2 if %lrkey% lss 4 set lc=%mid%&set mid=%tail%
::leftwall
if %lrkey% == 4 if %errorlevel% == 3 if %udkey% gtr 6 set lc=%mid%&set mid=%tail%
if %lrkey% == 4 if %errorlevel% == 3 if %udkey% lss 4 set lc=%mid%&set mid=%tail%
::rightwall
if %lrkey% == 6 if %errorlevel% == 4 if %udkey% gtr 6 set lc=%mid%&set mid=%tail%
if %lrkey% == 6 if %errorlevel% == 4 if %udkey% lss 4 set lc=%mid%&set mid=%tail%
goto :eof

rem 第一个数字是纵/横坐标，第二个数字是横纵坐标上/下限

:baset
set lable=a
set total=20
set a=5
color 8f
call :build
set a8=●
set a9=▲
set a10=∩
set lc=8
set mid=9
goto amap

:river
set lable=i
set total=27
set nb=0
:backY
set /a nb+=1
set material=∷
if %snow% == 0 set material=～
set %lable%%nb%=%material%
if %nb% == %total% goto dbuild
goto backY

:dbuild
set lable=d
set total=40
call :build

:dnext
set d19=●
set d18=▲
set d17=∩
set d24=∩
set d3=＠
set lc=19
set mid=18
set a=8

:dmap
if %boat% == riverwest set i13=▽&set i15=%material%
if %boat% == rivereast set i15=▽&set i13=%material%

cls
echo 小 溪
echo.
echo         %i1%%i2%%i3%
echo         %i4%%i5%%i6%
echo %d1%%d2%%d3%%d4%%i7%%i8%%i9%%d5%%d6%%d7%%d8%
echo %d9%%d10%%d11%%d12%%i10%%i11%%i12%%d13%%d14%%d15%%d16%
echo %d17%%d18%%d19%%d20%%i13%%i14%%i15%%d21%%d22%%d23%%d24%
echo %d25%%d26%%d27%%d28%%i16%%i17%%i18%%d29%%d30%%d31%%d32%
echo %d33%%d34%%d35%%d36%%i19%%i20%%i21%%d37%%d38%%d39%%d40%
echo         %i22%%i23%%i24%
echo         %i25%%i26%%i27%
echo.
goto control

:dcheck
if %aim% == 3 goto notice
if %snow% == 0 if %boat% == riverwest if %lc% == 20 if %errorlevel% == 8 goto boat
if %snow% == 0 if %boat% == rivereast if %lc% == 21 if %errorlevel% == 7 goto boat
if %snow% == 1 if %lc% == 20 if %errorlevel% == 8 call :iceblock
if %aim% == 17 goto dbset
if %aim% == 24 goto blankland
goto %lable%map

:blankland
set lable=o
set total=30
call :build

:onext
set o15=●
set o14=▲
set o13=∩
set o10=○
set o11=△
set lc=15
set mid=14
set a=6

:omap
call :blanklandmap
goto control

:blanklandmap
cls
echo 空 地
echo.
echo %o1%%o2%%o3%%o4%%o5%%o6%       
echo %o7%%o8%%o9%%o10%%o11%%o12%
echo %o13%%o14%%o15%%o16%%o17%%o18%
echo %o19%%o20%%o21%%o22%%o23%%o24%
echo %o25%%o26%%o27%%o28%%o29%%o30%
echo.
goto :eof

:ocheck
if %aim% == 10 goto swing
if %aim% == 11 goto swing
if %aim% == 13 goto odset
goto %lable%map

:odset
set lable=d
set total=40
set a=8
call :build
set d23=▲
set d22=●
set d17=∩
set d24=∩
set d3=＠
set lc=22
set mid=23
goto dmap

:swing
set name=*
set word=这是...一个圆形秋千和一个三角形秋千？
call :msgbox
if %night% == 1 if %firestone% == 1 if %endworld% == 1 goto firechat
goto omap

:firechat
set nb=1
set cctotal=2
set ccnb=19
set turn2=
:cc19
cls
set turn%nb%=←
echo 【*】
echo.
echo 要点燃篝火坐在秋千上聊聊天吗？
echo.
echo 要   %turn1%
echo 不要 %turn2%
call :ccchange

:check19
if %nb% == 1 goto firechat2
if %nb% == 2 goto omap

:firechat2
for /f "tokens=1 delims=;" %%i in (apple.jy) do set apple=%%i
for /f "tokens=2 delims=;" %%i in (apple.jy) do set applecoin=%%i
for /f "tokens=3 delims=;" %%i in (apple.jy) do set stick=%%i

if %stick% lss 20 goto nostick

set /a stick-=20
echo %apple%;%applecoin%;%stick%;>apple.jy

color 0e
set o10=●
set o11=▲
set o22=＃
set o23=＃
set o%lc%=□
set o%mid%=□

call :blanklandmap
choice /d p /t 3 /c p /n
set name=▲
set word=其实...我有点失落v_v
call :msgbox
set name=▲
set word=当听到松鼠店长说地球上可能只剩我们两个人的时候...
call :msgbox
set name=▲
set word=如果这个地球上真的只剩我们两个人，
call :msgbox
set name=▲
set word=那你说，我们...活着还有什么意义呢？
call :msgbox

call :blanklandmap
choice /d p /t 3 /c p /n
set name=▲
set word=唉...好想永远无忧无虑的快乐下去呀...
call :msgbox
set name=▲
set word=可是...或许这样会很无聊的吧？
call :msgbox
set name=▲
set word=我想...要是我们真是这个地球上最后的两个人，
call :msgbox
set name=▲
set word=活着最大的意义...就是活着...
call :msgbox
set name=▲
set word=活着，一切都还有机会...
call :msgbox
set name=▲
set word=可要是死了，就是真的死了，什么都没有了...
call :msgbox

call :blanklandmap
choice /d p /t 3 /c p /n
set name=*
set word=篝火的火焰像风中颤动的莹草，照亮了黛黑色的夜空...
call :msgbox
set name=▲
set word=我又想起我爷爷说的话了——
call :msgbox
set name=▲
set word=万物有灵，你看，就像这株火苗，
call :msgbox
set name=▲
set word=虽然它不能像我们一样说话，
call :msgbox
set name=▲
set word=它甚至像我们一样，连为什么来到这个世界上也不知道...
call :msgbox
set name=▲
set word=可它依旧愿意绽放自己的光和热，我们也是一样...
call :msgbox
set name=▲
set word=我们其实并不孤独，还有千千万万的像我们一样的，
call :msgbox
set name=▲
set word=陪伴着我们度过每一个苦昼和永夜，阳春和白雪...
call :msgbox

call :blanklandmap
choice /d p /t 3 /c p /n
set name=▲
set word=...谢谢今晚你陪我聊天:D
call :msgbox

color 02
set o22=□
set o23=□
set o10=○
set o11=△
set o16=●
set o17=▲
set lc=16
set mid=17

goto omap

::####
:iceblock
set name=*
set word=小溪被冻住了，不能划船...
call :msgbox
goto :eof

:dairwall
::leftwall
if %lrkey% == 5 if %errorlevel% == 3 set lc=%mid%&set mid=%tail%
::rightwall
if %lrkey% == 4 if %errorlevel% == 4 set lc=%mid%&set mid=%tail%
goto :eof

:dbset
set lable=b
set total=81
set a=9
call :build
set b43=●
set b44=▲
set b5=∩
set b37=∩
set b45=∩
set b77=∩
set lc=43
set mid=44
goto bmap

:notice
cls
echo 【告示牌】
echo.
echo 若 木    ICELAND
echo  ←         →
echo.
echo.
echo 这么写着
pause>nul
goto dmap

:boat
set nb=1
set cctotal=4
set ccnb=3
set turn2=
set turn3=
set turn4=
:cc3
cls
set turn%nb%=←
echo 【*】
echo.
echo 这是一艘小船。请问要前往？
echo.
echo 若木     %turn1%
echo 对岸     %turn2%
echo ICELAND  %turn3%
echo 留在原地 %turn4%
call :ccchange

:check3
if %nb% == 1 set boat=greatree&goto dnset
if %nb% == 3 set boat=iceland&goto dhset
if %nb% == 2 if %i13% == ▽ set boat=rivereast&goto boatlr
if %nb% == 2 if %i15% == ▽ set boat=riverwest&goto boatrl
if %nb% == 4 goto dmap

:dnset
set lable=n
set total=25
call :build
set n14=●
set n15=▲
set n13=∩
set lc=14
set mid=15
set a=5
goto nmap

:dhset
call :ghbuild
set h9=●
set h10=▲
set g33=▽
set h2=∩
set h4=＠
set lc=9
set mid=10
set a=5
goto hmap

:boatlr
set i13=～
set i15=▽
set d%mid%=□
set d%lc%=□
set d21=▲
set d22=●
set mid=21
set lc=22
goto dmap

:boatrl
set i15=～
set i13=▽
set d%mid%=□
set d%lc%=□
set d20=▲
set d19=●
set mid=20
set lc=19
goto dmap

:iceland
call :ghbuild

:hnext
set h2=∩
set h4=＠
set h7=▲
set h12=●
set lc=12
set mid=7
set a=5

if %snow% == 0 if %boat% == iceland set g33=▽&goto hmap
if %snow% == 0 goto hmap
:holemake
set /a randomkey=%random%%%24+1
if %randomkey% == 1 set holenb=2
if %randomkey% == 2 set holenb=7
if %randomkey% == 3 set holenb=8
if %randomkey% == 4 set holenb=10
if %randomkey% == 5 set holenb=14
if %randomkey% == 6 set holenb=15
if %randomkey% == 7 set holenb=16
if %randomkey% == 8 set holenb=21
if %randomkey% == 9 set holenb=22
if %randomkey% == 10 set holenb=23
if %randomkey% == 11 set holenb=24
if %randomkey% == 12 set holenb=53
if %randomkey% == 13 set holenb=54
if %randomkey% == 14 set holenb=55
if %randomkey% == 15 set holenb=56
if %randomkey% == 16 set holenb=58
if %randomkey% == 17 set holenb=62
if %randomkey% == 18 set holenb=63
if %randomkey% == 19 set holenb=64
if %randomkey% == 20 set holenb=66
if %randomkey% == 21 set holenb=67
if %randomkey% == 22 set holenb=71
if %randomkey% == 23 set holenb=72
if %randomkey% == 24 set holenb=3
set g%holenb%=○

:hmap
call :purehmap
goto control

::####
:purehmap
cls
echo ICELAND
echo.
echo           %g1%%g2%%g3%%g4%%g5%%g6%%g7%%g8%
echo           %g9%%g10%%g11%%g12%%g13%%g14%%g15%%g16%
echo           %g17%%g18%%g19%%g20%%g21%%g22%%g23%%g24%       
echo %h1%%h2%%h3%%h4%%h5%%g25%%g26%%g27%%g28%%g29%%g30%%g31%%g32%
echo %h6%%h7%%h8%%h9%%h10%%g33%%g34%%g35%%g36%%g37%%g38%%g39%%g40%
echo %h11%%h12%%h13%%h14%%h15%%g41%%g42%%g43%%g44%%g45%%g46%%g47%%g48%
echo           %g49%%g50%%g51%%g52%%g53%%g54%%g55%%g56%
echo           %g57%%g58%%g59%%g60%%g61%%g62%%g63%%g64%
echo           %g65%%g66%%g67%%g68%%g69%%g70%%g71%%g72%      
echo.
goto :eof

:hcheck
if %aim% == 2 goto heset
if %aim% == 4 goto golfrule
if %snow% == 1 if %lc% == 5 if %errorlevel% == 8 set balllc=25&goto load
if %snow% == 1 if %lc% == 10 if %errorlevel% == 8 set balllc=33&goto load
if %snow% == 1 if %lc% == 15 if %errorlevel% == 8 set balllc=41&goto load
if %snow% == 0 if %lc% == 10 if %boat% == iceland if %errorlevel% == 8 goto ilboat
if %snow% == 1 if %lc% == 10 if %boat% == iceland if %errorlevel% == 8 call :iceblock
goto hmap

:ilboat
set nb=1
set cctotal=4
set ccnb=15
set turn2=
set turn3=
set turn4=
:cc15
cls
set turn%nb%=←
echo 【*】
echo.
echo 这是一艘小船。请问要前往？
echo.
echo 若木     %turn1%
echo 小溪西岸 %turn2%
echo 小溪东岸 %turn3%
echo 留在原地 %turn4%
call :ccchange

:check15
if %nb% == 1 set boat=greatree&goto dnset
if %nb% == 2 set boat=riverwest&goto hdset
if %nb% == 3 set boat=rivereast&goto hdset
if %nb% == 4 goto hmap

:hdset
set lable=d
set total=40
set a=8
call :build

set total=27
set material=～
if %snow% == 1 set material=∷
set nb=0
:backZ
set /a nb+=1
set i%nb%=%material%
if %nb% == 27 goto hdset2
goto backZ

:hdset2
set d17=∩
set d24=∩
set d3=＠
if %boat% == rivereast set d21=▲&set d22=●&set lc=22&set mid=21
if %boat% == riverwest set d19=●&set d20=▲&set lc=19&set mid=20

goto dmap

:noapple
set name=*
set word=松果不足...
call :msgbox
goto hmap

:load
for /f "tokens=1 delims=;" %%i in (apple.jy) do set apple=%%i
for /f "tokens=2 delims=;" %%i in (apple.jy) do set applecoin=%%i
for /f "tokens=3 delims=;" %%i in (apple.jy) do set stick=%%i

if %apple% == 0 goto noapple
set g%balllc%=⊕
call :purehmap

:kick
choice /c ujkimq /n
if %errorlevel% == 6 set g%balllc%=∷&goto hmap
if %errorlevel% == 1 set dr=up
if %errorlevel% == 2 set dr=down
if %errorlevel% == 3 set dr=right
if %errorlevel% == 4 set dr=rightup
if %errorlevel% == 5 set dr=rightdown
set shootback=0

:ballcheck
set /a balllrkey=%balllc%%%8
set g%balllc%=∷

if %balllc% == 1 if not %dr% == up set dr=rightdown&goto ballmove
if %balllc% == 8 set dr=leftdown&goto ballmove
if %balllc% == 65 if not %dr% == down set dr=rightup&goto ballmove
if %balllc% == 72 set dr=leftup&goto ballmove

if %balllc% == 25 goto ballexit
if %balllc% == 33 goto ballexit
if %balllc% == 41 goto ballexit

if %balllc% lss 9 call :upwall
if %balllc% gtr 64 call :downwall
if %balllrkey% == 0 call :rightwall
if %balllrkey% == 1 call :leftwall

goto ballmove

:ballexit
if %dr% == left goto hmap
if %dr% == leftup goto hmap
if %dr% == leftdown goto hmap
if %dr% == up if %shootback% == 1 goto hmap
if %dr% == down if %shootback% == 1 goto hmap
if %dr% == left if %shootback% == 1 goto hmap
goto ballmove

:leftwall
if %dr% == left set dr=right
if %dr% == leftdown set dr=rightdown
if %dr% == leftup set dr=rightup
goto :eof

:upwall
set shootback=1
if %dr% == up set dr=down
if %dr% == rightup set dr=rightdown
if %dr% == leftup set dr=leftdown
goto :eof

:downwall
set shootback=1
if %dr% == down set dr=up
if %dr% == rightdown set dr=rightup
if %dr% == leftdown set dr=leftup
goto :eof

:rightwall
set shootback=1
if %dr% == right set dr=left
if %dr% == rightup set dr=leftup
if %dr% == rightdown set dr=leftdown
goto :eof

:ballmove
if %dr% == up set /a balllc-=8
if %dr% == down set /a balllc+=8
if %dr% == right set /a balllc+=1
if %dr% == left set /a balllc-=1
if %dr% == rightup set /a balllc-=7
if %dr% == rightdown set /a balllc+=9
if %dr% == leftup set /a balllc-=9
if %dr% == leftdown set /a balllc+=7

if !g%balllc%! == ○ goto ballwin
set g%balllc%=⊕
call :purehmap

:balldelay
set nb=0
:balldelay2
set /a nb+=1
if %nb% == 5 goto ballcheck
goto balldelay2

:ballwin
set /a apple-=1
set /a applecoin+=1
set g%holenb%=∷
echo %apple%;%applecoin%;%stick%;>apple.jy
goto holemake

:golfrule
cls
echo 【告示牌】
echo.
echo t y   ↑↗
echo   h     →
echo b n   ↓↘
echo.
echo 这么写着
pause>nul
goto hmap

:heset
set lable=e
set total=27
set a=3
call :build
set e23=▲
set e20=●
set e2=∩
set e26=∩
set lc=20
set mid=23
goto emap

:corridor
set lable=e
set total=27
call :build

:enext
set e8=●
set e5=▲
set e2=∩
set e26=∩
set lc=8
set mid=5
set a=3

:emap
cls
echo 林 间 小 径
echo.
echo   %e1%%e2%%e3%
echo   %e4%%e5%%e6%
echo ∩%e7%%e8%%e9%
echo   %e10%%e11%%e12%
echo   %e13%%e14%%e15%
echo   %e16%%e17%%e18%
echo   %e19%%e20%%e21%
echo   %e22%%e23%%e24%
echo   %e25%%e26%%e27%
echo.
goto control

:echeck
if %aim% == 2 goto ebset
if %aim% == 26 goto iceland
if %lc% == 7 if %errorlevel% == 7 goto store
goto %lable%map

:store
set nb=1
set cctotal=3
set ccnb=13
set turn2=
set turn3=
:cc13
cls
set turn%nb%=←
echo 【'w'】
echo.
echo 欢迎光临松鼠便利店,请问是要？
echo.
echo 购买商品 %turn1%
echo 询问规则 %turn2%
echo 离开商店 %turn3%
call :ccchange

:check13
if %nb% == 1 goto instore
if %nb% == 2 goto storerule
if %nb% == 3 goto endworld

:instore
set nb=1
set ccnb=25
set cctotal=7

set aturn2=
set aturn3=
set aturn4=
set aturn5=
set aturn6=
set aturn7=
:cc25
cls

set aturn%nb%=←
for /f "tokens=1 delims=;" %%i in (apple.jy) do set apple=%%i
for /f "tokens=2 delims=;" %%i in (apple.jy) do set applecoin=%%i
for /f "tokens=3 delims=;" %%i in (apple.jy) do set stick=%%i

for /f "tokens=1 delims=;" %%i in (own.jy) do set juice=%%i
for /f "tokens=2 delims=;" %%i in (own.jy) do set bread=%%i
for /f "tokens=3 delims=;" %%i in (own.jy) do set firestone=%%i
for /f "tokens=4 delims=;" %%i in (own.jy) do set flashlight=%%i
for /f "tokens=5 delims=;" %%i in (own.jy) do set knife=%%i
for /f "tokens=6 delims=;" %%i in (own.jy) do set greatreemap=%%i
for /f "tokens=7 delims=;" %%i in (own.jy) do set battery=%%i
for /f "tokens=8 delims=;" %%i in (own.jy) do set fish=%%i

echo ⊕:%applecoin%
echo.
echo 商品   已拥有数量   价格   
echo.
echo 果汁       %juice%         3   %aturn1%
echo.
echo 面包       %bread%         6  %aturn2%
if %firestone% == 0 echo.
if %firestone% == 0 echo 燧石       %firestone%         10  %aturn3%
if %flashlight% == 0 echo.
if %flashlight% == 0 echo 手电筒     %flashlight%         10  %aturn4%
if %knife% == 0 echo.
if %knife% == 0 echo 小刀       %knife%         20  %aturn5%
if %greatreemap% == 0 echo.
if %greatreemap% == 0 echo 山海经     %greatreemap%         10  %aturn6%
if %battery% == 0 echo.
if %battery% == 0 echo 琼脂       %battery%         30  %aturn7%
echo.
call :ccchange6

:check25
if %nb% == 1 set price=3&set buyname=juice&goto buy
if %nb% == 2 set price=6&set buyname=bread&goto buy
if %nb% == 3 set price=10&set buyname=firestone&goto buy
if %nb% == 4 set price=10&set buyname=flashlight&goto buy
if %nb% == 5 set price=20&set buyname=knife&goto buy
if %nb% == 6 set price=10&set buyname=greatreemap&goto buy
if %nb% == 7 set price=30&set buyname=battery&goto buy

:buy
if %applecoin% lss %price% goto nomoney
set /a applecoin-=%price%
set /a %buyname%+=1
echo %apple%;%applecoin%;%stick%;>apple.jy
echo %juice%;%bread%;%firestone%;%flashlight%;%knife%;%greatreemap%;%battery%;%fish%;>own.jy
echo 购买成功！
pause>nul
goto instore

:nomoney
echo 抱歉，你没有足够的松果...
pause>nul
goto instore

:ccchange6
choice /c wseq /n
if %errorlevel% == 4 goto store
if %errorlevel% == 3 goto check%ccnb%
set aturn%nb%=
if %errorlevel% == 1 set /a nb-=1&set correct=1
if %errorlevel% == 2 set /a nb+=1&set correct=-1

if %nb% gtr 7 set nb=1
if %nb% == 0 set nb=7

call :cc25ud
goto cc%ccnb%

:cc25ud
if %nb% == 3 if %firestone% == 1 set /a nb-=%correct%&goto cc25ud
if %nb% == 3 if %firestone% == 0 goto :eof
if %nb% == 4 if %flashlight% == 1 set /a nb-=%correct%&goto cc25ud
if %nb% == 4 if %flashlight% == 0 goto :eof
if %nb% == 5 if %knife% == 1 set /a nb-=%correct%&goto cc25ud
if %nb% == 5 if %knife% == 0 goto :eof
if %nb% == 6 if %greatreemap% == 1 set /a nb-=%correct%&goto cc25ud
if %nb% == 6 if %greatreemap% == 0 goto :eof
if %nb% == 7 if %battery% == 1 set /a nb-=%correct%&goto cc25ud
if %nb% == 7 if %battery% == 0 goto :eof
goto :eof

:endworld
set /a randomkey=%random%%%3
if %randomkey% == 0 if %endworld% == 0 goto ewtell
goto emap

:ewtell
set endworld=1
set year=%date:~0,4%
set /a passyear=%year%-2022

set name='w'
set word=你们是...人类？
call :msgbox
set name=▲
set word=是的
call :msgbox
set name='o'
set word=天...你知道吗？我已经有%passyear%年没见到人类了...
call :msgbox
set name='w'
set word=我甚至都快忘了人类长什么样了...
call :msgbox
set name='w'
set word=你们...为什么会来到这里？
call :msgbox
set name=●
set word=并不知道...以前的事情都忘记了，仿佛我们生来就活在这里U_U
call :msgbox
set name='v'
set word=...那么你们知道怎么离开这个...鬼地方吗？
call :msgbox
set name=▲
set word=然而也不知道——你知道吗？
call :msgbox
set name='w'
set word=我...不知道...
call :msgbox
set name=*
set word=......
call :msgbox
set name='_'
set word=其实...你们知道吗？很有可能——
call :msgbox
set name='_'
set word=——你们是地球上最后的人类了...
call :msgbox
set name=●＆▲
set word=为什么?
call :msgbox
set name='_'
set word=你们的同伴，绝大部分都已经离开地球，前往新的家园了...
call :msgbox
set name=●＆▲
set word=......
call :msgbox
set name='w'
set word=所以...多保重，祝你们好运！
call :msgbox
goto emap

:storerule 
set name='w'
set word=规则嘛，其实很简单...
call :msgbox
set name='w'
set word=我们松鼠便利店从来都不收人类的货币，
call :msgbox
set name='w'
set word=如果想在这儿消费的话，
call :msgbox
set name='w'
set word=只需要将收集到的松果投进南边的松鼠洞就可以了。
call :msgbox
set name='w'
set word=怎么样？果然很简单吧:D
call :msgbox
goto store

:ebset
set lable=b
set total=81
set a=9
call :build
set b59=●
set b68=▲
set b5=∩
set b37=∩
set b45=∩
set b77=∩
set lc=59
set mid=68
goto bmap

:forest
set lable=c
set total=121
call :build

:cnext
set c94=●
set c105=▲
set c116=∩
set c24=Υ
set c47=Υ
set c67=Υ
set c92=Υ
set c4=Υ
set c21=Υ
set c31=Υ
set c44=Υ
set c76=Υ
set c99=Υ
set lc=94
set mid=105
set a=11

:cmap
if %night% == 0 if %snow% == 0 color 2f
if %night% == 1 color 02
if %snow% == 1 color f7

set lable=c
set a=11
set total=121

call :puremap
goto control

::####
:puremap
cls
echo 森 林
echo.
echo %c1%%c2%%c3%%c4%%c5%%c6%%c7%%c8%%c9%%c10%%c11%
echo %c12%%c13%%c14%%c15%%c16%%c17%%c18%%c19%%c20%%c21%%c22%
echo %c23%%c24%%c25%%c26%%c27%%c28%%c29%%c30%%c31%%c32%%c33%
echo %c34%%c35%%c36%%c37%%c38%%c39%%c40%%c41%%c42%%c43%%c44%
echo %c45%%c46%%c47%%c48%%c49%%c50%%c51%%c52%%c53%%c54%%c55%
echo %c56%%c57%%c58%%c59%%c60%%c61%%c62%%c63%%c64%%c65%%c66%
echo %c67%%c68%%c69%%c70%%c71%%c72%%c73%%c74%%c75%%c76%%c77%    
echo %c78%%c79%%c80%%c81%%c82%%c83%%c84%%c85%%c86%%c87%%c88%
echo %c89%%c90%%c91%%c92%%c93%%c94%%c95%%c96%%c97%%c98%%c99%
echo %c100%%c101%%c102%%c103%%c104%%c105%%c106%%c107%%c108%%c109%%c110%
echo %c111%%c112%%c113%%c114%%c115%%c116%%c117%%c118%%c119%%c120%%c121%
echo.
goto :eof

:ccheck
if %join% == 1 if %aim% == 116 goto cbset
if !c%aim%! == Υ goto tree
goto %lable%map

:tree
if %alllife% == 0 goto alllife
if %hidecat% == 1 goto searchtree

set randomul=2

for /f "tokens=1 delims=;" %%i in (apple.jy) do set apple=%%i
for /f "tokens=2 delims=;" %%i in (apple.jy) do set applecoin=%%i
for /f "tokens=3 delims=;" %%i in (apple.jy) do set stick=%%i
for /f "tokens=3 delims=;" %%i in (own.jy) do set firestone=%%i

if not %stick% lss 5 if %firestone% gtr 0 set randomul=3
set /a randomkey=%random%%%%randomul%
::title %randomkey%
if %randomkey% == 0 goto game1
if %randomkey% == 1 goto game1
if %randomkey% == 2 goto game3

:hidecat
set hidecat=1
set name=▲
set word=好...闭上眼睛不许偷看喔)w(
call :msgbox
set name=▲
set word=我要开始藏了:)
call :msgbox
set name=●
set word=10...
call :msgbox
set name=●
set word=9...
call :msgbox
set name=●
set word=8...
call :msgbox
set name=●
set word=7...
call :msgbox
set name=●
set word=6...
call :msgbox
set name=●
set word=5...
call :msgbox
set name=●
set word=4...
call :msgbox
set name=●
set word=3...
call :msgbox
set name=●
set word=2...
call :msgbox
set name=●
set word=1...
call :msgbox
set name=●
set word=会藏在哪里⊙v⊙?
call :msgbox

set /a hidenb=%random%%%10+1
set join=0
set c%mid%=□
set c116=□
goto cmap

:searchtree
if %aim% == 4 set treenb=1
if %aim% == 21 set treenb=2
if %aim% == 24 set treenb=3
if %aim% == 31 set treenb=4
if %aim% == 44 set treenb=5
if %aim% == 47 set treenb=6
if %aim% == 67 set treenb=7
if %aim% == 76 set treenb=8
if %aim% == 92 set treenb=9
if %aim% == 99 set treenb=10

if %treenb% == %hidenb% goto find

set /a randomkey=%random%%%3
if %randomkey% == 0 goto cat

set /a randomkey=%random%%%3+1
goto answer%randomkey%
:answer1
set name=*
set word=这是一棵有生命的树。
call :msgbox
set name=*
set word=但是除了它没有其他生命的迹象...
call :msgbox
goto cmap

:answer2
set name=*
set word=只是一棵很普通的树。
call :msgbox
goto cmap

:answer3
set name=*
set word=可以看到这棵树有一个小小的树洞，
call :msgbox
set name=*
set word=但是里面什么都没有...
call :msgbox
goto cmap

:find
if %alsohide% == 1 goto alsosleep
set name=▲
set word=看不见我看不见我pvp...
call :msgbox
set name=*
set word=左叶的棱角在树荫里轻微摆动...
call :msgbox

set nb=1
set cctotal=3
set ccnb=9
set turn2=
set turn3=
:cc9
cls
set turn%nb%=←
echo 【*】
echo.
echo 请问你要？
echo.
echo 捕捉一只野生▲'v' %turn1%
echo 假装没有发现      %turn2%
echo 也找棵树藏起来    %turn3%
call :ccchange

:check9
if %nb% == 1 goto catch
if %nb% == 2 goto cmap
if %nb% == 3 set alsohide=1&goto alsohide

:alsohide
set /a randomkey=%random%%%10+1
if %randomkey% == %hidenb% goto alsohide
if %randomkey% == 1 set hidelc=4
if %randomkey% == 2 set hidelc=21
if %randomkey% == 3 set hidelc=24
if %randomkey% == 4 set hidelc=31
if %randomkey% == 5 set hidelc=47
if %randomkey% == 6 set hidelc=67
if %randomkey% == 7 set hidelc=76
if %randomkey% == 8 set hidelc=44
if %randomkey% == 9 set hidelc=92
if %randomkey% == 10 set hidelc=99
set c%lc%=□
set c%hidelc%=●
call :puremap
choice /d p /t 1 /c p /n
set c%hidelc%=Υ
:sleep
call :puremap
choice /d p /t 3 /c p /n
set name=*
if %snow% == 0 if %night% == 0 goto snight
color 2f
if %night% == 1 set night=0&set word=就这样等到了早上...
if %snow% == 1 set snow=0&set word=等着等着雪又停了...
call :msgbox
goto cc11start

:snight
set /a randomkey=%random%%%3
if %randomkey% == 0 set night=1&color 02
if not %randomkey% == 0 set snow=1&color f7
::title %randomkey%
if %night% == 1 set word=就这样等到了晚上...
if %snow% == 1 set word=等着等着突然下雪了...
call :msgbox

:cc11start
set nb=1
set cctotal=2
set ccnb=11
set turn2=
:cc11
cls
set turn%nb%=←
echo 【*】
echo.
echo 要继续等吗？
echo.
echo 要   %turn1%
echo 不要 %turn2%
call :ccchange

:check11
if %nb% == 1 goto sleep
if %nb% == 2 goto getup

:getup
set /a gtlc=%hidelc%+11
set c%hidelc%=Υ
set c%gtlc%=●
set lc=%gtlc%
goto cmap

:alsosleep
set name=*
set word=左叶...睡着了...
call :msgbox

set nb=1
set cctotal=2
set ccnb=12
set turn2=
:cc12
cls
set turn%nb%=←
echo 【*】
echo.
echo 要叫醒TA吗？
echo.
echo 要   %turn1%
echo 不要 %turn2%
call :ccchange

:check12
if %nb% == 1 goto sleepcatch
if %nb% == 2 goto cmap

:sleepcatch
set alsohide=0
set name=▲
set word=唔姆...睡着了@v@?
call :msgbox
set name=▲
set word=嘻嘻...实在不好意思呀...
call :msgbox
set join=1
set hidecat=0
set c116=∩
goto cmap

:catch
set name=▲
set word=果然还是被发现了TvT
call :msgbox
set join=1
set hidecat=0
set c116=∩
goto cmap

:cat
if %encountercat% == 1 goto otquestion
set nb=1
set cctotal=3
set ccnb=10
set turn2=
set turn3=
:cc10
cls
set turn%nb%=←
echo 【⊙w⊙】
echo.
echo 猜猜我是谁？
echo.
echo 机器人 %turn1%
echo 小猫咪 %turn2%
echo 许欢？ %turn3%
call :ccchange

:check10
if %nb% == 1 goto wrong
if %nb% == 2 goto right
if %nb% == 3 goto wrong

:wrong
set name=⊙w⊙
set word=回答错误喔∩w∩
call :msgbox
goto cmap

:right
set encountercat=1
set /a fish+=1
echo %juice%;%bread%;%firestone%;%flashlight%;%knife%;%greatreemap%;%battery%;%fish%;>own.jy
set name=⊙w⊙
set word=答对了！奖励一包小鱼干∩w∩
call :msgbox
goto cmap

:otquestion
set /a randomkey=%random%%%6+1
goto otquestion%randomkey%

:otquestion1
set name=⊙w⊙
set word=喵～
call :msgbox
goto cmap

:otquestion2
set name=⊙w⊙
set word=为什么小猫咪也会讲话？
call :msgbox
set name=⊙w⊙
set word=因为咱喵可不是一只普通的小猫喔...喵～！
call :msgbox
goto cmap

:otquestion3
set name=⊙w⊙
set word=什么？你问我为什么会在这里？
call :msgbox
set name=⊙w⊙
set word=因为...我也在躲猫猫...喵？
call :msgbox
goto cmap

:otquestion4
set name=⊙_⊙
set word=如果你问我会不会感到孤独...
call :msgbox
set name=⊙_⊙
set word=我想说...当然会...
call :msgbox
set name=⊙w⊙
set word=只不过孤独得久了，习惯了，就不孤独了...
call :msgbox
goto cmap

:otquestion5
set name=⊙w⊙
set word=很久很久以前...
call :msgbox
set name=⊙w⊙
set word=当我还是只更小的小猫咪的时候，
call :msgbox
set name=⊙w⊙
set word=一位机器人小姐姐收养了我。
call :msgbox
set name=⊙_⊙
set word=...不过后来她不见了，从此我就生活在森林里。
call :msgbox
goto cmap

:otquestion6
set name=⊙w⊙
set word=你在寻找一个叫▲的朋友？
call :msgbox
set name=⊙w⊙
set word=喏...往那边去了，不用谢喵～
call :msgbox
goto cmap

:alllife
set alllife=1
set name=*
set word=这是一棵大树，少说也有几十年的光景。
call :msgbox
set name=▲
set word=你知道吗？在我还很小的时候，大约三四岁吧，那时我爷爷还在。
call :msgbox
set name=▲
set word=他告诉我：万物有灵。什么意思呢？就是无论我们人类，
call :msgbox
set name=▲
set word=还是其他不会动的一切，其实都是有生命的。
call :msgbox
set name=▲
set word=比如空中的白云，还有我们脚下的土地，
call :msgbox
set name=▲
set word=甚至是这棵树，都有它们自己的生命。
call :msgbox
goto cmap

:game1
cls
set nb=1
set cctotal=3
set ccnb=30
set turn2=
set turn3=
:cc30
cls
set turn%nb%=←
echo 【*】
echo.
echo 听了左叶的故事，你想要
echo.
echo 陪左叶玩躲猫猫   %turn1%
echo.
echo 和左叶一起捡落叶 %turn2%
echo.
echo 啥也不想做       %turn3%
call :ccchange

:check30
if %nb% == 1 goto hidecat
if %nb% == 2 goto pickmatch
if %nb% == 3 goto cmap

::START
set nb=1
set cctotal=2
set ccnb=4
set turn2=
:cc4
cls
set turn%nb%=←
echo 【*】
echo.
echo 要躲猫猫吗？
echo.
echo 要   %turn1%
echo 不要 %turn2%
call :ccchange

:check4
if %nb% == 1 goto hidecat
if %nb% == 2 goto cmap

:game2
set nb=1
set cctotal=2
set ccnb=5
set turn2=
:cc5
cls
set turn%nb%=←
echo 【*】
echo.
echo 要玩捡落叶的游戏吗？
echo.
echo 要   %turn1%
echo 不要 %turn2%
call :ccchange

:check5
if %nb% == 1 goto pickmatch
if %nb% == 2 goto cmap
::END

:game3
set name=*
set word=这棵树有一个小小的树洞，
call :msgbox

set nb=1
set cctotal=2
set ccnb=16
set turn2=
:cc16
cls
set turn%nb%=←
echo 【*】
echo.
echo 要消耗5根树枝制作火把进去看看吗？
echo.
echo 要   %turn1%
echo 不要 %turn2%
call :ccchange

:check16
if %nb% == 1 goto usestick
if %nb% == 2 goto cmap

:usestick
set /a stick-=5
echo %apple%;%applecoin%;%stick%;>apple.jy
set fl=0
goto treepath

:treepath
set lable=j
set total=39
call :build

:jnext
set j32=●
set j35=▲
set j38=∩
set j2=∩
set j6=■
set j7=■
set j10=■
set j11=■
set j17=■
set j21=■
set j24=■
set j28=■
set lc=32
set mid=35
set a=3
set floor=1

goto darkmap

:jcheck
if %aim% == 2 goto greatree1
if %aim% == 38 goto jcset
goto dorb

:jcset
set lable=c
set total=121
set a=11
call :build
set c116=∩
set c24=Υ
set c47=Υ
set c67=Υ
set c92=Υ
set c4=Υ
set c21=Υ
set c31=Υ
set c44=Υ
set c76=Υ
set c99=Υ

set /a randomkey=%random%%%10+1
if %randomkey% == 1 set hidemid=15
if %randomkey% == 2 set hidemid=32
if %randomkey% == 3 set hidemid=35
if %randomkey% == 4 set hidemid=42
if %randomkey% == 5 set hidemid=58
if %randomkey% == 6 set hidemid=78
if %randomkey% == 7 set hidemid=87
if %randomkey% == 8 set hidemid=55
if %randomkey% == 9 set hidemid=103
if %randomkey% == 10 set hidemid=110
set /a hidelc=%hidemid%+11

set c%hidelc%=●
set c%hidemid%=▲
set lc=%hidelc%
set mid=%hidemid%
goto cmap

:greatree1
set lable=k
set total=121
call :build

:knext
call :darkmapbuild
set k94=●
set k105=▲
set lc=94
set mid=105
set a=11
set rightdoor=2

goto dorb

:kcheck
if %aim% == 116 call :darkmapbuild&goto rdcheck4
if %aim% == 6 call :darkmapbuild&goto rdcheck2
if %aim% == 56 call :darkmapbuild&goto rdcheck1
if %aim% == 66 call :darkmapbuild&goto rdcheck3
if %aim% == 61 if %errorlevel% == 7 set stairdr=up&goto stair
if %aim% == 61 if %errorlevel% == 8 set stairdr=down&goto stair

goto dorb

:stair
set lable=l
set total=18
call :build

if %stairdr% == down goto lnext
if %stairdr% == up goto mnext

:lnext
set l3=●
set l2=▲
set l1=∩
set l18=∩
set lc=3
set mid=2
set a=6
goto lmap

:mnext
set l16=●
set l17=▲
set l1=∩
set l18=∩
set lc=16
set mid=17
set a=6


:lmap
cls
echo 若 木 台 阶
echo.
echo %l1%%l2%
echo     %l3%
echo       %l4%
echo         %l5%
echo           %l6%
echo           %l12%
echo         %l11%
echo       %l10%
echo     %l9%
echo   %l8% 
echo %l7%
echo %l13%
echo   %l14%
echo     %l15%
echo       %l16%
echo         %l17%%l18%
echo.
goto control

:lcheck
if %aim% == 1 goto stairdoor
if %aim% == 18 goto stairdoor
goto lmap

:lairwall
::upwall
if %udkey% == 2 if %errorlevel% == 1 if not %stairlrkey% == 1 if %stairlrkey% lss 6 set lc=%mid%&set mid=%tail%
if %udkey% == 3 if %errorlevel% == 1 if %stairlrkey% gtr 1 set lc=%mid%&set mid=%tail%
::downwall
if %udkey% == 1 if %errorlevel% == 2 if %stairlrkey% lss 6 set lc=%mid%&set mid=%tail%
if %udkey% == 2 if %errorlevel% == 2 if %stairlrkey% gtr 1 if not %stairlrkey% == 6 set lc=%mid%&set mid=%tail%
goto :eof

:stairdoor
if %floor% == 6 if %aim% == 18 goto xuhuan
if %floor% == 0 if %aim% == 1 goto greatree0

call :darkmapbuild
if %floor% == 0 if %aim% == 18 set floor=1&set k63=●&set k62=▲&set lc=63&set mid=62&goto dorb

if %aim% == 1 set k59=●&set k60=▲&set lc=59&set mid=60
if %aim% == 18 set k63=●&set k62=▲&set lc=63&set mid=62
if %stairdr% == down if %aim% == 18 goto downcheck
if %stairdr% == up if %aim% == 1 set /a floor-=1
if %floor% == 0 goto greatree0

:dorb
if %fl% == 1 goto %lable%map
goto darkmap

:downcheck
if %floor% == 5 if %rightdoor% == 2 set floor=6&goto xuhuan
if %rightdoor% == 1 set /a floor+=1
set rightdoor=2

goto dorb

:rdcheck1
if not %rightdoor% == 2 set rightdoor=0
if not %floor% == 1 set rightdoor=0
if %floor% == 1 if %rightdoor% == 2 set rightdoor=1
set k64=●
set k65=▲
set lc=64
set mid=65

goto dorb

:rdcheck2
if not %rightdoor% == 2 set rightdoor=0
if not %floor% == 2 set rightdoor=0
if %floor% == 2 if %rightdoor% == 2 set rightdoor=1
set k94=●
set k105=▲
set lc=94
set mid=105

goto dorb

:rdcheck3
if not %rightdoor% == 2 set rightdoor=0
if not %floor% == 3 set rightdoor=0
if %floor% == 3 if %rightdoor% == 2 set rightdoor=1
set k58=●
set k57=▲
set lc=58
set mid=57

goto dorb

:rdcheck4
if %floor% == 1 if %rightdoor% == 2 goto kjset
if not %rightdoor% == 2 set rightdoor=0
if not %floor% == 4 set rightdoor=0
if %floor% == 4 if %rightdoor% == 2 set rightdoor=1
set k28=●
set k17=▲
set lc=28
set mid=17

goto dorb

::####
:darkmapbuild
set lable=k
set total=121
set a=11
call :build
set k116=∩
set k6=∩
set k56=∩
set k66=∩
set k61=∩
set k50=■
set k72=■
goto :eof

:kjset
set lable=j
set total=39
set a=3
call :build
set j38=∩
set j2=∩
set j6=■
set j7=■
set j10=■
set j11=■
set j17=■
set j21=■
set j24=■
set j28=■

set j5=▲
set j8=●
set lc=8
set mid=5

goto dorb

:cbset
set lable=b
set total=81
set a=9
call :build
set b23=●
set b14=▲
set b5=∩
set b37=∩
set b45=∩
set b77=∩
set lc=23
set mid=14
goto bmap

:greatree0
set lable=n
set total=25
if %night% == 0 if %snow% == 0 color 2f
if %snow% == 1 color f7
if %night% == 1 color 02
call :build

:nnext
set n13=∩
set n12=▲
set n11=●

set lc=11
set mid=12
set a=5

:nmap
if %snow% == 1 set m2=∷
if %snow% == 0 set m2=～
set gtpark=%m2%
if %boat% == greatree set gtpark=▽

cls
echo 若 木
echo.
echo %n1%%n2%%n3%%n4%%n5%%m2%%m2%%m2%
echo %n6%%n7%%n8%%n9%%n10%%m2%%m2%%m2%
echo %n11%%n12%%n13%%n14%%n15%%gtpark%%m2%%m2%
echo %n16%%n17%%n18%%n19%%n20%%m2%%m2%%m2%
echo %n21%%n22%%n23%%n24%%n25%%m2%%m2%%m2%    
echo.
goto control

:ncheck
if %aim% == 13 goto nkset
if %snow% == 0 if %lc% == 15 if %boat% == greatree if %errorlevel% == 8 goto gtboat
if %snow% == 1 if %lc% == 15 if %boat% == greatree if %errorlevel% == 8 call :iceblock
goto nmap

:gtboat
set nb=1
set cctotal=4
set ccnb=17
set turn2=
set turn3=
set turn4=
:cc17
cls
set turn%nb%=←
echo 【*】
echo.
echo 这是一艘小船。请问要前往？
echo.
echo ICELAND  %turn1%
echo 小溪西岸 %turn2%
echo 小溪东岸 %turn3%
echo 留在原地 %turn4%
call :ccchange

:check17
if %nb% == 1 set boat=iceland&goto dhset
if %nb% == 2 set boat=riverwest&goto hdset
if %nb% == 3 set boat=rivereast&goto hdset
if %nb% == 4 goto nmap

:nkset
set name=*
set word=这是一个巨大的树洞，
call :msgbox

set nb=1
set cctotal=2
set ccnb=18
set turn2=
:cc18
cls
set turn%nb%=←
echo 【*】
echo.
echo 要消耗5根树枝制作火把进去看看吗？
echo.
echo 要   %turn1%
echo 不要 %turn2%
call :ccchange

:check18
if %nb% == 1 goto usestick2
if %nb% == 2 goto nmap

:usestick2
for /f "tokens=1 delims=;" %%i in (apple.jy) do set apple=%%i
for /f "tokens=2 delims=;" %%i in (apple.jy) do set applecoin=%%i
for /f "tokens=3 delims=;" %%i in (apple.jy) do set stick=%%i
if %stick% lss 5 goto nostick
if %firestone% == 0 goto nofire

set /a stick-=5
echo %apple%;%applecoin%;%stick%;>apple.jy

set stairdr=down
color 0e
set rightdoor=2
set floor=0
set fl=0
goto stair

:nostick
set name=*
set word=没有足够的树枝...
call :msgbox
goto %lable%map

:nofire
set name=*
set word=没有生火的工具...
call :msgbox
goto nmap

:pickmatch

set name=*
set word=“呼...”
call :msgbox
set name=*
set word=一阵和风从森林深处吹来，带来了很好闻的草木香味。
call :msgbox
set name=*
set word=放眼向森林深处望去，目力所及之处尽是簌簌的落叶。
call :msgbox

if %night% == 0 set level1=◇&set level2=⊕
if %night% == 1 set level1=＊&set level2=☆&color 0e
if %snow% == 1 set level1=※&set level2=◎&color f7

for /f "tokens=1 delims=;" %%i in (pscore.jy) do set pickptotal=%%i
for /f "tokens=2 delims=;" %%i in (pscore.jy) do set pleaf=%%i
for /f "tokens=3 delims=;" %%i in (pscore.jy) do set papple=%%i
for /f "tokens=4 delims=;" %%i in (pscore.jy) do set pstick=%%i
for /f "tokens=5 delims=;" %%i in (pscore.jy) do set pickpwin=%%i

for /f "tokens=1 delims=;" %%i in (rscore.jy) do set pickrtotal=%%i
for /f "tokens=2 delims=;" %%i in (rscore.jy) do set rleaf=%%i
for /f "tokens=3 delims=;" %%i in (rscore.jy) do set rapple=%%i
for /f "tokens=4 delims=;" %%i in (rscore.jy) do set rstick=%%i
for /f "tokens=5 delims=;" %%i in (rscore.jy) do set pickrwin=%%i
for /f "tokens=6 delims=;" %%i in (rscore.jy) do set fair=%%i

for /f "tokens=1 delims=;" %%i in (apple.jy) do set apple=%%i
for /f "tokens=2 delims=;" %%i in (apple.jy) do set applecoin=%%i
for /f "tokens=3 delims=;" %%i in (apple.jy) do set stick=%%i

cls
set nb=1
set cctotal=5
set ccnb=6
set turn2=
set turn3=
set turn4=
set turn5=
:cc6
cls
set turn%nb%=←
echo.
echo 捡 落 叶
echo.
echo.
echo 比赛模式 %turn1%
echo.
echo 无尽模式 %turn2%
echo.
echo 查看规则 %turn3%
echo.
echo 历史成绩 %turn4%
echo.
echo 离开游戏 %turn5%
echo.
call :ccchange

:check6
if %nb% == 1 set pickmode=cpl&goto menu
if %nb% == 2 set pickmode=el&goto menu
if %nb% == 3 goto pickrule
if %nb% == 4 goto pickhst
if %nb% == 5 goto cmap

:pickhst
cls
set /a roundtotal1=%pickpwin%+%pickrwin%+%fair%
echo 【历史成绩】
echo.
echo     ●     ▲
echo.
echo 总分 %pickptotal%     %pickrtotal%
echo.
echo 落叶 %pleaf%     %rleaf%
echo.
echo 松果 %papple%     %rapple%
echo.
echo 树枝 %pstick%     %rstick%
echo.
echo 胜利 %pickpwin%     %pickrwin%
echo.
echo 平局 %fair%
echo.
echo 总局数 %roundtotal1%
pause>nul
goto pickmatch

:pickrule
set name=规则
set word=欢迎来到_捡落叶_游戏'v'
call :msgbox
set name=规则
set word=在游戏中，●和▲会一起捡落叶，先捡到者得1分。
call :msgbox
set name=规则
set word=有时树上也会落下不同的东西，比如松果和树枝。
call :msgbox
set name=规则
set word=先捡到苹果得3分，先捡到树枝得5分。
call :msgbox
set name=规则
set word=当●与▲处于同一位置时，该位置显示▲。
call :msgbox
set name=规则
set word=在比赛模式中，先得100分者获胜。
call :msgbox
set name=规则
set word=而在无尽模式中，则没有分数的限制。
call :msgbox
set name=规则
set word=如果玩累了不想玩了，可以随时按下“q”键返回主界面。
call :msgbox
set name=悄悄话
set word=一起来体验这款无聊的游戏吧:D
call :msgbox
goto pickmatch

:menu
set pickpscore=0
set pickrscore=0
set lable=f
set total=100
call :build

:fnext
set f43=●
set f48=▲
set plc=43
set rlc=48
set a=10
set nowdst=100

:newapple
set round=0
set /a applelc=%random%%%100+1
if not !f%applelc%! == □ goto newapple

set /a randomkey=%random%%%21
if %randomkey% gtr 4 if not %randomkey% == 20 set f%applelc%=%level1%
if %randomkey% lss 5 set f%applelc%=%level2%
if %randomkey% == 20 set f%applelc%=╱

:fmap
echo %pickptotal%;%pleaf%;%papple%;%pstick%;%pickpwin%;>pscore.jy
echo %pickrtotal%;%rleaf%;%rapple%;%rstick%;%pickrwin%;%fair%;>rscore.jy
echo %apple%;%applecoin%;%stick%;>apple.jy

cls
echo ●：%pickpscore%          ▲:%pickrscore%
echo.
echo.
echo.
echo %f1%%f2%%f3%%f4%%f5%%f6%%f7%%f8%%f9%%f10%
echo %f11%%f12%%f13%%f14%%f15%%f16%%f17%%f18%%f19%%f20%
echo %f21%%f22%%f23%%f24%%f25%%f26%%f27%%f28%%f29%%f30%
echo %f31%%f32%%f33%%f34%%f35%%f36%%f37%%f38%%f39%%f40%
echo %f41%%f42%%f43%%f44%%f45%%f46%%f47%%f48%%f49%%f50%
echo %f51%%f52%%f53%%f54%%f55%%f56%%f57%%f58%%f59%%f60%
echo %f61%%f62%%f63%%f64%%f65%%f66%%f67%%f68%%f69%%f70%
echo %f71%%f72%%f73%%f74%%f75%%f76%%f77%%f78%%f79%%f80%
echo %f81%%f82%%f83%%f84%%f85%%f86%%f87%%f88%%f89%%f90%
echo %f91%%f92%%f93%%f94%%f95%%f96%%f97%%f98%%f99%%f100%
echo.
if %pickmode% == cpl call :endcp1

:pickctrl
choice /c wsadq /n

if %errorlevel% == 5 goto exitask

set /a round+=1

set /a plrkey=%plc%%%%a%
set /a pudkey=%plc%/%a%+1
if %plrkey% == 0 set /a pudkey-=1

set pmid=%plc%
set rmid=%rlc%

if %errorlevel% == 1 set /a plc-=%a%
if %errorlevel% == 2 set /a plc+=%a%
if %errorlevel% == 3 set /a plc-=1
if %errorlevel% == 4 set /a plc+=1

if %plrkey% == 1 if %errorlevel% == 3 set plc=%pmid%
if %plrkey% == 0 if %errorlevel% == 4 set plc=%pmid%
if %plc% lss 1 set plc=%pmid%
if %plc% gtr %total% set plc=%pmid%

:brain
set /a rlrkey=%rlc%%%%a%
set /a rudkey=%rlc%/%a%+1
if %rlrkey% == 0 set /a rudkey-=1
if %rlrkey% == 0 set rlrkey=10

if %nowdst% == 100 goto clown
set /a xdst=%aplrkey%-%rlrkey%
if %xdst% lss 0 set /a xdst=-%xdst%
set /a ydst=%apudkey%-%rudkey%
if %ydst% lss 0 set /a ydst=-%ydst%
set /a nowdst=%xdst%+%ydst%
if !f%applelc%! == ⊕ set /a nowdst-=3
if !f%applelc%! == ☆ set /a nowdst-=3
if !f%applelc%! == ◎ set /a nowdst-=3
if !f%applelc%! == ╱ set /a nowdst-=5

:clown
if not %round% == 1 goto pickmove
call :newdst
if %newdst% lss %nowdst% goto aimchange
goto pickmove

:aimchange
set nowdst=%newdst%
set aplrkey=%newaplrkey%
set apudkey=%newapudkey%

:pickmove
set ticket=0
set /a dis=%pickpscore%-%pickrscore%
if %rlrkey% lss %aplrkey% set /a rlc+=1&set ticket=1
if %rlrkey% gtr %aplrkey% set /a rlc-=1&set ticket=1
if %ticket% == 1 if %dis% lss 3 goto nocrush
if %rudkey% lss %apudkey% set /a rlc+=%a%
if %rudkey% gtr %apudkey% set /a rlc-=%a%

:nocrush
if !f%plc%! == ▲ set plc=%pmid%
if !f%rlc%! == ● set rlc=%rmid%

if !f%plc%! == ◇ set /a pickpscore+=1&set nowdst=100&set /a pickptotal+=1&set /a pleaf+=1
if !f%plc%! == ⊕ set /a pickpscore+=3&set nowdst=100&set /a pickptotal+=3&set /a papple+=1&set /a apple+=1
if !f%plc%! == ＊ set /a pickpscore+=1&set nowdst=100&set /a pickptotal+=1&set /a pleaf+=1
if !f%plc%! == ※ set /a pickpscore+=1&set nowdst=100&set /a pickptotal+=1&set /a pleaf+=1
if !f%plc%! == ☆ set /a pickpscore+=3&set nowdst=100&set /a pickptotal+=3&set /a papple+=1&set /a apple+=1
if !f%plc%! == ◎ set /a pickpscore+=3&set nowdst=100&set /a pickptotal+=3&set /a papple+=1&set /a apple+=1
if !f%plc%! == ╱ set /a pickpscore+=5&set nowdst=100&set /a pickptotal+=5&set /a pstick+=1&set /a stick+=1

if !f%rlc%! == ◇ set /a pickrscore+=1&set nowdst=100&set /a pickrtotal+=1&set /a rleaf+=1
if !f%rlc%! == ⊕ set /a pickrscore+=3&set nowdst=100&set /a pickrtotal+=3&set /a rapple+=1&set /a apple+=1
if !f%rlc%! == ＊ set /a pickrscore+=1&set nowdst=100&set /a pickrtotal+=1&set /a rleaf+=1
if !f%rlc%! == ※ set /a pickrscore+=1&set nowdst=100&set /a pickrtotal+=1&set /a rleaf+=1
if !f%rlc%! == ☆ set /a pickrscore+=3&set nowdst=100&set /a pickrtotal+=3&set /a rapple+=1&set /a apple+=1
if !f%rlc%! == ◎ set /a pickrscore+=3&set nowdst=100&set /a pickrtotal+=3&set /a rapple+=1&set /a apple+=1
if !f%rlc%! == ╱ set /a pickrscore+=5&set nowdst=100&set /a pickrtotal+=5&set /a rstick+=1&set /a stick+=1

set f%pmid%=□
set f%plc%=●
set f%rmid%=□
set f%rlc%=▲

if %round% == 5 goto newapple
goto fmap

:endcp1
if %pickpscore% == %pickrscore% if not %pickrscore% lss 100 set /a fair+=1&goto endmenu
if not %pickpscore% lss 100 set /a pickpwin+=1&goto endmenu
if not %pickrscore% lss 100 set /a pickrwin+=1&goto endmenu
goto :eof
:endmenu

echo %pickptotal%;%pleaf%;%papple%;%pstick%;%pickpwin%;>pscore.jy
echo %pickrtotal%;%rleaf%;%rapple%;%rstick%;%pickrwin%;%fair%;>rscore.jy
echo %apple%;%applecoin%;%stick%;>apple.jy

cls
set nb=1
set cctotal=2
set ccnb=7
set turn2=
:cc7
cls
set turn%nb%=←
echo ●：%pickpscore%          ▲:%pickrscore%
echo.
echo.
echo.
if not %pickpscore% lss 100 echo ●胜利
if not %pickrscore% lss 100 echo ▲胜利
if %pickpscore% == %pickrscore% if not %pickrscore% lss 100 echo 平局
echo.
echo 再来一局 %turn1%       返回菜单 %turn2%
call :ccchange2

:check7
if %nb% == 2 goto pickmatch
if %nb% == 1 goto menu

:exitask
cls
set nb=1
set cctotal=2
set ccnb=8
set turn2=
:cc8
cls
set turn%nb%=←
echo 确定要离开游戏吗？
echo.
echo 不是 %turn1%       是的 %turn2%
call :ccchange2

:check8
if %nb% == 1 goto fmap
if %nb% == 2 goto pickmatch

::####
:ccchange2
choice /c ade /n
if %errorlevel% == 3 goto check%ccnb%
set turn%nb%=
if %errorlevel% == 1 set /a nb-=1
if %errorlevel% == 2 set /a nb+=1
if %nb% gtr %cctotal% set nb=1
if %nb% == 0 set nb=%cctotal%
goto cc%ccnb%


::####
:newdst
set /a newaplrkey=%applelc%%%%a%
set /a newapudkey=%applelc%/%a%+1
if %newaplrkey% == 0 set /a newapudkey-=1
if %newaplrkey% == 0 set newaplrkey=10

set /a xdst=%newaplrkey%-%rlrkey%
if %xdst% lss 0 set /a xdst=-%xdst%
set /a ydst=%newapudkey%-%rudkey%
if %ydst% lss 0 set /a ydst=-%ydst%
set /a newdst=%xdst%+%ydst%
if !f%applelc%! == ⊕ set /a newdst-=3
if !f%applelc%! == ☆ set /a newdst-=3
if !f%applelc%! == ◎ set /a newdst-=3
if !f%applelc%! == ╱ set /a newdst-=5
goto :eof

::####
:build
set nb=0
:back
set /a nb+=1
set %lable%%nb%=□
if %nb% == %total% goto :eof
goto back

::####
:ccchange
choice /c wse /n
if %errorlevel% == 3 goto check%ccnb%
set turn%nb%=
if %errorlevel% == 1 set /a nb-=1
if %errorlevel% == 2 set /a nb+=1
if %nb% gtr %cctotal% set nb=1
if %nb% == 0 set nb=%cctotal%
goto cc%ccnb%

::####
:msgbox
set nb=1
set string=0
:msgbox2
cls
echo 【%name%】
echo.
set msg=!word:~0,%nb%!
echo %msg%
if %string% == %msg% pause>nul&goto :eof

set nb2=0
for /f "tokens=1 delims=;" %%i in (wordspeed.jy) do set wordelay=%%i
:delay
set /a nb2+=1
if %nb2% == %wordelay% set string=%msg%&set /a nb+=1&goto msgbox2
goto delay

::####
:playermenu
set nb=1
set cctotal=4
set ccnb=20
set turn2=
set turn3=
set turn4=
:cc20
cls
set turn%nb%=←
echo 【菜 单】
echo.
echo   状 态 %turn1%
echo.
echo   背 包 %turn2%
echo.
echo   设 置 %turn3%
echo.
echo   离 开 %turn4%
call :ccchange3

:ccchange3
choice /c wseq /n
if %errorlevel% == 3 goto check%ccnb%
if %errorlevel% == 4 if not %lable% == j if not %lable% == k goto %lable%map
if %errorlevel% == 4 if %lable% == j goto dorb
if %errorlevel% == 4 if %lable% == k goto dorb

set turn%nb%=
if %errorlevel% == 1 set /a nb-=1
if %errorlevel% == 2 set /a nb+=1
if %nb% gtr %cctotal% set nb=1
if %nb% == 0 set nb=%cctotal%
goto cc%ccnb%

:check20
if %nb% == 1 goto condition
if %nb% == 2 set backlable=playermenu&set backlable2=bag&goto bag
if %nb% == 3 goto set
if %nb% == 4 goto leaveask

:bag
cls
set nb=1
set ccnb=23

set aturn2=
set aturn3=
set aturn4=
set aturn5=
set aturn6=
set aturn7=
set aturn8=

for /f "tokens=1 delims=;" %%i in (own.jy) do set juice=%%i
for /f "tokens=2 delims=;" %%i in (own.jy) do set bread=%%i
for /f "tokens=3 delims=;" %%i in (own.jy) do set firestone=%%i
for /f "tokens=4 delims=;" %%i in (own.jy) do set flashlight=%%i
for /f "tokens=5 delims=;" %%i in (own.jy) do set knife=%%i
for /f "tokens=6 delims=;" %%i in (own.jy) do set greatreemap=%%i
for /f "tokens=7 delims=;" %%i in (own.jy) do set battery=%%i
for /f "tokens=8 delims=;" %%i in (own.jy) do set fish=%%i

for /f "tokens=1 delims=;" %%i in (condition.jy) do set level=%%i
for /f "tokens=2 delims=;" %%i in (condition.jy) do set hp=%%i
for /f "tokens=3 delims=;" %%i in (condition.jy) do set exp=%%i
set /a hplimit=%level%*%level%*2+%level%+15

:cc23
set /a exchoice=%firestone%+%flashlight%+%knife%+%greatreemap%+%battery%+%fish%
if %juice% == %bread% if %bread% == 0 if %exchoice% == 0 echo 暂无物品...&pause>nul&goto %backlable%

set aturn%nb%=←

call :bagmenu
call :ccchange5

:check23
call :bagmenu

if %nb% == 1 set medicine=1&goto cc24start
if %nb% == 2 set medicine=2&goto cc24start
if %nb% == 3 goto fsrcm
if %nb% == 4 goto flrcm
if %nb% == 5 goto nfrcm
if %nb% == 6 goto grmrcm
if %nb% == 7 goto btrcm
if %nb% == 8 set medicine=3&goto cc24start

:fishrcm
set name=小鱼干
set word=⊙w⊙在小溪中钓到的小鱼，食用后可恢复所有HP。
call :msgbox
goto bag

:fsrcm
set name=燧石
set word=松鼠店长在小溪边发现的两块深灰色岩石，摩擦可以产生火花。
call :msgbox
goto bag

:flrcm
set name=手电筒
set word=在黑暗的地方按下“F”键可以照亮整片区域。
call :msgbox
goto bag

:nfrcm
set name=小刀
set word=非常锋利的小刀，自动装备以增加攻击力。
call :msgbox
goto bag

:grmrcm
set name=山海经
set word=...昆山之下，弱水之上，有若木焉。
call :msgbox
set name=山海经
set word=...若木呈龙状顺时针盘旋而下，凡六层。
call :msgbox
set name=山海经
set word=...各类鬼蜮游乎其间，自非亭午不可见矣。
call :msgbox
goto bag

:btrcm
set name=琥珀
set word=由若木树脂天然形成，呈鹅卵状，
call :msgbox
set name=琥珀
set word=通体晶莹剔透，散发松香，似乎有着神秘的力量...
call :msgbox
goto bag

:jcrcm
set name=果汁
set word=若木果实的果汁，饮用后可少量回复HP。
call :msgbox
goto bag

:bdrcm
set name=面包
set word=普通的面包，食用后可恢复一定量HP。
call :msgbox
goto bag

:cc24start
set nb=1
set cctotal=2
set ccnb=24
set turn2=
:cc24

set turn%nb%=←
call :bagmenu
echo.
echo 使用 %turn1%       查看 %turn2%
call :ccchange2

:check24
if %medicine% == 1 if %nb% == 1 goto juiceheal
if %medicine% == 2 if %nb% == 1 goto breadheal
if %medicine% == 1 if %nb% == 2 goto jcrcm
if %medicine% == 2 if %nb% == 2 goto bdrcm
if %medicine% == 3 if %nb% == 1 goto fishheal
if %medicine% == 3 if %nb% == 2 goto fishrcm

:fishheal
set /a fish-=1
set hp=%hplimit%
echo %juice%;%bread%;%firestone%;%flashlight%;%knife%;%greatreemap%;%battery%;%fish%;>own.jy
echo %level%;%hp%;%exp%;>condition.jy
goto %backlable2%

:juiceheal
set /a juice-=1
set /a hp+=20
if %hp% gtr %hplimit% set hp=%hplimit%
echo %juice%;%bread%;%firestone%;%flashlight%;%knife%;%greatreemap%;%battery%;%fish%;>own.jy
echo %level%;%hp%;%exp%;>condition.jy
goto %backlable2%

:breadheal
set /a bread-=1
set /a hp+=50
if %hp% gtr %hplimit% set hp=%hplimit%
echo %juice%;%bread%;%firestone%;%flashlight%;%knife%;%greatreemap%;%battery%;%fish%;>own.jy
echo %level%;%hp%;%exp%;>condition.jy
goto %backlable2%

:ccchange5
choice /c wseq /n
if %errorlevel% == 4 goto %backlable%
if %errorlevel% == 3 goto check%ccnb%
set aturn%nb%=
if %errorlevel% == 1 set /a nb-=1&set correct=1
if %errorlevel% == 2 set /a nb+=1&set correct=-1

if %nb% gtr 8 set nb=1
if %nb% == 0 set nb=8

call :cc23ud
goto cc%ccnb%

:cc23ud
if %nb% == 1 if %juice% == 0 set /a nb-=%correct%&goto cc23ud
if %nb% == 1 if not %juice% == 0 goto :eof
if %nb% == 2 if %bread% == 0 set /a nb-=%correct%&goto cc23ud
if %nb% == 2 if not %bread% == 0 goto :eof
if %nb% == 3 if %firestone% == 0 set /a nb-=%correct%&goto cc23ud
if %nb% == 3 if %firestone% == 1 goto :eof
if %nb% == 4 if %flashlight% == 0 set /a nb-=%correct%&goto cc23ud
if %nb% == 4 if %flashlight% == 1 goto :eof
if %nb% == 5 if %knife% == 0 set /a nb-=%correct%&goto cc23ud
if %nb% == 5 if %knife% == 1 goto :eof
if %nb% == 6 if %greatreemap% == 0 set /a nb-=%correct%&goto cc23ud
if %nb% == 6 if %greatreemap% == 1 goto :eof
if %nb% == 7 if %battery% == 0 set /a nb-=%correct%&goto cc23ud
if %nb% == 7 if %battery% == 1 goto :eof
if %nb% == 8 if %fish% == 0 set /a nb-=%correct%&goto cc23ud
if %nb% == 8 if %fish% == 1 goto :eof

:bagmenu
cls
echo HP:%hp%/%hplimit%
echo.
echo 物品   已拥有数量
if not %juice% == 0 echo.
if not %juice% == 0 echo 果汁       %juice%       %aturn1%
if not %bread% == 0 echo.
if not %bread% == 0 echo 面包       %bread%       %aturn2%
if %firestone% == 1 echo.
if %firestone% == 1 echo 燧石       %firestone%       %aturn3%
if %flashlight% == 1 echo.
if %flashlight% == 1 echo 手电筒     %flashlight%       %aturn4%
if %knife% == 1 echo.
if %knife% == 1 echo 小刀       %knife%       %aturn5%
if %greatreemap% == 1 echo.
if %greatreemap% == 1 echo 山海经     %greatreemap%       %aturn6%
if %battery% == 1 echo.
if %battery% == 1 echo 琼脂       %battery%       %aturn7%
if %fish% == 1 echo.
if %fish% == 1 echo 小鱼干     %fish%       %aturn8%
goto :eof

:condition
for /f "tokens=1 delims=;" %%i in (apple.jy) do set apple=%%i
for /f "tokens=2 delims=;" %%i in (apple.jy) do set applecoin=%%i
for /f "tokens=3 delims=;" %%i in (apple.jy) do set stick=%%i

cls
set /a hplimit=%level%*%level%*2+%level%+15
set /a defend=%level%*3
set /a speed=%level%*4+2
set /a uplimit=%level%*%level%*%level%+15

set /a hpblock=%hp%*10/%hplimit%+1
set /a expblock=%exp%*10/%uplimit%+1
if %hpblock% == 11 set hpblock=10
if %expblock% == 11 set expblock=10
if %expblock% == 1 set expblock=0
set nb=-1
:hploop2
set /a nb+=1
if not %nb% gtr %hpblock% set hp%nb%=■
if %nb% gtr %hpblock% set hp%nb%=□
if not %nb% gtr %expblock% set exp%nb%=■
if %nb% gtr %expblock% set exp%nb%=□
if %nb% == 10 goto condition2 
goto hploop2

:condition2
echo ●＆▲
echo.
echo LEVEL:%level%
echo.
echo HP:%hp%/%hplimit%
echo %hp1%%hp2%%hp3%%hp4%%hp5%%hp6%%hp7%%hp8%%hp9%%hp10%
echo.
echo EXP:%exp%/%uplimit%
echo %exp1%%exp2%%exp3%%exp4%%exp5%%exp6%%exp7%%exp8%%exp9%%exp10%
echo.
echo ⊕:%applecoin%
echo ╱:%stick%
echo.
if %knife% == 1 echo 装备：小刀
if %knife% == 0 echo 装备：无
pause>nul
goto playermenu

:set
cls
echo %wordelay%;>wordspeed.jy
set /a speed=11-%wordelay%
echo 【设 置】
echo.
echo 字节跳动速度:%speed%
echo.
echo 通过ws控制字节跳动速度...
choice /c wsq /n
if %errorlevel% == 3 goto cc20
if %errorlevel% == 1 set /a wordelay-=1
if %errorlevel% == 2 set /a wordelay+=1
if %wordelay% == 11 set wordelay=10
if %wordelay% == 0 set wordelay=1
goto set

:leaveask
cls
set nb=1
set cctotal=2
set ccnb=21
set aturn2=
:cc21
cls
set turn%nb%=←
echo 【*】
echo.
echo 确定要离开游戏吗？你的进度已储存。
echo.
echo 不是 %turn1%       是的 %turn2%
call :ccchange2

:check21
if %nb% == 1 goto playermenu
if %nb% == 2 goto frstcheck

:frstcheck
if %lable% == c echo %alllife%;%turndown%;%hidecat%;%encountercat%;%night%;%snow%;%alsohide%;%endworld%;1;%boat%;>switch.jy
goto start

::####
:control
echo %alllife%;%turndown%;%hidecat%;%encountercat%;%night%;%snow%;%alsohide%;%endworld%;%join%;%boat%;>switch.jy
choice /c wsadujhkq /n

if %errorlevel% == 9 goto playermenu

set /a lrkey=%lc%%%%a%

set stairlrkey=%lrkey%
if %stairlrkey% == 0 set stairlrkey=6

set /a udkey=%lc%/%a%+1
if %lrkey% == 0 set /a udkey-=1

if %errorlevel% == 5 set /a aim=%lc%-%a%&goto bfxcheck
if %errorlevel% == 6 set /a aim=%lc%+%a%&goto bfxcheck
if %errorlevel% == 7 set /a aim=%lc%-1&goto bfxcheck
if %errorlevel% == 8 set /a aim=%lc%+1&goto bfxcheck

if %join% == 1 set tail=%mid%
set mid=%lc%

if %errorlevel% == 1 set /a lc-=%a%
if %errorlevel% == 2 set /a lc+=%a%
if %errorlevel% == 3 set /a lc-=1
if %errorlevel% == 4 set /a lc+=1

if %lrkey% == 1 if %errorlevel% == 3 set lc=%mid%
if %lrkey% == 0 if %errorlevel% == 4 set lc=%mid%
if %lc% lss 1 set lc=%mid%
if %lc% gtr %total% set lc=%mid%
if %join% == 0 if not !%lable%%lc%! == □ set lc=%mid%
if %join% == 1 if not !%lable%%lc%! == □ if not !%lable%%lc%! == ▲ set lc=%mid%&set mid=%tail%

::@@@@
if %lable% == b call :bairwall
if %lable% == d call :dairwall
if %lable% == l call :lairwall

set %lable%%mid%=□
if %join% == 1 set %lable%%tail%=□
if %join% == 1 set %lable%%mid%=▲
set %lable%%lc%=●
goto %lable%map

:bfxcheck
if %lrkey% == 1 if %errorlevel% == 7 set aim=0
if %lrkey% == 0 if %errorlevel% == 8 set aim=0
goto %lable%check

::####
:ghbuild
set lable=g
set total=72
set nb=0
:backX
set /a nb+=1
if %snow% == 1 set %lable%%nb%=∷
if %snow% == 0 set %lable%%nb%=～
if %nb% == %total% goto hbuild
goto backX

:hbuild
set lable=h
set total=15
call :build
goto :eof

::####
:darkmap
set boss=0

set /a lrkey=%lc%%%%a%
set /a udkey=%lc%/%a%+1
if %lrkey% == 0 set /a udkey-=1
set /a b=%total%/%a%

set /a lulc=%lc%-%a%-1
set /a rulc=%lc%-%a%+1
set /a llc=%lc%-1
set /a rlc=%lc%+1
set /a ulc=%lc%-%a%
set /a dlc=%lc%+%a%
set /a ldlc=%lc%+%a%-1
set /a rdlc=%lc%+%a%+1

set lu=!%lable%%lulc%!
set u=!%lable%%ulc%!
set ru=!%lable%%rulc%!
set l=!%lable%%llc%!
set r=!%lable%%rlc%!
set ld=!%lable%%ldlc%!
set d=!%lable%%dlc%!
set rd=!%lable%%rdlc%!

if %lrkey% == 1 call :ldark
if %lrkey% == 0 call :rdark
goto darkmap2

:ldark
set l=　
set lu=　
set ld=　
goto :eof

:rdark
set r=　
set ru=　
set rd=　
goto :eof

:darkmap2
color 0e
cls
echo 若 木（-%floor%层）
echo.
if %udkey% == 1 echo.&goto echomid
echo %lu%%u%%ru%
:echomid
echo %l%!%lable%%lc%!%r%
if %udkey% == %b% echo.&goto echoend
echo %ld%%d%%rd%
:echoend
echo.

:darkcontrol
set /a randomkey=%random%%%10
if %floor% lss 5 if %randomkey% == 0 goto fight

choice /c wsadujhkfq /n
if %errorlevel% == 10 goto playermenu
if %errorlevel% == 9 if %flashlight% == 1 goto flashlight
if %errorlevel% == 5 set /a aim=%lc%-%a%&goto bfxcheck
if %errorlevel% == 6 set /a aim=%lc%+%a%&goto bfxcheck
if %errorlevel% == 7 set /a aim=%lc%-1&goto bfxcheck
if %errorlevel% == 8 set /a aim=%lc%+1&goto bfxcheck

set tail=%mid%
set mid=%lc%

if %errorlevel% == 1 set /a lc-=%a%
if %errorlevel% == 2 set /a lc+=%a%
if %errorlevel% == 3 set /a lc-=1
if %errorlevel% == 4 set /a lc+=1

if %lrkey% == 1 if %errorlevel% == 3 set lc=%mid%
if %lrkey% == 0 if %errorlevel% == 4 set lc=%mid%
if %lc% lss 1 set lc=%mid%
if %lc% gtr %total% set lc=%mid%
if not !%lable%%lc%! == □ if not !%lable%%lc%! == ▲ set lc=%mid%&set mid=%tail%

set %lable%%tail%=□
set %lable%%mid%=▲
set %lable%%lc%=●

goto dorb

::####
:flashlight
if %fl% == 0 set fl=1&goto %lable%map
if %fl% == 1 set fl=0&goto darkmap

:jmap
cls
echo 狭 长 树 道
echo.
echo %j1%%j2%%j3%
echo %j4%%j5%%j6%
echo %j7%%j8%%j9%
echo %j10%%j11%%j12%
echo %j13%%j14%%j15%
echo %j16%%j17%%j18%
echo %j19%%j20%%j21%
echo %j22%%j23%%j24%
echo %j25%%j26%%j27%
echo %j28%%j29%%j30%
echo %j31%%j32%%j33%
echo %j34%%j35%%j36%
echo %j37%%j38%%j39%
echo.
goto darkcontrol

:kmap
cls
echo 若 木（-%floor%层）
echo.
echo %k1%%k2%%k3%%k4%%k5%%k6%%k7%%k8%%k9%%k10%%k11%
echo %k12%%k13%%k14%%k15%%k16%%k17%%k18%%k19%%k20%%k21%%k22%
echo %k23%%k24%%k25%%k26%%k27%%k28%%k29%%k30%%k31%%k32%%k33%
echo %k34%%k35%%k36%%k37%%k38%%k39%%k40%%k41%%k42%%k43%%k44%
echo %k45%%k46%%k47%%k48%%k49%%k50%%k51%%k52%%k53%%k54%%k55%
echo %k56%%k57%%k58%%k59%%k60%%k61%%k62%%k63%%k64%%k65%%k66%
echo %k67%%k68%%k69%%k70%%k71%%k72%%k73%%k74%%k75%%k76%%k77%    
echo %k78%%k79%%k80%%k81%%k82%%k83%%k84%%k85%%k86%%k87%%k88%
echo %k89%%k90%%k91%%k92%%k93%%k94%%k95%%k96%%k97%%k98%%k99%
echo %k100%%k101%%k102%%k103%%k104%%k105%%k106%%k107%%k108%%k109%%k110%
echo %k111%%k112%%k113%%k114%%k115%%k116%%k117%%k118%%k119%%k120%%k121%
echo.
goto darkcontrol

:fight
for /f "tokens=1 delims=;" %%i in (condition.jy) do set level=%%i
for /f "tokens=2 delims=;" %%i in (condition.jy) do set hp=%%i
for /f "tokens=3 delims=;" %%i in (condition.jy) do set exp=%%i

set /a hplimit=%level%*%level%*2+%level%+15
set /a defend=%level%*3
set /a speed=%level%*4+2
set /a uplimit=%level%*%level%*%level%+15

if %boss% == 1 call :eyelesscat
if %floor% == 1 call :lovely
if %floor% == 2 call :tearsmile
if %floor% == 3 call :ghost
if %floor% == 4 call :doorsmile

set name=*
set word=%mstname%挡住了去路...
call :msgbox

if %speed% lss %mstspeed% goto monster
goto player

:monster
call :fightmenu

if %boss% == 1 call :elcat
if %floor% == 1 call :llat
if %floor% == 2 call :tsat
if %floor% == 3 call :gstat
if %floor% == 4 call :dsat

set /a hurt=%mstattack%-%defend%
if not %hurt% gtr 0 set hurt=0

set /a hp-=%hurt%
echo %level%;%hp%;%exp%;>condition.jy
echo %mstname%对你造成了%hurt%点伤害...

if %boss% == 1 goto drinkblood
goto monsternext

:drinkblood
set /a randomkey=%random%%%3
if %randomkey% == 0 goto drinkblood2
goto monsternext

:drinkblood2
set /a msthp+=%hurt%
if %msthp% gtr 300 set msthp=300
echo ○w○回复了%hurt%点HP...

:monsternext
pause>nul

if not %hp% gtr 0 goto gameover
goto player

:gameover
echo.
echo 你失败了...
pause>nul

set name=*
set word=......
call :msgbox

set lable=a
set total=20
call :build
color 8f
set a6=●
set a11=▲
set a10=∩
set lc=6
set mid=11
set a=5
set night=0
set hp=%hplimit%
echo %level%;%hp%;%exp%;>condition.jy
call :homemap
choice /c p /d p /t 1 /n

set name=●＆▲
set word=原来...只是一场梦呀...
call :msgbox
goto amap

:player
set /a hpblock=%hp%*10/%hplimit%+1
if %hpblock% == 11 set hpblock=10
set nb=0
:hploop
set /a nb+=1
if not %nb% gtr %hpblock% set hp%nb%=■
if %nb% gtr %hpblock% set hp%nb%=□
if %nb% == 10 goto cc22start
goto hploop

:cc22start
set attacknb=1
set cctotal=3
set ccnb=22
set turn2=
set turn3=

:player2
call :fightmenu
:cc22
set nb=%attacknb%
set turn%nb%=←
echo 攻击 %turn1%   道具 %turn2%   逃跑 %turn3%
goto ccchange4

:check22
if %nb% == 1 goto attack
if %nb% == 2 goto medicine
if %nb% == 3 goto runaway

:ccchange4
choice /c ade /n
if %errorlevel% == 3 goto check%ccnb%
set turn%nb%=
if %errorlevel% == 1 set /a nb-=1
if %errorlevel% == 2 set /a nb+=1
if %nb% gtr %cctotal% set nb=1
if %nb% == 0 set nb=%cctotal%
set attacknb=%nb%
goto player2

:fightmenu
cls
echo ●＆▲   LV:%level%
echo.
echo HP:%hp%/%hplimit%
echo %hp1%%hp2%%hp3%%hp4%%hp5%%hp6%%hp7%%hp8%%hp9%%hp10%
echo.
goto :eof

:attack
set /a attackfalse=%random%%%4+3
set /a attack=%level%*3+%attackfalse%
if %knife% == 1 set /a attack+=10

set /a msthp-=%attack%
echo %level%;%hp%;%exp%;>condition.jy
call :fightmenu
echo 你对%mstname%造成了%attack%点伤害...
pause>nul

if not %msthp% gtr 0 goto fightwin
goto monster

:fightwin

if %boss% == 1 set boss=0&echo 1;>switch2.jy

set /a exp+=%mstharvest%
echo %level%;%hp%;%exp%;>condition.jy

echo.
echo 你胜利了！
echo.
echo 获得了%mstharvest%点exp...
if not %exp% lss %uplimit% goto levelup
pause>nul
goto dorb

:levelup
set /a level+=1
set /a exp-=%uplimit%

set /a hplimit=%level%*%level%*2+%level%+15
set hp=%hplimit%
echo %level%;%hp%;%exp%;>condition.jy

echo.
echo 你的等级已提升为%level%级！
pause>nul
if %lable% == p goto pmap
goto dorb

:runaway
set /a slow=%mstspeed%-%speed%
set /a slowlimit=%random%%%6+5
if %slow% gtr %slowlimit% goto tooslow
goto dorb

:tooslow
call :fightmenu
echo.
echo 逃跑失败...
pause>nul
goto monster

:medicine
set backlable=monster
set backlable2=monster
goto bag

:eyelesscat
set mstname=○w○
set msthp=300
set mstspeed=50
set mstharvest=300
:elcat
set /a mstattack=%random%%%5+58
goto :eof

:lovely
set mstname='v'
set msthp=20
set mstspeed=4
set /a mstharvest=%random%%%3+3
:llat
set /a mstattack=%random%%%3+5
goto :eof

:tearsmile
set mstname=ivi
set msthp=50
set mstspeed=15
set /a mstharvest=%random%%%4+9
:tsat
set /a mstattack=%random%%%5+13
goto :eof

:ghost
set mstname=＠_＠
set msthp=80
set mstspeed=24
set /a mstharvest=%random%%%5+15
:gstat
set /a mstattack=%random%%%5+22
goto :eof

:doorsmile
set mstname=∩_∩
set msthp=100
set mstspeed=36
set /a mstharvest=%random%%%5+28
:dsat
set /a mstattack=%random%%%5+30
goto :eof

:homemap
cls
echo H O M E
echo.
echo %a1%%a2%%a3%%a4%%a5%
echo %a6%%a7%%a8%%a9%%a10%
echo %a11%%a12%%a13%%a14%%a15%
echo %a16%%a17%%a18%%a19%%a20%
echo.
goto :eof

:xuhuan
set lable=p
set total=21
call :build

:pnext
set p14=●
set p17=▲
set p20=∩
set p2=⊙
set lc=14
set mid=17
set a=3

:pmap
color b3
cls
echo 若 木（-%floor%层）
echo.
echo %p1%%p2%%p3%
echo %p4%%p5%%p6%
echo %p7%%p8%%p9%
echo %p10%%p11%%p12%
echo %p13%%p14%%p15%
echo %p16%%p17%%p18%
echo %p19%%p20%%p21%
echo.
goto control

:pcheck
for /f "tokens=1 delims=;" %%i in (switch2.jy) do set bosswin=%%i

if %aim% == 2 if %bosswin% == 0 goto xh
if %aim% == 2 if %bosswin% == 1 goto xh2
if %aim% == 20 goto pkset
goto %lable%map

:pkset
set stairdr=up
color 0e
set rightdoor=2
goto stair

:xh2
cls
echo 【*】
echo.
echo 机器人的旁边有一封信:
echo.
echo.
echo 总有一天，姐姐会醒过来的...
echo.
echo 在这之前，我一定会保护好姐姐。
echo.
echo.               
echo                  你最虔诚的
echo                     ⊙w⊙
echo.
pause>nul
                 
set /a randomkey=%random%%%2
if %randomkey% == 0 if %battery% == 1 goto chargeask
goto pmap

:chargeask
set nb=1
set cctotal=2
set ccnb=27
set turn2=
:cc27
cls
set turn%nb%=←
echo 【*】
echo.
echo 机器人的一处有一个凹槽，要将琥珀安上去试试吗？
echo.
echo 要   %turn1%
echo 不要 %turn2%
call :ccchange

:check27
if %nb% == 1 goto vrworld
if %nb% == 2 goto pmap

:xh
set name=*
set word=长廊的尽头摆放着一个破旧不堪的机器人,
call :msgbox
set name=*
set word=许多的光纤与电线已经裸露在机体之外...
call :msgbox

set nb=1
set cctotal=2
set ccnb=26
set turn2=
:cc26
cls
set turn%nb%=←
echo 【*】
echo.
echo 要触摸机器人吗？
echo.
echo 要   %turn1%
echo 不要 %turn2%
call :ccchange

:check26
if %nb% == 1 set boss=1&goto fight
if %nb% == 2 goto pmap

:vrworld
cls
color f7
choice /c p /d p /t 1 /n
color 2f

set lable=q
set total=100
call :build

:qnext
set q22=●
set q23=▲
set q33=←
set q60=∩

:qmap
cls
echo 虚 拟 世 界
echo.
echo %q1% %q2% %q3% %q4% %q5% %q6% %q7% %q8% %q9% %q10%
echo %q11% %q12% %q13% %q14% %q15% %q16% %q17% %q18% %q19% %q20%
echo %q21% %q22% %q23% %q24% %q25% %q26% %q27% %q28% %q29% %q30%
echo %q31% %q32% %q33% %q34% %q35% %q36% %q37% %q38% %q39% %q40%
echo %q41% %q42% %q43% %q44% %q45% %q46% %q47% %q48% %q49% %q50%
echo %q51% %q52% %q53% %q54% %q55% %q56% %q57% %q58% %q59% %q60%
echo %q61% %q62% %q63% %q64% %q65% %q66% %q67% %q68% %q69% %q70%
echo %q71% %q72% %q73% %q74% %q75% %q76% %q77% %q78% %q79% %q80%
echo %q81% %q82% %q83% %q84% %q85% %q86% %q87% %q88% %q89% %q90%
echo %q91% %q92% %q93% %q94% %q95% %q96% %q97% %q98% %q99% %q100%
echo.

choice /c p /d p /t 2 /n
set name=？？？
set word=欢迎来到虚拟世界⌒_⌒
call :msgbox

echo 15;>wordspeed.jy
set name=*
set word=...END
call :msgbox
set name=*
set word=......
call :msgbox
set name=*
set word=......
call :msgbox

echo 5;>wordspeed.jy
set name=TwT
set word=感觉好像烂尾了,呜呜呜...
call :msgbox
set name=＞_＜
set word=本来还想在篝火晚会上加一丢丢爱情的...
call :msgbox
set name=＞v＜
set word=果然还是加不了一点，呜呜呜...
call :msgbox
set name=*
set word=......
call :msgbox
set name='v'
set word=总而言之！
call :msgbox
set name='v'
set word=如果能玩得开心的话，
call :msgbox
set name=='v'=
set word=就一切都没所谓了吧～
call :msgbox

goto start
