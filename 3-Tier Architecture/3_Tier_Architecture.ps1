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
    $Public_IP_Allocation,
    [Parameter()][array]
    $Public_IP_Name,
    [Parameter()][array]
    $Public_IP_SKU,
    [Parameter()][hashtable]
    $Public_IP_Tags,
    [Parameter()][array]
    $Web_NIC_Name,
    [Parameter()][array]
    $Web_NIC_IP_Cfg_Name,
    [Parameter()][hashtable]
    $Web_NIC_Tags,
    [Parameter()][array]
    $NIC_Name,
    [Parameter()][array]
    $NIC_IP_Cfg_Name,
    [Parameter()][hashtable]
    $NIC_Tags,
    [Parameter()][array]
    $Web_Windows_VM_Username,
    [Parameter()][array]
    $Web_Windows_VM_Password,
    [Parameter()][array]
    $Web_Windows_VM_Name,
    [Parameter()][array]
    $Web_Windows_VM_Size,
    [Parameter()][hashtable]
    $Web_Windows_VM_Tags,
    [Parameter()][array]
    $Web_Windows_VM_Image_Publisher_Name,
    [Parameter()][array]
    $Web_Windows_VM_Image_Offer,
    [Parameter()][array]
    $Web_Windows_VM_Image_SKU,
    [Parameter()][array]
    $Web_Windows_VM_Image_Version,
    [Parameter()][array]
    $Web_Windows_VM_OS_Disk_Name,
    [Parameter()][array]
    $Web_Windows_VM_OS_Disk_Caching,
    [Parameter()][array]
    $Web_Windows_VM_OS_Disk_Creation_Option,
    [Parameter()][array]
    $Web_Windows_VM_OS_Disk_Size,
    [Parameter()][array]
    $Web_Windows_VM_OS_Storage_Type,
    [Parameter()][array]
    $Web_Linux_VM_Username,
    [Parameter()][array]
    $Web_Linux_VM_Password,
    [Parameter()][array]
    $Web_Linux_VM_Name,
    [Parameter()][array]
    $Web_Linux_VM_Size,
    [Parameter()][hashtable]
    $Web_Linux_VM_Tags,
    [Parameter()][array]
    $Web_Linux_VM_Image_Publisher_Name,
    [Parameter()][array]
    $Web_Linux_VM_Image_Offer,
    [Parameter()][array]
    $Web_Linux_VM_Image_SKU,
    [Parameter()][array]
    $Web_Linux_VM_Image_Version,
    [Parameter()][array]
    $Web_Linux_VM_OS_Disk_Name,
    [Parameter()][array]
    $Web_Linux_VM_OS_Disk_Caching,
    [Parameter()][array]
    $Web_Linux_VM_OS_Disk_Creation_Option,
    [Parameter()][array]
    $Web_Linux_VM_OS_Disk_Size,
    [Parameter()][array]
    $Web_Linux_VM_OS_Storage_Type,
    [Parameter()][array]
    $Windows_VM_Username,
    [Parameter()][array]
    $Windows_VM_Password,
    [Parameter()][array]
    $Linux_VM_Username,
    [Parameter()][array]
    $Linux_VM_Password,
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
    $Linux_VM_Name,
    [Parameter()][array]
    $Linux_VM_Size,
    [Parameter()][hashtable]
    $Linux_VM_Tags,
    [Parameter()][array]
    $Linux_VM_Image_Publisher_Name,
    [Parameter()][array]
    $Linux_VM_Image_Offer,
    [Parameter()][array]
    $Linux_VM_Image_SKU,
    [Parameter()][array]
    $Linux_VM_Image_Version,
    [Parameter()][array]
    $Linux_VM_OS_Disk_Name,
    [Parameter()][array]
    $Linux_VM_OS_Disk_Caching,
    [Parameter()][array]
    $Linux_VM_OS_Disk_Creation_Option,
    [Parameter()][array]
    $Linux_VM_OS_Disk_Size,
    [Parameter()][array]
    $Linux_VM_OS_Storage_Type,
    [Parameter()][array]
    $Web_Windows_VM_Extension_Name,
    [Parameter()][array]
    $Web_Windows_VM_Extension_Publisher,
    [Parameter()][array]
    $Web_Windows_VM_Extension_Type,
    [Parameter()][array]
    $Web_Windows_VM_Extension_Version,
    [Parameter()][string]
    $Web_Windows_VM_Extension_Cmd,
    [Parameter()][array]
    $Web_Linux_VM_Extension_Name,
    [Parameter()][array]
    $Web_Linux_VM_Extension_Publisher,
    [Parameter()][array]
    $Web_Linux_VM_Extension_Type,
    [Parameter()][array]
    $Web_Linux_VM_Extension_Version,
    [Parameter()][string]
    $Web_Linux_VM_Extension_Cmd,
    [Parameter()][array]
    $Windows_VM_Extension_Name,
    [Parameter()][array]
    $Windows_VM_Extension_Publisher,
    [Parameter()][array]
    $Windows_VM_Extension_Type,
    [Parameter()][array]
    $Windows_VM_Extension_Version,
    [Parameter()][string]
    $Windows_VM_Extension_Cmd,
    [Parameter()][array]
    $Linux_VM_Extension_Name,
    [Parameter()][array]
    $Linux_VM_Extension_Publisher,
    [Parameter()][array]
    $Linux_VM_Extension_Type,
    [Parameter()][array]
    $Linux_VM_Extension_Version,
    [Parameter()][string]
    $Linux_VM_Extension_Cmd
)

