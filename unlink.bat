@echo off
set tf2dir=C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\tf

REM https://www.howtogeek.com/howto/16226/complete-guide-to-symbolic-links-symlinks-on-windows-or-linux/
rmdir "%tf2dir%\cfg\user"
copy "cfg\user" "%tf2dir%\cfg\user"

del "%tf2dir%\custom\mastercomfig.bat"
copy "custom\mastercomfig.bat" "%tf2dir%\controls.cfg"

pause