[CmdletBinding()]
param (
    [Parameter()][array]
    $Primary_RG_Name,
    [Parameter()][array]
    $Primary_RG_Location,
    [Parameter()][hashtable]
    $Primary_RG_Tags, 
    [Parameter()][array]
    $Primary_Vnet_Name,
    [Parameter()][array]
    $Primary_Vnet_Address,
    [Parameter()][hashtable]
    $Primary_Vnet_Tags,
    [Parameter()][array]
    $Public_IP_Allocation,
    [Parameter()][array]
    $Public_IP_Name,
    [Parameter()][array]
    $Public_IP_SKU,
    [Parameter()][hashtable]
    $Public_IP_Tags,
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
    $Primary_Subnet_Name,
    [Parameter()][array]
    $Primary_Subnet_Address,
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
    $Primary_Storage_Name,
    [Parameter()][array]
    $Primary_Storage_SKU_Name,
    [Parameter()][array]
    $Primary_Storage_Kind,
    [Parameter()][array]
    $Primary_Storage_Access_Tier,
    [Parameter()][array]
    $Primary_Storage_Https_Traffic,
    [Parameter()][array]
    $Primary_Storage_Enable_HNS,
    [Parameter()][array]
    $Primary_Storage_Blob_Access,
    [Parameter()][array]
    $Primary_Storage_TLS_Version,
    [Parameter()][hashtable]
    $Primary_Storage_Tags,
    [Parameter()][array]
    $Recovery_RG_Name,
    [Parameter()][array]
    $Recovery_RG_Location,
    [Parameter()][hashtable]
    $Recovery_RG_Tags,
    [Parameter()][array]
    $Recovery_Vnet_Name,
    [Parameter()][array]
    $Recovery_Vnet_Address,
    [Parameter()][hashtable]
    $Recovery_Vnet_Tags,
    [Parameter()][array]
    $Recovery_Subnet_Name,
    [Parameter()][array]
    $Recovery_Subnet_Address,
    [Parameter()][array]
    $RSV_Name,
    [Parameter()][hashtable]
    $RSV_Tags,
    [Parameter()][array]
    $Primary_ASR_Name,
    [Parameter()][array]
    $Recovery_ASR_Name,
    [Parameter()][array]
    $Primary_ASR_Container_Name,
    [Parameter()][array]
    $Recovery_ASR_Container_Name,
    [Parameter()][array]
    $Replication_Policy_Name,
    [Parameter()][array]
    $Replication_Policy_Recovery_Duration,
    [Parameter()][array]
    $Replication_Policy_Snapshot_Frequency,
    [Parameter()][array]
    $Primary_Container_Mapping_Name,
    [Parameter()][array]
    $Recovery_Container_Mapping_Name,
    [Parameter()][array]
    $Primary_Network_Mapping_Name,
    [Parameter()][array]
    $Recovery_Network_Mapping_Name,
    [Parameter()][array]
    $Recovery_Replica_Disk_Type,
    [Parameter()][array]
    $Recovery_Target_Disk_Type,
    [Parameter()][array]
    $Replicated_Item_Name,
    [Parameter()][array]
    $Recovery_VM_Name
)

$Primary_RG_Name     = @('Primary-RG')
$Primary_RG_Location = @('EastUS')
$Primary_RG_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "RG"
}

$Primary_Vnet_RG_Name     = @('Primary-RG')
$Primary_Vnet_RG_Location = @('EastUS')
$Primary_Vnet_Name        = @('Vnet-1')
$Primary_Vnet_Address     = @('10.0.0.0/16')
$Primary_Vnet_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "VNet"
}

$IP_RG_Name           = @('Primary-RG', 'Primary-RG')
$IP_RG_Location       = @('EastUS', 'EastUS')
$Public_IP_Allocation = @('Static', 'Static')
$Public_IP_Name       = @('IP-1', 'IP-2')
$Public_IP_SKU        = @('Standard', 'Standard')
$Public_IP_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "Public-IP"
}

$NSG_RG_Name     = @('Primary-RG')
$NSG_RG_Location = @('EastUS')
$NSG_Name        = @('NSG-1')
$NSG_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "NSG"
}

$NSG_Rule_Name                       = @('NSG-rule-1')
$NSG_Rule_Description                = @('Allow all port for testing')
$NSG_Rule_Protocol                   = @('*')
$NSG_Rule_Source_Port_Range          = @('*')
$NSG_Rule_Destination_Port_Range     = @('*')
$NSG_Rule_Source_Address_Prefix      = @('*')
$NSG_Rule_Destination_Address_Prefix = @('*')
$NSG_Rule_Access                     = @('Allow')
$NSG_Rule_Priority                   = @(100)
$NSG_Rule_Direction                  = @('Inbound')

