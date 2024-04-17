[CmdletBinding()]
param (
    [Parameter()][String]
    $RG_Name,
    [Parameter()][string]
    $RG_Location,
    [Parameter()][string]
    $Vnet_Name,
    [Parameter()][string]
    $Vnet_Address,
    [Parameter()][hashtable]
    $Vnet_Tags,
    [Parameter()][string]
    $Subnet_Name,
    [Parameter()][string]
    $Subnet_Address,
    [Parameter()][string]
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
    $Windows_VM_OS_Storage_Type
)

$RG_Name     = 'RG'
$RG_Location = 'EastUS'

$Vnet_Name    = 'Vnet'
$Vnet_Address = '10.0.0.0/16'
$Vnet_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "VNet"
}

$Subnet_Name    = 'Subnet'
$Subnet_Address = '10.0.0.0/24'

$NSG_Name = 'NSG'
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

$Public_IP_Allocation = @('Static', 'Static')
$Public_IP_Name       = @('IP-1', 'IP-2')
$Public_IP_SKU        = @('Standard', 'Standard')
$Public_IP_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "Public-IP"
}

$NIC_Name        = @('NIC-1', 'NIC-2')
$NIC_IP_Cfg_Name = @('NIC-IP-Cfg-1', 'NIC-IP-Cfg-2')
$NIC_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "NIC"
}

$VM_Username     = @('John', 'John')
$VM_Password     = @('Password_12345', 'Password_12345')
$Windows_VM_Name = @('Windows-VM-1', 'Windows-VM-2')
$Windows_VM_Size = @('Standard_B1s', 'Standard_B1s')
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

#Get Virtual Network
Write-Output "`t`tGetting Virtual Network"
$Vnet = Get-AzVirtualNetwork -Name $Vnet_Name -ResourceGroupName $RG_Name -ErrorAction SilentlyContinue -WarningAction SilentlyContinue

if ($Vnet) {
    Write-Output "`t`tGetting Subnet"
    $subnet = Get-AzVirtualNetworkSubnetConfig -Name $Subnet_Name -VirtualNetwork $Vnet -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
    if (!$subnet) {  
        Write-Output "`t`tSubnet Not Found in Virtual Network"
        #Creation of Subnet
        Write-Output "`t`tCreation of Subnet in Existing Virtual Network"
        $null = Add-AzVirtualNetworkSubnetConfig `
            -Name           $Subnet_Name `
            -AddressPrefix  $Subnet_Address `
            -VirtualNetwork $Vnet `
            -WarningAction  SilentlyContinue | Set-AzVirtualNetwork
        Write-Output "`t`tSubnet Created`n"
    }
    else {
        Write-Output "`t`tVirtual Network and Subnet are existed in Resource Group`n"
    }
}
else {
    Write-Output "`t`tVirtual Network is not existed in Resource Group`n"
    #Creation of Virtual Network
    Write-Output "`t`tCreation of Virtual Network"
    $Vnet = New-AzVirtualNetwork `
        -Name              $Vnet_Name `
        -ResourceGroupName $RG_Name `
        -Location          $RG_Location `
        -AddressPrefix     $Vnet_Address `
        -Tag               $Vnet_Tags
    Write-Output "`t`tVirtual Network Created`n"

    #Creation of Subnet
    Write-Output "`t`tCreation of Subnet"
    $null = Add-AzVirtualNetworkSubnetConfig `
        -Name           $Subnet_Name `
        -AddressPrefix  $Subnet_Address `
        -VirtualNetwork $Vnet `
        -WarningAction  SilentlyContinue | Set-AzVirtualNetwork
    Write-Output "`t`tSubnet Created`n"
}

#Creation of Network Security Group
Write-Output "`t`tCreating Network Security Group"
$NSG = New-AzNetworkSecurityGroup `
    -Name              $NSG_Name `
    -ResourceGroupName $RG_Name `
    -Location          $RG_Location `
    -Tag               $NSG_Tags
Write-Output "`t`tNetwork Security Group is Created`n"

#Get Virtual Network
$Vnet = Get-AzVirtualNetwork -Name $Vnet_Name -ResourceGroupName $RG_Name

#Associate Network Security Group with Subnet
Write-Output "`t`tAssoicating Network Security Group with Subnet"
$null = Set-AzVirtualNetworkSubnetConfig `
    -Name                 $Subnet_Name `
    -VirtualNetwork       $Vnet `
    -NetworkSecurityGroup $NSG `
    -AddressPrefix        $Subnet_Address `
    -WarningAction        SilentlyContinue | Set-AzVirtualNetwork
Write-Output "`t`tNetwork Security Group associated with Subnet`n"


#Creation of Network Security Rules and Associated with NSG
for ($i = 0; $i -lt $NSG_Rule_Name.Count; $i++) {
    #Get NSG
    $NSG = Get-AzNetworkSecurityGroup -Name $NSG_Name -ResourceGroupName $RG_Name
    Write-Output "`t`tCreating Network Security Rules :- $($NSG_Rule_Name[$i])"
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
    Write-Output "`t`tNetwork Security Rules is Created :- $($NSG_Rule_Name[$i])`n"
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
    $Vnet = Get-AzVirtualNetwork -Name $Vnet_Name -ResourceGroupName $RG_Name
    #Retrieve Information about Subnet
    $Subnet = Get-AzVirtualNetworkSubnetConfig -Name $Subnet_Name -VirtualNetwork $Vnet
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
    Write-Output "`t`tCreating Virtual Machine :- $($Windows_VM_Name[$i])"
    $null = New-AzVM `
        -ResourceGroupName $RG_Name `
        -Location          $RG_Location `
        -VM                $VM
    Write-Output "`t`tVirutal Machine is Created :- $($Windows_VM_Name[$i])`n"
}