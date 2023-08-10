param(
  [string]$Path = 'D:\SteamLibrary\steamapps\common\Team Fortress 2\tf'
)

if (-not (Test-Path -Path "$Path" -PathType Container)) {
  throw "Invalid path: $Path"
}

Get-ChildItem -Directory -Path 'custom' | ForEach-Object -Process {
  New-Item -ItemType SymbolicLink -Path "$Path\custom\$($_.Name)" -Target $_.FullName -Force
}

Get-ChildItem -Path 'cfg' | ForEach-Object -Process {
  New-Item -ItemType SymbolicLink -Path "$Path\cfg\$($_.Name)" -Target $_.FullName -Force
}
