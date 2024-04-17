#Calling Parameter file
. .\RestoreSqlDatabaseParam.ps1

#Restore SQL Database
for ($i = 0; $i -lt $restoredDbName.Count; $i++) {

    #Get SQL Database
    $db= Get-AzSqlDatabase -DatabaseName $sqlDbName[$i] -ServerName $sqlServerName[$i] -ResourceGroupName $rgName

    $date = [datetime]::parseexact($time[$i],'dd/MM/yyyy HH:mm',$null)

    Write-Output "`t`tRestoring SQL Database"
    $null = Restore-AzSqlDatabase `
        -FromPointInTimeBackup `
        -PointInTime        $date `
        -ResourceId         $db.ResourceId `
        -ServerName         $sqlServerName[$i] `
        -TargetDatabaseName $restoredDbName[$i] `
        -ResourceGroupName  $rgName

    Write-Output "`t`tSQL database is restored`n"
}