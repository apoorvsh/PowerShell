[CmdletBinding()]
param (
    [Parameter()][string]
    $RG_Name,
    [Parameter()][string]
    $RG_Location,
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
    $Subnet_Name,
    [Parameter()][array]
    $Subnet_Address,
    [Parameter()][array]
    $Subnet_PE_Network_Policy,
    [Parameter()][array]
    $Service_Delegation_Name,
    [Parameter()][array]
    $Service_Delegation_Service_Name,
    [Parameter()][array]
    $DB_Subnet_Name,
    [Parameter()][array]
    $DB_Subnet_Address,
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
    $Storage_Container_Name,
    [Parameter()][array]
    $Storage_Container_Access,
    [Parameter()][array]
    $ADLS_Gen2_Name,
    [Parameter()][array]
    $ADLS_Gen2_Access,
    [Parameter()][array]
    $Public_IP_Allocation,
    [Parameter()][array]
    $Public_IP_Name,
    [Parameter()][array]
    $Public_IP_SKU,
    [Parameter()][hashtable]
    $Public_IP_Tags,
    [Parameter()][array]
    $NIC_Name,
    [Parameter()][array]
    $NIC_IP_Cfg_Name,
    [Parameter()][hashtable]
    $NIC_Tags,
    [Parameter()][array]
    $VM_Username,
    [Parameter()][array]
    $VM_Password,
    [Parameter()][array]
    $Windows_VM_Name,
    [Parameter()][array]
    $Windows_VM_Size,
    [Parameter()][hashtable]
    $Windows_VM_Tags,
    [Parameter()][array]
    $Windows_VM_Image_Publisher_Name,
    [Parameter()][array]
    $Windows_VM_Image_Offer,
    [Parameter()][array]
    $Windows_VM_Image_SKU,
    [Parameter()][array]
    $Windows_VM_Image_Version,
    [Parameter()][array]
    $Windows_VM_OS_Disk_Name,
    [Parameter()][array]
    $Windows_VM_OS_Disk_Caching,
    [Parameter()][array]
    $Windows_VM_OS_Disk_Creation_Option,
    [Parameter()][array]
    $Windows_VM_OS_Disk_Size,
    [Parameter()][array]
    $Windows_VM_OS_Storage_Type,
    [Parameter()][array]
    $VM_Boot_Diagnostic_Storage_Name,
    [Parameter()][array]
    $Vault_Name,
    [Parameter()][array]
    $Vault_Soft_Delete_Retention,
    [Parameter()][array]
    $Vault_SKU,
    [Parameter()][hashtable]
    $Vault_Tags,
    [Parameter()][array]
    $Vault_Network_Action,
    [Parameter()][array]
    $Vault_Network_Bypass,
    [Parameter()][array]
    $Analysis_Service_Name,
    [Parameter()][array]
    $Analysis_Service_SKU,
    [Parameter()][string]
    $Analysis_Service_User,
    [Parameter()][hashtable]
    $Analysis_Service_Tags,
    [Parameter()][array]
    $Databricks_Name,
    [Parameter()][array]
    $Databricks_Managed_RG_Name,
    [Parameter()][array]
    $Databricks_Private_Subnet_Name,
    [Parameter()][array]
    $Databricks_Public_Subnet_Name,
    [Parameter()][array]
    $Databricks_SKU,
    [Parameter()][hashtable]
    $Databricks_Tags,
    [Parameter()][array]
    $Log_Analytics_WS_Name,
    [Parameter()][array]
    $Log_Analytics_WS_SKU,
    [Parameter()][array]
    $Log_Analytics_WS_Retention,
    [Parameter()][hashtable]
    $Log_Analytics_WS_Tags,
    [Parameter()][array]
    $Automation_Account_Name,
    [Parameter()][array]
    $Automation_Account_Plan,
    [Parameter()][hashtable]
    $Automation_Account_Tags,
    [Parameter()][array]
    $Synapse_Username,
    [Parameter()][array]
    $Synapse_Password,
    [Parameter()][array]
    $Synapse_WS_Name,
    [Parameter()][hashtable]
    $Synapse_WS_Tags,
    [Parameter()][array]
    $Synapse_SQL_Pool_Name,
    [Parameter()][array]
    $Synapse_SQL_Pool_SKU,
    [Parameter()][array]
    $Synapse_SQL_Pool_Collation,
    [Parameter()][hashtable]
    $Synapse_SQL_Pool_Tags,
    [Parameter()][array]
    $AG_Receiver_Name,
    [Parameter()][array]
    $AG_Receiver_Mail,
    [Parameter()][array]
    $AG_Short_Name,
    [Parameter()][array]
    $Metric_Name,
    [Parameter()][array]
    $Metric_Namespace,
    [Parameter()][array]
    $Metric_Time_Aggregation,
    [Parameter()][array]
    $Metric_Alert_Operator,
    [Parameter()][array]
    $Metric_Alert_Threshold,
    [Parameter()][array]
    $Metric_Alert_Name,
    [Parameter()][array]
    $Metric_Alert_Window_Size,
    [Parameter()][array]
    $Metric_Alert_Frequency,
    [Parameter()][array]
    $Metric_Alert_Severity,
    [Parameter()][array]
    $Metric_Alert_Description,
    [Parameter()][array]
    $Storage_Network_Bypass,
    [Parameter()][array]
    $Storage_Network_Action,
    [Parameter()][array]
    $Synapse_Firewall_Name,
    [Parameter()][array]
    $Synapse_Firewall_Starting_IP,
    [Parameter()][array]
    $Synapse_Firewall_Ending_IP,
    [Parameter()][array]
    $Private_DNS_Name,
    [Parameter()][hashtable]
    $Private_DNS_Tags,
    [Parameter()][array]
    $Private_DNS_Vnet_Name,
    [Parameter()][hashtable]
    $Private_DNS_Vnet_Tags,
    [Parameter()][array]
    $PE_Service_Connection_Name,
    [Parameter()][array]
    $PE_Subresource_Name,
    [Parameter()][array]
    $PE_Name,
    [Parameter()][hashtable]
    $PE_Tags,
    [Parameter()][array]
    $Private_DNS_Zone_Config_Name,
    [Parameter()][array]
    $Private_DNS_Zone_Group_Name
)

$RG_Name     = 'KPMG-CA-DWSynapsePOC-RG'
$RG_Location = 'CanadaCentral'
$RG_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "RG"
}

