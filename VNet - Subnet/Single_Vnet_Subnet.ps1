[CmdletBinding()]
param (
    [Parameter()][String]
    $RG_Name,
    [Parameter()][string]
    $RG_Location,
    [Parameter()][hashtable]
    $RG_Tags,
    [Parameter()][string]
    $Vnet_Name,
    [Parameter()][string]
    $Vnet_Address,
    [Parameter()][hashtable]
    $Vnet_Tags,
    [Parameter()][string]
    $Subnet_Name,
    [Parameter()][string]
    $Subnet_Address
)

$RG_Name     = 'Aks-RG'
$RG_Location = 'EastUS'
$RG_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "RG"
}

$Vnet_Name    = 'Vnet-1'
$Vnet_Address = '10.0.0.0/16'
$Vnet_Tags = @{
    "Env"  = "Testing";
    "Name" = "Virtual Network"
}

$Subnet_Name    = 'Subnet-1'
$Subnet_Address = '10.0.0.0/24'

#Creation of Resource Group
Write-Output "Creation of Resource Group"
New-AzResourceGroup -Name $RG_Name -Location $RG_Location -Tag $RG_Tags
Write-Output "Resource Group Created"

#Creation of Vnet
Write-Output "Creation of Vitual Network in $($RG_Name)"
New-AzVirtualNetwork -Name $Vnet_Name -ResourceGroupName $RG_Name -Location $RG_Location -AddressPrefix $Vnet_Address -Tag $Vnet_Tags
Write-Output "Virutal Network Created"

#Retrieve Information about Virtual Network
$Vnet = Get-AzVirtualNetwork -Name $Vnet_Name

#Creation of Subnet
Write-Output "Creation of Subnet in $($Vnet_Name)"
Add-AzVirtualNetworkSubnetConfig -Name $Subnet_Name -VirtualNetwork $Vnet -AddressPrefix $Subnet_Address | Set-AzVirtualNetwork
Write-Output "Subnet Created"