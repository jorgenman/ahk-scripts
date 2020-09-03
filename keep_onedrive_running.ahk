;
; AutoHotkey Version: 1.x
; Author:         studotwho, modified by Aaron Jorgensen
;
; Script Function:
;   Restarts OneDrive if it isn't running. Note that if another user has
;	OneDrive running, this won't restart it for the current user.
;
;   This script loops every 50 seconds to determine if OneDrive is running
;	or not, and restarts it if it's not.
;
; Version history:
;	v1:		Initial version

#SingleInstance, force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

EnvGet, AppDataLocal, LOCALAPPDATA
oneDrive_Path	= %AppDataLocal%\Microsoft\OneDrive
oneDrive_EXE     = %oneDrive_Path%\OneDrive.exe
oneDrive_imgName = OneDrive.exe

;MsgBox, %oneDrive_EXE%

loop {
	sleep 45000
    Process, Exist, %oneDrive_imgName% ; check to see if iTeleportConnect is running
    If (ErrorLevel = 0) ; If it is not running
	{
        ; MsgBox, Not Running
        Run, %oneDrive_EXE%, %oneDrive_Path%, hide
	}
    Else ; If it is running, ErrorLevel equals the process id for the target program (Printkey). Then do nothing.
	{
        ; MsgBox, OneDrive is Running
        sleep 5
	}
}