$RG_Name     = 'Aks-RG'
$RG_Location = 'EastUS2'
$RG_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "RG"
}

$Vnet_Name        = @('Vnet-1')
$Vnet_Address     = @('10.10.0.0/16')
$Vnet_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "RG"
}

$NSG_Name = @('web-tier-nsg', 'app-tier-nsg', 'db-tier-nsg')
$NSG_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "NSG"
}

$NSG_Rule_NSG_Name                   = @('web-tier-nsg', 'app-tier-nsg', 'db-tier-nsg', 'db-tier-nsg', 'db-tier-nsg')
$NSG_Rule_Name                       = @('web-tier-nsg-rule', 'app-tier-nsg-rule', 'db-tier-nsg-rule-1', 'db-tier-nsg-rule-2', 'db-tier-nsg-rule-3')
$NSG_Rule_Description                = @('Allow all port for testing', 'Allow Inbound access to Web Tier Only', 'Allow Inbound access to App Tier Only', 'Deny All Inbound Virtual Network Access to DB Tier', 'Deny DB Tier All Outbound access')
$NSG_Rule_Protocol                   = @('*', '*', '*', '*', '*')
$NSG_Rule_Source_Port_Range          = @('*', '*', '*', '*', '*')
$NSG_Rule_Destination_Port_Range     = @('*', '*', '*', '*', '*')
$NSG_Rule_Source_Address_Prefix      = @('*', '10.10.0.0/24', '10.10.1.0/24', '*', 'VirtualNetwork')
$NSG_Rule_Destination_Address_Prefix = @('*', '*', '*', 'VirtualNetwork', '10.10.0.0/16')
$NSG_Rule_Access                     = @('Allow', 'Allow', 'Allow', 'Deny', 'Deny')
$NSG_Rule_Priority                   = @(100, 100, 100, 110, 120)
$NSG_Rule_Direction                  = @('Inbound', 'Inbound', 'Inbound', 'Inbound', 'Outbound')

$Subnet_Name      = @('web-tier-subnet', 'app-tier-subnet', 'db-tier-subnet')
$Subnet_Address   = @('10.10.0.0/24', '10.10.1.0/24', '10.10.2.0/24')
$Vnet_Subnet_Name = $Vnet_Name * $Subnet_Name.Count

$Public_IP_Allocation = @('Static', 'Static')
$Public_IP_Name       = @('web-ip-1', 'web-ip-2')
$Public_IP_SKU        = @('Standard', 'Standard')
$Public_IP_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "Public-IP"
}


$Web_NIC_Name        = @('web-nic-1', 'web-nic-2')
$Web_NIC_IP_Cfg_Name = @('web-nic-ip-cfg-1', 'web-nic-ip-cfg-2')
$Vnet_Web_NIC_Name   = @('Vnet-1', 'Vnet-1')
$Subnet_Web_NIC_Name = @('web-tier-subnet', 'web-tier-subnet')
$Web_NIC_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "NIC"
}

