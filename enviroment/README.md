# My Windows Environment

## Install with WinGet

```bash
winget import daily.json &&
winget import tools.json
```

## Advanced install arguments

- VisualStudioCode

  add to context menu
  
  ```bash
  winget install Microsoft.VisualStudioCode --override '/SILENT /mergetasks="!runcode,addcontextmenufiles,addcontextmenufolders"'
  ```
  
- Git

  don't add to context menu
  
  ```bash
  winget install Git.Git --override '/SILENT /COMPONENTS="icons,assoc"'
  ```
