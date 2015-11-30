ECHO OFF
E:
cd \angular-material\material
git fetch upstream
git checkout master
git merge upstream/master
git push
call gulp karma
del   ..\angular-material-midnight-dist\*.js /S /Q
del   ..\angular-material-midnight-dist\*.css /S /Q
mkdir ..\angular-material-midnight-dist
xcopy .\dist\*.* ..\angular-material-midnight-dist\*.* /S /E /R /Y
rmdir ..\angular-material-midnight-dist\docs /S /Q
del ..\angular-material-midnight-dist\angular-material.layouts.css
del ..\angular-material-midnight-dist\angular-material.layouts.min.css
del ..\angular-material-midnight-dist\angular-material.scss
del ..\angular-material-midnight-dist\angular-material-mocks.js
cd ..\angular-material-midnight-dist
del commitlabel.log /Q
call committime.bat
git pull
git add *
git commit -F commitlabel.log
git push
cd \angular-material\material
echo DONE!