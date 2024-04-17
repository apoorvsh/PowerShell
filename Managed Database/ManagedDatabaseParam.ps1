param (
    [Parameter(Mandatory = $false)] [string] $rgName = 'sqlmirgtest',
    [Parameter(Mandatory = $false)] [array] $sqlMiName = @('sqlmi26849'),
    [Parameter(Mandatory = $false)] [array] $miDbName = @('miDb'),
    [Parameter(Mandatory = $false)] [string] $miDbCollation = 'SQL_Latin1_General_CP1_CI_AS',
    [Parameter(Mandatory = $false)] [hashtable] $miDbTags = @{Env = "Testing"; Name= "RG"}
)