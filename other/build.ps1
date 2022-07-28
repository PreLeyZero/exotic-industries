#powershell -executionpolicy bypass -File .\build.ps1

$SourceFolder = 'D:\ToTheMoon\ToTheMoon'
$TargetFolder = 'D:\Test_folder'
$NewFolder = Join-Path -Path $TargetFolder -ChildPath "\ToTheMoon"
$NewRenamedFolder = Join-Path -Path $TargetFolder -ChildPath "\ToTheMoon_0.0.1"
$Destination = "C:\Users\A\AppData\Roaming\Factorio\mods\ToTheMoon_0.0.1"


#New-Item -Path 'D:\Test_folder' -ItemType Directory
#Copy-Item 'D:\ToTheMoon\ToTheMoon' 'D:\temp\ToTheMoon'
Copy-Item -Recurse -Path $SourceFolder  -Destination $TargetFolder
Rename-Item -Path $NewFolder -NewName "ToTheMoon_0.0.1"
#Compress-Archive -Path $NewRenamedFolder -CompressionLevel "Fastest" -DestinationPath $Destination

$compress = @{
  Path = $NewRenamedFolder
  CompressionLevel = "Fastest"
  DestinationPath = $Destination
}

#Compress-Archive @compress
Get-ChildItem -Path $Destination -Recurse | Remove-Item -force -recurse
Remove-Item $Destination -Force

Copy-Item -Recurse -Path $NewRenamedFolder -Destination "C:\Users\A\AppData\Roaming\Factorio\mods\"
Get-ChildItem -Path $NewRenamedFolder -Recurse | Remove-Item -force -recurse
Remove-Item $NewRenamedFolder -Force

& "D:\SteamLibrary\steamapps\common\Factorio\bin\x64\factorio.exe"