$Vnet_Name    = @('vnet-KPMG-CA-DWITSCore')
$Vnet_Address = @('10.135.28.0/24')
$Vnet_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "RG"
}


$NSG_Name = @('vm-nsg', 'db-nsg')
$NSG_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "NSG"
}


$NSG_Rule_NSG_Name                   = @('vm-nsg', 'db-nsg')
$NSG_Rule_Name                       = @('vm-nsg-rule', 'db-nsg-rule')
$NSG_Rule_Description                = @('Allow port 443 for Https', 'Allow port 443 for Https')
$NSG_Rule_Protocol                   = @('*', '*')
$NSG_Rule_Source_Port_Range          = @('*', '*')
$NSG_Rule_Destination_Port_Range     = @('443', '443')
$NSG_Rule_Source_Address_Prefix      = @('*', '*')
$NSG_Rule_Destination_Address_Prefix = @('*', '*')
$NSG_Rule_Access                     = @('Allow', 'Allow')
$NSG_Rule_Priority                   = @(100, 100)
$NSG_Rule_Direction                  = @('Inbound', 'Inbound')


$Subnet_Vnet_Name         = @('vnet-KPMG-CA-DWITSCore')
$Subnet_NSG_Name          = @('vm-nsg')
$Subnet_Name              = @('Snet-poc')
$Subnet_Address           = @('10.135.28.0/27')
$Subnet_PE_Network_Policy = @('Disabled')


$DB_Subnet_Vnet_Name     = @('vnet-KPMG-CA-DWITSCore', 'vnet-KPMG-CA-DWITSCore')
$DB_Subnet_NSG_Name      = @('db-nsg', 'db-nsg')
$Delegation_Name         = @('delegation-1', 'delegation-2') 
$Delegation_Service_Name = @('Microsoft.Databricks/workspaces', 'Microsoft.Databricks/workspaces')
$DB_Subnet_Name          = @('snet-dbw-cluster-poc', 'snet-dbw-host-poc')
$DB_Subnet_Address       = @('10.135.28.64/26', '10.135.28.128/26')


$Storage_Name          = @('mystkpmgcadwpoc042021', 'mystkpmgcadwasb', 'mydlskpmgcadwpoc042021')
$Storage_SKU_Name      = @('Standard_LRS', 'Standard_LRS', 'Standard_LRS')
$Storage_Kind          = @('StorageV2', 'StorageV2', 'StorageV2')
$Storage_Access_Tier   = @('Cool', 'Cool', 'Hot')
$Storage_Https_Traffic = @($True, $True, $True)
$Storage_Enable_HNS    = @($False, $False, $True)
$Storage_Blob_Access   = @($True, $True, $True)
$Storage_TLS_Version   = @('TLS1_2', 'TLS1_2', 'TLS1_2')
$Storage_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "Storage Account"
}

$Container_Storage_Name   = @('mystkpmgcadwasb')
$Storage_Container_Name   = @('backup01')
$Storage_Container_Access = @('Container')


$ADLS_Storage_Name = @('mydlskpmgcadwpoc042021')
$ADLS_Gen2_Name    = @('datalake')
$ADLS_Gen2_Access  = @('Container')


$Public_IP_Allocation = @('Static')
$Public_IP_Name       = @('IP-1')
$Public_IP_SKU        = @('Standard')
$Public_IP_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "Public-IP"
}

$Vnet_NIC_Name   = @('vnet-KPMG-CA-DWITSCore')
$Subnet_NIC_Name = @('Snet-poc')
$NIC_Name        = @('NIC-1')
$NIC_IP_Cfg_Name = @('NIC-IP-Cfg-1')
$NIC_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "NIC"
}

$VM_Username     = @('John')
$VM_Password     = @('Password_12345')
$Windows_VM_Name = @('Caadcapp0603')
$Windows_VM_Size = @('Standard_B1s')
$Windows_VM_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "VM"
}

$Windows_VM_Image_Publisher_Name    = @('MicrosoftWindowsServer')
$Windows_VM_Image_Offer             = @('WindowsServer')
$Windows_VM_Image_SKU               = @('2019-DataCenter')
$Windows_VM_Image_Version           = @('latest')
$Windows_VM_OS_Disk_Name            = @('os-disk')
$Windows_VM_OS_Disk_Caching         = @('ReadWrite')
$Windows_VM_OS_Disk_Creation_Option = @('FromImage')
$Windows_VM_OS_Disk_Size            = @(127)
$Windows_VM_OS_Storage_Type         = @('Standard_LRS')
$VM_Boot_Diagnostic_Storage_Name    = @('mystkpmgcadwpoc042021')


$Vault_Name                  = @('Aks-kv-kpmgcadwpoc01')
$Vault_Soft_Delete_Retention = @( 7 )
$Vault_SKU                   = @('Standard')
$Vault_Tags = @{
    "Env"  = "Testing";
    "Name" = "Key Vault"
}

$Vault_Network_Action = @('Deny')
$Vault_Network_Bypass = @('AzureServices')


$AAS_Backup_Storage_Name   = @('mystkpmgcadwasb')
$AAS_Backup_Container_Name = @('backup01')
$Analysis_Service_Name     = @('synaskpmgcadwpoc01')
$Analysis_Service_SKU      = @('S0')
$Analysis_Service_User     = 'whoaks1234_outlook.com#EXT#@whoaks1234outlook.onmicrosoft.com'
$Analysis_Service_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "Analysis Service"
}

$Databricks_Vnet_Name           = @('vnet-KPMG-CA-DWITSCore')
$Databricks_Name                = @('databricks-ws')
$Databricks_Managed_RG_Name     = @('db-ws-rg')
$Databricks_Private_Subnet_Name = @('snet-dbw-cluster-poc')
$Databricks_Public_Subnet_Name  = @('snet-dbw-host-poc')
$Databricks_SKU                 = @('Standard')
$Databricks_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "Databrick workspace"
}

$Log_Analytics_WS_Name      = @('log-kpmgca-dwcore')
$Log_Analytics_WS_SKU       = @('PerGB2018')
$Log_Analytics_WS_Retention = @( 30 )
$Log_Analytics_WS_Tags = @{
    "Env"  = "Testing";
    "Name" = "Log Analytics Workspace"
}


