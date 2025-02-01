@ECHO OFF
SETLOCAL
CHCP 65001
ECHO Job started on %COMPUTERNAME%
SET /A errno=0
ECHO ClusterSharedDirectory=C:\Users\Abel Tim\Documents\pws\sim\_ProjectScratch\Scr1ED4
IF NOT EXIST "C:\Users\Abel Tim\Documents\pws\sim\_ProjectScratch\Scr1ED4\." goto NOSTAGINGDIR
ECHO AWP_ROOT242=%AWP_ROOT242%
IF "%AWP_ROOT242%" == "" GOTO NOAWPROOTENV
IF NOT EXIST "%AWP_ROOT242%\." goto NOAWPROOTDIR
ECHO Command=%AWP_ROOT242%/commonfiles/CPython/3_10/winx64/Release/python/python.exe
IF NOT EXIST "%AWP_ROOT242%/commonfiles/CPython/3_10/winx64/Release/python/python.exe" goto NOCOMMAND
ECHO running the commmand
ECHO command: "%AWP_ROOT242%/commonfiles/CPython/3_10/winx64/Release/python/python.exe" -B -E "%AWP_ROOT242%/RSM/Config/scripts/ClusterJobs.py" "C:\Users\Abel Tim\Documents\pws\sim\_ProjectScratch\Scr1ED4\control_9f439c6f-d852-4439-a0be-95175f8d9945.rsm"
"%AWP_ROOT242%/commonfiles/CPython/3_10/winx64/Release/python/python.exe" -B -E "%AWP_ROOT242%/RSM/Config/scripts/ClusterJobs.py" "C:\Users\Abel Tim\Documents\pws\sim\_ProjectScratch\Scr1ED4\control_9f439c6f-d852-4439-a0be-95175f8d9945.rsm"
IF %ERRORLEVEL% NEQ 0 SET /A errno=%ERRORLEVEL%
GOTO END
:NOAWPROOTENV
ECHO The AWP_ROOT242 environment variable was NOT detected.
ECHO 1000 > "C:\Users\Abel Tim\Documents\pws\sim\_ProjectScratch\Scr1ED4\exitcode_9f439c6f-d852-4439-a0be-95175f8d9945.rsmout"
SET /A errno=1000
GOTO END
:NOCOMMAND
ECHO Command was NOT detected on execution host.
ECHO 1007 > "C:\Users\Abel Tim\Documents\pws\sim\_ProjectScratch\Scr1ED4\exitcode_9f439c6f-d852-4439-a0be-95175f8d9945.rsmout"
SET /A errno=1007
GOTO END
:NOSTAGINGDIR
ECHO Shared cluster directory does not exist on execution node, make sure it is shared and can be accessed from all nodes.
ECHO 1008 > "C:\Users\Abel Tim\Documents\pws\sim\_ProjectScratch\Scr1ED4\exitcode_9f439c6f-d852-4439-a0be-95175f8d9945.rsmout"
SET /A errno=1008
GOTO END
:NOAWPROOTDIR
ECHO AWP_ROOT242 directory does not exist on execution host.
ECHO 1009 > "C:\Users\Abel Tim\Documents\pws\sim\_ProjectScratch\Scr1ED4\exitcode_9f439c6f-d852-4439-a0be-95175f8d9945.rsmout"
SET /A errno=1009
GOTO END
:END
EXIT /B %errno%
