cmd.exe /k ^
echo [INFO] Start Test "cmd.exe /k" ^
& echo [INFO] command dir ^
& dir ^
& echo [INFO] command cd current dir ^
& cd /d %~dp0 ^
& dir ^
& echo [INFO] run bat file ^
& SampleWinCmd2.bat ^
& echo [INFO] End Test ^
