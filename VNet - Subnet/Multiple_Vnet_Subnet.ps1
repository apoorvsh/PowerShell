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
    $Subnet_Name,
    [Parameter()][array]
    $Subnet_Address
)

$RG_Name     = 'Aks-RG'
$RG_Location = 'EastUS'
$RG_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "RG"
}

$Vnet_Name    = @("Vnet-1", "Vnet-2", "Vnet-3")
$Vnet_Address = @("10.0.0.0/16", "10.1.0.0/16", "10.2.0.0/16")
$Vnet_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "RG"
}

$Vnet_Subnet_Name = @("Vnet-1", "Vnet-1", "Vnet-2", "Vnet-3", "Vnet-3", "Vnet-3")
$Subnet_Name      = @("Subnet-1", "Subnet-2", "Subnet-3", "Subnet-4", "Subnet-5", "Subnet-6")
$Subnet_Address   = @("10.0.0.0/24", "10.0.1.0/24", "10.1.0.0/24", "10.2.0.0/24", "10.2.1.0/24", "10.2.2.0/24")

#Creation of Resource Group
Write-Output "Creation of Resource Group"
$null = New-AzResourceGroup -Name $RG_Name -Location $RG_Location -Tag $RG_Tags
Write-Output "Resource Group Created"

#Creation of Multiple Virtual Network
for ($i = 0; $i -lt $Vnet_Name.Count; $i++) {
    Write-Output "Creation of Vitual Network- $($Vnet_Name[$i]) in $($RG_Name)"
    $null = New-AzVirtualNetwork -Name $Vnet_Name[$i] -ResourceGroupName $RG_Name -Location $RG_Location -AddressPrefix $Vnet_Address[$i] -Tag $Vnet_Tags
    Write-Output "Virutal Network- $($Vnet_Name[$i]) Created"
}

#Creation of Multiple Subnet in Multiple Virtual Network
for ($i = 0; $i -lt $Subnet_Name.Count; $i++) {
    #Retrieve Information about Virtual Network
    $Vnet = Get-AzVirtualNetwork -Name $Vnet_Subnet_Name[$i]
    Write-Output "Creation of Subnet-$($Subnet_Name[$i]) in $($Vnet_Subnet_Name[$i])"
    $null = Add-AzVirtualNetworkSubnetConfig -Name $Subnet_Name[$i] -VirtualNetwork $Vnet -AddressPrefix $Subnet_Address[$i] | Set-AzVirtualNetwork
    Write-Output "Subnet- $($Subnet_Name[$i]) Created"
}