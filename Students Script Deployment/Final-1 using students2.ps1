[CmdletBinding()]
param (
    [Parameter()][hashtable]
    $RG_Tags,
    [Parameter()][array]
    $Vnet_Name,
    [Parameter()][array]
    $Vnet_Address,
    [Parameter()][hashtable]
    $Vnet_Tags,
    [Parameter()][array]
    $NSG_Name,
    [Parameter()][hashtable]
    $NSG_Tags,
    [Parameter()][array]
    $NSG_Rule_Name,
    [Parameter()][array]
    $NSG_Rule_Description,
    [Parameter()][array]
    $NSG_Rule_Protocol,
    [Parameter()][array]
    $NSG_Rule_Source_Port_Range,
    [Parameter()][array]
    $NSG_Rule_Destination_Port_Range,
    [Parameter()][array]
    $NSG_Rule_Source_Address_Prefix,
    [Parameter()][array]
    $NSG_Rule_Destination_Address_Prefix,
    [Parameter()][array]
    $NSG_Rule_Access,
    [Parameter()][array]
    $NSG_Rule_Priority,
    [Parameter()][array]
    $NSG_Rule_Direction,
    [Parameter()][array]
    $Service_Delegation_Name,
    [Parameter()][array]
    $Service_Delegation_Service_Name,
    [Parameter()][array]
    $DB_Subnet_Name,
    [Parameter()][array]
    $DB_Subnet_Address,
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
    [Parameter()][array]
    $ADLS_Gen2_Name,
    [Parameter()][array]
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
    [Parameter()][array]
    $Databricks_Managed_RG_Name,
    [Parameter()][array]
    $Databricks_Private_Subnet_Name,
    [Parameter()][array]
    $Databricks_Public_Subnet_Name,
    [Parameter()][string]
    $Databricks_SKU,
    [Parameter()][hashtable]
    $Databricks_Tags,
    [Parameter()][hashtable]
    $DataFactory_Tags,
    [Parameter()][string]
    $Synapse_Username,
    [Parameter()][string]
    $Synapse_Password,
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

$Vnet_Name    = @('Vnet-1') , @()
$Vnet_Address = @('10.10.0.0/16') , @()
$Vnet_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "VNet"
}

$NSG_Name = @('db-nsg') , @()
$NSG_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "NSG"
}


$NSG_Rule_NSG_Name                   = @('db-nsg') , @()
$NSG_Rule_Name                       = @('db-nsg-rule') , @()
$NSG_Rule_Description                = @('Allow port 443 for Https') , @()
$NSG_Rule_Protocol                   = @('*'), @()
$NSG_Rule_Source_Port_Range          = @('*'), @()
$NSG_Rule_Destination_Port_Range     = @('443'), @()
$NSG_Rule_Source_Address_Prefix      = @('*'), @()
$NSG_Rule_Destination_Address_Prefix = @('*'), @()
$NSG_Rule_Access                     = @('Allow'), @()
$NSG_Rule_Priority                   = @(100), @()
$NSG_Rule_Direction                  = @('Inbound'), @()


$DB_Subnet_Vnet_Name     = @('Vnet-1', 'Vnet-1'), @()
$DB_Subnet_NSG_Name      = @('db-nsg', 'db-nsg'), @()
$Delegation_Name         = @('delegation-1', 'delegation-2'), @() 
$Delegation_Service_Name = @('Microsoft.Databricks/workspaces', 'Microsoft.Databricks/workspaces'), @()
$DB_Subnet_Name          = @('Subnet-dbw-cluster', 'Subnet-dbw-host'), @()
$DB_Subnet_Address       = @('10.10.1.0/26', '10.10.2.0/26'), @()


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

$ADLS_Gen2_Name    = @('datalake'), @()
$ADLS_Gen2_Access  = @('Container'), @()


$Vault_Soft_Delete_Retention = 7
$Vault_SKU                   = 'Standard'
$Vault_Tags = @{
    "Env"  = "Testing";
    "Name" = "Key Vault"
}

