# Create Resource Group Module

## Overview
This module automates the creation of an Azure Resource Group using standardized naming and tagging conventions.

## Example
./modules/create-resource-group.ps1 -Env dev -Region weu -Name core -Location westeurope


## Naming Convention
{env}-rg-{region}-{name}

Example: `prod-rg-weu-core`

## Tagging Policy
| Tag | Example |
|------|----------|
| env | dev |
| owner | lucian.s@cloudblueprint.local |
| costCenter | CC1001 |
| app | blueprint-core |
| dataClass | internal |
