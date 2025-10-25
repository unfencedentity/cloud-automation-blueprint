param(
  [ValidateSet("dev","test","prod")][string]$Env="dev",
  [ValidateSet("weu","neu","eus","wus")][string]$Region="weu",
  [string]$AppName="portal",
  [string]$Location="westeurope",
  [string]$Sku="B1",
  [switch]$DryRun
)

$rgName    = "$Env-rg-$Region-$AppName"
$planName  = "$Env-asp-$Region-$AppName"
$webApp    = "$Env-app-$Region-$AppName"
$tags = @{
  env=$Env; owner="lucian.s@cloudblueprint.local"; costCenter="CC1001"; app="blueprint-$AppName"; dataClass="internal"
}

if ($DryRun) {
  Write-Host "[DRY-RUN] Would create App Service Plan '$planName' and Web App '$webApp' in $Location (RG: $rgName) with tags:"
  $tags.GetEnumerator() | ForEach-Object { Write-Host " - $($_.Key): $($_.Value)" }
  exit 0
}

New-AzAppServicePlan -Name $planName -Location $Location -ResourceGroupName $rgName -Tier "Basic" -NumberofWorkers 1 -WorkerSize "Small" -Tag $tags | Out-Null
New-AzWebApp -Name $webApp -ResourceGroupName $rgName -Location $Location -AppServicePlan $planName -Tag $tags | Out-Null
Write-Host "✅ Web App '$webApp' created in plan '$planName'."
