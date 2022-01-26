# XmasDev2021

## Table of contents

* [Description](#Description)
* [Terraform backend on Azure](#TerraformBackendOnAzure)

## Description

Demo XmasDev 2021

## TerraformBackendOnAzure

The script ```Run-TerraformBackendOnAzure.ps1``` will configure the ```main.tf``` file to store Terraform states on Azure blob storage, it need as in input file the main Terraform file.

```Run-TerraformBackendOnAzure.ps1``` in the folder ```iac``` can be used like this ```Run-TerraformBackendOnAzure.ps1 -ResourcePrefix $prefix -AzRegion $azRegion -MainTerraformFileName .\main.tf```
This script is tested to be executed both on Windows or Linux or WSL, the only requirement is to have installed PowerShell >= 6.x [how to do it](https://docs.microsoft.com/powershell/scripting/install/installing-powershell)

Whitin an output like this:

![Main terraform within backend configuration - screenshot example](https://github.com/AngelusGi/PowerShell/blob/master/XmasDev2021/assets/terraformBackendOnAzure-screenshot.png?raw=true)
