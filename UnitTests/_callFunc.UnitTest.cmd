

::----------------------------------------------------------------------

:_UnitTest__callFunc
SETLOCAL

    SHIFT
    :: Dummy test - _callFunc is a template. No functional test
    ECHO:Skipped:Template=no test>"%TEMP%\%0.skip" & GOTO :EOF
    
    REM :: Create ref
    REM (
        REM ECHO:_callFunc is a template. No functional test
    REM )>"%TEMP%\%0.ref" 2>>"%TEMP%\%0.trc"

    REM :: Dump data
    REM (
        REM ECHO:_callFunc is a template. No functional test
    REM )>"%TEMP%\%0.dump"
    
GOTO :EOF *** :_UnitTest__callFunc ***

::----------------------------------------------------------------------