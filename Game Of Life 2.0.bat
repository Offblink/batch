@echo off
title Game Of Live 2.0
color f0
setlocal enabledelayedexpansion
set bornmin=3
set bornmax=3
set staymin=2
set staymax=3
set population=0

:return
set delay=?
set /p a=A:
set /p b=B:
set /a total=%a%*%b%
call :clean
goto initial

:clean
set population=0
set nb=0
:back4
set /a nb+=1
set a%nb%=¡õ
set b%nb%=w
if %nb% == %total% goto :eof
goto back4

:initial
set generation=0
set new=1
set clown=0
call :echo
echo.
set /p location=Location:
if %location:~0,1% == x set x=%location:~1%&goto y
if %location% == b cls&goto return
if %location% == r set nb=0&goto back
if %location% == f goto next
if %location% == s goto setting
if %location% == c call :clean&goto initial
goto mid
:y
set /p location2=Location2:
set y=%location2:~1%
set /a location=(%y%-1)*%a%+%x%
:mid
set /p color=Color:
if %color% == w set block=¡õ
if %color% == b set block=¡ö

:place
set middle=!a%location%!
set a%location%=%block%
if %middle% == ¡õ if !a%location%! == ¡ö set b%location%=b&set /a population+=1
if %middle% == ¡ö if !a%location%! == ¡õ set b%location%=w&set /a population-=1
goto initial

:back
set /a nb+=1
set /a key=%random%%%2
if %key% == 0 set a%nb%=¡õ&set b%nb%=w
if %key% == 1 set a%nb%=¡ö&set b%nb%=b&set /a population+=1
if %nb% == %total% goto next
goto back

:next
set last=%population%

if %new% == 1 goto next2
set endminute=%time:~3,2%
set endsecond=%time:~6,2%
if %endsecond:~0,1% == 0 set endsecond=%endsecond:~1,1%
if %endminute:~0,1% == 0 set endminute=%endminute:~1,1%
set /a minutex=%endminute%-%beginminute%
set /a secondx=%endsecond%-%beginsecond%
if %minutex% lss 0 set /a minutex+=60
set /a delay=(%minutex%)*60+%secondx%

:next2
call :echo
echo.
set /a generation+=1
if %population% gtr 2 call :graph
if %population% == 2 echo ..>>Graph.txt
if %population% == 1 echo .>>Graph.txt
if not %clown% == c set /p clown=
if %clown% == b goto initial

set beginminute=%time:~3,2%
set beginsecond=%time:~6,2%
if %beginsecond:~0,1% == 0 set beginsecond=%beginsecond:~1,1%
if %beginminute:~0,1% == 0 set beginminute=%beginminute:~1,1%
set new=0
set population=0
set nb=1

:start
set /a edge=%nb%%%%a%
if %nb% gtr %total% goto translate
set neighbour=0
set /a up=%nb%-%a%
set /a down=%nb%+%a%
set /a left=%nb%-1
set /a right=%nb%+1
if %edge% == 0 set /a right-=%a%
if %edge% == 1 set /a left+=%a%
if %down% gtr %total% set /a down-=%total%
if %up% lss 1 set /a up+=%total%
set /a leftup=%left%-%a%
set /a leftdown=%left%+%a%
set /a rightup=%right%-%a%
set /a rightdown=%right%+%a%
if %leftdown% gtr %total% set /a leftdown-=%total%
if %rightdown% gtr %total% set /a rightdown-=%total%
if %leftup% lss 1 set /a leftup+=%total%
if %rightup% lss 1 set /a rightup+=%total%
if !a%up%! == ¡ö set /a neighbour+=1
if !a%down%! == ¡ö set /a neighbour+=1
if !a%left%! == ¡ö set /a neighbour+=1
if !a%right%! == ¡ö set /a neighbour+=1
if !a%leftup%! == ¡ö set /a neighbour+=1
if !a%leftdown%! == ¡ö set /a neighbour+=1
if !a%rightup%! == ¡ö set /a neighbour+=1
if !a%rightdown%! == ¡ö set /a neighbour+=1
if !a%nb%! == ¡õ if %neighbour% lss %bornmin% set /a nb+=1&goto start
if !a%nb%! == ¡õ if %neighbour% gtr %bornmax% set /a nb+=1&goto start
if !a%nb%! == ¡ö if %neighbour% lss %staymin% set b%nb%=w
if !a%nb%! == ¡ö if %neighbour% gtr %staymax% set b%nb%=w
if !a%nb%! == ¡õ set b%nb%=b
set /a nb+=1
goto start

:translate
set nb=1
:loop
if !b%nb%! == w set a%nb%=¡õ
if !b%nb%! == b set a%nb%=¡ö&set /a population+=1
if %nb% == %total% if %population% == %last% call :ask
if %nb% == %total% goto next
set /a nb+=1
goto loop

:echo
cls
set line=0
echo Generation:%generation%  Population:%population%  Delay:%delay%s
echo.
:back3
set /a final=%line%*%a%+1
set /a limit=(%line%+1)*%a%
set string=!a%final%!
set /a nb=%line%*%a%+2
:back2
set string=%string%!a%nb%!
if %nb% == %limit% goto check
set /a nb+=1
goto back2
:check
echo %string%
set /a line+=1
if %line% == %b% goto :eof
goto back3

:setting
cls
set /p bornmin=Bornmin:
set /p bornmax=Bornmax:
set /p staymin=Staymin:
set /p staymax=Staymax:
goto initial

:graph
set length=.
set nb=1
:back5
set /a nb+=1
set length=%length%.
if %nb% == %population% echo %length%>>Graph.txt&goto :eof
goto back5

:ask
choice /c yn /m Continue?(y/n): /d y /t 3 /n 
if %errorlevel% == 1 goto :eof
echo ###>>Graph.txt
goto initial

