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
    $SQL_Username,
    [Parameter()][array]
    $SQL_Server_Name,
    [Parameter()][hashtable]
    $SQL_Server_Tags,
    [Parameter()][array]
    $SQL_DB_Name,
    [Parameter()][array]
    $SQL_DB_Edition,
    [Parameter()][array]
    $SQL_DB_Collation,
    [Parameter()][array]
    $SQL_DB_Size,
    [Parameter()][hashtable]
    $SQL_DB_Tags
)

$RG_Name     = 'Aks-RG2'
$RG_Location = 'EastUS'
$RG_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "RG"
}

$Vault_Name                  = @('keyvault34823')
$Vault_Soft_Delete_Retention = @( 7 )
$Vault_SKU                   = @('Standard')
$Vault_Tags = @{
    "Env"  = "Testing";
    "Name" = "Key Vault"
}

$Vault_Secret_Value = @('Password_12345')
$Vault_Secret_Name  = @('SQLPassword')
$Secret_Vault_Name  = @('keyvault34823')

$SQL_Vault_Name        = @('keyvault34823')
$SQL_Vault_Secret_Name = @('SQLPassword')
$SQL_Username          = @('John')
$SQL_Server_Name       = @('sqlserver5476')
$SQL_Server_Tags = @{
    "Env"  = "Testing";
    "Name" = "SQL Server"
}

$DB_Server_Name   = @('sqlserver5476', 'sqlserver5476')
$SQL_DB_Name      = @('mydb1', 'mydb2')
$SQL_DB_Edition   = @('Basic', 'Basic')
$SQL_DB_Collation = @('SQL_Latin1_General_CP1_CI_AS', 'SQL_Latin1_General_CP1_CI_AS')
$SQL_DB_Size      = @('1073741824', '1073741824')
$SQL_DB_Tags = @{
    "Env"  = "Testing";
    "Name" = "SQL Database"
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

#Create SQL Server
for ($i = 0; $i -lt $SQL_Server_Name.Count; $i++) {

    #Get SQL Password from key vault
    $SQL_Password = (Get-AzKeyVaultSecret -VaultName $SQL_Vault_Name[$i] -Name $SQL_Vault_Secret_Name[$i]).SecretValue

    $Creds = New-Object -TypeName System.Management.Automation.PSCredential ($SQL_Username[$i], $SQL_Password)

    Write-Output "`t`tCreating SQL Server :- $($SQL_Server_Name[$i])"
    $null = New-AzSqlServer `
        -ServerName                  $SQL_Server_Name[$i] `
        -ResourceGroupName           $RG_Name `
        -SqlAdministratorCredentials $Creds `
        -Location                    $RG_Location `
        -Tags                        $SQL_Server_Tags

    Write-Output "`t`tSQL Server is Created :- $($SQL_Server_Name[$i])`n"
}


#Create SQL Database
for ($i = 0; $i -lt $SQL_DB_Name.Count; $i++) {

    Write-Output "`t`tCreating SQL Database $($SQL_DB_Name[$i]) in $($DB_Server_Name[$i])"
    $null = New-AzSqlDatabase `
        -ResourceGroupName $RG_Name `
        -ServerName        $DB_Server_Name[$i] `
        -DatabaseName      $SQL_DB_Name[$i] `
        -Edition           $SQL_DB_Edition[$i] `
        -CollationName     $SQL_DB_Collation[$i] `
        -MaxSizeBytes      $SQL_DB_Size[$i] `
        -Tags              $SQL_DB_Tags
    
    Write-Output "`t`tSQL Database $($SQL_DB_Name[$i]) is Created in $($DB_Server_Name[$i])`n"
}