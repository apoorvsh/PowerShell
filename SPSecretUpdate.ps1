param($Request, $TriggerMetadata)
$appId = "2de639d8-0b22-4f18-a561-6a829c2267aa"
$displayName = "apoorv01"
$kvName = "kvab03"
$kvSecretName = "test"
# Replace 'YourSecretId' with the actual ID of the secret you want to remove
# $secretIdToRemove = 'b962be9c-9d8f-461f-a090-d96d2b78ed56'
Install-Module AzureAD
Connect-AzAccount -Identity
$secrets = Get-AzADAppCredential -ApplicationId $appId
# Write-Host $secrets
$AADApp = Get-AzADApplication -ApplicationId $appId
# Write-Host $AADApp 
# $objectId = $AADApp.id 
# Write-Host $objectId 
$PasswordCedentials = @{
    StartDateTime = Get-Date
    EndDateTime = (Get-Date).AddDays(90)
    # DisplayName = ("Secret auto-rotated on: "+(Get-Date).ToUniversalTime().ToString("yyyy'-'MM'-'dd"))
     DisplayName = $displayName
}    
$spCreds = New-AzADAppCredential -ApplicationObject $AADApp -PasswordCredentials $PasswordCedentials
$secret = $spCreds.SecretText
Write-Host $secret
$secretvalue = ConvertTo-SecureString -String $secret -AsPlainText -Force
$secret = Set-AzKeyVaultSecret -VaultName $kvName -Name $kvSecretName -SecretValue $secretvalue
# Replace 'YourSecretId' with the actual ID of the secret you want to remove
# Remove-AzADAppCredential -ObjectId $objectId -KeyId $secretIdToRemove
foreach ($secret in $secrets) {
    $AADApp | Remove-AzADAppCredential -KeyId $secret.KeyId 
}