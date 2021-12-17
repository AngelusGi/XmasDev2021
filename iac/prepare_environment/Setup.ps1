$azRegion = 'northeurope'
$prefix = 'xmasdev21agv'

.\Run-TerraformBackendOnAzure.ps1 -ResourcePrefix $prefix -AzRegion $azRegion -AzTag $tags -OutputFilePath (Split-Path (get-location).path)
