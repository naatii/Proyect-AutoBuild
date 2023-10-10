@echo off

set/p ruta= Indica el path absoluto local: 

:pregunta
@ECHO.1.- GitHub 
@ECHO.2.- Windows
@ECHO.3.- ayuda 
@ECHO.4.- salir
:pregunta

set/p pregunta= ¿Que quieres hacer? 
if %pregunta% == 1 goto GitHub 
if %pregunta% == 2 goto Build
if %pregunta% == 3 goto ayuda 
if %pregunta% == 4 goto salir

goto pregunta
:GitHub
cd %ruta%
set/p repo= indique el path del repo para clonarlo: 
git clone %repo%
cd %repo%
echo %repo%
echo.
cls

goto pregunta
:Build
@echo.Se va a crear la estructura del proyecto para Windows
set/p ruta= Indica el path absoluto local: 
cd %ruta%
mkdir src
mkdir test
python -m virtualenv venv
cd ./venv/bin/
call activate
pip install pytest
Echo ./venv/bin/activate | Clip.exe
cls

goto pregunta
echo.
:ayuda
echo Esta es la ayuda del programa AutoGit por Natalia Cortés: 
echo    -1 GitHub (baja el repositorio de GitHub)
echo    -2 Build (Construye el proyecto)
echo    -3 ayuda (Muestra este menú)        
echo    -4 salir (Sale del programa)

goto pregunta
echo.
:salir
echo Pulsa una tecla para salir.
pause>nul
exit