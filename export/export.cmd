@echo off
@call _config.cmd

@echo.
@echo extracting database...
@pause

@del %META_FILENAME%
IBEScript.exe extract.sql -GIB_CLIENT=%IB_CLIENT% -GSRC_PSW=%SRC_PSW% -GSRC_DB='%SRC_DB%' -GMETA_FILENAME='%META_FILENAME%' -GDATA_TABLES='%DATA_TABLES%'

pause

