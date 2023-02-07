@echo off

cd c:\dev\Assembly-HLA\assembly
cd hla
call ihla
set /p var= "Enter Path: "
cd c:\dev\Assembly-HLA\assembly
cd %var%
call fhla %var%.hla

:loop

echo:
echo ==============================
echo:

call %var%
set /p choice=
if %choice%==run ( goto loop ) 
if %choice%==clsrun ( 
goto loop 
) 

echo "Program Exit."

PAUSE