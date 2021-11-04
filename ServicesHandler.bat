@echo off
call C:\Users\naisu\Documents\batchPlayground\setup.bat
set /p MODE=Choose [start/stop/restart/query]: 

echo %MODE%ing Services

set x=0

:SymLoop
if defined services[%x%] (
   call echo ************************ %MODE%ing %%services[%x%]%% ************************

   @echo off
   call sc %MODE% %%services[%x%]%%

   if %MODE% NEQ query (
      timeout /t 5
      echo ------------------- Showing status after 5 seconds -------------------
      call sc query %%services[%x%]%%
      echo ------------------- End of Status -------------------
      echo .
      echo .
      echo .
   )
 
   
   if ERRORLEVEL 1 goto error

   set /a x+=1
   GOTO :SymLoop

   :error
   echo There was a problem
   set /a x+=1
   GOTO :SymLoop
)







pause