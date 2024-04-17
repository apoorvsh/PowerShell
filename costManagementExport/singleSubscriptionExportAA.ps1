param(
    [parameter(Mandatory = $false)] [string] $connectionName              = 'AzureRunAsConnection',
    [parameter(Mandatory = $false)] [string] $cmScope                     = 'subscriptions/01ce3075-23cc-4058-9df8-b6888684a736',
    [parameter(Mandatory = $false)] [string] $cmName                      = 'export1',
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

$TenantId = $Connection.TenantId
$ApplicationId = $Connection.ApplicationID
$CertificateThumbprint = $Connection.CertificateThumbprint

#Connect to Azure using credentials
Write-Output "`t`tConnecting to Azure....."
$null = Connect-AzAccount -TenantId $TenantId -ApplicationID $ApplicationId -CertificateThumbprint $CertificateThumbprint
Write-Output "`t`tConnected to Azure`n"

#Get Storage ID
$storageID = (Get-AzStorageAccount `
    -ResourceGroupName $storageRgName `
    -Name $storageName).Id


#Code To Export Cost Management 
Write-Output "`t`tCost Management Export creation in progress"
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
Write-Output "`t`tCost Management exporting to storage account"
Invoke-AzCostManagementExecuteExport -ExportName $cmName -Scope $cmScope
Write-Output "`t`tCost Management exported to storage account"