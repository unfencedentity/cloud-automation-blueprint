<#
.SYNOPSIS
Creates an Azure Storage Account with standardized naming and tagging.

.DESCRIPTION
This script automates the creation of a Storage Account that follows
enterprise naming and tagging conventions, ensuring compliance and consistency.

.PARAMETER Env
Deployment environment (dev, test, prod)

.PARAMETER Region
Azure region short code (e.g. weu, neu, eus)

.PARAMETER AppName
Logical name for the application

.PARAMETER Location
Azure location (e.g. westeurope)

.EXAMPLE
.\create-storage.ps1 -Env dev -Region weu -AppName core -Location westeurope
#>

param(
    [ValidateSet("dev","test","prod")]
    [string]$Env = "dev",
    [ValidateSet("weu","neu","eus","wus")]
    [string]$Region = "weu",
    [string]$AppName = "core",
    [string]$Location = "westeurope",
    [string]$SkuName = "Standard_LRS"
)

# Construct Storage Account name (must be lowercase, 3-24 chars, no hyphens)
$rand   = -join ((48..57 + 97..122) | Get-Random -Count 3 | % {[char]$_})
$saName = ("st{0}{1}{2}{3}" -f $Env, $Region, $AppName, $rand).ToLower() -replace "[^a-z0-9]", ""
if ($saName.Length -gt 24) { $saName = $saName.Substring(0,24) }

$rgName = "$Env-rg-$Region-$AppName"

$tags = @{
    env        = $Env
    owner      = "lucian.s@cloudblueprint.local"
    costCenter = "CC1001"
    app        = "blueprint-$AppName"
    dataClass  = "internal"
}

Write-Host "Creating Storage Account: $saName in $Location"
New-AzStorageAccount `
  -Name $saName `
  -ResourceGroupName $rgName `
  -Location $Location `
  -SkuName $SkuName `
  -Kind "StorageV2" `
  -EnableHttpsTrafficOnly $true `
  -Tag $tags | Out-Null

Write-Host "✅ Storage Account '$saName' created successfully in $Location"
