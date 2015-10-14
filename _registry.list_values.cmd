::@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION&::(Don't pollute the global environment with the following)
::*********************************************************************
SET $NAME=%~n0
SET $DESCRIPTION=List value entries from the registration database
SET $AUTHOR=Erik Bachmann, ClicketyClick.dk [ErikBachmann@ClicketyClick.dk]
SET $SOURCE=%~f0
::@(#)NAME
::@(-)  The name of the command or function, followed by a one-line description of what it does.
::@(#)      %$NAME% -- %$DESCRIPTION%
::@(#) 
::@(#)SYNOPSIS
::@(-)  In the case of a command, a formal description of how to run it and what command line options it takes. 
::@(-)  For program functions, a list of the parameters the function takes and which header file contains its definition.
::@(-)  
::@(#)  %$NAME% "Path" "key"
::@(#) 
::@(#)OPTIONS
::@(-)  Flags, parameters, arguments (NOT the Monty Python way)
::@(#)  -h      Help page
::@(#) 
::@ (#) 
::@(#)DESCRIPTION
::@(-)  A textual description of the functioning of the command or function.
::@(#)  %NAME% list values found in the key given as first argument
::@(#) 
::@(#)  Note: Patterns are case insensitive
::@(#)
::@(#) 
::@(#) 
::@(#)EXAMPLES
::@(-)  Some examples of common usage.
::@(#)      CALL %$NAME% "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
::@(#)  Will print a list of values like:
::@(#)      SM_GamesName
::@(#)      SM_ConfigureProgramsName
::@(#)      ::
::@(#)      PF_AccessoriesName
::@(#)      
::@(#)EXIT STATUS
::@(-)  Exit status / errorlevel is 0 if OK, otherwise 1+.
::@(#)  Exit status is 0 if any matches were found, otherwise 1.
::@(#)  1   Usage
::@(#)  2   No key given
::@(#)
::@ (#)
::@ (#)ENVIRONMENT
::@(-)  Variables affected
::@ (#)
::@ (#)
::@ (#)FILES, 
::@(-)  Files used, required, affected
::@ (#)
::@ (#)
::@ (#)BUGS / KNOWN PROBLEMS
::@(-)  If any known
::@ (#)
::@ (#)
::@ (#)REQUIRES
::@(-)  Dependecies
::@ (#)  
::@ (#)
::@(#)SEE ALSO
::@(-)  A list of related commands or functions.
::@(#)  _registry.write_string.cmd _registry.read_string.cmd 
::@(#)  _registry.delete_string.cmd _registry.list_keys.cmd
::@ (#)  
::@ (#)REFERENCE
::@(-)  References to inspiration, clips and other documentation
::@ (#)  Author:
::@ (#)  URL: 
::@ (#) 
::@(#)
::@(#)SOURCE
::@(-)  Where to find this source
::@(#)  %$Source%
::@(#)
::@ (#)AUTHOR
::@(-)  Who did what
::@ (#)  %$AUTHOR%
::*** HISTORY **********************************************************
::SET $VERSION=YYYY-MM-DD&SET $REVISION=hh:mm:ss&SET $COMMENT=Init Description/Initials [xx.xxx]
::SET $VERSION=2010-11-04&SET $REVISION=12:35:00&SET $COMMENT=Initial/ErikBachmann [01.000]
::SET $VERSION=2014-01-03&SET $REVISION=09:21:00&SET $COMMENT=Exact path to reg.exe/ErikBachmann [01.002]
::SET $VERSION=2015-02-19&SET $REVISION=03:33:35&SET $COMMENT=Autoupdate / ErikBachmann
  SET $VERSION=2015-10-08&SET $REVISION=11:20:00&SET $COMMENT=GetOpt: Calling usage on -h and exit on error / ErikBachmann
::**********************************************************************
::@(#)(c)%$Version:~0,4% %$Author%
::**********************************************************************

    CALL "%~dp0\_DEBUG"
    CALL "%~dp0\_Getopt" %*&IF ERRORLEVEL 1 EXIT /B 1
ENDLOCAL

:MAIN
    CALL "%~dp0\_debug"
    CALL SET _REG=%WinDir%\system32\REG.exe
    IF "!"=="!%~1" EXIT /B 2
    FOR /F "usebackq tokens=*" %%C IN (`%_REG% query "%~1" ^| find /i /v "%~1"`) DO CALL :TruncList %%C
 
GOTO :EOF

:TruncList
    CALL %_Debug_% 1[%~1] 2[%~2] 3[%~3]
    ECHO %~1
GOTO :EOF

::*** End of File ******************************************************