$Primary_Subnet_RG_Name     = @('Primary-RG')
$Primary_Vnet_Subnet_Name   = @('Vnet-1')
$Primary_Subnet_Name        = @('Subnet-1')
$Primary_Subnet_Address     = @('10.0.0.0/24')

$NIC_RG_Name             = @('Primary-RG', 'Primary-RG')
$NIC_RG_Location         = @('EastUS', 'EastUS')
$Primary_Vnet_NIC_Name   = @('Vnet-1', 'Vnet-1')
$Primary_Subnet_NIC_Name = @('Subnet-1', 'Subnet-1')
$NIC_Name                = @('NIC-1', 'NIC-2')
$NIC_IP_Cfg_Name         = @('NIC-IP-Cfg-1', 'NIC-IP-Cfg-2')
$NIC_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "NIC"
}

$VM_RG_Name      = @('Primary-RG', 'Primary-RG')
$VM_RG_Location  = @('EastUS', 'EastUS')
$VM_Username     = @('John', 'John')
$VM_Password     = @('Password_12345', 'Password_12345')
$Windows_VM_Name = @('Windows-VM-1', 'Windows-VM-2')
$Windows_VM_Size = @('Standard_B2s', 'Standard_B2s')
$Windows_VM_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "VM"
}

$Windows_VM_Image_Publisher_Name    = @('MicrosoftWindowsServer', 'MicrosoftWindowsServer')
$Windows_VM_Image_Offer             = @('WindowsServer', 'WindowsServer')
$Windows_VM_Image_SKU               = @('2019-DataCenter', '2019-DataCenter')
$Windows_VM_Image_Version           = @('latest', 'latest')
$Windows_VM_OS_Disk_Name            = @('os-disk-1', 'os-disk-2')
$Windows_VM_OS_Disk_Caching         = @('ReadWrite', 'ReadWrite')
$Windows_VM_OS_Disk_Creation_Option = @('FromImage', 'FromImage')
$Windows_VM_OS_Disk_Size            = @(127, 127)
$Windows_VM_OS_Storage_Type         = @('Standard_LRS', 'Standard_LRS')

$Storage_RG_Name               = @('Primary-RG')
$Storage_RG_Location           = @('EastUS')
$Primary_Storage_Name          = @('cachestorage76321')
$Primary_Storage_SKU_Name      = @('Standard_LRS')
$Primary_Storage_Kind          = @('StorageV2')
$Primary_Storage_Access_Tier   = @('Hot')
$Primary_Storage_Https_Traffic = @($True)
$Primary_Storage_Enable_HNS    = @($False)
$Primary_Storage_Blob_Access   = @($True)
$Primary_Storage_TLS_Version   = @('TLS1_2')
$Primary_Storage_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "Storage Account"
}

$Recovery_RG_Name     = @('Recovery-RG')
$Recovery_RG_Location = @('WestUS')
$Recovery_RG_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "RG"
}

$Recovery_Vnet_RG_Name     = @('Recovery-RG')
$Recovery_Vnet_RG_Location = @('WestUS')
$Recovery_Vnet_Name        = @('Recovery-Vnet')
$Recovery_Vnet_Address     = @('10.0.0.0/16')
$Recovery_Vnet_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "RG"
}

$Recovery_Subnet_RG_Name     = @('Recovery-RG')
$Recovery_Subnet_Name        = @('Recovery-Subnet')
$Recovery_Subnet_Address     = @('10.0.0.0/24')

$RSV_RG_Name     = @('Recovery-RG')
$RSV_RG_Location = @('WestUS')
$RSV_Name                  = @('Vault-1')
$RSV_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "Recovery Service Vault"
}

$Primary_ASR_Name                      = @('primary-asr')
$Recovery_ASR_Name                     = @('recovery-asr')
$Primary_ASR_Container_Name            = @('primary-asr-container')
$Recovery_ASR_Container_Name           = @('recovery-asr-container')
$Replication_Policy_Name               = @('A2APolicy')
$Replication_Policy_Recovery_Duration  = @(24)
$Replication_Policy_Snapshot_Frequency = @(4)
$Primary_Container_Mapping_Name        = @('A2APrimaryToRecovery')
$Recovery_Container_Mapping_Name       = @('A2ARecoveryToPrimary')
$Primary_Network_Mapping_Name          = @('primary-recovery-network')
$Recovery_Network_Mapping_Name         = @('recovery-primary-network')
$Recovery_Replica_Disk_Type            = @('Standard_LRS', 'Standard_LRS')
$Recovery_Target_Disk_Type             = @('Standard_LRS', 'Standard_LRS')
$Replicated_Item_Name                  = @('replicateditem-1', 'replicateditem-2')
$Recovery_VM_Name                      = @('recovery-vm-1', 'recovery-vm-1')

