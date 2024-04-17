$SynpaseWSName = "ak2synswkpmgcadwpoc01" #Name of Synapse Workspace
$SqlPoolName   = "syndwkpmgcapoc1" # Name of Synapse Dedicated Pool

# Get the Connection Properties
$Connection = Get-AutomationConnection -Name "AzureRunAsConnection"

$TenantId = $Connection.TenantId
$ApplicationId = $Connection.ApplicationID
$CertificateThumbprint = $Connection.CertificateThumbprint

# Log-in to Azure
$null = Connect-AzAccount -ServicePrincipal -TenantId $TenantId -ApplicationID $ApplicationId -CertificateThumbprint $CertificateThumbprint

foreach($Pool in $SqlPoolName)
{
    Write-Output "Resuming $($Pool) in $($SynpaseWSName) Synapse Workspace"
    Resume-AzSynapseSqlPool -WorkspaceName $SynpaseWSName -Name $Pool
    Write-Output "$($Pool) is Started in $($SynpaseWSName) Synapse Workspace"
}

Write-Output "Done"
