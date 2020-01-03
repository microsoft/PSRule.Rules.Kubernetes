#
# Unit tests for PSRule rule quality
#

[CmdletBinding()]
param (

)

# Setup error handling
$ErrorActionPreference = 'Stop';
Set-StrictMode -Version latest;

if ($Env:SYSTEM_DEBUG -eq 'true') {
    $VerbosePreference = 'Continue';
}

# Setup tests paths
$rootPath = $PWD;
Import-Module (Join-Path -Path $rootPath -ChildPath out/modules/PSRule.Rules.Kubernetes) -Force;
$here = (Resolve-Path $PSScriptRoot).Path;

Describe 'Rule quality' {
    $rules = Get-PSRule -Module PSRule.Rules.Kubernetes -WarningAction Ignore;

    Context 'Naming' {
        foreach ($rule in $rules) {
            It $rule.RuleName {
                $rule.RuleName.Length -le 35 | Should -Be $True;
            }
        }
    }

    Context 'Metadata' {
        foreach ($rule in $rules) {
            It $rule.RuleName {
                $rule.Synopsis | Should -Not -BeNullOrEmpty;
                $rule.Description | Should -Not -BeNullOrEmpty;
                $rule.Info.Annotations.category | Should -Not -BeNullOrEmpty;
                $rule.Info.Annotations.severity | Should -Not -BeNullOrEmpty;
                $rule.Info.GetOnlineHelpUri()  | Should -Not -BeNullOrEmpty;
            }
        }
    }
}
