[CmdletBinding()]
param (
    [Parameter()][String]
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
    $Subnet_Name,
    [Parameter()][array]
    $Subnet_Address,
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
    $Windows_VM_OS_Storage_Type
)

$RG_Name     = 'Aks-RG'
$RG_Location = 'EastUS'
$RG_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "RG"
}

$Vnet_Name    = @('Vnet-1')
$Vnet_Address = @('10.0.0.0/16')
$Vnet_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "RG"
}

$Public_IP_Allocation = @('Static', 'Static', 'Dynamic', 'Dynamic', 'Static')
$Public_IP_Name       = @('IP-1', 'IP-2', 'IP-3', 'IP-4', 'IP-5')
$Public_IP_SKU        = @('Standard', 'Standard', 'Basic', 'Basic', 'Standard')
$Public_IP_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "Public-IP"
}

$NSG_Name = @('NSG-1')
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

$Vnet_Subnet_Name = @('Vnet-1')
$Subnet_Name      = @('Subnet-1')
$Subnet_Address   = @('10.0.0.0/24')

$Vnet_NIC_Name   = @('Vnet-1', 'Vnet-1', 'Vnet-1', 'Vnet-1', 'Vnet-1')
$Subnet_NIC_Name = @('Subnet-1', 'Subnet-1', 'Subnet-1', 'Subnet-1', 'Subnet-1')
$NIC_Name        = @('NIC-1', 'NIC-2', 'NIC-3', 'NIC-4', 'NIC-5')
$NIC_IP_Cfg_Name = @('NIC-IP-Cfg-1', 'NIC-IP-Cfg-2', 'NIC-IP-Cfg-3', 'NIC-IP-Cfg-4', 'NIC-IP-Cfg-5')
$NIC_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "NIC"
}

$VM_Username     = @('John', 'John', 'John', 'John', 'John')
$VM_Password     = @('Password_12345', 'Password_12345', 'Password_12345', 'Password_12345', 'Password_12345')
$Windows_VM_Name = @('Windows-VM-1', 'Windows-VM-2', 'Windows-VM-3', 'Windows-VM-4', 'Windows-VM-5')
$Windows_VM_Size = @('Standard_B1s', 'Standard_B1s', 'Standard_B1s', 'Standard_B1s', 'Standard_B1s')
$Windows_VM_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "VM"
}
$Windows_VM_Image_Publisher_Name    = @('MicrosoftWindowsServer', 'MicrosoftWindowsServer', 'MicrosoftWindowsServer', 'MicrosoftWindowsServer', 'MicrosoftWindowsServer')
$Windows_VM_Image_Offer             = @('WindowsServer', 'WindowsServer', 'WindowsServer', 'WindowsServer', 'WindowsServer')
$Windows_VM_Image_SKU               = @('2019-DataCenter', '2019-DataCenter', '2019-DataCenter', '2019-DataCenter', '2019-DataCenter')
$Windows_VM_Image_Version           = @('latest', 'latest', 'latest', 'latest', 'latest')
$Windows_VM_OS_Disk_Name            = @('os-disk-1', 'os-disk-2', 'os-disk-3', 'os-disk-4', 'os-disk-5')
$Windows_VM_OS_Disk_Caching         = @('ReadWrite', 'ReadWrite', 'ReadWrite', 'ReadWrite', 'ReadWrite')
$Windows_VM_OS_Disk_Creation_Option = @('FromImage', 'FromImage', 'FromImage', 'FromImage', 'FromImage')
$Windows_VM_OS_Disk_Size            = @(127, 127, 127, 127, 127)
$Windows_VM_OS_Storage_Type         = @('Standard_LRS', 'Standard_LRS', 'Standard_LRS', 'Standard_LRS', 'Standard_LRS')

#Creation of Resource Group
Write-Output "`t`tCreation of Resource Group is going-on"
$null = New-AzResourceGroup `
    -Name     $RG_Name `
    -Location $RG_Location `
    -Tag      $RG_Tags
Write-Output "`t`tResource Group Created`n"