$Automation_Account_Name = @('Aks-aa-kpmgcadwpoc01')
$Automation_Account_Plan = @('Basic')
$Automation_Account_Tags = @{
    "Env"  = "Testing";
    "Name" = "Automation Account"
}

$App_Display_Name                = 'AAS-SP'
$SelfSigned_Certificate_Password = 'Password@12345'



$Synapse_Username          = @('John')
$Synapse_Password          = @('Password_12345')
$Synapse_Storage_Name      = @('mydlskpmgcadwpoc042021')
$Synapse_Storage_File_Name = @('datalake')
$Synapse_WS_Name           = @('mysynswkpmgcadwpoc01')
$Synapse_WS_Tags  = @{
    "Env"  = "Testing";
    "Name" = "Synapse Workspace"
}

$SQL_Synapse_Name           = @('mysynswkpmgcadwpoc01')
$Synapse_SQL_Pool_Name      = @('sqlpool1')
$Synapse_SQL_Pool_SKU       = @('DW100c')
$Synapse_SQL_Pool_Collation = @('SQL_Latin1_General_CP1_CI_AS')
$Synapse_SQL_Pool_Tags = @{
    "Env"  = "Testing";
    "Name" = "Synapse Dedicated SQL Pool"
}

$WS_Name = ''

$AG_Receiver_Name = @('Mail-1')
$AG_Receiver_Mail = @('pandeypn.ap@gmail.com')
$Receiver_AG_Name = @('ActionGroup')
$AG_Short_Name    = @('ag')


$Action_Group_Name          = @('ActionGroup', 'ActionGroup', 'ActionGroup', 'ActionGroup', 'ActionGroup', 'ActionGroup', 'ActionGroup', 'ActionGroup', 'ActionGroup', 'ActionGroup')
$Alert_Target_Resource_Type = @('Storage', 'Storage', 'Storage', 'VM', 'KeyVault', 'AAS', 'LogWS', 'AutomationAccount', 'SynapseWS', 'DedicatedSQLPool')
$Alert_Target_Resource_Name = @('mystkpmgcadwpoc042021', 'mystkpmgcadwasb', 'mydlskpmgcadwpoc042021', 'Caadcapp0603', 'Aks-kv-kpmgcadwpoc01', 'synaskpmgcadwpoc01', 'log-kpmgca-dwcore', 'Aks-aa-kpmgcadwpoc01', 'mysynswkpmgcadwpoc01', 'sqlpool1')


$Metric_Name              = @('UsedCapacity', 'UsedCapacity', 'UsedCapacity', 'Percentage CPU', 'ServiceApiHit', 'CurrentConnections', 'Average_% Available Memory', 'TotalJob', 'BuiltinSqlPoolDataProcessedBytes', 'Connections')
$Metric_Namespace         = @('Microsoft.Storage/storageAccounts', 'Microsoft.Storage/storageAccounts', 'Microsoft.Storage/storageAccounts', 'Microsoft.Compute/virtualMachines', 'Microsoft.KeyVault/vaults', 'Microsoft.AnalysisServices/servers', 'Microsoft.OperationalInsights/workspaces', 'Microsoft.Automation/automationAccounts', 'Microsoft.Synapse/workspaces', 'Microsoft.Synapse/workspaces/sqlPools')
$Metric_Time_Aggregation  = @('Average', 'Average', 'Average', 'Average', 'Count', 'Average', 'Average','Total', 'Total', 'Total')
$Metric_Alert_Operator    = @('GreaterThan', 'GreaterThan', 'GreaterThan', 'GreaterThan', 'GreaterThan', 'GreaterThan', 'GreaterThan', 'GreaterThan', 'GreaterThan', 'GreaterThan')
$Metric_Alert_Threshold   = @(10, 10, 10, 10, 10, 10, 10, 10, 10, 10)
$Metric_Alert_Name        = @('boot-storage-alert', 'backup-storage-alert', 'adls-alert', 'vm-alert', 'keyvault-alert', 'aas-alert', 'logws-alert', 'automation-account-alert', 'synapsews-alert', 'dedicated-sqlpool-alert')
$Metric_Alert_Window_Size = @('01:00:00', '01:00:00', '01:00:00', '00:01:00', '00:01:00', '00:01:00', '00:01:00', '00:01:00', '00:01:00', '00:01:00')
$Metric_Alert_Frequency   = @('00:01:00', '00:01:00', '00:01:00', '00:01:00', '00:01:00', '00:01:00', '00:01:00', '00:01:00', '00:01:00', '00:01:00')
$Metric_Alert_Severity    = @(3, 3, 3, 3, 3, 3, 3, 3, 3, 3 )
$Metric_Alert_Description = @(
    'The Amount of Storage used by Storage Account',
    'The Amount of Storage used by Storage Account',
    'The Amount of Storage used by Storage Account',
    'The percentage of allocated compute units that are currently in use by the Virtual Machine(s)',
    'Number of total service api hits',
    'Current number of client connections established',
    'Average_% Available Memory',
    'The total number of jobs',
    'Amount of data processed by queries',
    'Count of Total logins to the SQL pool'
    )


$Storage_Network_Bypass = @('AzureServices', 'AzureServices', 'AzureServices')
$Storage_Network_Action = @('Deny', 'Deny', 'Deny')

$Synapse_Firewall_WS_Name     = @('mysynswkpmgcadwpoc01')
$Synapse_Firewall_Name        = @('AllowAllWindowsAzureIps')
$Synapse_Firewall_Starting_IP = @('0.0.0.0')
$Synapse_Firewall_Ending_IP   = @('0.0.0.0')


$Private_DNS_Name = @('privatelink.dfs.core.windows.net', 'privatelink.blob.core.windows.net', 'privatelink.sql.azuresynapse.net', 'privatelink.vaultcore.azure.net')
$Private_DNS_Tags = @{
    "Env"  = "Testing";
    "Name" = "Private DNS"
}

$DNS_Vnet_Name         = @('vnet-KPMG-CA-DWITSCore', 'vnet-KPMG-CA-DWITSCore', 'vnet-KPMG-CA-DWITSCore', 'vnet-KPMG-CA-DWITSCore')
$Private_DNS_Vnet_Name = @('dns-dfs-vnet', 'dns-blob-vnet', 'dns-sql-vnet', 'dns-vault-vnet')
$Private_DNS_Vnet_Tags = @{
    "Env" = "Testing";
    "Name" = "DNS Vnet"
}