$NIC_Name        = @('app-nic-1', 'app-nic-2', 'db-nic-1', 'db-nic-2')
$NIC_IP_Cfg_Name = @('app-nic-ip-cfg-1', 'app-nic-ip-cfg-2', 'db-nic-ip-cfg-1', 'db-nic-ip-cfg-2')
$Vnet_NIC_Name   = @('Vnet-1', 'Vnet-1', 'Vnet-1', 'Vnet-1')
$Subnet_NIC_Name = @('app-tier-subnet', 'app-tier-subnet', 'db-tier-subnet', 'db-tier-subnet')
$NIC_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "NIC"
}


$Web_Windows_VM_Username = @('John')
$Web_Windows_VM_Password = @('Password_12345')
$Web_Windows_VM_Name     = @('windows-web-vm')
$Web_Windows_VM_Size     = @('Standard_B1s')
$Web_Windows_VM_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "VM"
}

$Web_Windows_VM_NIC_Name                = @('web-nic-1')
$Web_Windows_VM_Image_Publisher_Name    = @('MicrosoftWindowsServer')
$Web_Windows_VM_Image_Offer             = @('WindowsServer')
$Web_Windows_VM_Image_SKU               = @('2019-DataCenter')
$Web_Windows_VM_Image_Version           = @('latest')
$Web_Windows_VM_OS_Disk_Name            = @('windows-os-disk-1')
$Web_Windows_VM_OS_Disk_Caching         = @('ReadWrite')
$Web_Windows_VM_OS_Disk_Creation_Option = @('FromImage')
$Web_Windows_VM_OS_Disk_Size            = @(127)
$Web_Windows_VM_OS_Storage_Type         = @('Standard_LRS')


$Web_Linux_VM_Username = @('John')
$Web_Linux_VM_Password = @('Password_12345')
$Web_Linux_VM_Name     = @('web-linux-vm')
$Web_Linux_VM_Size     = @('Standard_B1s')
$Web_Linux_VM_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "VM"
}

$Web_Linux_VM_NIC_Name                = @('web-nic-2')
$Web_Linux_VM_Image_Publisher_Name    = @('RedHat')
$Web_Linux_VM_Image_Offer             = @('RHEL')
$Web_Linux_VM_Image_SKU               = @('8.2')
$Web_Linux_VM_Image_Version           = @('latest')
$Web_Linux_VM_OS_Disk_Name            = @('linux-os-disk-1')
$Web_Linux_VM_OS_Disk_Caching         = @('ReadWrite')
$Web_Linux_VM_OS_Disk_Creation_Option = @('FromImage')
$Web_Linux_VM_OS_Disk_Size            = @(64)
$Web_Linux_VM_OS_Storage_Type         = @('Standard_LRS')

$Windows_VM_Username = @('John', 'John')
$Windows_VM_Password = @('Password_12345', 'Password_12345')
$Windows_VM_Name     = @('app-windows-vm', 'db-windows-vm')
$Windows_VM_Size     = @('Standard_B1s', 'Standard_B1s')
$Windows_VM_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "VM"
}

$Windows_VM_NIC_Name                = @('app-nic-1', 'db-nic-1')
$Windows_VM_Image_Publisher_Name    = @('MicrosoftWindowsServer', 'MicrosoftWindowsServer')
$Windows_VM_Image_Offer             = @('WindowsServer', 'WindowsServer')
$Windows_VM_Image_SKU               = @('2019-DataCenter', '2019-DataCenter')
$Windows_VM_Image_Version           = @('latest', 'latest')
$Windows_VM_OS_Disk_Name            = @('app-windows-os-disk', 'db-windows-os-disk')
$Windows_VM_OS_Disk_Caching         = @('ReadWrite', 'ReadWrite')
$Windows_VM_OS_Disk_Creation_Option = @('FromImage', 'FromImage')
$Windows_VM_OS_Disk_Size            = @(127, 127)
$Windows_VM_OS_Storage_Type         = @('Standard_LRS', 'Standard_LRS')


