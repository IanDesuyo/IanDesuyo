if (!$?) {
	Start-Process powershell.exe -Verb RunAs -ArgumentList ('-executionpolicy bypass -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
	exit $LASTEXITCODE
}

# Remove & disable Windows shit
echo "Running Win11Debloat..."
& ([scriptblock]::Create((irm "https://raw.githubusercontent.com/Raphire/Win11Debloat/master/Get.ps1"))) -RemoveApps -ClearStart -DisableTelemetry -DisableBing -DisableSuggestions -DisableLockscreenTips -ShowHiddenFolders -ShowKnownFileExt -DisableRecall -HideGiveAccessTo -Silent

echo "Install apps with WinGet..."
winget install Git.Git --override '/SILENT /COMPONENTS="icons,assoc"'
winget install Microsoft.VisualStudioCode --override '/SILENT /mergetasks="!runcode,addcontextmenufiles,addcontextmenufolders"'

winget import .\daily.json
winget import .\tools.json

echo "Configure apps"
# Reload env
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 


# ExplorerPatcher
reg import .\ExplorerPatcher.reg

# Git
git config --global user.name "IanDesuyo"
git config --global user.email "59338745+IanDesuyo@users.noreply.github.com"

# Oh My Posh
# Ref: https://ohmyposh.dev/docs/installation/prompt
oh-my-posh font install # CascadiaCode

if (-not (Test-Path -Path $PROFILE)) {
    New-Item -Path $PROFILE -ItemType File
}
echo "oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/IanDesuyo/IanDesuyo/master/enviroment/ian.omp.json' | Invoke-Expression" > $PROFILE
. $PROFILE

# Windows Terminal
Copy-Item -Path ".\wt-settings.json" -Destination "$($env:LOCALAPPDATA)\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

# Vencord
iwr "https://raw.githubusercontent.com/Vencord/Installer/main/install.ps1" -UseBasicParsing | iex
```