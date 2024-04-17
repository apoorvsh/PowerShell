$storageAccountName = "storaasdfgnt1"
$storageAccountKey = "rrOrhcgOi1W5OyIno2Vq/3aOsGfE+SIJv********************Wd2/zU5UIXTnk2kENDu9Intbu4J9g+AStW2JR1A=="
$rndstring = $(-join ((65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_})).ToLower()
$blobname = "archivedata$rndstring.txt"
$containerName = "archivefiles$rndstring"
$tenantId = 'd18895cc-999****************8393110a'
$subsId = '8a21611a-c5*****************32026d'
$rgName = 'aksrg'

$ctx = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey


Connect-AzAccount -Tenant $tenantId

Set-AzContext -Subscription $subsId

$sa = Get-AzStorageAccount -ResourceGroupName $rgName -Name $storageAccountName 

if ($sa.Kind -eq 'Storage') {
Set-AzStorageAccount -ResourceGroupName $rgName -Name $storageAccountName -UpgradeToStorageV2 -AccessTier 'Hot' -Force
}



try
{
    Write-Host "Creating container..."
    New-AzStorageContainer -Name $containerName -Context $ctx -Permission blob
}
catch [Exception]
{
    Write-Host $_.Exception.GetType().FullName, $_.Exception.Message
}

Write-Host "Uploading blob..."
Set-AzStorageBlobContent -File "C:\D\Infra Automation\Bicep\SingPost\Version1\main.bicep" `
-Container $containerName `
-Blob $blobname `
-Context $ctx `
-Force

Write-Host
Write-Host "Blob upload finished!"
Write-Host

$blob = Get-AzStorageBlob -Container $containerName -Blob $blobname -Context $ctx

try
{
    Write-Host "Setting blob tier..."
    Write-Host
    $blob.icloudblob.setstandardblobtier("Archive")
    Write-Host (Get-Date).ToUniversalTime()
    Write-Host "Archive blob tier set successfully!" -ForegroundColor Yellow
    Write-Host "TimeStamp: " (Get-Date).ToUniversalTime() -ForegroundColor Yellow
    $tmp = New-TemporaryFile
    Write-Host "Temporary file $tmp"
    Get-AzStorageBlob -Container $containerName -Blob $blobname -Context $ctx | Select-Object -Property Name, BlobType, Length, ContentType, @{n='AccessTier';e={$_.ICloudBlob.Properties.StandardBlobTier}}
    #  | Select-Object -Property Name, BlobType, Length, ContentType, @{n='AccessTier';e={$_.ICloudBlob.Properties.StandardBlobTier}} | Export-Csv "$tmp.csv"
}
catch [Exception]
{
    Write-Host $_.Exception.GetType().FullName, $_.Exception.Message -ForegroundColor Red
    $dt = $(Get-Date).ToUniversalTime()
    Write-Host "TimeStamp: $dt UTC" -ForegroundColor Red
}
