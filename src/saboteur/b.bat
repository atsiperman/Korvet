
mkdir out

set filename=SABOTEUR

del /Q out\*.*
..\..\tools\sjasmplus makefile  --lst=out/sabmain.lst

@IF ERRORLEVEL 1 GOTO error

@echo off
del /Q %filename%.kdi
copy /Y sab-clean.kdi %filename%.kdi
@IF ERRORLEVEL 1 GOTO error

cd out
..\..\..\tools\xkorvet a ..\%filename%.kdi %filename%.COM >nul
..\..\..\tools\xkorvet w ..\%filename%.kdi >nul
cd ..

GOTO end

:error
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!
time /T
exit 1

:end
echo Well done!

forfiles /P out /M *.com  /C "cmd /c echo @file @fsize bytes"

time /T

