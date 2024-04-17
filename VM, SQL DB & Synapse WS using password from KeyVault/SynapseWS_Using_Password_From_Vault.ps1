[CmdletBinding()]
param (
    [Parameter()][string]
    $RG_Name,
    [Parameter()][string]
    $RG_Location,
    [Parameter()][hashtable]
    $RG_Tags,
    [Parameter()][array]
    $Vault_Name,
    [Parameter()][array]
    $Vault_Soft_Delete_Retention,
    [Parameter()][array]
    $Vault_SKU,
    [Parameter()][hashtable]
    $Vault_Tags,
    [Parameter()][array]
    $Vault_Secret_Value,
    [Parameter()][array]
    $Vault_Secret_Name,
    [Parameter()][array]
    $Storage_Name,
    [Parameter()][array]
    $Storage_SKU_Name,
    [Parameter()][array]
    $Storage_Kind,
    [Parameter()][array]
    $Storage_Access_Tier,
    [Parameter()][array]
    $Storage_Https_Traffic,
    [Parameter()][array]
    $Storage_Enable_HNS,
    [Parameter()][array]
    $Storage_Blob_Access,
    [Parameter()][array]
    $Storage_TLS_Version,
    [Parameter()][hashtable]
    $Storage_Tags,
    [Parameter()][array]
    $ADLS_Gen2_Name,
    [Parameter()][array]
    $ADLS_Gen2_Access,
    [Parameter()][array]
    $Synapse_Username,
    [Parameter()][array]
    $Synapse_WS_Name,
    [Parameter()][hashtable]
    $Synapse_WS_Tags
)

$RG_Name     = 'Aks-RG'
$RG_Location = 'EastUS'
$RG_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "RG"
}

$Vault_Name                  = @('keyvault34829')
$Vault_Soft_Delete_Retention = @( 7 )
$Vault_SKU                   = @('Standard')
$Vault_Tags = @{
    "Env"  = "Testing";
    "Name" = "Key Vault"
}

$Vault_Secret_Value = @('Password_12345')
$Vault_Secret_Name  = @('SQLPassword')
$Secret_Vault_Name  = @('keyvault34829')

$Storage_Name          = @('storageacc76324')
$Storage_SKU_Name      = @('Standard_LRS')
$Storage_Kind          = @('StorageV2')
$Storage_Access_Tier   = @('Hot')
$Storage_Https_Traffic = @($True)
$Storage_Enable_HNS    = @($True)
$Storage_Blob_Access   = @($True)
$Storage_TLS_Version   = @('TLS1_2')
$Storage_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "Storage Account"
}

$ADLS_Storage_Name = @('storageacc76324')
$ADLS_Gen2_Name    = @('con-1')
$ADLS_Gen2_Access  = @('Container')

$Synapse_Vault_Name        = @('keyvault34829')
$Synapse_Vault_Secret_Name = @('SQLPassword')
$Synapse_Username          = @('John')
$Synapse_WS_Name           = @('whoakssynapsews')
$Synapse_WS_Tags  = @{
    "Env"  = "Testing";
    "Name" = "Synapse Workspace"
}

#Creation of Resource Group
Write-Output "`t`tCreating Resource Group"
$null = New-AzResourceGroup `
    -Name     $RG_Name `
    -Location $RG_Location `
    -Tag      $RG_Tags
Write-Output "`t`tResource Group is Created`n"

#Create Key Vault
for ($i = 0; $i -lt $Vault_Name.Count; $i++) {
    
    Write-Output "`t`tCreating Key Vault :- $($Vault_Name[$i])"
    $null = New-AzKeyVault `
        -Name                      $Vault_Name[$i] `
        -ResourceGroupName         $RG_Name `
        -Location                  $RG_Location `
        -SoftDeleteRetentionInDays $Vault_Soft_Delete_Retention[$i] `
        -Sku                       $Vault_SKU[$i] `
        -Tag                       $Vault_Tags `
        -EnabledForDeployment

    Write-Output "`t`tKey Vault is Created :- $($Vault_Name[$i])`n"
}

