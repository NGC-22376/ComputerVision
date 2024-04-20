
setlocal enabledelayedexpansion
REM 设置python路径
conda activate cv
pause
REM 设置.py文件路径
:roundstart
cd /d"%~dp0"
set PY1=main.py
set PY2=gene_window.py
REM 执行
python PY1
REM 使用C语言编译器生成可执行文件并执行，需要额外库的需要链接
cl /Feoutput1.exe write_into_mcu.c
start output1.exe
REM 使用Keil运行.C文件，需要连接额外库
armcc mcu.c
REMstc-isp操作


echo Press 'Q' to quit the round.
echo Any other key to continue...
choice /C Q /N /M ""

if errorlevel 2 goto roundend
if errorlevel 1 goto roundstart
:roundend
echo ALL DONE
python PY2
PAUSE