## Dotfiles

### .bashrc

```bash
echo yo, $(date)
alias sudo="sudo "
alias cls="clear"
alias open="xdg-open"
alias explorer="open "
alias py="python"
alias t3="npx create-t3-app@latest"
alias intellijntm="rm ~/.var/app/com.jetbrains.IntelliJ-IDEA-Community/config/JetBrains/IdeaIC20**/.lock"

export HISTSIZE="5000"
export HISTFILESIZE="5000"
```


## Scripts

### VM Ware Priority

```bat
@echo off
:loop
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    goto UACPrompt
) else (
    echo Running with administrative privileges.
    goto :run
)

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B

:run
echo Setting priority of vmware-vmx.exe to real time...
wmic process where name="vmware-vmx.exe" CALL setpriority 256
echo Priority set to real time.

timeout /t 3 /nobreak > nul
goto loop
```
