$azRegion = 'northeurope'
$prefix = 'xmasdev2021'

.\Run-TerraformBackendOnAzure.ps1 -ResourcePrefix $prefix -AzRegion $azRegion -AzTag $tags -OutputFilePath (Split-Path (get-location).path)
