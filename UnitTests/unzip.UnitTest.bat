

::----------------------------------------------------------------------

:_UnitTest_unzip
SETLOCAL

    SHIFT
    IF EXIST "%TEMP%\%0.*" DEL "%TEMP%\%0.*"

    :: Create tmp
    (
        ECHO:Hello world
    )>"%TEMP%\%0.tmp" 2>>"%TEMP%\%0.trc"

    CALL zip.bat "%TEMP%\%0.zip" "%TEMP%\%0.tmp"
    DEL "%TEMP%\%0.tmp"
    echo on
    CALL %0 "%TEMP%%0.zip" "%TEMP%"
    
    :: Create ref
    (
        ECHO:[%TEMP%%0.tmp][13]
    )>"%TEMP%\%0.ref" 2>>"%TEMP%\%0.trc"

    :: Dump data
    (
        FOR %%a IN ("%TEMP%\%0.tmp") DO ECHO [%%~fa][%%~za]
    )>"%TEMP%\%0.dump"
    
GOTO :EOF *** :_UnitTest_unzip ***

::----------------------------------------------------------------------