$Replicated_Item_Primary_RG_Name           = @('Primary-RG', 'Primary-RG')
$Replicated_Item_Recovery_RG_Name          = @('Recovery-RG', 'Recovery-RG')
$Replicated_Item_Recovery_RG_Location      = @('WestUS', 'WestUS')
$Replicated_Storage_Name                   = @('cachestorage76321', 'cachestorage76321')
$Replicated_Recovery_Vnet_Name             = @('Recovery-Vnet', 'Recovery-Vnet')
$Replicated_Primary_ASR_Name               = @('primary-asr', 'primary-asr')
$Replicated_Primary_ASR_Container_Name     = @('primary-asr-container', 'primary-asr-container')
$Replicated_Primary_Container_Mapping_Name = @('A2APrimaryToRecovery', 'A2APrimaryToRecovery')
$Replicated_Recovery_Subnet_Name           = @('Recovery-Subnet', 'Recovery-Subnet')
$Replicated_RSV_Name                       = @('Vault-1', 'Vault-1')


#Creation of Primary Resource Group
for ($i = 0; $i -lt $Primary_RG_Name.Count; $i++) {
    Write-Output "`t`tPrimary Resource Group is Creating"
    $null = New-AzResourceGroup `
        -Name     $Primary_RG_Name[$i] `
        -Location $Primary_RG_Location[$i] `
        -Tag      $Primary_RG_Tags
    Write-Output "`t`tPrimary Resource Group is Created`n"
}


#Creation of Primary Virtual Network
for ($i = 0; $i -lt $Primary_Vnet_Name.Count; $i++) {
    Write-Output "`t`tCreation of Primary Vitual Network- $($Primary_Vnet_Name[$i]) is going-on"
    $null = New-AzVirtualNetwork `
        -Name              $Primary_Vnet_Name[$i] `
        -ResourceGroupName $Primary_Vnet_RG_Name[$i] `
        -Location          $Primary_Vnet_RG_Location[$i] `
        -AddressPrefix     $Primary_Vnet_Address[$i] `
        -Tag               $Primary_Vnet_Tags
    Write-Output "`t`tPrimary Virutal Network- $($Primary_Vnet_Name[$i]) Created`n"
}


#Creation of Public IP
for ($i = 0; $i -lt $Public_IP_Name.Count; $i++) {
    Write-Output "`t`tCreation of Public IP - $($Public_IP_Name[$i]) is going-on"
    $null = New-AzPublicIpAddress `
        -ResourceGroupName $IP_RG_Name[$i] `
        -AllocationMethod  $Public_IP_Allocation[$i] `
        -Name              $Public_IP_Name[$i] `
        -Location          $IP_RG_Location[$i] `
        -Sku               $Public_IP_SKU[$i] `
        -Tag               $Public_IP_Tags
    Write-Output "`t`tPublic IP - $($Public_IP_Name[$i]) Created`n"
}


#Creation of Network Security Group
for ($i = 0; $i -lt $NSG_Name.Count; $i++) {
    Write-Output "`t`tCreation of Network Security Group - $($NSG_Name[$i]) is going-on"
    $null = New-AzNetworkSecurityGroup `
        -Name              $NSG_Name[$i] `
        -ResourceGroupName $NSG_RG_Name[$i] `
        -Location          $NSG_RG_Location[$i] `
        -Tag               $NSG_Tags
    Write-Output "`t`tNetwork Security Group- $($NSG_Name[$i]) Created`n"
}


#Creation of Network Security Rules and Associated with NSG
for ($i = 0; $i -lt $NSG_Rule_Name.Count; $i++) {
    #Retrieve Information about NSG
    $NSG = Get-AzNetworkSecurityGroup -Name $NSG_Name[$i] -ResourceGroupName $NSG_RG_Name[$i]
    Write-Output "`t`tCreation of Network Security Rules- $($NSG_Rule_Name[$i]) in $($NSG_Name[$i]) is going-on"
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
    Write-Output "`t`tNetwork Security Rules- $($NSG_Rule_Name[$i]) in $($NSG_Name[$i]) is Created`n"
}


#Creation of Primary Subnet
for ($i = 0; $i -lt $Primary_Subnet_Name.Count; $i++) {
    #Retrieve Information about Virtual Network
    $Vnet = Get-AzVirtualNetwork -Name $Primary_Vnet_Subnet_Name[$i] -ResourceGroupName $Primary_Subnet_RG_Name[$i]
    #Retrieve Information about NSG
    $NSG = Get-AzNetworkSecurityGroup -Name $NSG_Name[$i] -ResourceGroupName $Primary_Subnet_RG_Name[$i]
    Write-Output "`t`tCreation of Primary Subnet-$($Primary_Subnet_Name[$i]) in $($Primary_Vnet_Subnet_Name[$i]) is going-on"
    $null = Add-AzVirtualNetworkSubnetConfig `
        -Name           $Primary_Subnet_Name[$i] `
        -VirtualNetwork $Vnet `
        -AddressPrefix  $Primary_Subnet_Address[$i] `
        -NetworkSecurityGroup $NSG | Set-AzVirtualNetwork
    Write-Output "`t`tPrimary Subnet- $($Primary_Subnet_Name[$i]) Created`n"
}


