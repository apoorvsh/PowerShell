$subscriptionId = '4edc813d-bed1-4b19-a709-c856626dee70'
$bpDefinitionName = 'Hanover_CoreDataServices_BP'
$bpDefinitionPublishedVersion = '1.0'
$bpAssignmentName = 'Hanover_CoreDataServices_BP_nonProd_Assign'
$bpLocation = 'eastus2'

Connect-AzAccount
Set-AzContext -Subscription $subscriptionId

Import-AzBlueprintWithArtifact -Name $bpDefinitionName -InputPath . -Force

$bp = Get-AzBlueprint -Name $bpDefinitionName

Publish-AzBlueprint -Version $bpDefinitionPublishedVersion -Blueprint $bp

$publishedBlueprint = Get-AzBlueprint -Name $bpDefinitionName -LatestPublished

New-AzBlueprintAssignment -Name $bpAssignmentName -Blueprint $publishedBlueprint -AssignmentFile .\AssignmentFiles\nonprod.json