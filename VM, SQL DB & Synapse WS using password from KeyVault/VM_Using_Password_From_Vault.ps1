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
    $VM_Username,
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
    $Linux_VM_OS_Storage_Type
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

$Public_IP_Allocation = @('Static')
$Public_IP_Name       = @('IP-1')
$Public_IP_SKU        = @('Standard')
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

$Vnet_NIC_Name   = @('Vnet-1')
$Subnet_NIC_Name = @('Subnet-1')
$NIC_Name        = @('NIC-1')
$NIC_IP_Cfg_Name = @('NIC-IP-Cfg-1')
$NIC_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "NIC"
}

$Vault_Name                  = @('keyvault34829')
$Vault_Soft_Delete_Retention = @( 7 )
$Vault_SKU                   = @('Standard')
$Vault_Tags = @{
    "Env"  = "Testing";
    "Name" = "Key Vault"
}

$Vault_Secret_Value = @('Password_12345')
$Vault_Secret_Name  = @('VmAdminPassword')
$Secret_Vault_Name  = @('keyvault34829')

$VM_Vault_Name        = @('keyvault34829')
$VM_Vault_Secret_Name = @('VmAdminPassword')
$VM_Username          = @('John')
$Linux_VM_Name        = @('Linux-VM-1')
$Linux_VM_Size        = @('Standard_B1s')
$Linux_VM_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "VM"
}

$Linux_VM_Image_Publisher_Name    = @('Canonical')
$Linux_VM_Image_Offer             = @('UbuntuServer')
$Linux_VM_Image_SKU               = @('18.04-LTS')
$Linux_VM_Image_Version           = @('latest')
$Linux_VM_OS_Disk_Name            = @('os-disk-1')
$Linux_VM_OS_Disk_Caching         = @('ReadWrite')
$Linux_VM_OS_Disk_Creation_Option = @('FromImage')
$Linux_VM_OS_Disk_Size            = @(127)
$Linux_VM_OS_Storage_Type         = @('Standard_LRS')

#Creation of Resource Group
Write-Output "`t`tCreating Resource Group"
$null = New-AzResourceGroup `
    -Name     $RG_Name `
    -Location $RG_Location `
    -Tag      $RG_Tags
Write-Output "`t`tResource Group is Created`n"

#Creation of Multiple Virtual Network
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
    #Retrieve Information about NSG
    $NSG = Get-AzNetworkSecurityGroup -Name $NSG_Name[$i] -ResourceGroupName $RG_Name
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
    $Vnet = Get-AzVirtualNetwork -Name $Vnet_Subnet_Name[$i] -ResourceGroupName $RG_Name
    #Retrieve Information about NSG
    $NSG = Get-AzNetworkSecurityGroup -Name $NSG_Name[$i] -ResourceGroupName $RG_Name
    Write-Output "`t`tCreating Subnet :- $($Subnet_Name[$i])"
    $null = Add-AzVirtualNetworkSubnetConfig `
        -Name                 $Subnet_Name[$i] `
        -VirtualNetwork       $Vnet `
        -AddressPrefix        $Subnet_Address[$i] `
        -WarningAction        SilentlyContinue `
        -NetworkSecurityGroup $NSG | Set-AzVirtualNetwork
    Write-Output "`t`tSubnet is Created :- $($Subnet_Name[$i])`n"
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

#Creation of Linux Virtual Machine
for ($i = 0; $i -lt $Linux_VM_Name.Count; $i++) {

    #Get Secret Value from Key Vault
    $VM_Password = (Get-AzKeyVaultSecret -VaultName $VM_Vault_Name[$i] -Name $VM_Vault_Secret_Name[$i]).SecretValue

    $Credential = New-Object System.Management.Automation.PSCredential ($VM_Username[$i], $VM_Password);
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
    $NIC = Get-AzNetworkInterface -Name $NIC_Name[$i] -ResourceGroupName $RG_Name
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