$PE_Vnet_Name               = @('vnet-KPMG-CA-DWITSCore', 'vnet-KPMG-CA-DWITSCore', 'vnet-KPMG-CA-DWITSCore', 'vnet-KPMG-CA-DWITSCore', 'vnet-KPMG-CA-DWITSCore', 'vnet-KPMG-CA-DWITSCore')
$PE_Subnet_Name             = @('Snet-poc', 'Snet-poc', 'Snet-poc', 'Snet-poc', 'Snet-poc', 'Snet-poc')
$PE_Service_Type            = @('ADLS', 'ADLS', 'Storage', 'Storage', 'Synapse', 'Vault')
$PE_Service_Name            = @('mydlskpmgcadwpoc042021', 'mydlskpmgcadwpoc042021', 'mystkpmgcadwpoc042021', 'mystkpmgcadwasb', 'mysynswkpmgcadwpoc01', 'Aks-kv-kpmgcadwpoc01')
$PE_Service_Connection_Name = @('adls-pe-dfs-connection', 'adls-pe-blob-connection', 'storage-account-for-vm-pe-connection', 'storage-account-for-analysis-pe-connection', 'synapsews-pe-connection', 'vault-pe-connection')
$PE_Subresource_Name        = @('dfs', 'blob', 'blob', 'blob', 'Sql', 'vault')
$PE_Name                    = @('pe-adlsgen2-dfs', 'pe-adlsgen2-blob', 'pe-storageaccountforvm-blob', 'pe-storageaccountforanalysis-blob', 'pe-synapsews-sql', 'pe-keyvault-vault')
$PE_Tags = @{
    "Env"  = "Testing";
    "Name" = "Private Endpoint"
}

$PE_DNS_Name                  = @('privatelink.dfs.core.windows.net', 'privatelink.blob.core.windows.net', 'privatelink.blob.core.windows.net', 'privatelink.blob.core.windows.net', 'privatelink.sql.azuresynapse.net', 'privatelink.vaultcore.azure.net')
$Private_DNS_Zone_Config_Name = @('adls-config1', 'adls-config2', 'stac-config1', 'stac-config2', 'ws-config', 'vault-config')
$Private_DNS_Zone_Group_Name  = @('private-dns-zone-dfs', 'private-dns-zone-blob', 'private-dns-zone-blob', 'private-dns-zone-blob', 'private-dns-zone-sql', 'private-dns-zone-vault')


#Creation of Resource Group
Write-Output "`t`tCreating Resource Group"
$null = New-AzResourceGroup `
    -Name     $RG_Name `
    -Location $RG_Location `
    -Tag      $RG_Tags
Write-Output "`t`tResource Group is Created`n"


#Creation of Virtual Network
for ($i = 0; $i -lt $Vnet_Name.Count; $i++) {
    Write-Output "`t`tCreating Vitual Network :- $($Vnet_Name[$i])"
    $null = New-AzVirtualNetwork `
        -Name              $Vnet_Name[$i] `
        -ResourceGroupName $RG_Name `
        -Location          $RG_Location `
        -AddressPrefix     $Vnet_Address[$i] `
        -Tag               $Vnet_Tags
    Write-Output "`t`tVirutal Network is Created :- $($Vnet_Name[$i])`n"
}


#Creation of Network Security Group
for ($i = 0; $i -lt $NSG_Name.Count; $i++) {
    Write-Output "`t`tCreating Network Security Group :- $($NSG_Name[$i])"
    $null = New-AzNetworkSecurityGroup `
        -Name              $NSG_Name[$i] `
        -ResourceGroupName $RG_Name `
        -Location          $RG_Location `
        -Tag               $NSG_Tags
    Write-Output "`t`tNetwork Security Group is Created :- $($NSG_Name[$i])`n"
}

#Creation of Network Security Rules and Associated with NSG
for ($i = 0; $i -lt $NSG_Rule_Name.Count; $i++) {
    
    #Get Network Security Group
    $NSG = Get-AzNetworkSecurityGroup -Name $NSG_Rule_NSG_Name[$i] -ResourceGroupName $RG_Name
    
    Write-Output "`t`tCreating Network Security Rules $($NSG_Rule_Name[$i]) in $($NSG_Name[$i])"
    $null = Add-AzNetworkSecurityRuleConfig `
        -Name                     $NSG_Rule_Name[$i] `
        -NetworkSecurityGroup     $NSG `
        -Description              $NSG_Rule_Description[$i] `
        -Protocol                 $NSG_Rule_Protocol[$i] `
        -SourcePortRange          $NSG_Rule_Source_Port_Range[$i] `
        -DestinationPortRange     $NSG_Rule_Destination_Port_Range[$i] `
        -SourceAddressPrefix      $NSG_Rule_Source_Address_Prefix[$i] `
        -DestinationAddressPrefix $NSG_Rule_Destination_Address_Prefix[$i] `
        -Access                   $NSG_Rule_Access[$i] `
        -Priority                 $NSG_Rule_Priority[$i] `
        -Direction                $NSG_Rule_Direction[$i] | Set-AzNetworkSecurityGroup
    Write-Output "`t`tNetwork Security Rules $($NSG_Rule_Name[$i]) in $($NSG_Name[$i]) is Created`n"
}


#Creation of Subnet
for ($i = 0; $i -lt $Subnet_Name.Count; $i++) {
    
    #Retrieve Information about Virtual Network
    $Vnet = Get-AzVirtualNetwork -Name $Subnet_Vnet_Name[$i] -ResourceGroupName $RG_Name
    
    #Retrieve Information about NSG
    $NSG = Get-AzNetworkSecurityGroup -Name $Subnet_NSG_Name[$i] -ResourceGroupName $RG_Name
    
    Write-Output "`t`tCreating Subnet :- $($Subnet_Name[$i])"
    $null = Add-AzVirtualNetworkSubnetConfig `
        -Name                               $Subnet_Name[$i] `
        -VirtualNetwork                     $Vnet `
        -AddressPrefix                      $Subnet_Address[$i] `
        -PrivateEndpointNetworkPoliciesFlag $Subnet_PE_Network_Policy[$i] `
        -WarningAction                      SilentlyContinue `
        -NetworkSecurityGroup               $NSG | Set-AzVirtualNetwork
    Write-Output "`t`tSubnet is Created :- $($Subnet_Name[$i])`n"
}


