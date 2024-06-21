# My Windows Environment

## Install with WinGet

```ps
# install apps with arguments
winget install Git.Git --override '/SILENT /COMPONENTS="icons,assoc"'
winget install Microsoft.VisualStudioCode --override '/SILENT /mergetasks="!runcode,addcontextmenufiles,addcontextmenufolders"'

# import all I needed
winget import .\daily.json
winget import .\tools.json
```

## Configures

Ref: https://ohmyposh.dev/docs/installation/prompt
```ps
# ExplorerPatcher
reg import .\ExplorerPatcher.reg

# Git
git config --global user.name "IanDesuyo"
git config --global user.email "59338745+IanDesuyo@users.noreply.github.com"

# Oh My Posh
oh-my-posh font install # CascadiaCode
echo "oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/IanDesuyo/IanDesuyo/master/ian.omp.json' | Invoke-Expression" > $PROFILE
. $PROFILE

# Windows Terminal
# "colorScheme": "One Half Dark"
# "face": "CaskaydiaCove Nerd Font"
notepad %LocalAppData%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
```