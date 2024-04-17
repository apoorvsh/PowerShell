#Calling parameter file
. .\RestoreManagedDatabaseParam.ps1

$null = Select-AzSubscription -SubscriptionId (Get-AzContext).Subscription.Id

#Restore SQL Instance
for ($i = 0; $i -lt $targetMiDbName.Count; $i++) {

    Write-Output "`t`tRestoring managed instance database"
    $null = Restore-AzSqlInstanceDatabase `
        -FromPointInTimeBackup `
        -ResourceGroupName          $rgName `
        -InstanceName               $sqlMiName[$i] `
        -Name                       $miDbName[$i] `
        -PointInTime                $time[$i] `
        -TargetInstanceDatabaseName $targetMiDbName[$i]

    Write-Output "`t`tManaged instance database is restored`n"
}