#Creation of Network Interface Card
for ($i = 0; $i -lt $NIC_Name.Count; $i++) {
    #Retrieve Information about Virtual Network
    $Vnet = Get-AzVirtualNetwork -Name $Primary_Vnet_NIC_Name[$i] -ResourceGroupName $NIC_RG_Name[$i]
    #Retrieve Information about Subnet
    $Subnet = Get-AzVirtualNetworkSubnetConfig -Name $Primary_Subnet_NIC_Name[$i] -VirtualNetwork $Vnet
    #Retrieve Information about Public IP Address
    $IP = Get-AzPublicIpAddress -Name $Public_IP_Name[$i] -ResourceGroupName $NIC_RG_Name[$i]
    Write-Output "`t`tCreation of Network Interface Card is going-on"
    $null = New-AzNetworkInterface `
        -Name                $NIC_Name[$i] `
        -ResourceGroupName   $NIC_RG_Name[$i] `
        -Location            $NIC_RG_Location[$i] `
        -Subnet              $Subnet `
        -PublicIpAddress     $IP `
        -IpConfigurationName $NIC_IP_Cfg_Name[$i] `
        -Tag                 $NIC_Tags
    Write-Output "`t`tNetwork Interface Card is Created`n"
}


#Creation of Windows Virtual Machine
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
    $NIC = Get-AzNetworkInterface -Name $NIC_Name[$i] -ResourceGroupName $VM_RG_Name[$i]
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
    #Disbale Virtual Machine boot diagonistic
    $VM = Set-AzVMBootDiagnostic `
        -VM $VM `
        -Disable
    #Creates a Virtual Machine
    Write-Output "`t`tCreation of Virtual Machine- $($Windows_VM_Name[$i]) is going-on"
    $null = New-AzVM `
        -ResourceGroupName $VM_RG_Name[$i] `
        -Location          $VM_RG_Location[$i] `
        -VM                $VM
    Write-Output "`t`tCreation of Virutal Machine- $($Windows_VM_Name[$i]) Completed`n"
}


#Creation of Storage Account
for ($i = 0; $i -lt $Primary_Storage_Name.Count; $i++) {
    Write-Output "`t`tCache Storage Account in Primary Resource Group in which VM is located is Creating" 
    $PrimaryStorage = New-AzStorageAccount `
        -ResourceGroupName           $Storage_RG_Name[$i] `
        -Name                        $Primary_Storage_Name[$i] `
        -SkuName                     $Primary_Storage_SKU_Name[$i] `
        -Location                    $Storage_RG_Location[$i] `
        -Kind                        $Primary_Storage_Kind[$i] `
        -AccessTier                  $Primary_Storage_Access_Tier[$i] `
        -EnableHttpsTrafficOnly      $Primary_Storage_Https_Traffic[$i] `
        -EnableHierarchicalNamespace $Primary_Storage_Enable_HNS[$i] `
        -AllowBlobPublicAccess       $Primary_Storage_Blob_Access[$i] `
        -MinimumTlsVersion           $Primary_Storage_TLS_Version[$i] `
        -Tag                         $Primary_Storage_Tags

    Write-Output "`t`tCache Storage Account in Primary Resource Group is Created`n"
}

#Creation of Recovery Resource Group
for ($i = 0; $i -lt $Recovery_RG_Name.Count; $i++) {
    Write-Output "`t`tRecovery Resource Group is Creating"
    $null = New-AzResourceGroup `
        -Name     $Recovery_RG_Name[$i] `
        -Location $Recovery_RG_Location[$i] `
        -Tag      $Recovery_RG_Tags
    Write-Output "`t`tRecovery Resource Group is Created`n"
}


#Creation of Recovery Virtual Network
for ($i = 0; $i -lt $Recovery_Vnet_Name.Count; $i++) {
    Write-Output "`t`tRecovery Virtual Network is Creating"
    $null = New-AzVirtualNetwork `
        -Name              $Recovery_Vnet_Name[$i] `
        -ResourceGroupName $Recovery_Vnet_RG_Name[$i] `
        -Location          $Recovery_Vnet_RG_Location[$i] `
        -AddressPrefix     $Recovery_Vnet_Address[$i] `
        -Tag               $Recovery_Vnet_Tags
    Write-Output "`t`tRecovery Virtual Network is Created`n"
}