$Linux_VM_Username = @('John', 'John')
$Linux_VM_Password = @('Password_12345', 'Password_12345')
$Linux_VM_Name     = @('app-linux-vm', 'db-linux-vm')
$Linux_VM_Size     = @('Standard_B1s', 'Standard_B1s')
$Linux_VM_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "VM"
}

$Linux_VM_NIC_Name                = @('app-nic-2', 'db-nic-2')
$Linux_VM_Image_Publisher_Name    = @('RedHat', 'RedHat')
$Linux_VM_Image_Offer             = @('RHEL', 'RHEL')
$Linux_VM_Image_SKU               = @('8.2', '8.2')
$Linux_VM_Image_Version           = @('latest', 'latest')
$Linux_VM_OS_Disk_Name            = @('app-linux-os-disk', 'db-linux-os-disk')
$Linux_VM_OS_Disk_Caching         = @('ReadWrite', 'ReadWrite')
$Linux_VM_OS_Disk_Creation_Option = @('FromImage', 'FromImage')
$Linux_VM_OS_Disk_Size            = @(64, 64)
$Linux_VM_OS_Storage_Type         = @('Standard_LRS', 'Standard_LRS')

$Web_Windows_VM_Extension_Name      = @('web-iis-ext')
$Web_Windows_VM_Extension_Publisher = @('Microsoft.Compute')
$Web_Windows_VM_Extension_Type      = @('CustomScriptExtension')
$Web_Windows_VM_Extension_Version   = @('1.7')
$Web_Windows_VM_Extension_Cmd       = 'powershell.exe Install-WindowsFeature -name Web-Server -IncludeManagementTools'

$Web_Linux_VM_Extension_Name      = @('web-apache-ext')
$Web_Linux_VM_Extension_Publisher = @('Microsoft.Azure.Extensions')
$Web_Linux_VM_Extension_Type      = @('CustomScript')
$Web_Linux_VM_Extension_Version   = @('2.1')
$Web_Linux_VM_Extension_Cmd       = 'sudo yum install httpd -y; sudo systemctl stop firewalld; sudo systemctl start httpd; sudo systemctl enable httpd; echo "webserver" | sudo tee /var/www/html/index.html'

$Windows_VM_Extension_Name      = @('app-iis-ext', 'db-iis-ext')
$Windows_VM_Extension_Publisher = @('Microsoft.Compute', 'Microsoft.Compute')
$Windows_VM_Extension_Type      = @('CustomScriptExtension', 'CustomScriptExtension')
$Windows_VM_Extension_Version   = @('1.7', '1.7')
$Windows_VM_Extension_Cmd       = 'powershell.exe Install-WindowsFeature -name Web-Server -IncludeManagementTools'

$Linux_VM_Extension_Name      = @('app-apache-ext', 'db-apache-ext')
$Linux_VM_Extension_Publisher = @('Microsoft.Azure.Extensions', 'Microsoft.Azure.Extensions')
$Linux_VM_Extension_Type      = @('CustomScript', 'CustomScript')
$Linux_VM_Extension_Version   = @('2.1', '2.1')
$Linux_VM_Extension_Cmd       = 'sudo yum install httpd -y; sudo systemctl stop firewalld; sudo systemctl start httpd; sudo systemctl enable httpd; echo "webserver" | sudo tee /var/www/html/index.html'

#Creation of Resource Group
Write-Output "`t`tCreating Resource Group"
$null = New-AzResourceGroup `
    -Name     $RG_Name `
    -Location $RG_Location `
    -Tag      $RG_Tags
Write-Output "`t`tResource Group is Created`n"


#Creation of Virtual Network
for ($i = 0; $i -lt $Vnet_Name.Count; $i++) {
    Write-Output "`t`tCreation of Virtual Network"
    $null = New-AzVirtualNetwork `
        -Name              $Vnet_Name[$i] `
        -ResourceGroupName $RG_Name `
        -Location          $RG_Location `
        -AddressPrefix     $Vnet_Address[$i] `
        -Tag               $Vnet_Tags
    Write-Output "`t`tVirtual Network Created`n"
}

