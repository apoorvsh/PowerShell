param (
    [Parameter(Mandatory = $false)] [string] $databricksRegion = 'canadacentral',
    [Parameter(Mandatory = $false)] [string] $cluster_create_condition = 'true',
    [Parameter(Mandatory = $false)] [string] $applicationId = '7675641d-9ce0-4756-a373-a251fc5d99c8',
    [Parameter(Mandatory = $false)] [string] $secret = 'pAu7Q~g1DwH.cYTIwYpoYWTMjC_XwEqix3TUw',
    [Parameter(Mandatory = $false)] [string] $rgName = 'aksdbrg',
    [Parameter(Mandatory = $false)] [string] $subscriptionId ='6fda6038-7704-4a6f-b545-a0bd54a99785',
    [Parameter(Mandatory = $false)] [array] $workspaceName = 'aksdb',
    [Parameter(Mandatory = $false)] [string] $tenantId = 'bc8c9c58-f77e-4153-9804-299c75615045',
    [Parameter(Mandatory = $false)] [int] $tokenLife = 36000,
    [Parameter(Mandatory = $false)] [string] $tokenCommentName = 'token',
    [Parameter(Mandatory = $false)] [string] $clusterName = 'cluster',
    [Parameter(Mandatory = $false)] [string] $sparkVersion = '8.3.x-scala2.12',
    [Parameter(Mandatory = $false)] [string] $clusterProfile = 'singleNode',
    [Parameter(Mandatory = $false)] [string] $sparkMaster = 'local[*]',
    [Parameter(Mandatory = $false)] [string] $resourceClass = 'SingleNode',
    [Parameter(Mandatory = $false)] [string] $nodeType = 'Standard_F4s',
    [Parameter(Mandatory = $false)] [int] $autoTerminationMinute = 120,
    [parameter(mandatory = $false)] [string] $principal = 'whoaks@astha1606outlook.onmicrosoft.com',
    [parameter(mandatory = $false)] [string] $permissionLevel = 'CAN_MANAGE',
    [parameter(mandatory = $false)] [string] $databricksObjectType = 'cluster',
    [parameter(mandatory = $false)] [string] $group = 'users'
)

if( $cluster_create_condition -eq $true ) {
Import-Module PowerShellGet -Force
Install-Module -Name azure.databricks.cicd.tools -RequiredVersion 2.2.4780 -Force

$rgName2 = $rgName.Split(',')
$workspaceName2 = $workspaceName.Split(',')
$principal2 = $principal.Split(',')

if($rgName2 -NotContains ',') {
    $rgName2 = @($rgName2)
    $workspaceName2 = @($workspaceName2)
    $principal2 = @($principal2)
}

#Add-Type -AssemblyName System.Web

for ($i = 0; $i -lt $workspaceName2.Count; $i++) {
    #Connect to Databricks using Service Principal
    Write-Output "`t`tConnecting to databricks workspace"
    $null = Connect-Databricks `
        -Region            $databricksRegion `
        -ApplicationId     $applicationId `
        -Secret            $secret `
        -ResourceGroupName $rgName2[$i] `
        -SubscriptionId    $subscriptionId `
        -WorkspaceName     $workspaceName2[$i] `
        -TenantId          $tenantId
    Write-Output "`t`tConnected to databricks workspace`n"

    #Create PAT token
    Write-Output "`t`tCreating PAT token"
    $token = New-DatabricksBearerToken `
        -LifetimeSeconds $tokenLife `
        -Comment         $tokenCommentName
    Write-Output "`t`tPAT token created`n"

    #Create Databricks Cluster
    Write-Output "`t`tCreating databricks cluster"
    $cluster = New-DatabricksCluster `
        -BearerToken            $token.token_value `
        -Region                 $databricksRegion `
        -ClusterName            $clusterName `
        -SparkVersion           $sparkVersion `
        -NodeType               $nodeType `
        -AutoTerminationMinutes $autoTerminationMinute `
        -Spark_conf @{
            "spark.databricks.cluster.profile" = $clusterProfile;
            "spark.master" = $sparkMaster } `
        -CustomTags @{
            "ResourceClass" = $resourceClass }

    Write-Output "`t`tAdding databricks users in Users group"
    $null = Add-DatabricksUser `
        -BearerToken $token.token_value `
        -Region      $databricksRegion `
        -Username    $principal2[$i] `
        -Groups $group
    Write-Output "`t`tUsers is added`n"

    Write-Output "`t`tSet Databricks Permissions"
    $null = Set-DatabricksPermission `
        -BearerToken          $token.token_value `
        -Region               $databricksRegion `
        -Principal            $principal2[$i] `
        -PermissionLevel      $permissionLevel `
        -DatabricksObjectType $databricksObjectType `
        -DatabricksObjectId   $cluster     
    Write-Output "`t`tDatabricks Permissions set`n"
}
}