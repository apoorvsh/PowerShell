Get-AzContext

$myfilesystem = 'adfstagedcopytempdata'

$mypath = '45491460-4627-424a-bc31-7e433535d627'

$ctx = New-AzStorageContext -StorageAccountName 'tsbadlsstoragedev'

$Files = Get-AzDataLakeGen2ChildItem -Context $ctx -FileSystem $myfilesystem -Path $mypath -Recurse | Where-Object IsDirectory -eq $false

$Total = $Files | Measure-Object -Property Length -Sum

$Total | Select-Object @{Name = "SizeInGB"; Expression={$_.Sum/1GB}} 



$myfilesystem = Get-AzStorageContainer -Context $ctx

for ($i = 0; $i -lt $myfilesystem.Count; $i++) {

    $mypath = (Get-AzDataLakeGen2ChildItem -Context $ctx -FileSystem $myfilesystem[$i].Name).Path
    $containerName = $myfilesystem[$i].Name
    Write-Output "`t`t Container Name: - $($containerName)"
    for ($j = 0; $j -lt $mypath.Count; $j++) {

        if ($mypath.Count -le 1) {
            $mypath = @($mypath)
        }

        $Files = Get-AzDataLakeGen2ChildItem -Context $ctx -FileSystem $containerName -Path $mypath[$j] -Recurse | Where-Object IsDirectory -eq $false
        $Total = $Files | Measure-Object -Property Length -Sum
        $size = $Total | Select-Object @{Name = "SizeInGB"; Expression={$_.Sum/1GB}} 
        Write-Output "`t`tFileSystem:-  $($mypath[$j]) and its Size is:- $size`n"
    }
    Write-Output "`n"
}


$ctx = New-AzStorageContext -StorageAccountName 'tsbadlsstoragedev'
$myfilesystem = Get-AzStorageContainer -Context $ctx


for ($i = 0; $i -lt $myfilesystem.Count; $i++) {

    $mypath = (Get-AzDataLakeGen2ChildItem -Context $ctx -FileSystem $myfilesystem[$i].Name).Path
    $containerName = $myfilesystem[$i].Name
    Write-Output "`t`t Container Name: - $($containerName)"
    for ($j = 0; $j -lt $mypath.Count; $j++) {

        if ($mypath.Count -le 1) {
            $mypath = @($mypath)
        }

        $Files = Get-AzDataLakeGen2ChildItem -Context $ctx -FileSystem $containerName -Path $mypath[$j] -Recurse | Where-Object IsDirectory -eq $false
        $Total = $Files | Measure-Object -Property Length -Sum
        $size = $Total | Select-Object @{Name = "SizeInGB"; Expression={$_.Sum/1GB}}, @{Name = "SizeInKB"; Expression={$_.Sum/1KB}}
         Write-Output "`t`tFileSystem:-  $($mypath[$j]) and its Size is:- $size`n"
         }
    Write-Output "`n"
}


Connect-AzAccount -Tenant 94d9231c-ea6a-4040-a577-29ea232aecea

$ctx = New-AzStorageContext -StorageAccountName 'tsbadlsstoragedev'
$myfilesystem = 'tsb-data'

$mypath = (Get-AzDataLakeGen2ChildItem -Context $ctx -FileSystem $myfilesystem).Path

for ($j = 0; $j -lt $mypath.Count; $j++) {
    if ($mypath.Count -le 1) {
             $mypath = @($mypath)
    }
    $Files = Get-AzDataLakeGen2ChildItem -Context $ctx -FileSystem $myfilesystem -Path $mypath[$j] -Recurse | Where-Object IsDirectory -eq $false
    $Total = $Files | Measure-Object -Property Length -Sum
    $size = $Total | Select-Object @{Name = "SizeInGB"; Expression={$_.Sum/1GB}}, @{Name = "SizeInKB"; Expression={$_.Sum/1KB}}
    Write-Output "`t`tFileSystem:-  $($mypath[$j]) and its Size is:- $size`n"
}