# cloud-automation-blueprint
A production-style Azure automation setup using PowerShell, governance, and CI workflows.


# Cloud Automation Blueprint

A complete Azure automation baseline using PowerShell and CI workflows.  
This repository showcases enterprise-style deployment, governance, and modular infrastructure automation.

## 🚀 Features
- End-to-end environment deploy (RG → Network → Storage → App Service)
- Policy-based governance (naming + tagging)
- Reusable PowerShell automation modules
- GitHub Actions integration
- ## Quickstart

**Local (dry-run):**
pwsh ./examples/deploy-full-environment.ps1 -Env dev -Region weu -AppName core -Location westeurope


**CI (this repo):**  
Every push to `main` runs:
- `Demo Deployment Validation (Dry-Run)` – executes modules on Windows & Ubuntu  
- `PowerShell Lint` – PSScriptAnalyzer quality gate


## 📁 Structure
| Folder | Description |
|---------|-------------|
| modules | Reusable automation scripts |
| examples | Demo deployments |
| workflows | GitHub Actions CI/CD workflows |
| docs | Architecture & usage documentation |

## 🧠 Skills Demonstrated
- Azure Resource Automation (PowerShell)
- Infrastructure Governance & RBAC
- CI/CD Workflows (GitHub Actions)
- Documentation & Technical Writing


A production-style **Azure automation** blueprint using PowerShell and GitHub Actions.  
It demonstrates real-world cloud practices: modular scripts, governance (naming & tags), and CI validation running on Windows and Ubuntu.


![Demo Deployment Validation](https://github.com/unfencedentity/cloud-automation-blueprint/actions/workflows/deploy-demo.yml/badge.svg)
![PowerShell Lint](https://github.com/unfencedentity/cloud-automation-blueprint/actions/workflows/lint.yml/badge.svg)
![Tested on Windows & Ubuntu](https://img.shields.io/badge/tested-Windows%20%7C%20Ubuntu-informational)
![PowerShell](https://img.shields.io/badge/PowerShell-Automation-blue)
