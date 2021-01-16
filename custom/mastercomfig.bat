@echo off
REM https://mastercomfig.com/download

REM wget -N https://github.com/mastercomfig/mastercomfig/releases/latest/download/mastercomfig-no-tutorial-addon.vpk
REM wget --no-if-modified-since https://github.com/mastercomfig/mastercomfig/releases/latest/download/mastercomfig-null-cancelling-movement-addon.vpk
REM curl -L -o "mastercomfig-no-tutorial-addon.vpk" -z "mastercomfig-no-tutorial-addon.vpk" https://github.com/mastercomfig/mastercomfig/releases/latest/download/mastercomfig-no-tutorial-addon.vpk
REM curl -o "mastercomfig-null-cancelling-movement-addon.vpk" -z "mastercomfig-null-cancelling-movement-addon.vpk" "https://github.com/mastercomfig/mastercomfig/releases/latest/download/mastercomfig-null-cancelling-movement-addon.vpk"

REM -L follows redirects
REM -O writes to specified file (we use it to overwrite here)
echo. [*] fetching latest version info . . .
curl -L -o mastercomfig.json https://api.github.com/repos/mastercomfig/mastercomfig/releases/latest

::http://stackoverflow.com/questions/22198458/find-text-in-file-and-set-it-as-a-variable-batch-file
for /F "delims=" %%a in ('findstr /I "tag_name" mastercomfig.json') do set "latest_ver=%%a"
:: Split String https://www.dostips.com/DtTipsStringManipulation.php#Snippets.SplitString
for /f "tokens=1,2 delims=:" %%a in ("%latest_ver%") do set latest_ver=%%b
:: remove comma https://www.dostips.com/DtTipsStringManipulation.php#Snippets.RemoveSpaces
set latest_ver=%latest_ver:,=%
:: remove quotes https://www.dostips.com/DtTipsStringManipulation.php#Snippets.TrimQuotes
for /f "useback tokens=*" %%a in ('%latest_ver%') do set latest_ver=%%~a
echo %latest_ver%
:: cleanup
@REM del mastercomfig.json

set old_ver=none
set /p old_ver=<mastercomfig.txt
echo %old_ver%
pause

:: compare
if %old_ver%==%latest_ver% (
    echo. [!] No update found.
    pause
    REM CLEANUP HERE
    exit /b 1
) else if NOT %old_ver%==%latest_ver% (
    echo. [!] update found.
    echo. [*] downloading update . . .
    echo %latest_ver%>mastercomfig.txt

    curl -L -O https://github.com/mastercomfig/mastercomfig/releases/latest/download/mastercomfig-medium-high-preset.vpk
    curl -L -O https://github.com/mastercomfig/mastercomfig/releases/latest/download/mastercomfig-no-tutorial-addon.vpk
    curl -L -O https://github.com/mastercomfig/mastercomfig/releases/latest/download/mastercomfig-null-cancelling-movement-addon.vpk

    del /S *.cache
    pause
    exit /b 1
)

