# cd C:\Users\paulz\Desktop\Modding\exotic-industries\exotic-industries_dev

# cd D:\exotic-industries\exotic-industries_dev
# powershell -ExecutionPolicy Bypass -File build_mod.ps1

$param1 = $args[0]

function Write-ColorOutput($ForegroundColor)
{
    # save the current color
    $fc = $host.UI.RawUI.ForegroundColor

    # set the new color
    $host.UI.RawUI.ForegroundColor = $ForegroundColor

    # output
    if ($args) {
        Write-Output $args
    }
    else {
        $input | Write-Output
    }

    # restore the original color
    $host.UI.RawUI.ForegroundColor = $fc
}

function make_both {
    Write-ColorOutput green ("Building source mod...")

    #$FactorioFolder = "C:\Users\A\AppData\Roaming\Factorio\mods\"
    $FactorioFolder = "C:\Users\paulz\AppData\Roaming\Factorio\mods\"

    #$FactorioProcessPath = "D:\SteamLibrary\steamapps\common\Factorio\bin\x64\factorio.exe"
    $FactorioProcessPath = "C:\Program Files (x86)\Steam\steamapps\common\Factorio\bin\x64\factorio.exe"

    # Find both mods in folder above

    Write-ColorOutput darkgreen ("Searching files.")

    $LocationPath = (Get-Location).path
    $ParentPath = (get-item $LocationPath ).parent.FullName

    Write-ColorOutput darkgreen ("Checking files.")

    # exclude files in migrations folder

    # $SourceArray = Get-ChildItem -Path $ParentPath -Recurse | Where {$_.Name -match 'exotic-industries_'} | %{$_.FullName}
    $SourceArray = Get-ChildItem -Path $ParentPath -Recurse | Where {$_.Name -match 'exotic-industries_'} | Where {$_.FullName -notmatch 'migrations'} | %{$_.FullName}
    $GraphicalArray = Get-ChildItem -Path $ParentPath -Recurse | Where {$_.Name -match 'exotic-industries-graphics_'} | %{$_.FullName}

    # --> kommt nicht hierhin

    # check if both arrays only have one element, throw error otherwise

    Write-ColorOutput darkgreen ("Done checking files.")

    if ($SourceArray.count -eq 1) 
    {
        $SourceFolder = $SourceArray     
    }
    else
    {
        throw "There is more then one uniqe exotic-industries folder in this repository."
    }

    if ($GraphicalArray.count -eq 1) 
    {
        $GraphicalFolder = $GraphicalArray     
    }
    else
    {
        throw "There is more then one uniqe exotic-industries-graphics folder in this repository."
    }

    # Get new version numbers for source and graphic mod from info.json

    Write-ColorOutput darkgreen ("Searching for version numbers.")

    [string]$SourceVersion = (Get-Content (Join-Path -Path $SourceFolder -ChildPath "\info.json") -Raw | ConvertFrom-Json).version
    [string]$GraphicalVersion = (Get-Content (Join-Path -Path $GraphicalFolder -ChildPath "\info.json") -Raw | ConvertFrom-Json).version

    # Make targets with version numbers

    $SourceTarget = Join-Path -Path $FactorioFolder -ChildPath (-join("exotic-industries_", $SourceVersion))
    $GraphicalTarget = Join-Path -Path $FactorioFolder -ChildPath (-join("exotic-industries-graphics_", $GraphicalVersion))

    # copy all updated filed using xcopy

    Write-ColorOutput darkgreen ("Copying.")

    xcopy $SourceFolder $SourceTarget /s /d /e /f /y /i
    xcopy $GraphicalFolder $GraphicalTarget /s /d /e /f /y /i
}

function start_factorio {
    # look if factorio is running, if so, restart it
    # $FactorioProcessPath = "D:\SteamLibrary\steamapps\common\Factorio\bin\x64\factorio.exe"
    $FactorioProcessPath = "C:\Program Files (x86)\Steam\steamapps\common\Factorio\bin\x64\factorio.exe"

    $FactorioProcess = Get-Process factorio -ErrorAction SilentlyContinue
    if($FactorioProcess -eq $null)
    {
        # start factorio
        Write-ColorOutput blue ("Starting factorio.")
        Start-Process -FilePath $FactorioProcessPath -Wait
        # Start-Process -FilePath "C:\Program Files (x86)\Steam\steamapps\common\Factorio\bin\x64\factorio.exe" -Wait
    }
    else
    {   
        Write-ColorOutput blue ("Restarting factorio.")

        # be nice first
        $FactorioProcess.CloseMainWindow()

        # then kill it
        Sleep 5
        if (!$FactorioProcess.HasExited)
        {
            $FactorioProcess | Stop-Process -Force
        }

        # start factorio
        Start-Process -FilePath $FactorioProcessPath -Wait
    }
}

function make_containers {
    # build exotic-industries-dev container mod
    Write-ColorOutput green ("Building container mod...")

    #$FactorioFolder = "C:\Users\A\AppData\Roaming\Factorio\mods\"
    $FactorioFolder = "C:\Users\paulz\AppData\Roaming\Factorio\mods\"

    #$FactorioProcessPath = "D:\SteamLibrary\steamapps\common\Factorio\bin\x64\factorio.exe"
    $FactorioProcessPath = "C:\Program Files (x86)\Steam\steamapps\common\Factorio\bin\x64\factorio.exe"

    # Find container mod in folder above

    Write-ColorOutput darkgreen ("Searching files.")

    $LocationPath = (Get-Location).path
    $ParentPath = (get-item $LocationPath ).parent.FullName

    Write-ColorOutput darkgreen ("Checking files.")

    # exclude files in migrations folder

    # $SourceArray = Get-ChildItem -Path $ParentPath -Recurse | Where {$_.Name -match 'exotic-industries_'} | %{$_.FullName}
    $SourceArray = Get-ChildItem -Path $ParentPath -Recurse | Where {$_.Name -match 'exotic-industries-containers_'} | %{$_.FullName}

    # --> kommt nicht hierhin

    # check if both arrays only have one element, throw error otherwise

    Write-ColorOutput darkgreen ("Done checking files.")

    if ($SourceArray.count -eq 1) 
    {
        $SourceFolder = $SourceArray     
    }
    else
    {
        throw "There is more then one uniqe exotic-industries-containers folder in this repository."
    }

    # Get new version numbers for source mod from info.json

    Write-ColorOutput darkgreen ("Searching for version numbers.")

    [string]$SourceVersion = (Get-Content (Join-Path -Path $SourceFolder -ChildPath "\info.json") -Raw | ConvertFrom-Json).version

    # Make targets with version numbers

    $SourceTarget = Join-Path -Path $FactorioFolder -ChildPath (-join("exotic-industries-containers_", $SourceVersion))

    # copy all updated filed using xcopy

    Write-ColorOutput darkgreen ("Copying.")

    xcopy $SourceFolder $SourceTarget /s /d /e /f /y /i
}


# select action
switch ($param1)
{
    1 {
        make_both
        start_factorio
    }

    2 {
        make_both
    }

    3 {
        make_containers
        start_factorio
    }

    4 {
        make_containers
        make_both
        start_factorio
    }

    default {
        Write-ColorOutput yellow ("False parameter")
    }
}

exit 0