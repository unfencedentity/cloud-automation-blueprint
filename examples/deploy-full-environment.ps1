<#
.SYNOPSIS
Deploys a full Azure environment using the modules in this repository.

.DESCRIPTION
This example script runs the resource group, storage account, and app service creation modules
to demonstrate a complete end-to-end deployment in Azure.

.EXAMPLE
.\deploy-full-environment.ps1 -Env dev -Region weu -AppName core -Location westeurope
#>

param(
    [ValidateSet("dev","test","prod")]
    [string]$Env = "dev",
    [ValidateSet("weu","neu","eus","wus")]
    [string]$Region = "weu",
    [string]$AppName = "core",
    [string]$Location = "westeurope"
)

$base = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "🚀 Starting full environment deployment ($Env - $AppName - $Region)" -ForegroundColor Cyan

& "$base/../modules/create-resource-group.ps1" -Env $Env -Region $Region -Name $AppName -Location $Location
& "$base/../modules/create-storage.ps1" -Env $Env -Region $Region -AppName $AppName -Location $Location
& "$base/../modules/create-appservice.ps1" -Env $Env -Region $Region -AppName $AppName -Location $Location

Write-Host "✅ Environment '$Env-$AppName' deployed successfully." -ForegroundColor Green
