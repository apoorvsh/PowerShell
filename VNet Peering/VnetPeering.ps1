[CmdletBinding()]
param (
    [Parameter()][array]
    $RG_Name,
    [Parameter()][array]
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
    $Subnet_Address,
    [Parameter()][array]
    $Vnet_Peer_Name
)

$RG_Name     = @('Aks-RG', 'Aks-RG2')
$RG_Location = @('EastUS', 'EastUS2')
$RG_Tags = @{
    "Env"  = "Testing"
    "Name" = "Resource Group"
}


$Vnet_RG_Name     = @('Aks-RG', 'Aks-RG2')
$Vnet_RG_Location = @('EastUS', 'EastUS2')
$Vnet_Name        = @('Vnet-1', 'Vnet-2')
$Vnet_Address     = @('10.10.0.0/16', '10.11.0.0/16')
$Vnet_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "VNet"
}

$Subnet_RG_Name   = @('Aks-RG', 'Aks-RG2')
$Vnet_Subnet_Name = @('Vnet-1', 'Vnet-2')
$Subnet_Name      = @('Subnet-1', 'Subnet-2')
$Subnet_Address   = @('10.10.0.0/24', '10.11.0.0/24')



$Vnet_Peer_Name = @('Vnet-1-to-2', 'Vnet-2-to-1')
$VnetA_Name = @('Vnet-1', 'Vnet-2')
$VnetA_RG_Name = @('Aks-RG', 'Aks-RG2')
$VnetB_Name = @('Vnet-2', 'Vnet-1')
$VNetB_RG_Name = @('Aks-RG2', 'Aks-RG')

#Creation of Resource Group
for ($i = 0; $i -lt $RG_Name.Count; $i++) {
    Write-Output "`t`tCreating Resource Group"
    $null = New-AzResourceGroup `
        -Name     $RG_Name[$i] `
        -Location $RG_Location[$i] `
        -Tag      $RG_Tags
    Write-Output "`t`tResource Group is Created`n"
}

#Creation of Virtual Network
for ($i = 0; $i -lt $Vnet_Name.Count; $i++) {
    Write-Output "`t`tCreating Vitual Network :- $($Vnet_Name[$i])"
    $null = New-AzVirtualNetwork `
        -Name              $Vnet_Name[$i] `
        -ResourceGroupName $Vnet_RG_Name[$i] `
        -Location          $Vnet_RG_Location[$i] `
        -AddressPrefix     $Vnet_Address[$i] `
        -Tag               $Vnet_Tags
    Write-Output "`t`tVirutal Network is Created :- $($Vnet_Name[$i])`n"
}

#Creation of Subnet
for ($i = 0; $i -lt $Subnet_Name.Count; $i++) {
    
    #Retrieve Information about Virtual Network
    $Vnet = Get-AzVirtualNetwork -Name $Vnet_Subnet_Name[$i] -ResourceGroupName $Subnet_RG_Name[$i]
    
    Write-Output "`t`tCreating Subnet :-$($Subnet_Name[$i])"
    $null = Add-AzVirtualNetworkSubnetConfig `
        -Name           $Subnet_Name[$i] `
        -VirtualNetwork $Vnet `
        -AddressPrefix  $Subnet_Address[$i] `
        -WarningAction  SilentlyContinue | Set-AzVirtualNetwork
    Write-Output "`t`tSubnet is Created :- $($Subnet_Name[$i])`n"
}

#Creation of Virtual Network Peering
for ($i = 0; $i -lt $Vnet_Peer_Name.Count; $i++) {
    
    #Get Virtual Network
    $VnetA = Get-AzVirtualNetwork -Name $VnetA_Name[$i] -ResourceGroupName $VnetA_RG_Name[$i]

    #Get 2nd Virtual Network
    $VnetB = Get-AzVirtualNetwork -Name $VnetB_Name[$i] -ResourceGroupName $VnetB_RG_Name[$i]

    Write-Output "`t`tCreating Virtual Network Peering :- $($Vnet_Peer_Name[$i])"
    $null = Add-AzVirtualNetworkPeering `
        -Name $Vnet_Peer_Name[$i] `
        -VirtualNetwork $VnetA `
        -RemoteVirtualNetworkId $VnetB.Id
    Write-Output "`t`tVirtual Network Peering is Created :- $($Vnet_Peer_Name[$i])`n"
}