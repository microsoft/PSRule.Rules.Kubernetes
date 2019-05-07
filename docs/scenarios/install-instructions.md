# Install instructions

## Prerequisites

A separate `PSRule` module is required for `PSRule.Rules.Kubernetes` to work. The required version will automatically be installed along-side `PSRule.Rules.Kubernetes` when using `Install-Module` or `Update-Module` cmdlets.

- Windows PowerShell 5.1 with .NET Framework 4.7.2+ or
- PowerShell Core 6.0 or greater on Windows, macOS and Linux

For a list of platforms that PowerShell Core is supported on [see](https://github.com/PowerShell/PowerShell#get-powershell).

## Getting the modules

Install from [PowerShell Gallery][psg] for all users (requires permissions)

```powershell
# Install PSRule module
Install-Module -Name 'PSRule.Rules.Kubernetes';
```

Install from [PowerShell Gallery][psg] for current user only

```powershell
# Install PSRule module
Install-Module -Name 'PSRule.Rules.Kubernetes' -Scope CurrentUser;
```

Save for offline use from PowerShell Gallery

```powershell
# Save PSRule module, in the .\modules directory
Save-Module -Name 'PSRule', 'PSRule.Rules.Kubernetes' -Path '.\modules';
```

> For pre-release versions the `-AllowPrerelease` switch must be added when calling `Install-Module` or `Save-Module`.

[psg]: https://www.powershellgallery.com/packages/PSRule.Rules.Kubernetes
