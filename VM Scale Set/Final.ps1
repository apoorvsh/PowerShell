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
    $Firewall_Name,
    [Parameter()][hashtable]
    $Firewall_Tags,
    [Parameter()][array]
    $Firewall_Network_Rule_Name,
    [Parameter()][array]
    $Firewall_Network_Rule_Source_Address,
    [Parameter()][array]
    $Firewall_Network_Rule_Destination_Ports,
    [Parameter()][array]
    $Firewall_Network_Rule_Destination_Address,
    [Parameter()][array]
    $Firewall_Network_Rule_Protocol,
    [Parameter()][array]
    $Firewall_Network_Collection_Name,
    [Parameter()][array]
    $Firewall_Network_Collection_Priority,
    [Parameter()][array]
    $Firewall_Network_Collection_Action,
    [Parameter()][array]
    $Firewall_Application_Rule_Name,
    [Parameter()][array]
    $Firewall_Application_Rule_Source_Address,
    [Parameter()][array]
    $Firewall_Application_Rule_Target_FQDN,
    [Parameter()][array]
    $Firewall_Application_Rule_Protocol,
    [Parameter()][array]
    $Firewall_Application_Collection_Name,
    [Parameter()][array]
    $Firewall_Application_Collection_Priority,
    [Parameter()][array]
    $Firewall_Application_Collection_Action,
    [Parameter()][array]
    $Firewall_NAT_Rule_Name,
    [Parameter()][array]
    $Firewall_NAT_Rule_Source_Address,
    [Parameter()][array]
    $Firewall_NAT_Rule_Destination_Port,
    [Parameter()][array]
    $Firewall_NAT_Rule_Translated_Address,
    [Parameter()][array]
    $Firewall_NAT_Rule_Translated_Port,
    [Parameter()][array]
    $Firewall_NAT_Rule_Protocol,
    [Parameter()][array]
    $Firewall_NAT_Collection_Name,
    [Parameter()][array]
    $Firewall_NAT_Collection_Priority
)

$RG_Name     = 'Aks-RG'
$RG_Location = 'EastUS'
$RG_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "RG"
}

$Vnet_Name    = @('Vnet-1')
$Vnet_Address = @('10.10.0.0/16')
$Vnet_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "VNet"
}

$Vnet_Subnet_Name = @('Vnet-1')
$Subnet_Name      = @('AzureFirewallSubnet')
$Subnet_Address   = @('10.10.0.0/24')

$Public_IP_Allocation = @('Static')
$Public_IP_Name       = @('IP-1')
$Public_IP_SKU        = @('Standard')
$Public_IP_Tags = @{
    "Env"  = "Testing" ;
    "Name" = "Public-IP"
}

$Firewall_Name    = @('az-firewall')
$Firewall_IP_Name = @('IP-1')
$Firewall_Tags = @{
    "Env"  = "Testing"
    "Name" = "Firewall"
}

$Firewall_Network_Rule_Name                = @('rule-1')
$Firewall_Network_Rule_Source_Address      = @('10.10.0.0/16')
$Firewall_Network_Rule_Destination_Ports   = @('53')
$Firewall_Network_Rule_Destination_Address = @('8.8.8.8')
$Firewall_Network_Rule_Protocol            = @('TCP')
$Firewall_Network_Collection_Name          = @('firewall-network-rule')
$Firewall_Network_Collection_Priority      = @(100)
$Firewall_Network_Collection_Action        = @('Allow')



$Firewall_Application_Rule_Name           = @('app-rule-1')
$Firewall_Application_Rule_Source_Address = @('10.10.0.0/16')
$Firewall_Application_Rule_Target_FQDN    = @('*.google.com')
$Firewall_Application_Rule_Protocol       = @('https:443')
$Firewall_Application_Collection_Name     = @('firewall-application-rule')
$Firewall_Application_Collection_Priority = @(200)
$Firewall_Application_Collection_Action   = @('Allow')


