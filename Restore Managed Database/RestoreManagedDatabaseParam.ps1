param (
    [Parameter(Mandatory = $false)] [string] $rgName = 'sqlmirgtest',
    [Parameter(Mandatory = $false)] [array] $sqlMiName = @('sqlmi26849'),
    [Parameter(Mandatory = $false)] [array] $miDbName = @('midb'),
    [Parameter(Mandatory = $false)] [array] $time = @('2021-09-10T08:11:00Z'),
    [Parameter(Mandatory = $false)] [array] $targetMiDbName = @('targetmidb')
)