#Creation of Databricks Subnet with Service Delegation
for ($i = 0; $i -lt $DB_Subnet_Name.Count; $i++) {

    #Retrieve Information about Virtual Network
    $Vnet = Get-AzVirtualNetwork -Name $DB_Subnet_Vnet_Name[$i] -ResourceGroupName $RG_Name

    #Retrieve Information about NSG
    $NSG = Get-AzNetworkSecurityGroup -Name $DB_Subnet_NSG_Name[$i] -ResourceGroupName $RG_Name

    #Create Service Delegation
    Write-Output "`t`tCreating Service Delegation :- $($Delegation_Name[$i])"
    $Delegation = New-AzDelegation `
        -Name $Delegation_Name[$i] `
        -ServiceName $Delegation_Service_Name[$i]
    Write-Output "`t`tService Delegation is Created :- $($Delegation_Name[$i])`n"

    Write-Output "`t`tCreating Databricks Subnet :- $($DB_Subnet_Name[$i])"
    $null = Add-AzVirtualNetworkSubnetConfig `
        -Name                 $DB_Subnet_Name[$i] `
        -VirtualNetwork       $Vnet `
        -AddressPrefix        $DB_Subnet_Address[$i] `
        -Delegation           $Delegation `
        -WarningAction        SilentlyContinue `
        -NetworkSecurityGroup $NSG | Set-AzVirtualNetwork
    Write-Output "`t`tDatabricks Subnet is Created :- $($DB_Subnet_Name[$i])`n"
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

#Creation of Storage Container
for ($i = 0; $i -lt $Storage_Container_Name.Count; $i++) {
    
    #Get Storage Account
    $Storage = Get-AzStorageAccount -ResourceGroupName $RG_Name -Name $Container_Storage_Name[$i]

    do {
        Write-Output "`t`tSleep for 10 Seconds`n"
        Start-Sleep 10;
    } while ($Storage.ProvisioningState -ne 'Succeeded')

    Write-Output "`t`tCreating Storage Container $($Storage_Container_Name[$i]) in Storage Account $($Container_Storage_Name[$i])"
    $null = New-AzStorageContainer `
        -Name $Storage_Container_Name[$i] `
        -Permission $Storage_Container_Access[$i] `
        -Context    $Storage.Context
    Write-Output "`t`tStorage Container $($Storage_Container_Name[$i]) in Storage Account $($Container_Storage_Name[$i]) is Created`n"
}

#Creation of ADLS Gen2 Container
for ($i = 0; $i -lt $ADLS_Gen2_Name.Count; $i++) {
    
    #Get Storage Account
    $Storage = Get-AzStorageAccount -ResourceGroupName $RG_Name -Name $ADLS_Storage_Name[$i]

    do {
        Write-Output "`t`tSleep for 10 Seconds`n"
        Start-Sleep 10;
    } while ($Storage.ProvisioningState -ne 'Succeeded')

    Write-Output "`t`tCreating ADLS Gen2 Container $($ADLS_Gen2_Name[$i]) in $($ADLS_Storage_Name[$i])"
    $null = New-AzDatalakeGen2FileSystem `
        -Name       $ADLS_Gen2_Name[$i] `
        -Permission $ADLS_Gen2_Access[$i] `
        -Context    $Storage.Context
    Write-Output "`t`tADLS Gen2 Container $($ADLS_Gen2_Name[$i]) in $($ADLS_Storage_Name[$i]) is Created`n"
}

#Creation of Public IP
for ($i = 0; $i -lt $Public_IP_Name.Count; $i++) {
    Write-Output "`t`tCreating Public IP :- $($Public_IP_Name[$i])"
    $null = New-AzPublicIpAddress `
        -ResourceGroupName $RG_Name `
        -AllocationMethod  $Public_IP_Allocation[$i] `
        -Name              $Public_IP_Name[$i] `
        -Location          $RG_Location `
        -Sku               $Public_IP_SKU[$i] `
        -WarningAction     SilentlyContinue `
        -Tag               $Public_IP_Tags
    Write-Output "`t`tPublic IP is Created :- $($Public_IP_Name[$i])`n"
}

#Creation of Network Interface Card
for ($i = 0; $i -lt $NIC_Name.Count; $i++) {
    #Retrieve Information about Virtual Network
    $Vnet = Get-AzVirtualNetwork -Name $Vnet_NIC_Name[$i] -ResourceGroupName $RG_Name
    #Retrieve Information about Subnet
    $Subnet = Get-AzVirtualNetworkSubnetConfig -Name $Subnet_NIC_Name[$i] -VirtualNetwork $Vnet
    #Retrieve Information about Public IP Address
    $IP = Get-AzPublicIpAddress -Name $Public_IP_Name[$i] -ResourceGroupName $RG_Name
    Write-Output "`t`tCreating Network Interface Card :- $($NIC_Name[$i])"
    $null = New-AzNetworkInterface `
        -Name                $NIC_Name[$i] `
        -ResourceGroupName   $RG_Name `
        -Location            $RG_Location `
        -Subnet              $Subnet `
        -PublicIpAddress     $IP `
        -IpConfigurationName $NIC_IP_Cfg_Name[$i] `
        -Tag                 $NIC_Tags
    Write-Output "`t`tNetwork Interface Card is Created :- $($NIC_Name[$i])`n"
}


#Creation of Virtual Machine
for ($i = 0; $i -lt $Windows_VM_Name.Count; $i++) {

    #Convert Password Into Secure Password
    $VM_Password[$i] = ConvertTo-SecureString $VM_Password[$i] -AsPlainText -Force
    $Credential = New-Object System.Management.Automation.PSCredential ($VM_Username[$i], $VM_Password[$i]);
    
    #Create a Configurable Virtual Machine Object
    $VM = New-AzVMConfig `
        -VMName $Windows_VM_Name[$i] `
        -VMSize $Windows_VM_Size[$i] `
        -Tags   $Windows_VM_Tags

    #Set Operating System Properties for a Virtual Machine
    $VM = Set-AzVMOperatingSystem `
        -VM           $VM `
        -Windows `
        -ComputerName $Windows_VM_Name[$i] `
        -Credential   $Credential

    #Gets Network Interface Information
    $NIC = Get-AzNetworkInterface -Name $NIC_Name[$i] -ResourceGroupName $RG_Name
    
    #Adds a Network Interface to Virtual Machine
    $VM = Add-AzVMNetworkInterface `
        -VM $VM `
        -Id $NIC.Id
    
    #Set the Image for Virtual Machine
    $VM= Set-AzVMSourceImage `
        -VM            $VM `
        -PublisherName $Windows_VM_Image_Publisher_Name[$i] `
        -Offer         $Windows_VM_Image_Offer[$i] `
        -Skus          $Windows_VM_Image_SKU[$i] `
        -Version       $Windows_VM_Image_Version[$i]
    
    #Set Operating System disk properties on Virtual Machine
    $VM = Set-AzVMOSDisk `
        -VM                 $VM `
        -Name               $Windows_VM_OS_Disk_Name[$i] `
        -Caching            $Windows_VM_OS_Disk_Caching[$i] `
        -CreateOption       $Windows_VM_OS_Disk_Creation_Option[$i] `
        -DiskSizeInGB       $Windows_VM_OS_Disk_Size[$i] `
        -StorageAccountType $Windows_VM_OS_Storage_Type[$i]
    
    #Set Virtual Machine boot diagonistic Storage Account
    $VM = Set-AzVMBootDiagnostic `
        -VM                 $VM `
        -StorageAccountName $VM_Boot_Diagnostic_Storage_Name[$i] `
        -Enable `
        -ResourceGroupName  $RG_Name
    
    #Creates a Virtual Machine
    Write-Output "`t`tCreating Windows Virtual Machine :- $($Windows_VM_Name[$i])"
    $null = New-AzVM `
        -ResourceGroupName $RG_Name `
        -Location          $RG_Location `
        -VM                $VM
    Write-Output "`t`tWindows Virutal Machine is Created :- $($Windows_VM_Name[$i])`n"
}

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

    #Updation of Key Vault Network Rule
    Write-Output "`t`tUpdating Key Vault Network Rule"
    $null = Update-AzKeyVaultNetworkRuleSet `
        -VaultName         $Vault_Name[$i] `
        -ResourceGroupName $RG_Name `
        -DefaultAction     $Vault_Network_Action[$i] `
        -Bypass            $Vault_Network_Bypass[$i]
    Write-Output "`t`tKey Vault Network Rule is Updated`n"
}