#Creation of Multiple Virtual Network
for ($i = 0; $i -lt $Vnet_Name.Count; $i++) {
    Write-Output "`t`tCreation of Vitual Network- $($Vnet_Name[$i]) in $($RG_Name) is going-on"
    $null = New-AzVirtualNetwork `
        -Name              $Vnet_Name[$i] `
        -ResourceGroupName $RG_Name `
        -Location          $RG_Location `
        -AddressPrefix     $Vnet_Address[$i] `
        -Tag               $Vnet_Tags
    Write-Output "`t`tVirutal Network- $($Vnet_Name[$i]) Created`n"
}

#Creation of Public IP
for ($i = 0; $i -lt $Public_IP_Name.Count; $i++) {
    Write-Output "`t`tCreation of Public IP - $($Public_IP_Name[$i]) is going-on"
    $null = New-AzPublicIpAddress `
        -ResourceGroupName $RG_Name `
        -AllocationMethod  $Public_IP_Allocation[$i] `
        -Name              $Public_IP_Name[$i] `
        -Location          $RG_Location `
        -Sku               $Public_IP_SKU[$i] `
        -Tag               $Public_IP_Tags
    Write-Output "`t`tPublic IP - $($Public_IP_Name[$i]) Created`n"
}

#Creation of Network Security Group
for ($i = 0; $i -lt $NSG_Name.Count; $i++) {
    Write-Output "`t`tCreation of Network Security Group - $($NSG_Name[$i]) is going-on"
    $null = New-AzNetworkSecurityGroup `
        -Name              $NSG_Name[$i] `
        -ResourceGroupName $RG_Name `
        -Location          $RG_Location `
        -Tag               $NSG_Tags
    Write-Output "`t`tNetwork Security Group- $($NSG_Name[$i]) Created`n"
}

#Creation of Network Security Rules and Associated with NSG
for ($i = 0; $i -lt $NSG_Rule_Name.Count; $i++) {
    #Retrieve Information about NSG
    $NSG = Get-AzNetworkSecurityGroup -Name $NSG_Name[$i] -ResourceGroupName $RG_Name
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

#Creation of Subnet
for ($i = 0; $i -lt $Subnet_Name.Count; $i++) {
    #Retrieve Information about Virtual Network
    $Vnet = Get-AzVirtualNetwork -Name $Vnet_Subnet_Name[$i] -ResourceGroupName $RG_Name
    #Retrieve Information about NSG
    $NSG = Get-AzNetworkSecurityGroup -Name $NSG_Name[$i] -ResourceGroupName $RG_Name
    Write-Output "`t`tCreation of Subnet-$($Subnet_Name[$i]) in $($Vnet_Subnet_Name[$i]) is going-on"
    $null = Add-AzVirtualNetworkSubnetConfig `
        -Name           $Subnet_Name[$i] `
        -VirtualNetwork $Vnet `
        -AddressPrefix  $Subnet_Address[$i] `
        -NetworkSecurityGroup $NSG | Set-AzVirtualNetwork
    Write-Output "`t`tSubnet- $($Subnet_Name[$i]) Created`n"
}

#Creation of Network Interface Card
for ($i = 0; $i -lt $NIC_Name.Count; $i++) {
    #Retrieve Information about Virtual Network
    $Vnet = Get-AzVirtualNetwork -Name $Vnet_NIC_Name[$i] -ResourceGroupName $RG_Name
    #Retrieve Information about Subnet
    $Subnet = Get-AzVirtualNetworkSubnetConfig -Name $Subnet_NIC_Name[$i] -VirtualNetwork $Vnet
    #Retrieve Information about Public IP Address
    $IP = Get-AzPublicIpAddress -Name $Public_IP_Name[$i] -ResourceGroupName $RG_Name
    Write-Output "`t`tCreation of Network Interface Card is going-on"
    $null = New-AzNetworkInterface `
        -Name                $NIC_Name[$i] `
        -ResourceGroupName   $RG_Name `
        -Location            $RG_Location `
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
    #Disbale Virtual Machine boot diagonistic
    $VM = Set-AzVMBootDiagnostic `
        -VM $VM `
        -Disable
    #Creates a Virtual Machine
    Write-Output "`t`tCreation of Virtual Machine- $($Windows_VM_Name[$i]) is going-on"
    $null = New-AzVM `
        -ResourceGroupName $RG_Name `
        -Location          $RG_Location `
        -VM                $VM
    Write-Output "`t`tCreation of Virutal Machine- $($Windows_VM_Name[$i]) Completed`n"
}