$Vault_Network_Action = 'Deny'
$Vault_Network_Bypass = 'AzureServices'


$Databricks_Vnet_Name           = @('Vnet-1')
$Databricks_Managed_RG_Name     = @('db-ws-rg')
$Databricks_Private_Subnet_Name = @('Subnet-dbw-cluster')
$Databricks_Public_Subnet_Name  = @('Subnet-dbw-host')
$Databricks_SKU                 = 'Standard'
$Databricks_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "Databrick workspace"
}

$DataFactory_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "Data factory"
}


$Synapse_Username          = 'John'
$Synapse_Password          = 'Password_12345'
$Synapse_Storage_File_Name = @('datalake')
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

Import-Csv .\student2.csv |
    ForEach-Object {
        $RG_Name          = $_.'RG Name'
        $RG_Location      = $_.'RG Location'
        $Storage_Name     = $_.'ADLSGen2 Name'
        $DataFactory_Name = $_.'DataFactory Name'
        $Databricks_Name  = $_.'Databricks Name'
        $Vault_Name       = $_.'KeyVault Name'
        $Synapse_WS_Name  = $_.'Synapse Analytics Name'

        #Creation of Resource Group
        Write-Output "`t`tCreating Resource Group :- $($RG_Name)"
        $null = New-AzResourceGroup `
            -Name     $RG_Name `
            -Location $RG_Location `
            -Tag      $RG_Tags
        Write-Output "`t`tResource Group is Created :- $($RG_Name)`n"

        #Creation of Virtual Network
        for ($i = 0; $i -lt $Vnet_Name[$count].Length; $i++) {
            Write-Output "`t`tCreating Vitual Network :- $($Vnet_Name[$count][$i])"
            $null = New-AzVirtualNetwork `
                -Name              $Vnet_Name[$count][$i] `
                -ResourceGroupName $RG_Name `
                -Location          $RG_Location `
                -AddressPrefix     $Vnet_Address[$count][$i] `
                -Tag               $Vnet_Tags
            Write-Output "`t`tVirutal Network is Created :- $($Vnet_Name[$count][$i])`n"
        }

        #Creation of Network Security Group
        for ($i = 0; $i -lt $NSG_Name[$count].Length; $i++) {
            Write-Output "`t`tCreating Network Security Group :- $($NSG_Name[$count][$i])"
            $null = New-AzNetworkSecurityGroup `
                -Name              $NSG_Name[$count][$i] `
                -ResourceGroupName $RG_Name `
                -Location          $RG_Location `
                -Tag               $NSG_Tags
            Write-Output "`t`tNetwork Security Group is Created :- $($NSG_Name[$count][$i])`n"
        }

        #Creation of Network Security Rules and Associated with NSG
        for ($i = 0; $i -lt $NSG_Rule_Name[$count].Length; $i++) {
            
            #Get Network Security Group
            $NSG = Get-AzNetworkSecurityGroup -Name $NSG_Rule_NSG_Name[$count][$i] -ResourceGroupName $RG_Name
            
            Write-Output "`t`tCreating Network Security Rules $($NSG_Rule_Name[$count][$i]) in $($NSG_Name[$count][$i])"
            $null = Add-AzNetworkSecurityRuleConfig `
                -Name                     $NSG_Rule_Name[$count][$i] `
                -NetworkSecurityGroup     $NSG `
                -Description              $NSG_Rule_Description[$count][$i] `
                -Protocol                 $NSG_Rule_Protocol[$count][$i] `
                -SourcePortRange          $NSG_Rule_Source_Port_Range[$count][$i] `
                -DestinationPortRange     $NSG_Rule_Destination_Port_Range[$count][$i] `
                -SourceAddressPrefix      $NSG_Rule_Source_Address_Prefix[$count][$i] `
                -DestinationAddressPrefix $NSG_Rule_Destination_Address_Prefix[$count][$i] `
                -Access                   $NSG_Rule_Access[$count][$i] `
                -Priority                 $NSG_Rule_Priority[$count][$i] `
                -Direction                $NSG_Rule_Direction[$count][$i] | Set-AzNetworkSecurityGroup
            Write-Output "`t`tNetwork Security Rules $($NSG_Rule_Name[$count][$i]) in $($NSG_Name[$count][$i]) is Created`n"
        }


        #Creation of Databricks Subnet with Service Delegation
        for ($i = 0; $i -lt $DB_Subnet_Name[$count].Length; $i++) {

            #Retrieve Information about Virtual Network
            $Vnet = Get-AzVirtualNetwork -Name $DB_Subnet_Vnet_Name[$count][$i] -ResourceGroupName $RG_Name

            #Retrieve Information about NSG
            $NSG = Get-AzNetworkSecurityGroup -Name $DB_Subnet_NSG_Name[$count][$i] -ResourceGroupName $RG_Name

            #Create Service Delegation
            Write-Output "`t`tCreating Service Delegation :- $($Delegation_Name[$count][$i])"
            $Delegation = New-AzDelegation `
                -Name        $Delegation_Name[$count][$i] `
                -ServiceName $Delegation_Service_Name[$count][$i]
            Write-Output "`t`tService Delegation is Created :- $($Delegation_Name[$count][$i])`n"

            Write-Output "`t`tCreating Databricks Subnet :- $($DB_Subnet_Name[$count][$i])"
            $null = Add-AzVirtualNetworkSubnetConfig `
                -Name                 $DB_Subnet_Name[$count][$i] `
                -VirtualNetwork       $Vnet `
                -AddressPrefix        $DB_Subnet_Address[$count][$i] `
                -Delegation           $Delegation `
                -WarningAction        SilentlyContinue `
                -NetworkSecurityGroup $NSG | Set-AzVirtualNetwork
            Write-Output "`t`tDatabricks Subnet is Created :- $($DB_Subnet_Name[$count][$i])`n"
        }
        

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
        for ($i = 0; $i -lt $ADLS_Gen2_Name[$count].Length; $i++) {
            do {
                Write-Output "`t`tSleep for 10 Seconds`n"
                Start-Sleep 10;
            } while ($Storage.ProvisioningState -ne 'Succeeded')

            Write-Output "`t`tCreating ADLS Gen2 Container $($ADLS_Gen2_Name[$count][$i]) in $($Storage_Name)"
            $null = New-AzDatalakeGen2FileSystem `
                -Name       $ADLS_Gen2_Name[$count][$i] `
                -Permission $ADLS_Gen2_Access[$count][$i] `
                -Context    $Storage.Context
            Write-Output "`t`tADLS Gen2 Container $($ADLS_Gen2_Name[$count][$i]) in $($Storage_Name) is Created`n"
        }

        
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

        
        #Get Virtual Network
        $Vnet = Get-AzVirtualNetwork -Name $Databricks_Vnet_Name[$count] -ResourceGroupName $RG_Name

        #Creation of Databricks WorkSpace
        Write-Output "`t`tCreating Databricks Workspace :- $($Databricks_Name)"
        $null = New-AzDatabricksWorkspace `
            -Name                     $Databricks_Name `
            -ResourceGroupName        $RG_Name `
            -Location                 $RG_Location `
            -ManagedResourceGroupName $Databricks_Managed_RG_Name[$count] `
            -PrivateSubnetName        $Databricks_Private_Subnet_Name[$count] `
            -PublicSubnetName         $Databricks_Public_Subnet_Name[$count] `
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
        $Password = ConvertTo-SecureString $Synapse_Password -AsPlainText -Force
        $Creds = New-Object -TypeName System.Management.Automation.PSCredential ($Synapse_Username, $Password)

        #Creation of Synapse Analytics WorkSpace
        Write-Output "`t`tCreating Synapse Workspace :- $($Synapse_WS_Name)"
        $null = New-AzSynapseWorkspace `
            -ResourceGroupName                 $RG_Name `
            -Name                              $Synapse_WS_Name `
            -Location                          $RG_Location `
            -DefaultDataLakeStorageAccountName $Storage_Name `
            -DefaultDataLakeStorageFilesystem  $Synapse_Storage_File_Name[$count] `
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