#Creation of Analysis Service
for ($i = 0; $i -lt $Analysis_Service_Name.Count; $i++) {

    #Get Backup Storage Account
    $Storage = Get-AzStorageAccount -ResourceGroupName $RG_Name -Name $AAS_Backup_Storage_Name[$i]

    #Get Backup Container
    $Container = Get-AzStorageContainer -Name $AAS_Backup_Container_Name[$i] -Context $Storage.Context
    
    Write-Output "`t`tCreating Analysis Service :- $($Analysis_Service_Name[$i])"
    $null = New-AzAnalysisServicesServer `
        -ResourceGroupName      $RG_Name `
        -Name                   $Analysis_Service_Name[$i] `
        -Location               $RG_Location `
        -Sku                    $Analysis_Service_SKU[$i] `
        -Administrator          $Analysis_Service_User `
        -BackupBlobContainerUri $Container.BlobContainerClient.Uri.AbsoluteUri `
        -Tag                    $Analysis_Service_Tags
    Write-Output "`t`tAnalysis Service is Created :- $($Analysis_Service_Name[$i])`n"
}


#Creating Databricks WorkSpace
for ($i = 0; $i -lt $Databricks_Name.Count; $i++) {
    
    #Get Virtual Network
    $Vnet = Get-AzVirtualNetwork -Name $Databricks_Vnet_Name[$i] -ResourceGroupName $RG_Name

    Write-Output "`t`tCreating Databricks Workspace :- $($Databricks_Name[$i])"
    $null = New-AzDatabricksWorkspace `
        -Name                     $Databricks_Name[$i] `
        -ResourceGroupName        $RG_Name `
        -Location                 $RG_Location `
        -ManagedResourceGroupName $Databricks_Managed_RG_Name[$i] `
        -PrivateSubnetName        $Databricks_Private_Subnet_Name[$i] `
        -PublicSubnetName         $Databricks_Public_Subnet_Name[$i] `
        -Sku                      $Databricks_SKU[$i] `
        -VirtualNetworkId         $Vnet.Id `
        -Tag                      $Databricks_Tags
    Write-Output "`t`tDatabricks Workspace is Created :- $($Databricks_Name[$i])`n"
}


#Creation of Log Analytics WorkSpace
for ($i = 0; $i -lt $Log_Analytics_WS_Name.Count; $i++) {
    
    Write-Output "`t`tCreating Log Analytics Workspace :- $($Log_Analytics_WS_Name[$i])"
    $null = New-AzOperationalInsightsWorkspace `
        -ResourceGroupName $RG_Name `
        -Name              $Log_Analytics_WS_Name[$i] `
        -Location          $RG_Location `
        -Sku               $Log_Analytics_WS_SKU[$i] `
        -RetentionInDays   $Log_Analytics_WS_Retention[$i] `
        -Tag               $Log_Analytics_WS_Tags
    Write-Output "`t`tLog Analytics Workspace is Created :- $($Log_Analytics_WS_Name[$i])`n"
}


#Creation of Automation Account
for ($i = 0; $i -lt $Automation_Account_Name.Count; $i++) {
    
    Write-Output "`t`tCreating Automation Account :- $($Automation_Account_Name[$i])"
    $null = New-AzAutomationAccount `
        -ResourceGroupName $RG_Name `
        -Name              $Automation_Account_Name[$i] `
        -Location          $RG_Location `
        -Plan              $Automation_Account_Plan[$i] `
        -Tags              $Automation_Account_Tags
    Write-Output "`t`tAutomation Account is Created :- $($Automation_Account_Name)`n"

    #Creation of RunAsAccount
    Write-Output "`t`tCreating Run as Account"
    $null = .\Create-RunAsAccount.ps1 `
        -ResourceGroup               $RG_Name `
        -AutomationAccountName       $Automation_Account_Name[$i] `
        -SubscriptionId              (Get-AzSubscription).Id `
        -ApplicationDisplayName      $App_Display_Name `
        -SelfSignedCertPlainPassword $SelfSigned_Certificate_Password `
        -CreateClassicRunAsAccount   $false
    Write-Output "`t`tRun as Account is Created`n"
}


