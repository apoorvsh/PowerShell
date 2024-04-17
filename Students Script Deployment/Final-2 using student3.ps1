[CmdletBinding()]
param (
    [Parameter()][hashtable]
    $RG_Tags,
    [Parameter()][hashtable]
    $Vnet_Tags,
    [Parameter()][hashtable]
    $NSG_Tags,
    [Parameter()][string]
    $Private_Subnet_Delegation_Name,
    [Parameter()][string]
    $Public_Subnet_Delegation_Name,
    [Parameter()][string]
    $Delegation_Service_Name,
    [Parameter()][string]
    $Storage_SKU_Name,
    [Parameter()][string]
    $Storage_Kind,
    [Parameter()][string]
    $Storage_Access_Tier,
    [Parameter()][bool]
    $Storage_Https_Traffic,
    [Parameter()][bool]
    $Storage_Enable_HNS,
    [Parameter()][bool]
    $Storage_Blob_Access,
    [Parameter()][string]
    $Storage_TLS_Version,
    [Parameter()][hashtable]
    $Storage_Tags,
    [Parameter()][string]
    $ADLS_Gen2_Access,
    [Parameter()][int]
    $Vault_Soft_Delete_Retention,
    [Parameter()][string]
    $Vault_SKU,
    [Parameter()][hashtable]
    $Vault_Tags,
    [Parameter()][string]
    $Vault_Network_Action,
    [Parameter()][string]
    $Vault_Network_Bypass,
    [Parameter()][string]
    $Databricks_SKU,
    [Parameter()][hashtable]
    $Databricks_Tags,
    [Parameter()][hashtable]
    $DataFactory_Tags,
    [Parameter()][string]
    $Synapse_Username,
    [Parameter()][string]
    $Synapse_Pass,
    [Parameter()][hashtable]
    $Synapse_WS_Tags,
    [Parameter()][string]
    $Storage_Network_Bypass,
    [Parameter()][string]
    $Storage_Network_Action,
    [Parameter()][string]
    $Synapse_Firewall_Name,
    [Parameter()][string]
    $Synapse_Firewall_Starting_IP,
    [Parameter()][string]
    $Synapse_Firewall_Ending_IP
)

$RG_Tags = @{
    "Env"  = "Testing"
    "Name" = "Resource Group"
}

$Vnet_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "VNet"
}

$NSG_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "NSG"
}

$Private_Subnet_Delegation_Name = 'delegation-1'
$Public_Subnet_Delegation_Name  = 'delegation-2'
$Delegation_Service_Name        = 'Microsoft.Databricks/workspaces'


$Storage_SKU_Name      = 'Standard_GRS'
$Storage_Kind          = 'StorageV2'
$Storage_Access_Tier   = 'Hot'
$Storage_Https_Traffic = $True
$Storage_Enable_HNS    = $True
$Storage_Blob_Access   = $True
$Storage_TLS_Version   = 'TLS1_2'
$Storage_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "Storage Account"
}

$ADLS_Gen2_Access = 'Container'

$Vault_Soft_Delete_Retention = 7
$Vault_SKU                   = 'Standard'
$Vault_Tags = @{
    "Env"  = "Testing";
    "Name" = "Key Vault"
}

$Vault_Network_Action = 'Deny'
$Vault_Network_Bypass = 'AzureServices'


$Databricks_SKU = 'Standard'
$Databricks_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "Databrick workspace"
}

$DataFactory_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "Data factory"
}

$Synapse_Username = 'John'
$Synapse_Pass     = 'Password_12345'
$Synapse_WS_Tags  = @{
    "Env"  = "Testing";
    "Name" = "Synapse Workspace"
}


$Storage_Network_Bypass = 'AzureServices'
$Storage_Network_Action = 'Deny'

$Synapse_Firewall_Name        = 'AllowAllWindowsAzureIps'
$Synapse_Firewall_Starting_IP = '0.0.0.0'
$Synapse_Firewall_Ending_IP   = '0.0.0.0'

$count = 0

