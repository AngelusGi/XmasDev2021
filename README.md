# XmasDev2021

## Table of contents

* [Description](#Description)
* [Requirements](#Requirements)
* [How to](#HowTo)
* [Terraform backend on Azure](#TerraformBackendOnAzure)
* [Demo Architecture](#Architecture)
* [Terraform variables](#Variables)
* [Execution Note](#ExecutionNote)

## Description

Demo XmasDev 2021

## Requirements

* Azure AD tenant and Azure AD user within at least "__Application Administrator__" role [Microsoft Docs - How to](https://docs.microsoft.com/azure/active-directory/roles/permissions-reference#all-roles)
* Azure subscription [Microsoft Docs - How to](https://docs.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/initial-subscriptions)
* Azure DevOps organization [Microsoft Docs - How to](https://docs.microsoft.com/azure/devops/organizations/accounts/create-organization?view=azure-devops)
* Terraform version >= 1.0.0
* PowerShell (Core) >= 6.0.0
* GitHub token: "__code read-only__" (used to import in Azure DevOps Repos the GitHub repository containing the Docker container solution).
* Azure DevOps personal access token as "__full access__" (used to create resources in Azure DevOps).

## HowTo

* first step: lunch PowerShell script to setup terraform backend on Azure ([see more](#TerraformBackendOnAzure))

* second step: ```terraform init``` and ```terraform plan -out=stage1``` and ```terraform apply stage1```. this step will setup your Azure AD creating a service principal. To deploy this stage, please comment "az" and "az_devops" module in terraform main file ("aad" and "data" modules will remain uncommented).

* thrid step: ```terraform init``` and ```terraform plan -out=stage2``` and ```terraform apply stage2```. This step will create all needed Azure infrastructure ([see architecture](#Architecture).  To deploy this stage, please comment "az_devops" module in terraform main file ("aad", "data", "az" modules will remain uncommented).

* fourth step: ```terraform init``` and ```terraform plan -out=stage3``` and ```terraform apply stage3```. This step will create nearly all Azure DevOps infrastructure (only resources not covered by the actual version of Azure DevOps provider in Terraform are: ServiceHook and Agent Pool).  To deploy this stage, please comment "az_devops" module in terraform main file ("aad", "data", "az" modules will remain uncommented).

## TerraformBackendOnAzure

The script ```Run-TerraformBackendOnAzure.ps1``` will configure the ```main.tf``` file to store Terraform states on Azure blob storage, it need as in input file the main Terraform file.
<br /><br />
```Run-TerraformBackendOnAzure.ps1``` in the folder ```iac``` can be used like this: <br /> ```Run-TerraformBackendOnAzure.ps1 -ResourcePrefix "XmasDev21demo" -AzRegion "northeurope" -MainTerraformFileName .\main.tf```
<br /><br />

Whitin an output like this:

![Main terraform within backend configuration - screenshot example](https://github.com/AngelusGi/XmasDev2021/blob/master/assets/terraformBackendOnAzure-screenshot.png?raw=true)

## Variables

Following an example of the Terraform input variables:
```variables example```

## Architecture

![Solution architecture](https://github.com/AngelusGi/XmasDev2021/blob/master/assets/architecture.png?raw=true)

___

## ExecutionNote

This script is tested to be executed both on Windows or Linux or WSL, the only requirement is to have installed PowerShell >= 6.x [how to do it](https://docs.microsoft.com/powershell/scripting/install/installing-powershell)