$Firewall_NAT_Rule_Name               = @('nat-rule-1')
$Firewall_NAT_Rule_Source_Address     = @('10.10.0.0/16')
$Firewall_IP_Name                     = @('IP-1')
$Firewall_NAT_Rule_Destination_Port   = @('53')
$Firewall_NAT_Rule_Translated_Address = @('8.8.8.8')
$Firewall_NAT_Rule_Translated_Port    = @(53)
$Firewall_NAT_Rule_Protocol           = @('TCP')
$Firewall_NAT_Collection_Name         = @('firewall-nat-rule')
$Firewall_NAT_Collection_Priority     = @(300)


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


#Creation of Subnet
for ($i = 0; $i -lt $Subnet_Name.Count; $i++) {
    
    #Retrieve Information about Virtual Network
    $Vnet = Get-AzVirtualNetwork -Name $Vnet_Subnet_Name[$i] -ResourceGroupName $RG_Name
    
    Write-Output "`t`tCreating Subnet :-$($Subnet_Name[$i])"
    $null = Add-AzVirtualNetworkSubnetConfig `
        -Name           $Subnet_Name[$i] `
        -VirtualNetwork $Vnet `
        -AddressPrefix  $Subnet_Address[$i] `
        -WarningAction  SilentlyContinue | Set-AzVirtualNetwork
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

#Creation of Firewall
for ($i = 0; $i -lt $Firewall_Name.Count; $i++) {

    Write-Output "`t`tCreating Azure Firewall :- $($Firewall_Name[$i])"
    $null = New-AzFirewall `
        -Name               $Firewall_Name[$i] `
        -ResourceGroupName  $RG_Name `
        -Location           $RG_Location `
        -VirtualNetworkName $Vnet_Name[$i] `
        -PublicIpName       $Firewall_IP_Name[$i] `
        -Tag                $Firewall_Tags `
        -WarningAction      SilentlyContinue
    Write-Output "`t`tAzure Firewall is Created :- $($Firewall_Name[$i])`n"
}

#Creation of Firewall Network Rule
for ($i = 0; $i -lt $Firewall_Network_Rule_Name.Count; $i++) {
    
    Write-Output "`t`tCreating Firewall Network Rule :- $($Firewall_Network_Rule_Name[$i])"
    $networkrule = New-AzFirewallNetworkRule `
        -Name               $Firewall_Network_Rule_Name[$i] `
        -SourceAddress      $Firewall_Network_Rule_Source_Address[$i] `
        -DestinationPort    $Firewall_Network_Rule_Destination_Ports[$i] `
        -DestinationAddress $Firewall_Network_Rule_Destination_Address[$i] `
        -Protocol           $Firewall_Network_Rule_Protocol[$i]
    Write-Output "`t`tFirewall Network rule is created :- $($Firewall_Network_Rule_Name[$i])`n"

    
    Write-Output "`t`tCreating Firewall Network Collection :- $($Firewall_Network_Collection_Name[$i])"
    $NetworkRuleCollection = New-AzFirewallNetworkRuleCollection `
        -Name       $Firewall_Network_Collection_Name[$i] `
        -Priority   $Firewall_Network_Collection_Priority[$i] `
        -Rule       $networkrule `
        -ActionType $Firewall_Network_Collection_Action[$i]
    Write-Output "`t`tFirewall Network Collection is Created :- $($Firewall_Network_Collection_Name[$i])`n"

    #Get Azure Firewall
    $Firewall = Get-AzFirewall -Name $Firewall_Name[$i] -ResourceGroupName $RG_Name

    #Apply Firewall rule
    Write-Output "`t`tAdding Collection of Firewall Network Rules"  
    $Firewall.NetworkRuleCollections.Add($NetworkRuleCollection)
    $null = Set-AzFirewall -AzureFirewall $Firewall
    Write-Output "`t`tCollection of Firewall Network rules is added`n"
}

#Creation of Firewall Application Rule
for ($i = 0; $i -lt $Firewall_Application_Rule_Name.Count; $i++) {
    
    Write-Output "`t`tCreating Firewall Application Rule :- $($Firewall_Application_Rule_Name[$i])"
    $apprule = New-AzFirewallApplicationRule `
        -Name $Firewall_Application_Rule_Name[$i] `
        -SourceAddress $Firewall_Application_Rule_Source_Address[$i] `
        -TargetFqdn    $Firewall_Application_Rule_Target_FQDN[$i] `
        -Protocol      $Firewall_Application_Rule_Protocol[$i]
    Write-Output "`t`tFirewall Application rule is created :- $($Firewall_Application_Rule_Name[$i])`n"

    Write-Output "`t`tCreating Firewall Application Collection :- $($Firewall_Application_Collection_Name[$i])"
    $AppRuleCollection = New-AzFirewallApplicationRuleCollection `
        -Name       $Firewall_Application_Collection_Name[$i] `
        -Priority   $Firewall_Application_Collection_Priority[$i] `
        -ActionType $Firewall_Application_Collection_Action[$i] `
        -Rule       $apprule
    Write-Output "`t`tFirewall Application Collection is Created :- $($Firewall_Application_Collection_Name[$i])`n"

    #Get Azure Firewall
    $Firewall = Get-AzFirewall -Name $Firewall_Name[$i] -ResourceGroupName $RG_Name

    #Apply Firewall rule
    Write-Output "`t`tAdding Collection of Firewall Application Rules"
    $Firewall.ApplicationRuleCollections.Add($AppRuleCollection)
    $null = Set-AzFirewall -AzureFirewall $Firewall
    Write-Output "`t`tCollection of firewall application rules is added`n"
}

#Creation of Firewall NAT Rule
for ($i = 0; $i -lt $Firewall_NAT_Rule_Name.Count; $i++) {

    #Get Public IP Address
    $IP = Get-AzPublicIpAddress -Name $Firewall_IP_Name[$i] -ResourceGroupName $RG_Name
    
    Write-Output "`t`tCreating Firewall NAT rule :- $($Firewall_NAT_Rule_Name[$i])"
    $natrule = New-AzFirewallNatRule `
        -Name               $Firewall_NAT_Rule_Name[$i] `
        -SourceAddress      $Firewall_NAT_Rule_Source_Address[$i] `
        -DestinationAddress $IP.IpAddress `
        -DestinationPort    $Firewall_NAT_Rule_Destination_Port[$i] `
        -TranslatedAddress  $Firewall_NAT_Rule_Translated_Address[$i] `
        -TranslatedPort     $Firewall_NAT_Rule_Translated_Port[$i] `
        -Protocol           $Firewall_NAT_Rule_Protocol[$i]
    Write-Output "`t`tFirewall NAT Rule is created :- $($Firewall_NAT_Rule_Name[$i])`n"

    Write-Output "`t`tCreating Firewall NAT Collection :- $($Firewall_NAT_Collection_Name[$i])"
    $NatRuleCollection = New-AzFirewallNatRuleCollection `
        -Name     $Firewall_NAT_Collection_Name[$i] `
        -Priority $Firewall_NAT_Collection_Priority[$i] `
        -Rule     $natrule
    Write-Output "`t`tFirewall NAT Collection is created :- $($Firewall_NAT_Collection_Name[$i])`n"

    #Get Azure Firewall
    $Firewall = Get-AzFirewall -Name $Firewall_Name[$i] -ResourceGroupName $RG_Name

    #Apply Firewall rule
    Write-Output "`t`tAdding Collection of Firewall NAT Rules"
    $Firewall.NatRuleCollections.Add($NatRuleCollection)
    $null = Set-AzFirewall -AzureFirewall $Firewall
    Write-Output "`t`tCollection of NAT Rules is added`n"
}