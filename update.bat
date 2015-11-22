ECHO OFF
E:
cd \angular-material\material
git fetch upstream
git checkout master
git merge upstream/master
call gulp karma
rmdir ..\angular-material-midnight-dist\docs /S /Q
del   ..\angular-material-midnight-dist\*.js /S /Q
del   ..\angular-material-midnight-dist\*.css /S /Q
xcopy .\dist\*.* ..\angular-material-midnight-dist\*.* /S /E /R /Y
mkdir ..\angular-material-midnight-dist
cd ..\angular-material-midnight-dist
del commitlabel.log /Q
call committime.bat
git add *
git commit -F commitlabel.log
git push
cd \angular-material\material
echo DONE!