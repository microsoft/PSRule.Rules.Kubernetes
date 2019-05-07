#
# Unit tests for Kubernetes metadata rules
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

Describe 'Kubernetes.Metadata' {
    $testParams = @{
        Module = 'PSRule.Rules.Kubernetes'
        Option = Join-Path -Path $here -ChildPath ps-rule.yaml
        InputPath = Join-Path -Path $here -ChildPath Resources.Metadata.yaml
    }

    $result = Invoke-PSRule @testParams -WarningAction Ignore;

    Context 'Resource metadata' {
        It 'Kubernetes.Metadata' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Kubernetes.Metadata' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 2;
            $ruleResult.TargetName | Should -BeIn 'deployment-B', 'service-B';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 2;
            $ruleResult.TargetName | Should -BeIn 'deployment-A', 'service-A';
        }
    }
}
