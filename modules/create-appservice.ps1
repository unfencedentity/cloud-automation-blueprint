<#
.SYNOPSIS
Creates an Azure App Service Plan and Web App using standard naming and tagging.

.DESCRIPTION
This script deploys a basic web application setup on Azure App Service,
following standardized naming and tagging for governance compliance.

.PARAMETER Env
Deployment environment (dev, test, prod)

.PARAMETER Region
Azure region short code (e.g. weu, neu, eus)

.PARAMETER AppName
Logical name of the application

.PARAMETER Location
Azure location (e.g. westeurope)

.EXAMPLE
.\create-appservice.ps1 -Env dev -Region weu -AppName portal -Location westeurope
#>

param(
    [ValidateSet("dev","test","prod")]
    [string]$Env = "dev",
    [ValidateSet("weu","neu","eus","wus")]
    [string]$Region = "weu",
    [string]$AppName = "portal",
    [string]$Location = "westeurope",
    [string]$Sku = "B1"
)

$rgName = "$Env-rg-$Region-$AppName"
$planName = "$Env-asp-$Region-$AppName"
$webAppName = "$Env-app-$Region-$AppName"

$tags = @{
    env        = $Env
    owner      = "lucian.s@cloudblueprint.local"
    costCenter = "CC1001"
    app        = "blueprint-$AppName"
    dataClass  = "internal"
}

Write-Host "Creating App Service Plan: $planName"
New-AzAppServicePlan `
  -Name $planName `
  -Location $Location `
  -ResourceGroupName $rgName `
  -Tier "Basic" `
  -NumberofWorkers 1 `
  -WorkerSize "Small" `
  -Tag $tags | Out-Null

Write-Host "Creating Web App: $webAppName"
New-AzWebApp `
  -Name $webAppName `
  -ResourceGroupName $rgName `
  -Location $Location `
  -AppServicePlan $planName `
  -Tag $tags | Out-Null

Write-Host "✅ Web App '$webAppName' created successfully in plan '$planName'."
