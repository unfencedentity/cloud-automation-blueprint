param(
  [ValidateSet("dev","test","prod")][string]$Env="dev",
  [ValidateSet("weu","neu","eus","wus")][string]$Region="weu",
  [string]$AppName="core",
  [string]$Location="westeurope",
  [string]$SkuName="Standard_LRS",
  [switch]$DryRun
)

$rand   = -join ((48..57 + 97..122) | Get-Random -Count 3 | ForEach-Object {[char]$_})
$saName = ("st{0}{1}{2}{3}" -f $Env,$Region,$AppName,$rand).ToLower() -replace "[^a-z0-9]",""
if ($saName.Length -gt 24) { $saName = $saName.Substring(0,24) }

$rgName = "$Env-rg-$Region-$AppName"
$tags = @{
  env=$Env; owner="lucian.s@cloudblueprint.local"; costCenter="CC1001"; app="blueprint-$AppName"; dataClass="internal"
}

if ($DryRun) {
  Write-Host "[DRY-RUN] Would create Storage Account '$saName' in $Location (RG: $rgName, SKU: $SkuName) with tags:"
  $tags.GetEnumerator() | ForEach-Object { Write-Host " - $($_.Key): $($_.Value)" }
  exit 0
}

New-AzStorageAccount `
  -Name $saName `
  -ResourceGroupName $rgName `
  -Location $Location `
  -SkuName $SkuName `
  -Kind "StorageV2" `
  -EnableHttpsTrafficOnly $true `
  -Tag $tags | Out-Null

Write-Host "✅ Storage Account '$saName' created."
