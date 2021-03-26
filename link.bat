@echo off
set tf2dir=C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\tf

REM https://www.howtogeek.com/howto/16226/complete-guide-to-symbolic-links-symlinks-on-windows-or-linux/
mklink /J "%tf2dir%\cfg\user" "cfg\user"
mklink /H "%tf2dir%\custom\mastercomfig.bat" "custom\mastercomfig.bat"

pause