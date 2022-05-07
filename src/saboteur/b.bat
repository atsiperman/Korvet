
mkdir out

del /Q out\*.*
..\..\tools\sjasmplus makefile  --lst=out/sabmain.lst

@IF ERRORLEVEL 1 GOTO error

@echo off
del /Q sab.kdi
copy /Y sab-clean.kdi sab.kdi
@IF ERRORLEVEL 1 GOTO error

cd out
..\..\..\tools\xkorvet a ..\sab.kdi SAB.COM >nul
..\..\..\tools\xkorvet w ..\sab.kdi >nul
cd ..

GOTO end

:error
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!
time /T
exit 1

:end

forfiles /P out /M *.com  /C "cmd /c echo @file @fsize bytes"

time /T

