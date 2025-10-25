param(
  [ValidateSet("dev","test","prod")][string]$Env="dev",
  [ValidateSet("weu","neu","eus","wus")][string]$Region="weu",
  [string]$Name="core",
  [string]$Location="westeurope",
  [switch]$DryRun
)

$rgName = "$Env-rg-$Region-$Name"
$tags = @{
  env=$Env; owner="lucian.s@cloudblueprint.local"; costCenter="CC1001"; app="blueprint-$Name"; dataClass="internal"
}

if ($DryRun) {
  Write-Host "[DRY-RUN] Would create RG '$rgName' in $Location with tags:"
  $tags.GetEnumerator() | ForEach-Object { Write-Host " - $($_.Key): $($_.Value)" }
  return 0

}

New-AzResourceGroup -Name $rgName -Location $Location -Tag $tags | Out-Null
Write-Host "✅ Resource Group '$rgName' created."