#Creation of Recovery Subnet
for ($i = 0; $i -lt $Recovery_Subnet_Name.Count; $i++) {
    #Get Recovery Virtual Network
    $RecoveryVnet = Get-AzVirtualNetwork -Name $Recovery_Vnet_Name[$i] -ResourceGroupName $Recovery_Subnet_RG_Name[$i]
    Write-Output "`t`tRecovery Subnet is Creating"
    $null = Add-AzVirtualNetworkSubnetConfig `
        -Name           $Recovery_Subnet_Name[$i] `
        -VirtualNetwork $RecoveryVnet `
        -AddressPrefix  $Recovery_Subnet_Address[$i] | Set-AzVirtualNetwork
    Write-Output "`t`tRecovery Subnet is Created`n"
}

for ($i = 0; $i -lt $RSV_Name.Count; $i++) {
    #Creation of Recovery Service Vault
    Write-Output "`t`tRecovery Service Vault is Creating"
    $Vault = New-AzRecoveryServicesVault `
        -Name              $RSV_Name[$i] `
        -ResourceGroupName $RSV_RG_Name[$i] `
        -Location          $RSV_RG_Location[$i] `
        -Tag               $RSV_Tags
    Write-Output "`t`tRecovery Service Vault is Created`n"

    #Setting the Vault Context
    Set-AzRecoveryServicesAsrVaultContext -Vault $Vault
    
    
    #Creation of Site Recovery Fabric Object to represent the Primary region
    Write-Output "`t`tPrimary ASR Fabric is Creating"
    $ASRJob = New-AzRecoveryServicesAsrFabric `
        -Azure `
        -Name     $Primary_ASR_Name[$i] `
        -Location $Primary_RG_Location[$i]

    #Track Job Status to check for Completion
    while (($ASRJob.State -eq 'InProgress') -or ($ASRJob.State -eq 'NotStarted')) {
        Start-Sleep 10;
        $ASRJob = Get-AzRecoveryServicesAsrJob -Job $ASRJob
    }

    Write-Output "`t`tPrimary ASR Fabric is Created`n"
    $PrimaryFabric = Get-AzRecoveryServicesAsrFabric -Name $Primary_ASR_Name[$i]


    #Creation of Site Recovery Fabric Object to represent the Recovery region
    Write-Output "`t`tRecovery ASR Fabric is Creating"
    $ASRJob = New-AzRecoveryServicesAsrFabric `
        -Azure `
        -Name     $Recovery_ASR_Name[$i] `
        -Location $Recovery_RG_Location[$i]
    
    #Track Job Status to check for Completion
    while (($ASRJob.State -eq 'InProgress') -or ($ASRJob.State -eq 'NotStarted')) {
        Start-Sleep 10;
        $ASRJob = Get-AzRecoveryServicesAsrJob -Job $ASRJob
    }

    Write-Output "`t`tRecovery ASR Fabric is Created`n"
    $RecoveryFabric = Get-AzRecoveryServicesAsrFabric -Name $Recovery_ASR_Name[$i]


    #Creation of Site Recovery Protection Container in Primary Region
    Write-Output "`t`tPrimary ASR Container is Creating"
    $ASRJob = New-AzRecoveryServicesAsrProtectionContainer `
        -Name        $Primary_ASR_Container_Name[$i] `
        -InputObject $PrimaryFabric

    #Track Job Status to check for Completion    
    while (($ASRJob.State -eq 'InProgress') -or ($ASRJob.State -eq 'NotStarted')) {
        Start-Sleep 10;
        $ASRJob = Get-AzRecoveryServicesAsrJob -Job $ASRJob
    }

    Write-Output "`t`tPrimary ASR Container is Created`n"
    $PrimaryProtectionContainer = Get-AzRecoveryServicesAsrProtectionContainer -Fabric $PrimaryFabric -Name $Primary_ASR_Container_Name[$i]


    #Creation of Site Recovery Protection Container in Recovery Region
    Write-Output "`t`tRecovery ASR Container is Creating"
    $ASRJob = New-AzRecoveryServicesAsrProtectionContainer `
        -Name        $Recovery_ASR_Container_Name[$i] `
        -InputObject $RecoveryFabric

    #Track Job Status to check for Completion
    while (($ASRJob.State -eq 'InProgress') -or ($ASRJob.State -eq 'NotStarted')) {
        Start-Sleep 10;
        $ASRJob = Get-AzRecoveryServicesAsrJob -Job $ASRJob
    }

    Write-Output "`t`tRecovery ASR Container is Created`n"
    $RecoveryProtectionContainer = Get-AzRecoveryServicesAsrProtectionContainer -Fabric $RecoveryFabric -Name $Recovery_ASR_Container_Name[$i]


    #Creation of Replication Policy
    Write-Output "`t`tRecovery Service Replication Policy is Creating"
    $ASRJob = New-AzRecoveryServicesAsrPolicy `
        -AzureToAzure `
        -Name                                          $Replication_Policy_Name[$i] `
        -RecoveryPointRetentionInHours                 $Replication_Policy_Recovery_Duration[$i] `
        -ApplicationConsistentSnapshotFrequencyInHours $Replication_Policy_Snapshot_Frequency[$i]

    #Track Job Status to check for Completion
    while (($ASRJob.State -eq 'InProgress') -or ($ASRJob.State -eq 'NotStarted')) {
        Start-Sleep 10;
        $ASRJob = Get-AzRecoveryServicesAsrJob -Job $ASRJob
    }

    Write-Output "`t`tRecovery Service Replication Policy is Created`n"
    $ReplicationPolicy = Get-AzRecoveryServicesAsrPolicy -Name $Replication_Policy_Name[$i]


    #Creation of Protection Container Mapping between Primary and Recovery Protection Container 
    Write-Output "`t`tPrimary to Recovery Protection Container Mapping is Creating"
    $ASRJob = New-AzRecoveryServicesAsrProtectionContainerMapping `
        -Name                        $Primary_Container_Mapping_Name[$i] `
        -Policy                      $ReplicationPolicy `
        -PrimaryProtectionContainer  $PrimaryProtectionContainer `
        -RecoveryProtectionContainer $RecoveryProtectionContainer

    #Track Job Status to check for Completion
    while (($ASRJob.State -eq 'InProgress') -or ($ASRJob.State -eq 'NotStarted')) {
        Start-Sleep 10;
        $ASRJob = Get-AzRecoveryServicesAsrJob -Job $ASRJob
    }

    Write-Output "`t`tPrimary to Recovery Protection Container Mapping is Created`n"
    $PriToRecPCMapping = Get-AzRecoveryServicesAsrProtectionContainerMapping -Name $Primary_Container_Mapping_Name[$i] -ProtectionContainer $PrimaryProtectionContainer    


    #Creation of Protection Container Mapping for Reverse Replication after a failover
    Write-Output "`t`tRecovery to Primary Protection Container Mapping is Creating"
    $ASRJob = New-AzRecoveryServicesAsrProtectionContainerMapping `
        -Name                         $Recovery_Container_Mapping_Name[$i] `
        -Policy                       $ReplicationPolicy `
        -PrimaryProtectionContainer   $RecoveryProtectionContainer `
        -RecoveryProtectionContainer  $PrimaryProtectionContainer

    #Track Job Status to check for Completion
    while (($ASRJob.State -eq 'InProgress') -or ($ASRJob.State -eq 'NotStarted')) {
        Start-Sleep 10;
        $ASRJob = Get-AzRecoveryServicesAsrJob -Job $ASRJob
    }
    Write-Output "`t`tRecovery to Primary Protection Container Mapping is Created`n"


    #Get Recovery Virtual Network
    $RecoveryVnet = Get-AzVirtualNetwork -Name $Recovery_Vnet_Name[$i] -ResourceGroupName $Recovery_RG_Name[$i]

    #Get Primary Virtual Network
    $PrimaryVnet  = Get-AzVirtualNetwork -Name $Primary_Vnet_Name[$i] -ResourceGroupName $Primary_RG_Name[$i]



    #Creation of Network Mapping between Primary Virtual Network and Recovery Virtual Network
    Write-Output "`t`tCreation of Primary to Recovery Network Mapping"
    $ASRJob = New-AzRecoveryServicesAsrNetworkMapping `
        -AzureToAzure `
        -Name                   $Primary_Network_Mapping_Name[$i] `
        -PrimaryFabric          $PrimaryFabric `
        -PrimaryAzureNetworkId  $PrimaryVnet.Id `
        -RecoveryFabric         $RecoveryFabric `
        -RecoveryAzureNetworkId $RecoveryVnet.Id

    #Track Job Status to check for Completion
    while (($ASRJob.State -eq 'InProgress') -or ($ASRJob.State -eq 'NotStarted')) {
        Start-Sleep 10;
        $ASRJob = Get-AzRecoveryServicesAsrJob -Job $ASRJob
    }
    Write-Output "`t`tPrimary to Recovery Network Mapping is Created`n"


    #Creation of Network Mapping for the failback
    Write-Output "`t`tCreation of Recovery to Primary Network Mapping"
    $ASRJob = New-AzRecoveryServicesAsrNetworkMapping `
        -AzureToAzure `
        -Name                   $Recovery_Network_Mapping_Name[$i] `
        -PrimaryFabric          $RecoveryFabric `
        -PrimaryAzureNetworkId  $RecoveryVnet.Id `
        -RecoveryFabric         $PrimaryFabric `
        -RecoveryAzureNetworkId $PrimaryVnet.Id

    #Track Job Status to check for Completion
    while (($ASRJob.State -eq 'InProgress') -or ($ASRJob.State -eq 'NotStarted')) {
        Start-Sleep 10;
        $ASRJob = Get-AzRecoveryServicesAsrJob -Job $ASRJob
    }
    Write-Output "`t`tRecovery to Primary Network Mapping is Created`n"
}