#Create Synapse Workspace
for ($i = 0; $i -lt $Synapse_WS_Name.Count; $i++) {
    
    #Conversion of Password into Secure String
    $Password = ConvertTo-SecureString $Synapse_Password[$i] -AsPlainText -Force

    $Creds = New-Object -TypeName System.Management.Automation.PSCredential ($Synapse_Username[$i], $Password)

    Write-Output "`t`tCreating Synapse Workspace :- $($Synapse_WS_Name[$i])"
    $null = New-AzSynapseWorkspace `
        -ResourceGroupName                 $RG_Name `
        -Name                              $Synapse_WS_Name[$i] `
        -Location                          $RG_Location `
        -DefaultDataLakeStorageAccountName $Synapse_Storage_Name[$i] `
        -DefaultDataLakeStorageFilesystem  $Synapse_Storage_File_Name[$i] `
        -SqlAdministratorLoginCredential   $Creds `
        -Tag                               $Synapse_WS_Tags
    Write-Output "`t`tSynapse Workspace is Created :- $($Synapse_WS_Name[$i])`n"
}

#Create Synapse Dedicated SQL Pool
for ($i = 0; $i -lt $Synapse_SQL_Pool_Name.Count; $i++) {
    
    Write-Output "`t`tCreating Synapse Dedicated SQL Pool $($Synapse_SQL_Pool_Name[$i]) in $($Synapse_WS_Name[$i])"
    $null = New-AzSynapseSqlPool `
        -ResourceGroupName $RG_Name `
        -WorkspaceName     $SQL_Synapse_Name[$i] `
        -Name              $Synapse_SQL_Pool_Name[$i] `
        -PerformanceLevel  $Synapse_SQL_Pool_SKU[$i] `
        -Collation         $Synapse_SQL_Pool_Collation[$i] `
        -Tag               $Synapse_SQL_Pool_Tags
    Write-Output "`t`tSynapse Dedicated SQL Pool $($Synapse_SQL_Pool_Name[$i]) in $($Synapse_WS_Name[$i]) is Created`n"
}


#Creation of Action Group Receiver
for ($i = 0; $i -lt $AG_Receiver_Name.Count; $i++) {
    
    Write-Output "`t`tCreating Action Group Receiver :- $($AG_Receiver_Name[$i])"
    $AGReceiver = New-AzActionGroupReceiver `
        -Name         $AG_Receiver_Name[$i] `
        -EmailReceiver `
        -EmailAddress $AG_Receiver_Mail[$i]
    Write-Output "`t`tAction Group Receiver is Created :- $($AG_Receiver_Name[$i])`n"

    Write-Output "`t`tAdding Receiver Mail to Action Group"
    $null = Set-AzActionGroup `
        -ResourceGroupName $RG_Name `
        -Name              $Receiver_AG_Name[$i] `
        -ShortName         $AG_Short_Name[$i] `
        -Receiver          $AGReceiver `
        -WarningAction     SilentlyContinue
    Write-Output "`t`tReceiver Mail is added to action group`n"
}


for ($i = 0; $i -lt $Metric_Alert_Name.Count; $i++) {

    if ($Alert_Target_Resource_Type[$i] -eq 'Storage') {
        $TargetResource = (Get-AzStorageAccount -ResourceGroupName $RG_Name -Name $Alert_Target_Resource_Name[$i]).Id
    }
    elseif ($Alert_Target_Resource_Type[$i] -eq 'VM') {
        $TargetResource = (Get-AzVM -ResourceGroupName $RG_Name -Name $Alert_Target_Resource_Name[$i]).Id
    }
    elseif ($Alert_Target_Resource_Type[$i] -eq 'KeyVault') {
        $TargetResource = (Get-AzKeyVault -VaultName $Alert_Target_Resource_Name[$i] -ResourceGroupName $RG_Name).ResourceId
    }
    elseif ($Alert_Target_Resource_Type[$i] -eq 'AAS') {
        $TargetResource = (Get-AzAnalysisServicesServer -ResourceGroupName $RG_Name -Name $Alert_Target_Resource_Name[$i]).Id
    }
    elseif ($Alert_Target_Resource_Type[$i] -eq 'LogWS') {
        $TargetResource = (Get-AzOperationalInsightsWorkspace -ResourceGroupName $RG_Name -Name $Alert_Target_Resource_Name[$i]).ResourceId
    }
    elseif ($Alert_Target_Resource_Type[$i] -eq 'AutomationAccount') {
        $TargetResource = "/subscriptions/$($(Get-AzSubscription).Id)/resourceGroups/$($RG_Name)/providers/Microsoft.Automation/automationAccounts/$($Alert_Target_Resource_Name[$i])" 
    }
    elseif ($Alert_Target_Resource_Type[$i] -eq 'SynapseWS') {
        $TargetResource = (Get-AzSynapseWorkspace -ResourceGroupName $RG_Name -Name $Alert_Target_Resource_Name[$i]).Id
        $WS_Name        = $Alert_Target_Resource_Name[$i] 
    }
    elseif ($Alert_Target_Resource_Type[$i] -eq 'DedicatedSQLPool') {
        $TargetResource = (Get-AzSynapseSqlPool -ResourceGroupName $RG_Name -WorkspaceName $WS_Name -Name $Alert_Target_Resource_Name[$i]).Id
    }

    #Get Action Group
    $Act = Get-AzActionGroup -ResourceGroupName $RG_Name -Name $Action_Group_Name[$i] -WarningAction SilentlyContinue

    $Action = New-AzActionGroup -ActionGroupId $Act.Id

    #Create Metric Alert Rule Criteria
    Write-Output "`t`tCreating Metric Alert Rule Criteria :- $($Metric_Name[$i])"
    $Criteria = New-AzMetricAlertRuleV2Criteria `
        -MetricName      $Metric_Name[$i] `
        -MetricNamespace $Metric_Namespace[$i] `
        -TimeAggregation $Metric_Time_Aggregation[$i] `
        -Operator        $Metric_Alert_Operator[$i] `
        -Threshold       $Metric_Alert_Threshold[$i] `
        -WarningAction   SilentlyContinue
    Write-Output "`t`tMetric Alert Rule Criteria is Created`n"

    #Creation of Alert Rule
    Write-Output "`t`tCreating Metric Alert Rule :- $($Metric_Alert_Name[$i])"
    $null = Add-AzMetricAlertRuleV2 `
        -Name              $Metric_Alert_Name[$i] `
        -ResourceGroupName $RG_Name `
        -WindowSize        $Metric_Alert_Window_Size[$i] `
        -Frequency         $Metric_Alert_Frequency[$i] `
        -TargetResourceId  $TargetResource `
        -Condition         $Criteria `
        -ActionGroup       $Action `
        -Severity          $Metric_Alert_Severity[$i] `
        -Description       $Metric_Alert_Description[$i] `
        -WarningAction     SilentlyContinue
    Write-Output "`t`tMetric Alert Rule is Created`n"
}


