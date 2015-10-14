::@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION&::(Don't pollute the global environment with the following)
::**********************************************************************
SET $NAME=%~n0
SET $DESCRIPTION=Status part of "Action [status]" line
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
::@(#)  %$NAME% "string"
::@(#) 
::@(#)OPTIONS
::@(-)  Flags, parameters, arguments (NOT the Monty Python way)
::@(#)  -h      Help page
::@(#)
::@ (#) 
::@(#)DESCRIPTION
::@(-)  A textual description of the functioning of the command or function.
::@(#)  %$NAME% echos a string with the maximum length of 77 - $ActionRange to STDOUT.
::@(#)  The string will by surrounded bye [ ]
::@(#)  Line IS terminated by a NEWLINE!
::@(#)
::@(#)  %$NAME% is usually used in combination with _action.cmd to display
::@(#)  status information durring processing
::@(#)
::@(#)EXAMPLES
::@(-)  Some examples of common usage.
::@(#)  CALL {LinkStart}_ACTION{LinkEnd} "Hello"
::@(#)  CALL {LinkStart}_STATUS{LinkEnd} "World"
::@(#)
::@(#)  Will produce the line:
::@(#)  Hello                                             [World                   ]
::@(#)
::@ (#)EXIT STATUS
::@(-)  Exit status / errorlevel is 0 if OK, otherwise 1+.
::@(#)  0 if OK
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
::@(-)  Dependencies
::@ (#)  
::@ (#)
::@(#)SEE ALSO
::@(-)  A list of related commands or functions.
::@(#)  {LinkStart}_action.cmd{LinkEnd}
::@(#)  {LinkStart}_state.cmd{LinkEnd}
::@(#)
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
::SET $VERSION=YYYY-MM-DD&SET $REVISION=hh:mm:ss&SET $COMMENT=Comment/Init [00.000]
::SET $VERSION=2010-10-07&SET $REVISION=08:35:00&SET $COMMENT=Intial/ErikBachmann [00.010]
::SET $VERSION=2010-10-20&SET $REVISION=17:15:00&SET $COMMENT=Addding $Source/ErikBachmann [01.001]
::SET $VERSION=2010-12-16&SET $REVISION=15:21:00&SET $COMMENT=$StatusRange=76 - %$ActionRange% [01.002]
::SET $VERSION=2011-01-17&SET $REVISION=15:42:00&SET $COMMENT=$ActionRange=45 [01.003]
::SET $VERSION=2015-02-19&SET $REVISION=03:36:20&SET $COMMENT=Autoupdate / ErikBachmann
  SET $VERSION=2015-10-08&SET $REVISION=16:00:00&SET $COMMENT=GetOpt: Calling usage and exit on error / ErikBachmann
::**********************************************************************
::@(#)(c)%$Version:~0,4% %$Author%
::**********************************************************************

    CALL "%~dp0\_DEBUG"
    CALL "%~dp0\_Getopt" %*&IF ERRORLEVEL 1 EXIT /B 1
::ENDLOCAL

:_Status
    SET _=%~1
    IF NOT DEFINED $ActionRange SET $ActionRange=45
    SET /a $StatusRange=76 - %$ActionRange%

    SET _=%_%                                                                     !
    CALL SET /P _=[%%_:~0,%$StatusRange%%% ]<nul
    ECHO\
    EXIT /b 0
GOTO :EOF

::*** End of File ******************************************************