for ($i = 0; $i -lt $Replicated_Item_Name.Count; $i++) {

    #Get Primary Storage Account
    $PrimaryStorage = Get-AzStorageAccount -Name $Replicated_Storage_Name[$i] -ResourceGroupName $Replicated_Item_Primary_RG_Name[$i]
    
    #Get Recovery Resource Group
    $RecoveryRG = Get-AzResourceGroup -Name $Replicated_Item_Recovery_RG_Name[$i] -Location $Replicated_Item_Recovery_RG_Location[$i]

    #Get Recovery Virtual Network
    $RecoveryVnet = Get-AzVirtualNetwork -Name $Replicated_Recovery_Vnet_Name[$i] -ResourceGroupName $Replicated_Item_Recovery_RG_Name[$i]

    #Get Primary ASR
    $PrimaryFabric = Get-AzRecoveryServicesAsrFabric -Name $Replicated_Primary_ASR_Name[$i]
    
    #Get Primary Protection Container
    $PrimaryProtectionContainer = Get-AzRecoveryServicesAsrProtectionContainer -Fabric $PrimaryFabric -Name $Replicated_Primary_ASR_Container_Name[$i]
    
    #Get Primary to Recovery Protection Container Mapping
    $PriToRecPCMapping = Get-AzRecoveryServicesAsrProtectionContainerMapping -Name $Replicated_Primary_Container_Mapping_Name[$i] -ProtectionContainer $PrimaryProtectionContainer


    #Get Virtual Machine to be replicated
    $VM = Get-AzVM -ResourceGroupName $Replicated_Item_Primary_RG_Name[$i] -Name $Windows_VM_Name[$i]
    
    #Get OS Disk ID of Virtual Machine
    $OsDiskId = $VM.StorageProfile.OsDisk.ManagedDisk.Id

    #Specify the Replication Properties for the Disk to be replicated
    $OSDiskReplicationConfig = New-AzRecoveryServicesAsrAzureToAzureDiskReplicationConfig `
        -ManagedDisk `
        -LogStorageAccountId            $PrimaryStorage.Id `
        -DiskId                         $OsDiskId `
        -RecoveryResourceGroupId        $RecoveryRG.ResourceId `
        -RecoveryReplicaDiskAccountType $Recovery_Replica_Disk_Type[$i] `
        -RecoveryTargetDiskAccountType  $Recovery_Target_Disk_Type[$i]
    
    #Creation of Replicated Item to Start the VM Replication
    Write-Output "`t`tReplicated Item- $($Replicated_Item_Name[$i]) is Creating"
    $ASRJob = New-AzRecoveryServicesAsrReplicationProtectedItem `
        -AzureToAzure `
        -AzureToAzureDiskReplicationConfiguration $OSDiskReplicationConfig `
        -AzureVmId                                $VM.Id `
        -Name                                     $Replicated_Item_Name[$i] `
        -RecoveryVmName                           $Recovery_VM_Name[$i] `
        -ProtectionContainerMapping               $PriToRecPCMapping `
        -RecoveryAzureNetworkId                   $RecoveryVnet.Id `
        -RecoveryAzureSubnetName                  $Replicated_Recovery_Subnet_Name[$i] `
        -RecoveryResourceGroupId                  $RecoveryRG.ResourceId

    while (($ASRJob.State -eq 'InProgress') -or ($ASRJob.State -eq 'NotStarted')) {
        Start-Sleep 10;
        $ASRJob = Get-AzRecoveryServicesAsrJob -Job $ASRJob
    }
    Write-Output "`t`tReplicated Item- $($Replicated_Item_Name[$i]) is Created`n"
}

