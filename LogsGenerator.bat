@echo off
call C:\Users\naisu\Documents\batchPlayground\config.bat

set x=0
set folderName="s"
:SymLoop
if defined logs[%x%] (
   call echo ************************ Getting Logs From %%logs[%x%]%% ************************
   
   call cd %%logs[%x%]%%
    
    for /r %%i in (.\*.txt) do (
        for %%? in (%%i) do (
            echo Last-Modified Date   : %%~t?
        )
        for %%I in (.) do set folderName=%%~nxI
        call echo Copying %%i 
        call xcopy /s "%%i" "%OUTPUT_DIR%\%%folderName%%\*"
    )

   if ERRORLEVEL 1 goto error
   set /a x+=1
   GOTO :SymLoop

   :error
   echo There was a problem
   set /a x+=1
   GOTO :SymLoop
)
set x=0

call echo "Done!"
pause