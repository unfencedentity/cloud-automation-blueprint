<#
.SYNOPSIS
Creates an Azure Resource Group using standardized naming and tagging conventions.

.DESCRIPTION
This script demonstrates a simple, production-style approach to resource group creation.
It applies consistent naming and tagging aligned with enterprise governance policies.

.PARAMETER Env
Environment (dev, test, prod)

.PARAMETER Region
Azure region code (e.g. weu, neu, eus)

.PARAMETER Name
Logical name for the Resource Group

.PARAMETER Location
Azure location (e.g. westeurope)

.EXAMPLE
.\create-resource-group.ps1 -Env dev -Region weu -Name core -Location westeurope
#>

param(
    [ValidateSet("dev","test","prod")]
    [string]$Env = "dev",
    [ValidateSet("weu","neu","eus","wus")]
    [string]$Region = "weu",
    [string]$Name = "core",
    [string]$Location = "westeurope"
)

$rgName = "$Env-rg-$Region-$Name"

$tags = @{
    env        = $Env
    owner      = "lucian.s@cloudblueprint.local"
    costCenter = "CC1001"
    app        = "blueprint-$Name"
    dataClass  = "internal"
}

Write-Host "Creating Resource Group: $rgName in $Location"
New-AzResourceGroup -Name $rgName -Location $Location -Tag $tags | Out-Null
Write-Host "✅ Resource Group '$rgName' created successfully."