#Update Storage Network Rules
for ($i = 0; $i -lt $Storage_Name.Count; $i++) {
    Write-Output "`t`tUpdating Storage Account Network Rule"
    $null = Update-AzStorageAccountNetworkRuleSet `
        -ResourceGroupName $RG_Name `
        -Name              $Storage_Name[$i] `
        -Bypass            $Storage_Network_Bypass[$i] `
        -DefaultAction     $Storage_Network_Action[$i]

    Write-Output "`t`tStorage Account Network Rule is updated`n"
}

#Create Synapse Firewall
for ($i = 0; $i -lt $Synapse_Firewall_Name.Count; $i++) {
    
    Write-Output "`t`tCreating Synapse Firewall :- $($Synapse_Firewall_Name[$i])"
    $null = New-AzSynapseFirewallRule `
        -ResourceGroupName $RG_Name `
        -WorkspaceName     $Synapse_Firewall_WS_Name[$i] `
        -Name              $Synapse_Firewall_Name[$i] `
        -StartIpAddress    $Synapse_Firewall_Starting_IP[$i] `
        -EndIpAddress      $Synapse_Firewall_Ending_IP[$i]

    Write-Output "`t`tSynapse Firewall is Created :- $($Synapse_Firewall_Name[$i])`n"
}

for ($i = 0; $i -lt $Private_DNS_Name.Count; $i++) {
    
    #Create Private DNS Zone
    Write-Output "`t`tCreating Private DNS Zone :- $($Private_DNS_Name[$i])"
    $null = New-AzPrivateDnsZone `
        -ResourceGroupName $RG_Name `
        -Name              $Private_DNS_Name[$i] `
        -Tag               $Private_DNS_Tags

    Write-Output "`t`tPrivate DNS Zone is Created :- $($Private_DNS_Name[$i])`n"

    #Get Virtual Network
    $VNet = Get-AzVirtualNetwork -Name $DNS_Vnet_Name[$i] -ResourceGroupName $RG_Name

    #Create Private DNS and Virtual Network Link
    Write-Output "`t`tCreating Private DNS and Virtual Network Link"
    $null = New-AzPrivateDnsVirtualNetworkLink `
        -ResourceGroupName $RG_Name `
        -ZoneName          $Private_DNS_Name[$i] `
        -Name              $Private_DNS_Vnet_Name[$i] `
        -VirtualNetworkId  $VNet.Id `
        -Tag               $Private_DNS_Vnet_Tags

    Write-Output "`t`tPrivate DNS and Virtual Network Link`n"
}


for ($i = 0; $i -lt $PE_Name.Count; $i++) {

    #Get Virtual Network
    $VNet = Get-AzVirtualNetwork -Name $PE_Vnet_Name[$i] -ResourceGroupName $RG_Name

    #Get Subnet
    $Subnet = Get-AzVirtualNetworkSubnetConfig -Name $PE_Subnet_Name[$i] -VirtualNetwork $VNet

    if (($PE_Service_Type[$i] -eq 'ADLS') -or ($PE_Service_Type[$i] -eq 'Storage')){
        $Private_Link_Service = (Get-AzStorageAccount -ResourceGroupName $RG_Name -Name $PE_Service_Name[$i]).Id
    }
    elseif ($PE_Service_Type[$i] -eq 'Synapse') {
        $Private_Link_Service = (Get-AzSynapseWorkspace -ResourceGroupName $RG_Name -Name $PE_Service_Name[$i]).Id
    }
    elseif ($PE_Service_Type[$i] -eq 'Vault') {
        $Private_Link_Service = (Get-AzKeyVault -VaultName $PE_Service_Name[$i] -ResourceGroupName $RG_Name).ResourceId
    }

    #Create Private Endpoint Service Connection
    Write-Output "`t`tCreating Private Endpoint Service Connection :- $($PE_Service_Connection_Name[$i])"
    $PEConnection = New-AzPrivateLinkServiceConnection `
        -Name                 $PE_Service_Connection_Name[$i] `
        -PrivateLinkServiceId $Private_Link_Service `
        -GroupId              $PE_Subresource_Name[$i]
    
    Write-Output "`t`tPrivate Endpoint Service Connection is Created :- $($PE_Service_Connection_Name[$i])`n"

    #Create Private Endpoint
    Write-Output "`t`tCreating Private Endpoint :- $($PE_Name[$i])"
    $null = New-AzPrivateEndpoint `
        -Name                         $PE_Name[$i] `
        -ResourceGroupName            $RG_Name `
        -Location                     $RG_Location `
        -Subnet                       $Subnet `
        -PrivateLinkServiceConnection $PEConnection `
        -Tag                          $PE_Tags

    Write-Output "`t`tPrivate Endpoint is Created :- $($PE_Name[$i])`n"

    #Get Private DNS Zone
    $DNSZone = Get-AzPrivateDnsZone -ResourceGroupName $RG_Name -Name $PE_DNS_Name[$i]

    #Create Private DNS Zone Config
    Write-Output "`t`tConfigure Private DNS Zone"
    $ZoneConfig = New-AzPrivateDnsZoneConfig `
        -Name             $Private_DNS_Zone_Config_Name[$i] `
        -PrivateDnsZoneId $DNSZone.ResourceId

    Write-Output "`t`tPrivate DNS Zone is Configured`n"

    #Create Private DNS Zone Group
    Write-Output "`t`tCreating Private DNS Zone Group"
    $null = New-AzPrivateDnsZoneGroup `
        -ResourceGroupName    $RG_Name `
        -PrivateEndpointName  $PE_Name[$i] `
        -Name                 $Private_DNS_Zone_Group_Name[$i] `
        -PrivateDnsZoneConfig $ZoneConfig
    
    Write-Output "`t`tPrivate DNS Zone Group is created`n"
}