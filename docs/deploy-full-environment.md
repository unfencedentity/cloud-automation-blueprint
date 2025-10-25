# Full Environment Deployment Example

## Overview
This example demonstrates how to deploy a complete Azure environment using the modules in this repository.

## Steps
1. Authenticate to Azure:
Connect-AzAccount

2. Run the example script:
./examples/deploy-full-environment.ps1 -Env dev -Region weu -AppName core -Location westeurope


## Modules Used
| Module | Description |
|----------|-------------|
| create-resource-group.ps1 | Creates the Resource Group |
| create-storage.ps1 | Creates the Storage Account |
| create-appservice.ps1 | Creates the App Service Plan and Web App |

## Output
- Resource Group: `dev-rg-weu-core`  
- Storage Account: auto-generated `stdevweucoreXYZ`  
- Web App: `dev-app-weu-core`