for ($i = 0; $i -lt $RSV_Name.Count; $i++) {

    #Get Primary ASR
    Write-Output "`t`tGetting Primary ASR Fabric Information`n"
    $PrimaryFabric = Get-AzRecoveryServicesAsrFabric -Name $Primary_ASR_Name[$i]
        
    #Get Primary Protection Container
    Write-Output "`t`tGetting Primary Protection Container Information`n"
    $PrimaryProtectionContainer = Get-AzRecoveryServicesAsrProtectionContainer -Fabric $PrimaryFabric -Name $Primary_ASR_Container_Name[$i]
        
    #Get Replicated Item
    Write-Output "`t`tGetting Replicated Item`n"
    $ReplicationProtectedItem = Get-AzRecoveryServicesAsrReplicationProtectedItem -ProtectionContainer $PrimaryProtectionContainer | Select ProtectionState
    
    Start-Sleep 200;

    while ($ReplicationProtectedItem.ProtectionState -contains "UnprotectedStatesBegin")
    {
        $ReplicationProtectedItem = Get-AzRecoveryServicesAsrReplicationProtectedItem -ProtectionContainer $PrimaryProtectionContainer | Select ProtectionState;
        Write-Output "Keep Checking for Protected State"
        Start-Sleep 30;
    }
    
    Write-Output "Protection State of VMs are Completed"
}

