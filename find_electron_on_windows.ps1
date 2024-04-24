function Is-ElectronApp {
    param($directory)

    Get-ChildItem -Path $directory -Filter "*.asar" -Recurse -ErrorAction SilentlyContinue |
        ForEach-Object {
            $appName = if ($_.FullName -like "*\Program Files*\*") {
                $splitPath = (Split-Path -Path $_.Directory).Split('\')
                $splitPath[2..($splitPath.Length - 3)] -join '\'
            } elseif ($_.FullName -like "*\AppData\Local\Programs\*" -or $_.FullName -like "*\AppData\LocalLow\Programs\*" -or $_.FullName -like "*\AppData\Roaming\Programs\*") {
                (Split-Path -Path $_.Directory).Split('\')[6]
            } elseif ($_.FullName -like "*\AppData\Local\*" -or $_.FullName -like "*\AppData\LocalLow\*" -or $_.FullName -like "*\AppData\Roaming\*") {
                (Split-Path -Path $_.Directory).Split('\')[5]
            } elseif ($_.FullName -like "*\Users\$env:USERNAME\Desktop\*" -or $_.FullName -like "*\Users\$env:USERNAME\Downloads\*" -or $_.FullName -like "*\Users\$env:USERNAME\Documents\*") {
                (Split-Path -Path $_.Directory).Split('\')[4]
            } else {
                Split-Path -Path $_.Directory
            }
            $appPath = $_.Directory
            [PSCustomObject]@{
                AppName = $appName
                AppPath = $appPath
            }
        }
}

$drives = Get-PSDrive -PSProvider 'FileSystem'
$directoriesToSearch = @("\Program Files", "\Program Files (x86)", "\Users\$env:USERNAME\AppData\Local", "\Users\$env:USERNAME\AppData\LocalLow", "\Users\$env:USERNAME\AppData\Roaming", "\Users\$env:USERNAME\Desktop", "\Users\$env:USERNAME\Downloads", "\Users\$env:USERNAME\Documents")

$electronApps = foreach ($drive in $drives) {
    foreach ($directory in $directoriesToSearch) {
        $fullPath = Join-Path -Path $drive.Root -ChildPath $directory
        if (Test-Path -Path $fullPath) {
            Is-ElectronApp -directory $fullPath
        }
    }
}

if ($electronApps) {
    $electronApps | Format-Table -AutoSize
} else {
    Write-Output "Electron-based applications not found."
}
