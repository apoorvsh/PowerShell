param($Request, $TriggerMetadata)
$ServicePrincipals = @(
 @{
    "AppId"= "2de639d8-0b22-4f18-a561-6a829c2267aa";
    "DisplayName"= "icici01";
    "KvName" = "kvab03";
    "KvSecretName" = "testing01"
 },
 @{
    "AppId"="17988a10-43d4-4417-9e13-f4ce2cd0232a";
    "DisplayName"="icici02";
    "KvName" = "kvab03";
    "KvSecretName" = "testing02"
 }
)
Install-Module AzureAD
Connect-AzAccount -Identity
foreach($sp in $ServicePrincipals)
{
    $secrets = Get-AzADAppCredential -ApplicationId $sp.AppId
    $AADApp = Get-AzADApplication -ApplicationId $sp.AppId
    $PasswordCedentials = @{
    StartDateTime = Get-Date
    EndDateTime = (Get-Date).AddDays(90)
    # DisplayName = ("Secret auto-rotated on: "+(Get-Date).ToUniversalTime().ToString("yyyy'-'MM'-'dd"))
     DisplayName = $sp.DisplayName
} 
$spCreds = New-AzADAppCredential -ApplicationObject $AADApp -PasswordCredentials $PasswordCedentials
$secret = $spCreds.SecretText
Write-Host $secret
$secretvalue = ConvertTo-SecureString -String $secret -AsPlainText -Force
$secret = Set-AzKeyVaultSecret -VaultName $sp.KvName -Name $sp.KvSecretName -SecretValue $secretvalue
foreach ($secret in $secrets) {
    $AADApp | Remove-AzADAppCredential -KeyId $secret.KeyId 
}
}