for ($i = 0; $i -lt $Replicated_Item_Name.Count; $i++) {
    
    #Get Primary ASR
    Write-Output "`t`tGetting Primary ASR Fabric`n"
    $PrimaryFabric = Get-AzRecoveryServicesAsrFabric -Name $Replicated_Primary_ASR_Name[$i]
    
    #Get Primary Protection Container
    Write-Output "`t`tGetting Primary Protection Container`n"
    $PrimaryProtectionContainer = Get-AzRecoveryServicesAsrProtectionContainer -Fabric $PrimaryFabric -Name $Replicated_Primary_ASR_Container_Name[$i]

    #Get Recovery Virtual Network
    Write-Output "`t`tGetting Recovery Virtual Network`n"
    $RecoveryVnet = Get-AzVirtualNetwork -Name $Replicated_Recovery_Vnet_Name[$i] -ResourceGroupName $Replicated_Item_Recovery_RG_Name[$i]
    
    #Get Replicated Item
    Write-Output "`t`tGetting Replicated Item`n"
    $ReplicationProtectedItem = Get-AzRecoveryServicesAsrReplicationProtectedItem -FriendlyName $Windows_VM_Name[$i] -ProtectionContainer $PrimaryProtectionContainer


    #Start Test Failover
    Write-Output "Test FailOver Started"
    $FailoverJob = Start-AzRecoveryServicesAsrTestFailoverJob -ReplicationProtectedItem $ReplicationProtectedItem -AzureVMNetworkId $RecoveryVnet.Id -Direction PrimaryToRecovery

    do {
            $FailoverJob = Get-AzRecoveryServicesAsrJob -Job $FailoverJob;
            sleep 30;
    } while (($FailoverJob.State -eq "InProgress") -or ($FailoverJob.State -eq "NotStarted"))
    
    Write-Output "Test FailOver Done"


    #Start Test FailOver CleanUp
    Write-Output "Starting the Cleanup Test Failover Operation"
    $FailoverCleanupJob = Start-AzRecoveryServicesAsrTestFailoverCleanupJob -ReplicationProtectedItem $ReplicationProtectedItem

    do {
            $FailoverCleanupJob = Get-AzRecoveryServicesAsrJob -Job $FailoverCleanupJob;
            sleep 30;
    } while (($FailoverCleanupJob.State -eq "InProgress") -or ($FailoverCleanupJob.State -eq "NotStarted"))
    
    Write-Output "Cleanup Test Failover Opearation is Completed"


    #Get Specific Recovery Point for failover Virtual machine
    $RecoveryPoint = Get-AzRecoveryServicesAsrRecoveryPoint -ReplicationProtectedItem $ReplicationProtectedItem
    "{0} {1}" -f $RecoveryPoint[0].RecoveryPointType, $RecoveryPoint[-1].RecoveryPointTime


    #Starting FailOver Job
    Write-Output "Starting FailOver Job"
    $Job_Failover = Start-AzRecoveryServicesAsrUnplannedFailoverJob -ReplicationProtectedItem $ReplicationProtectedItem -Direction PrimaryToRecovery -RecoveryPoint $RecoveryPoint[-1]

    do {
            $Job_Failover = Get-AzRecoveryServicesAsrJob -Job $Job_Failover;
            sleep 30;
    } while (($Job_Failover.State -eq "InProgress") -or ($JobFailover.State -eq "NotStarted"))
    
    Write-Output "FailOver Job Completed"


    Write-Output "Commit FailOver Job"
    $CommitFailoverJOb = Start-AzRecoveryServicesAsrCommitFailoverJob -ReplicationProtectedItem $ReplicationProtectedItem

    do {
            $CommitFailoverJOb = Get-AzRecoveryServicesAsrJob -Job $CommitFailoverJOb;
            sleep 30;
    } while (($CommitFailoverJOb.State -eq "InProgress") -or ($CommitFailoverJOb.State -eq "NotStarted"))
    
    Write-Output "FailOver Job Completed"
}