# Create Storage Account Module

## Overview
This module automates the deployment of Azure Storage Accounts using standardized naming and tagging.

## Example
./modules/create-storage.ps1 -Env dev -Region weu -AppName core -Location westeurope


## Naming Convention
Storage account names follow this pattern:
st{env}{region}{app}{rand}

Example: `stdevweucoreabc`

## Tagging Policy
| Tag | Example |
|------|----------|
| env | dev |
| owner | lucian.s@cloudblueprint.local |
| costCenter | CC1001 |
| app | blueprint-core |
| dataClass | internal |

## Notes
- Maximum length: 24 characters  
- Must be lowercase, no hyphens  
- Adds random suffix to ensure global uniqueness
