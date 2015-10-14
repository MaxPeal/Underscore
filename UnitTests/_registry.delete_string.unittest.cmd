
::----------------------------------------------------------------------

:_UnitTest__registry.delete_string
SETLOCAL
    SHIFT
    SET _Key=HKEY_LOCAL_MACHINE\SOFTWARE\ClicketyClick.dk\%0
    SET _REG=REG.exe
    
    SET #%$NAME%.Status=
    ECHO #%$NAME%.Status=UnitTest>"%TEMP%\%0.ref" 2>>"%TEMP%\%0.trc"
    ECHO #%$NAME%.Status=>>"%TEMP%\%0.ref" 2>>"%TEMP%\%0.trc"

    ::Write string
    CALL _registry.write_string ^
        "%_KEY%" ^
        "Status" "UnitTest" 
    ::Read string
    CALL _registry.read_string "%_Key%" "Status"  >"%TEMP%\%0.trc" 2>&1 
    CALL ECHO #%$NAME%.Status=%%#%$NAME%.Status%%>"%TEMP%\%0.dump"

    SET #%$NAME%.Status=
    ::      _registry.delete_string deletes the entries found in the key given as first argument
    ::     
    ::          CALL _registry.delete_string "HKEY_LOCAL_MACHINE\SOFTWARE\ClicketyClick.dk\%$NAME%" "Status"
    CALL _registry.delete_string "%_KEY%" "Status"
    ::Read string - again
    CALL _registry.read_string "%_Key%" "Status" >nul 2>&1
    CALL ECHO #%$NAME%.Status=%%#%$NAME%.Status%%>>"%TEMP%\%0.dump"
    
::    :: Test
::    FC "%TEMP%\%0.ref" "%TEMP%\%0.dump">NUL 2>&1
::    IF ERRORLEVEL 1 (
::        ECHO %0 Fail
::    ) ELSE (
::        ECHO %0 OK
::    )    
GOTO :EOF *** :_UnitTest__registry.delete_string ***

::----------------------------------------------------------------------
