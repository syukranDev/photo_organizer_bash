@echo off
setlocal enabledelayedexpansion

rem Loop through all jpg, jpeg, png, and gif files in the current directory
for %%F in (*.jpg *.jpeg *.png *.gif) do (
    rem Get the last write time of the file
    for /f "tokens=1-3 delims=/ " %%A in ('echo %%~tF') do (
        set "day=%%A"
        set "month=%%B"
        set "year=%%C"
    )
    
    rem Create the destination folder if it doesn't exist
    if not exist "!year!-!month!" mkdir "!year!-!month!"
    
    rem Move the file to the appropriate folder
    move "%%F" "!year!-!month!"
)

echo Photos have been organized successfully.