#Creation of Network Security Group
for ($i = 0; $i -lt $NSG_Name.Count; $i++) {
    Write-Output "`t`tCreating Network Security Group :- $($NSG_Name[$i])"
    $null = New-AzNetworkSecurityGroup `
        -Name              $NSG_Name[$i] `
        -ResourceGroupName $RG_Name `
        -Location          $RG_Location `
        -Tag               $NSG_Tags
    Write-Output "`t`tNetwork Security Group is created :- $($NSG_Name[$i])`n"
}


#Creation of Network Security Rules and Associated with NSG
for ($i = 0; $i -lt $NSG_Rule_Name.Count; $i++) {
    #Retrieve Information about NSG
    $NSG = Get-AzNetworkSecurityGroup -Name $NSG_Rule_NSG_Name[$i] -ResourceGroupName $RG_Name
    Write-Output "`t`tCreating Network Security Rule :- $($NSG_Rule_Name[$i]) in $($NSG_Rule_NSG_Name[$i])"
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
    Write-Output "`t`tNetwork Security Rule is Created :- $($NSG_Rule_Name[$i]) in $($NSG_Rule_NSG_Name[$i])`n"
}

#Creation of Subnet
for ($i = 0; $i -lt $Subnet_Name.Count; $i++) {
    #Retrieve Information about Virtual Network
    $Vnet = Get-AzVirtualNetwork -Name $Vnet_Subnet_Name[$i] -ResourceGroupName $RG_Name
    #Retrieve Information about NSG
    $NSG = Get-AzNetworkSecurityGroup -Name $NSG_Name[$i] -ResourceGroupName $RG_Name
    Write-Output "`t`tCreating Subnet :-$($Subnet_Name[$i])"
    $null = Add-AzVirtualNetworkSubnetConfig `
        -Name                 $Subnet_Name[$i] `
        -VirtualNetwork       $Vnet `
        -AddressPrefix        $Subnet_Address[$i] `
        -NetworkSecurityGroup $NSG `
        -WarningAction        SilentlyContinue| Set-AzVirtualNetwork
    Write-Output "`t`tSubnet is Created :- $($Subnet_Name[$i])`n"
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

#Creation of Network Interface Card for WebTier VMs
for ($i = 0; $i -lt $Web_NIC_Name.Count; $i++) {
    #Get Virtual Network
    $Vnet = Get-AzVirtualNetwork -Name $Vnet_Web_NIC_Name[$i] -ResourceGroupName $RG_Name
    #Get Subnet
    $Subnet = Get-AzVirtualNetworkSubnetConfig -Name $Subnet_Web_NIC_Name[$i] -VirtualNetwork $Vnet
    #Get Public IP Address
    $IP = Get-AzPublicIpAddress -Name $Public_IP_Name[$i] -ResourceGroupName $RG_Name
    Write-Output "`t`tCreating Network Interface Card for Web-Tier VMs :- $($Web_NIC_Name[$i])"
    $null = New-AzNetworkInterface `
        -Name                $Web_NIC_Name[$i] `
        -ResourceGroupName   $RG_Name `
        -Location            $RG_Location `
        -Subnet              $Subnet `
        -PublicIpAddress     $IP `
        -IpConfigurationName $Web_NIC_IP_Cfg_Name[$i] `
        -Tag                 $Web_NIC_Tags
    Write-Output "`t`tNetwork Interface Card is Created for Web Tier VMs :- $($Web_NIC_Name[$i])`n"
}

#Creation of Network Interface Card for App & DB Tier VMs
for ($i = 0; $i -lt $NIC_Name.Count; $i++) {
    #Get Virtual Network
    $Vnet = Get-AzVirtualNetwork -Name $Vnet_NIC_Name[$i] -ResourceGroupName $RG_Name
    #Get Subnet
    $Subnet = Get-AzVirtualNetworkSubnetConfig -Name $Subnet_NIC_Name[$i] -VirtualNetwork $Vnet
    Write-Output "`t`tCreating Network Interface Card :- $($NIC_Name[$i])"
    $null = New-AzNetworkInterface `
        -Name                $NIC_Name[$i] `
        -ResourceGroupName   $RG_Name `
        -Location            $RG_Location `
        -Subnet              $Subnet `
        -IpConfigurationName $NIC_IP_Cfg_Name[$i] `
        -Tag                 $NIC_Tags
    Write-Output "`t`tNetwork Interface Card is Created :- $($NIC_Name[$i])`n"
}



#Creation of Windows Virtual Machine for Web Tier
for ($i = 0; $i -lt $Web_Windows_VM_Name.Count; $i++) {
    #Convert Password Into Secure Password
    $VM_Password = ConvertTo-SecureString $Web_Windows_VM_Password[$i] -AsPlainText -Force
    $Credential = New-Object System.Management.Automation.PSCredential ($Web_Windows_VM_Username[$i], $VM_Password);
    #Create a Configurable Virtual Machine Object
    $VM = New-AzVMConfig `
        -VMName $Web_Windows_VM_Name[$i] `
        -VMSize $Web_Windows_VM_Size[$i] `
        -Tags   $Web_Windows_VM_Tags
    #Set Operating System Properties for a Virtual Machine
    $VM = Set-AzVMOperatingSystem `
        -VM           $VM `
        -Windows `
        -ComputerName $Web_Windows_VM_Name[$i] `
        -Credential   $Credential
    #Gets Network Interface Information
    $NIC = Get-AzNetworkInterface -Name $Web_Windows_VM_NIC_Name[$i] -ResourceGroupName $RG_Name
    #Adds a Network Interface to Virtual Machine
    $VM = Add-AzVMNetworkInterface `
        -VM $VM `
        -Id $NIC.Id
    #Set the Image for Virtual Machine
    $VM= Set-AzVMSourceImage `
        -VM            $VM `
        -PublisherName $Web_Windows_VM_Image_Publisher_Name[$i] `
        -Offer         $Web_Windows_VM_Image_Offer[$i] `
        -Skus          $Web_Windows_VM_Image_SKU[$i] `
        -Version       $Web_Windows_VM_Image_Version[$i]
    #Set Operating System disk properties on Virtual Machine
    $VM = Set-AzVMOSDisk `
        -VM                 $VM `
        -Name               $Web_Windows_VM_OS_Disk_Name[$i] `
        -Caching            $Web_Windows_VM_OS_Disk_Caching[$i] `
        -CreateOption       $Web_Windows_VM_OS_Disk_Creation_Option[$i] `
        -DiskSizeInGB       $Web_Windows_VM_OS_Disk_Size[$i] `
        -StorageAccountType $Web_Windows_VM_OS_Storage_Type[$i]
    #Disbale Virtual Machine boot diagonistic
    $VM = Set-AzVMBootDiagnostic `
        -VM $VM `
        -Disable
    #Creates a Virtual Machine
    Write-Output "`t`tCreating Virtual Machine :- $($Web_Windows_VM_Name[$i])"
    $null = New-AzVM `
        -ResourceGroupName $RG_Name `
        -Location          $RG_Location `
        -VM                $VM
    Write-Output "`t`tWindows Virtual Machine is Created :- $($Web_Windows_VM_Name[$i]) Completed`n"
}


#Creation of Linux Virtual Machine
for ($i = 0; $i -lt $Web_Linux_VM_Name.Count; $i++) {
    #Convert Password Into Secure Password
    $VM_Password = ConvertTo-SecureString $Web_Linux_VM_Password[$i] -AsPlainText -Force
    $Credential = New-Object System.Management.Automation.PSCredential ($Web_Linux_VM_Username[$i] , $VM_Password);
    #Create a Configurable Virtual Machine Object
    $VM = New-AzVMConfig `
        -VMName $Web_Linux_VM_Name[$i] `
        -VMSize $Web_Linux_VM_Size[$i] `
        -Tags   $Web_Linux_VM_Tags
    #Set Operating System Properties for a Virtual Machine
    $VM = Set-AzVMOperatingSystem `
        -VM           $VM `
        -Linux `
        -ComputerName $Web_Linux_VM_Name[$i] `
        -Credential   $Credential
    #Gets Network Interface Information
    $NIC = Get-AzNetworkInterface -Name $Web_Linux_VM_NIC_Name[$i] -ResourceGroupName $RG_Name
    #Adds a Network Interface to Virtual Machine
    $VM = Add-AzVMNetworkInterface `
        -VM $VM `
        -Id $NIC.Id
    #Set the Image for Virtual Machine
    $VM= Set-AzVMSourceImage `
        -VM            $VM `
        -PublisherName $Web_Linux_VM_Image_Publisher_Name[$i] `
        -Offer         $Web_Linux_VM_Image_Offer[$i] `
        -Skus          $Web_Linux_VM_Image_SKU[$i] `
        -Version       $Web_Linux_VM_Image_Version[$i]
    #Set Operating System disk properties on Virtual Machine
    $VM = Set-AzVMOSDisk `
        -VM                 $VM `
        -Name               $Web_Linux_VM_OS_Disk_Name[$i] `
        -Caching            $Web_Linux_VM_OS_Disk_Caching[$i] `
        -CreateOption       $Web_Linux_VM_OS_Disk_Creation_Option[$i] `
        -DiskSizeInGB       $Web_Linux_VM_OS_Disk_Size[$i] `
        -StorageAccountType $Web_Linux_VM_OS_Storage_Type[$i]
    #Disbale Virtual Machine boot diagonistic
    $VM = Set-AzVMBootDiagnostic `
        -VM $VM `
        -Disable
    #Creates a Virtual Machine
    Write-Output "`t`tCreating Web_Linux Virtual Machine :- $($Web_Linux_VM_Name[$i])"
    $null = New-AzVM `
        -ResourceGroupName $RG_Name `
        -Location          $RG_Location `
        -VM                $VM
    Write-Output "`t`tLinux Virutal Machine is Created :- $($Web_Linux_VM_Name[$i])`n"
}


#Creation of Windows Virtual Machine for App & DB Tier
for ($i = 0; $i -lt $Windows_VM_Name.Count; $i++) {
    #Convert Password Into Secure Password
    $VM_Password = ConvertTo-SecureString $Windows_VM_Password[$i] -AsPlainText -Force
    $Credential = New-Object System.Management.Automation.PSCredential ($Windows_VM_Username[$i], $VM_Password);
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
    $NIC = Get-AzNetworkInterface -Name $Windows_VM_NIC_Name[$i] -ResourceGroupName $RG_Name
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
    Write-Output "`t`tCreating Virtual Machine :- $($Windows_VM_Name[$i])"
    $null = New-AzVM `
        -ResourceGroupName $RG_Name `
        -Location          $RG_Location `
        -VM                $VM
    Write-Output "`t`tVirutal Machine is Created :- $($Windows_VM_Name[$i]) Completed`n"
}

#Creation of Linux Virtual Machine for App & DB Tier
for ($i = 0; $i -lt $Linux_VM_Name.Count; $i++) {
    #Convert Password Into Secure Password
    $VM_Password = ConvertTo-SecureString $Linux_VM_Password[$i] -AsPlainText -Force
    $Credential = New-Object System.Management.Automation.PSCredential ($Linux_VM_Username[$i], $VM_Password);
    #Create a Configurable Virtual Machine Object
    $VM = New-AzVMConfig `
        -VMName $Linux_VM_Name[$i] `
        -VMSize $Linux_VM_Size[$i] `
        -Tags   $Linux_VM_Tags
    #Set Operating System Properties for a Virtual Machine
    $VM = Set-AzVMOperatingSystem `
        -VM           $VM `
        -Linux `
        -ComputerName $Linux_VM_Name[$i] `
        -Credential   $Credential
    #Gets Network Interface Information
    $NIC = Get-AzNetworkInterface -Name $Linux_VM_NIC_Name[$i] -ResourceGroupName $RG_Name
    #Adds a Network Interface to Virtual Machine
    $VM = Add-AzVMNetworkInterface `
        -VM $VM `
        -Id $NIC.Id
    #Set the Image for Virtual Machine
    $VM= Set-AzVMSourceImage `
        -VM            $VM `
        -PublisherName $Linux_VM_Image_Publisher_Name[$i] `
        -Offer         $Linux_VM_Image_Offer[$i] `
        -Skus          $Linux_VM_Image_SKU[$i] `
        -Version       $Linux_VM_Image_Version[$i]
    #Set Operating System disk properties on Virtual Machine
    $VM = Set-AzVMOSDisk `
        -VM                 $VM `
        -Name               $Linux_VM_OS_Disk_Name[$i] `
        -Caching            $Linux_VM_OS_Disk_Caching[$i] `
        -CreateOption       $Linux_VM_OS_Disk_Creation_Option[$i] `
        -DiskSizeInGB       $Linux_VM_OS_Disk_Size[$i] `
        -StorageAccountType $Linux_VM_OS_Storage_Type[$i]
    #Disbale Virtual Machine boot diagonistic
    $VM = Set-AzVMBootDiagnostic `
        -VM $VM `
        -Disable
    #Creates a Virtual Machine
    Write-Output "`t`tCreating Linux Virtual Machine :- $($Linux_VM_Name[$i])"
    $null = New-AzVM `
        -ResourceGroupName $RG_Name `
        -Location          $RG_Location `
        -VM                $VM
    Write-Output "`t`tLinux Virutal Machine is Created :- $($Linux_VM_Name[$i])`n"
}


#Creation of IIS WebServer for Web Tier VM
for ($i = 0; $i -lt $Web_Windows_VM_Extension_Name.Count; $i++) {
    Write-Output "`t`tCreating IIS WebServer"
    $null = Set-AzVMExtension `
        -Name $Web_Windows_VM_Extension_Name[$i] `
        -Publisher $Web_Windows_VM_Extension_Publisher[$i] `
        -ExtensionType $Web_Windows_VM_Extension_Type[$i] `
        -ResourceGroupName $RG_Name `
        -Location $RG_Location `
        -VMName $Web_Windows_VM_Name[$i] `
        -TypeHandlerVersion $Web_Windows_VM_Extension_Version[$i] `
        -Settings @{
            "commandToExecute" = $Web_Windows_VM_Extension_Cmd
        }
    Write-Output "`t`tIIS WebServer Created"
}

#Creation of Apache Server in Web Tier Linux VM
for ($i = 0; $i -lt $Web_Linux_VM_Extension_Name.Count; $i++) {
    Write-Output "`t`tCreating Apache WebServer"
    $null = Set-AzVMExtension `
        -Name               $Web_Linux_VM_Extension_Name[$i] `
        -Publisher          $Web_Linux_VM_Extension_Publisher[$i] `
        -ExtensionType      $Web_Linux_VM_Extension_Type[$i] `
        -ResourceGroupName  $RG_Name `
        -Location           $RG_Location `
        -VMName             $Web_Linux_VM_Name[$i] `
        -TypeHandlerVersion $Web_Linux_VM_Extension_Version[$i] `
        -Settings @{
            "commandToExecute" = $Web_Linux_VM_Extension_Cmd
        }
    Write-Output "`t`tApache WebServer Created"
}

#Creation of IIS WebServer
for ($i = 0; $i -lt $Windows_VM_Extension_Name.Count; $i++) {
    Write-Output "`t`tCreating IIS WebServer"
    $null = Set-AzVMExtension `
        -Name               $Windows_VM_Extension_Name[$i] `
        -Publisher          $Windows_VM_Extension_Publisher[$i] `
        -ExtensionType      $Windows_VM_Extension_Type[$i] `
        -ResourceGroupName  $RG_Name `
        -Location           $RG_Location `
        -VMName             $Windows_VM_Name[$i] `
        -TypeHandlerVersion $Windows_VM_Extension_Version[$i] `
        -Settings @{
            "commandToExecute" = $Windows_VM_Extension_Cmd
        }
    Write-Output "`t`tIIS WebServer Created"
}


#Creation of Apache Server in Linux VM
for ($i = 0; $i -lt $Linux_VM_Extension_Name.Count; $i++) {
    Write-Output "`t`tCreating Apache WebServer"
    $null = Set-AzVMExtension `
        -Name               $Linux_VM_Extension_Name[$i] `
        -Publisher          $Linux_VM_Extension_Publisher[$i] `
        -ExtensionType      $Linux_VM_Extension_Type[$i] `
        -ResourceGroupName  $RG_Name `
        -Location           $RG_Location `
        -VMName             $Linux_VM_Name[$i] `
        -TypeHandlerVersion $Linux_VM_Extension_Version[$i] `
        -Settings @{
            "commandToExecute" = $Linux_VM_Extension_Cmd
        }
    Write-Output "`t`tApache WebServer Created"
}