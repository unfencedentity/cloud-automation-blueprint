# Create App Service Module

## Overview
This module automates the creation of an Azure App Service Plan and Web App using standardized naming and tagging conventions.

## Example
./modules/create-appservice.ps1 -Env dev -Region weu -AppName portal -Location westeurope


## Naming Convention
{env}-asp-{region}-{app} → App Service Plan
{env}-app-{region}-{app} → Web App

Example:
- `dev-asp-weu-portal`
- `dev-app-weu-portal`

## Tagging Policy
| Tag | Example |
|------|----------|
| env | dev |
| owner | lucian.s@cloudblueprint.local |
| costCenter | CC1001 |
| app | blueprint-portal |
| dataClass | internal |

## Notes
- Default SKU: **Basic (B1)**  
- All resources inherit the same tags and region.  
- Ideal for demos, test environments, or internal tools.
