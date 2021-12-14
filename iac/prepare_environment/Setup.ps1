$azRegion = 'northeurope'
$prefix = 'XmasDev'
$upperPath = Split-Path (Get-Location)
$mainPath = "$upperPath\main.tf"
$tags += @{Location = $azRegion }
$tags += @{Project = $prefix }
$tags += @{IaC = 'Terraform' }
$tags += @{Tool = 'PowerShell' }
$tags

.\Set-TerraformBackendOnAzure.ps1 -ResourcePrefix $prefix -MainFilePath $mainPath -OutputFilePath $mainPath -AzSub '00f8e5cf-5740-4b15-8496-ca3964e0d9b1' -AzRegion $azRegion -AzTag $tags