@ECHO OFF

pushd %~dp0

REM Command file for Sphinx documentation

if "%SPHINXBUILD%" == "" (
    set SPHINXBUILD=sphinx-build
)

set SOURCEDIR=src
set BUILDDIR=build

if "%1" == "" goto help
if "%1" == "html" goto html

%SPHINXBUILD% >NUL 2>NUL

if errorlevel 9009 (
    echo.
    echo.The 'sphinx-build' command was not found. Make sure you have Sphinx
    echo.installed, then set the SPHINXBUILD environment variable to point
    echo.to the full path of the 'sphinx-build' executable. Alternatively you
    echo.may add the Sphinx directory to PATH.
    echo.
    echo.If you don't have Sphinx installed, grab it from
    echo.http://sphinx-doc.org/
    exit /b 1
)

%SPHINXBUILD% -M %1 %SOURCEDIR% %BUILDDIR% %SPHINXOPTS%

goto end

:html

set ROOTDIR=%cd%

%SPHINXBUILD% -M html %SOURCEDIR% %BUILDDIR% %SPHINXOPTS%
python %ROOTDIR%\scripts\appendfile.py ^
       %ROOTDIR%\%BUILDDIR%\html\_static\pygments.css ^
       %ROOTDIR%\styles\cellmlText.css

goto end

:help

%SPHINXBUILD% -M help %SOURCEDIR% %BUILDDIR% %SPHINXOPTS%

:end

popd