Import-Csv .\student3.csv |
    ForEach-Object {
        $RG_Name                    = $_.'RG Name'
        $RG_Location                = $_.'RG Location'
        $Vnet_Name                  = $_.'Vnet Name'
        $Vnet_Address               = $_.'Vnet Address'
        $NSG_Name                   = $_.'NSG Name'
        $Private_Subnet_Name        = $_.'Private Subnet Name'
        $Private_Subnet_Address     = $_.'Private Subnet Address'
        $Public_Subnet_Name         = $_.'Public Subnet Name'
        $Public_Subnet_Address      = $_.'Public Subnet Address'
        $Storage_Name               = $_.'ADLSGen2 Name'
        $ADLS_Gen2_Name             = $_.'ADLSGen2 Container Name'
        $DataFactory_Name           = $_.'DataFactory Name'
        $Databricks_Name            = $_.'Databricks Name'
        $Databricks_Managed_RG_Name = $_.'Databricks Managed RG Name'
        $Vault_Name                 = $_.'KeyVault Name'
        $Synapse_WS_Name            = $_.'Synapse Analytics Name'

        #Creation of Resource Group
        Write-Output "`t`tCreating Resource Group :- $($RG_Name)"
        $null = New-AzResourceGroup `
            -Name     $RG_Name `
            -Location $RG_Location `
            -Tag      $RG_Tags
        Write-Output "`t`tResource Group is Created :- $($RG_Name)`n"

        #Creation of Virtual Network
        Write-Output "`t`tCreating Vitual Network :- $($Vnet_Name)"
        $Vnet = New-AzVirtualNetwork `
            -Name              $Vnet_Name `
            -ResourceGroupName $RG_Name `
            -Location          $RG_Location `
            -AddressPrefix     $Vnet_Address `
            -Tag               $Vnet_Tags
        Write-Output "`t`tVirutal Network is Created :- $($Vnet_Name)`n"

        #Creation of Network Security Group
        Write-Output "`t`tCreating Network Security Group :- $($NSG_Name)"
        $NSG = New-AzNetworkSecurityGroup `
            -Name              $NSG_Name `
            -ResourceGroupName $RG_Name `
            -Location          $RG_Location `
            -Tag               $NSG_Tags
        Write-Output "`t`tNetwork Security Group is Created :- $($NSG_Name)`n"

        #Create Service Delegation for Private Databricks Subnet
        Write-Output "`t`tCreating Service Delegation :- $($Private_Subnet_Delegation_Name)"
        $Delegation = New-AzDelegation `
            -Name        $Private_Subnet_Delegation_Name `
            -ServiceName $Delegation_Service_Name
        Write-Output "`t`tService Delegation is Created :- $($Private_Subnet_Delegation_Name)`n"

        #Creation of Private Databricks Subnet
        Write-Output "`t`tCreating Databricks Subnet :- $($Private_Subnet_Name)"
        $null = Add-AzVirtualNetworkSubnetConfig `
            -Name                 $Private_Subnet_Name `
            -VirtualNetwork       $Vnet `
            -AddressPrefix        $Private_Subnet_Address `
            -Delegation           $Delegation `
            -WarningAction        SilentlyContinue `
            -NetworkSecurityGroup $NSG | Set-AzVirtualNetwork
        Write-Output "`t`tDatabricks Subnet is Created :- $($Private_Subnet_Name)`n"
        
        #Create Service Delegation for Public Databricks Subnet
        Write-Output "`t`tCreating Service Delegation :- $($Public_Subnet_Delegation_Name)"
        $Delegation = New-AzDelegation `
            -Name        $Public_Subnet_Delegation_Name `
            -ServiceName $Delegation_Service_Name
        Write-Output "`t`tService Delegation is Created :- $($Public_Subnet_Delegation_Name)`n"

        #Creation of Public Databricks Subnet
        Write-Output "`t`tCreating Databricks Subnet :- $($Public_Subnet_Name)"
        $null = Add-AzVirtualNetworkSubnetConfig `
            -Name                 $Public_Subnet_Name `
            -VirtualNetwork       $Vnet `
            -AddressPrefix        $Public_Subnet_Address `
            -Delegation           $Delegation `
            -WarningAction        SilentlyContinue `
            -NetworkSecurityGroup $NSG | Set-AzVirtualNetwork
        Write-Output "`t`tDatabricks Subnet is Created :- $($Public_Subnet_Name)`n"

        #Creation of ADLS Gen2 Storage Account
        Write-Output "`t`tCreating Storage Account :- $($Storage_Name)" 
        $Storage = New-AzStorageAccount `
            -ResourceGroupName           $RG_Name `
            -Name                        $Storage_Name `
            -SkuName                     $Storage_SKU_Name `
            -Location                    $RG_Location `
            -Kind                        $Storage_Kind `
            -AccessTier                  $Storage_Access_Tier `
            -EnableHttpsTrafficOnly      $Storage_Https_Traffic `
            -EnableHierarchicalNamespace $Storage_Enable_HNS `
            -AllowBlobPublicAccess       $Storage_Blob_Access `
            -MinimumTlsVersion           $Storage_TLS_Version `
            -Tag                         $Storage_Tags
        Write-Output "`t`tStorage Account is Created :- $($Storage_Name)`n"

        #Creation of ADLS Gen2 Container
        do {
                Write-Output "`t`tSleep for 10 Seconds`n"
                Start-Sleep 10;
        } while ($Storage.ProvisioningState -ne 'Succeeded')

        Write-Output "`t`tCreating ADLS Gen2 Container $($ADLS_Gen2_Name) in $($Storage_Name)"
        $null = New-AzDatalakeGen2FileSystem `
            -Name       $ADLS_Gen2_Name `
            -Permission $ADLS_Gen2_Access `
            -Context    $Storage.Context
        Write-Output "`t`tADLS Gen2 Container $($ADLS_Gen2_Name) in $($Storage_Name) is Created`n"

        
        #Creation of Key Vault
        Write-Output "`t`tCreating Key Vault :- $($Vault_Name)"
        $null = New-AzKeyVault `
            -Name                      $Vault_Name `
            -ResourceGroupName         $RG_Name `
            -Location                  $RG_Location `
            -SoftDeleteRetentionInDays $Vault_Soft_Delete_Retention `
            -Sku                       $Vault_SKU `
            -Tag                       $Vault_Tags `
            -EnabledForDeployment
        Write-Output "`t`tKey Vault is Created :- $($Vault_Name)`n"

        #Updation of Key Vault Network Rule
        Write-Output "`t`tUpdating Key Vault Network Rule"
        $null = Update-AzKeyVaultNetworkRuleSet `
            -VaultName         $Vault_Name `
            -ResourceGroupName $RG_Name `
            -DefaultAction     $Vault_Network_Action `
            -Bypass            $Vault_Network_Bypass
        Write-Output "`t`tKey Vault Network Rule is Updated`n"

        #Creation of Databricks WorkSpace
        Write-Output "`t`tCreating Databricks Workspace :- $($Databricks_Name)"
        $null = New-AzDatabricksWorkspace `
            -Name                     $Databricks_Name `
            -ResourceGroupName        $RG_Name `
            -Location                 $RG_Location `
            -ManagedResourceGroupName $Databricks_Managed_RG_Name `
            -PrivateSubnetName        $Private_Subnet_Name `
            -PublicSubnetName         $Public_Subnet_Name `
            -Sku                      $Databricks_SKU `
            -VirtualNetworkId         $Vnet.Id `
            -Tag                      $Databricks_Tags
        Write-Output "`t`tDatabricks Workspace is Created :- $($Databricks_Name)`n"
        
        #Creation of Data Factory
        Write-Output "`t`tCreating Data Factory :- $($DataFactory_Name)"
        $null = New-AzDataFactory `
            -Name              $DataFactory_Name `
            -Location          $RG_Location `
            -ResourceGroupName $RG_Name `
            -Tag               $DataFactory_Tags
        Write-Output "`t`tData Factory is Created :- $($DataFactory_Name)`n"
         
        #Conversion of Password into Secure String
        $Password = ConvertTo-SecureString $Synapse_Pass -AsPlainText -Force
        $Creds = New-Object -TypeName System.Management.Automation.PSCredential ($Synapse_Username, $Password)

        #Creation of Synapse Analytics WorkSpace
        Write-Output "`t`tCreating Synapse Workspace :- $($Synapse_WS_Name)"
        $null = New-AzSynapseWorkspace `
            -ResourceGroupName                 $RG_Name `
            -Name                              $Synapse_WS_Name `
            -Location                          $RG_Location `
            -DefaultDataLakeStorageAccountName $Storage_Name `
            -DefaultDataLakeStorageFilesystem  $ADLS_Gen2_Name `
            -SqlAdministratorLoginCredential   $Creds `
            -Tag                               $Synapse_WS_Tags
        Write-Output "`t`tSynapse Workspace is Created :- $($Synapse_WS_Name)`n"

        #Update Storage Account Network Rule
        Write-Output "`t`tUpdating Storage Account Network Rule :- $($Storage_Name)"
        $null = Update-AzStorageAccountNetworkRuleSet `
            -ResourceGroupName $RG_Name `
            -Name              $Storage_Name `
            -Bypass            $Storage_Network_Bypass `
            -DefaultAction     $Storage_Network_Action
        Write-Output "`t`tStorage Account Network Rule is updated :- $($Storage_Name)`n"

        #Update Synapse Firewall Rule
        Write-Output "`t`tCreating Synapse Firewall :- $($Synapse_WS_Name)"
        $null = New-AzSynapseFirewallRule `
            -ResourceGroupName $RG_Name `
            -WorkspaceName     $Synapse_WS_Name `
            -Name              $Synapse_Firewall_Name `
            -StartIpAddress    $Synapse_Firewall_Starting_IP `
            -EndIpAddress      $Synapse_Firewall_Ending_IP
        Write-Output "`t`tSynapse Firewall is Created :- $($Synapse_WS_Name)`n"
        $count += 1
    }