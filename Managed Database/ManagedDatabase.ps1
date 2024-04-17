#Calling parameter file
. .\ManagedDatabaseParam.ps1

#Create Instance database
for ($i = 0; $i -lt $miDbName.Count; $i++) {
    
    Write-Output "`t`tCreating Managed database:- $($miDbName[$i])"
    $null = New-AzSqlInstanceDatabase `
        -Name              $miDbName[$i]`
        -InstanceName      $sqlMiName[$i]`
        -ResourceGroupName $rgName `
        -Collation         $miDbCollation `
        -Tag               $miDbTags

    Write-Output "`t`tManaged database is created:- $($miDbName[$i])"
}