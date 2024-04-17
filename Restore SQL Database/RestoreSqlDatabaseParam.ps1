param (
    [Parameter(Mandatory = $false)] [string] $rgName = 'akspsRg1',
    [Parameter(Mandatory = $false)] [array] $sqlServerName = @('sqlServer54787'),
    [Parameter(Mandatory = $false)] [array] $sqlDbName = @('mydb1'),
    [Parameter(Mandatory = $false)] [array] $time = @('10/09/2021 08:46'),
    [Parameter(Mandatory = $false)] [array] $restoredDbName = @('restoreddb')
)