#Create Key Vault Secret
for ($i = 0; $i -lt $Vault_Secret_Name.Count; $i++) {
    
    #Convert Secret Vaule to Secure String
    $Secret = ConvertTo-SecureString -String $Vault_Secret_Value[$i] -AsPlainText -Force

    Write-Output "`t`tCreating Secret Value in $($Secret_Vault_Name[$i])"
    $null = Set-AzKeyVaultSecret `
        -VaultName   $Secret_Vault_Name[$i] `
        -Name        $Vault_Secret_Name[$i] `
        -SecretValue $Secret

    Write-Output "`t`tSecret Value in $($Secret_Vault_Name[$i]) is Created`n"
}

#Creation of Storage Account
for ($i = 0; $i -lt $Storage_Name.Count; $i++) {

    Write-Output "`t`tCreating Storage Account :- $($Storage_Name[$i])" 
    $null = New-AzStorageAccount `
        -ResourceGroupName           $RG_Name `
        -Name                        $Storage_Name[$i] `
        -SkuName                     $Storage_SKU_Name[$i] `
        -Location                    $RG_Location `
        -Kind                        $Storage_Kind[$i] `
        -AccessTier                  $Storage_Access_Tier[$i] `
        -EnableHttpsTrafficOnly      $Storage_Https_Traffic[$i] `
        -EnableHierarchicalNamespace $Storage_Enable_HNS[$i] `
        -AllowBlobPublicAccess       $Storage_Blob_Access[$i] `
        -MinimumTlsVersion           $Storage_TLS_Version[$i] `
        -Tag                         $Storage_Tags

    Write-Output "`t`tStorage Account is Created :- $($Storage_Name[$i])`n"
}

for ($i = 0; $i -lt $ADLS_Gen2_Name.Count; $i++) {
    
    #Get Storage Account
    $Storage = Get-AzStorageAccount -ResourceGroupName $RG_Name -Name $ADLS_Storage_Name[$i]

    do {
        Write-Output "`t`tSleep for 10 Seconds`n"
        Start-Sleep 10;
    } while ($Storage.ProvisioningState -ne 'Succeeded')

    #Create ADLS FileSystem
    Write-Output "`t`tCreating ADLS Gen2 Container $($ADLS_Gen2_Name[$i]) in $($ADLS_Storage_Name[$i])"
    $null = New-AzDatalakeGen2FileSystem `
        -Name       $ADLS_Gen2_Name[$i] `
        -Permission $ADLS_Gen2_Access[$i] `
        -Context    $Storage.Context

    Write-Output "`t`tADLS Gen2 Container $($ADLS_Gen2_Name[$i]) in $($ADLS_Storage_Name[$i]) is Created`n"
}

#Create Synapse Workspace
for ($i = 0; $i -lt $Synapse_WS_Name.Count; $i++) {

    #Get Secret Value from Key Vault
    $Synapse_Password = (Get-AzKeyVaultSecret -VaultName $Synapse_Vault_Name[$i] -Name $Synapse_Vault_Secret_Name[$i]).SecretValue

    $Creds = New-Object -TypeName System.Management.Automation.PSCredential ($Synapse_Username[$i], $Synapse_Password)

    Write-Output "`t`tCreating Synapse Workspace :- $($Synapse_WS_Name[$i])"
    $null = New-AzSynapseWorkspace `
        -ResourceGroupName                 $RG_Name `
        -Name                              $Synapse_WS_Name[$i] `
        -Location                          $RG_Location `
        -DefaultDataLakeStorageAccountName $Storage_Name[$i] `
        -DefaultDataLakeStorageFilesystem  $ADLS_Gen2_Name[$i] `
        -SqlAdministratorLoginCredential   $Creds `
        -Tag                               $Synapse_WS_Tags
    
    Write-Output "`t`tSynapse Workspace is Created :- $($Synapse_WS_Name[$i])`n"
}