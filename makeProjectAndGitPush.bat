@echo off
echo [INFO] ------------------------------------------------------------------------
echo [INFO] set up mvn archetype 
echo [INFO] ------------------------------------------------------------------------
echo [INFO] cd current dir 
cd /d %~dp0
rem set groupId=com.appspot.roovemore.xxxx
set /p groupId="input groupId (ex:com.appspot.roovemore.xxxx) : "
echo [INFO] %groupId%
rem set artifactId=roovemore-xxxx
set /p artifactId="input artifactId (ex:roovemore-xxxx) : "
echo [INFO] %artifactId%
rem set gitRemoteUrl=roovemore-xxxx
set /p gitRemoteUrl="input gitRemoteUrl (ex:https://xxxx.git) : "
echo [INFO] %gitRemoteUrl%
set /p answer="run mvn archetype:generate? (y/n) : "
if "%answer%"=="y" (
echo yes
) else if "%answer%"=="n" ( 
  echo "no"
  exit /b 1
)else (
  echo "other key"
  exit /b 1
)
echo [INFO] ------------------------------------------------------------------------
echo [INFO] run mvn archetype:generate 
echo [INFO] ------------------------------------------------------------------------
call mvn archetype:generate -DinteractiveMode=false ^
-DarchetypeGroupId=org.apache.maven.archetypes ^
-DarchetypeArtifactId=maven-archetype-quickstart ^
-DarchetypeVersion=1.1 ^
-DgroupId=%groupId% ^
-DartifactId=%artifactId% ^
-Dversion=1.0-SNAPSHOT ^
-Dpackage=%groupId% ^
-Dpackaging=jar
echo [INFO] cd project dir
cd %artifactId%
echo [INFO] ------------------------------------------------------------------------
echo [INFO] run mvn eclipse 
echo [INFO] ------------------------------------------------------------------------
call mvn eclipse:eclipse -DdownloadSources=true
echo [INFO] ------------------------------------------------------------------------
echo [INFO] git set up 
echo [INFO] ------------------------------------------------------------------------
echo [INFO] ------------------------------------------------------------------------
echo [INFO] git init 
echo [INFO] ------------------------------------------------------------------------
git init
echo [INFO] ------------------------------------------------------------------------
echo [INFO] git set up gitignore
echo [INFO] ------------------------------------------------------------------------
echo /target >> .gitignore
echo /.classpath >> .gitignore
echo /.project >> .gitignore
echo [INFO] ------------------------------------------------------------------------
echo [INFO] git add all
echo [INFO] ------------------------------------------------------------------------
git add *
echo [INFO] ------------------------------------------------------------------------
echo [INFO] git commit
echo [INFO] ------------------------------------------------------------------------
git commit -m "first commit"
echo [INFO] ------------------------------------------------------------------------
echo [INFO] git remote add
echo [INFO] ------------------------------------------------------------------------
git remote add origin %gitRemoteUrl%
echo [INFO] ------------------------------------------------------------------------
echo [INFO] git push
echo [INFO] ------------------------------------------------------------------------
git push -u origin master