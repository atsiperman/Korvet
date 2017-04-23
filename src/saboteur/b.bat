
del /Y out\*.*
..\..\tools\sjasmplus sabmain.asm  --lst=out/sabmain.lst

@IF ERRORLEVEL 1 GOTO error

@echo off
copy /Y sab-clean.kdi sab.kdi
cd out
..\..\..\tools\xkorvet a ..\sab.kdi SAB.COM >nul
..\..\..\tools\xkorvet w ..\sab.kdi >nul
cd ..

GOTO end

:error
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!

:end

