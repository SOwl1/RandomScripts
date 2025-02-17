# I thought it was a huge pain to keep restarting a service and attaching the debugger. 
# It seemed to take up most of the time I spent working on buffer overflows.
# This can be used for other services. You simply need to change the service name in the first line as well as what keys are sent to Immunity in the second SendWait method.
# To run it:
# 1. Save this file as a .ps1 file
# 2. Create a shortcut to the .ps1 file on your desktop
# 3. Right click the shortcut and go to 'Properties'
# 4. Set the target to "powershell -ep bypass 'C:\Path\To\Your\ps1\file.ps1'
# 5. Click 'Advanced'
# 6. Check 'Run As Administrator'
# 7. Enjoy
# 8. Special thanks to shimstache

Get-Service slmail | start-service
Start-Process -FilePath "C:\program files (x86)\Immunity Inc\Immunity Debugger\ImmunityDebugger.exe" -verb runas
Sleep 5
[void][System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')
[System.Windows.Forms.SendKeys]::SendWait("^{F1}")
Sleep 1
[System.Windows.Forms.SendKeys]::SendWait("slmail")
Sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Sleep 5
[System.Windows.Forms.SendKeys]::SendWait("{F9}")