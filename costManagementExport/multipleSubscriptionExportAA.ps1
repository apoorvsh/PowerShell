param(
    [parameter(Mandatory = $false)] [string] $cmScope,
    [parameter(Mandatory = $false)] [string] $connectionName              = 'AzureRunAsConnection',
    [parameter(Mandatory = $false)] [string] $cmFormat                    = "csv",
    [parameter(Mandatory = $false)] [string] $storageConatinerName        = 'test',
    [parameter(Mandatory = $false)] [string] $storageRgName               = 'Akash-RG',
    [parameter(Mandatory = $false)] [string] $storageName                 = 'adlsstorage9726',
    [parameter(Mandatory = $false)] [string] $cmDefinitionType            = 'Usage'  ,
    [parameter(Mandatory = $false)] [string] $cmDestinationTimeFrame      = 'MonthToDate' ,
    [parameter(Mandatory = $false)] [string] $cmScheduleRecurrence        = 'Daily',
    [parameter(Mandatory = $false)] [string] $cmRecurrenecPeriodFrom      = '2022-02-04T00:00:00Z',
    [parameter(Mandatory = $false)] [string] $cmRecurrencePeriodTo        ='2022-02-28T00:00:00Z' ,
    [parameter(Mandatory = $false)] [string] $cmScheduleStatus            = 'Active',
    [parameter(Mandatory = $false)] [string] $cmDestinationRootFolderPath = 'mydirectory'
)


#Get Connection details
$Connection = Get-AutomationConnection -Name $connectionName

$TenantId= $Connection.TenantId
$ApplicationId= $Connection.ApplicationID
$CertificateThumbprint= $Connection.CertificateThumbprint

#Connect to Azure using credentials
Write-Output "`t`tConnecting to Azure....."
$null = Connect-AzAccount -TenantId $TenantId -ApplicationID $ApplicationId -CertificateThumbprint $CertificateThumbprint
Write-Output "`t`tConnected to Azure`n"

#Get Subscriptions in a tenant
$subs = Get-AzSubscription -TenantId $TenantId

#Get Storage ID
$storageID = (Get-AzStorageAccount `
    -ResourceGroupName $storageRgName `
    -Name $storageName).Id


for ($i = 0; $i -lt $subs.Count; $i++) {

    #Set Subscriptions scope
    $cmScope='subscriptions/'+$subs.Id[$i]

    #Set Cost Management Export Name concating subscription ID to respective subscription.
    $cmName='export-'+$($subs.Id[$i])

    #Code To Export Cost Management 
    Write-Output "`t`tCost Management Export creation in progress for Subscription:- $($subs.Name[$i])"
    $null = New-AzCostManagementExport `
        -Scope                     $cmScope `
        -Name                      $cmName `
        -Format                    $cmFormat `
        -DestinationContainer      $storageConatinerName `
        -DestinationResourceId     $storageID `
        -DefinitionType            $cmDefinitionType `
        -DefinitionTimeframe       $cmDestinationTimeFrame `
        -ScheduleRecurrence        $cmScheduleRecurrence `
        -RecurrencePeriodFrom      $cmRecurrenecPeriodFrom `
        -RecurrencePeriodTo        $cmRecurrencePeriodTo `
        -ScheduleStatus            $cmScheduleStatus  `
        -DestinationRootFolderPath $cmDestinationRootFolderPath 
    Write-Output "`t`tCost Management Export is created`n"

    #Export Cost Management 
    Write-Output "`t`tCost Management exporting to storage account, Subscription:- $($subs.Name[$i])"
    Invoke-AzCostManagementExecuteExport -ExportName $cmName -Scope $cmScope
    Write-Output "`t`tCost Management exported to storage account`n"
}