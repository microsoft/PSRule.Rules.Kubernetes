#
# Unit tests for Kubernetes AKS rules
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

Describe 'Kubernetes.AKS' {
    $testParams = @{
        Module = 'PSRule.Rules.Kubernetes'
        Option = Join-Path -Path $here -ChildPath ps-rule.yaml
        InputPath = Join-Path -Path $here -ChildPath Resources.AKS.yaml
    }

    $result = Invoke-PSRule @testParams -WarningAction Ignore;

    Context 'Security' {
        It 'Kubernetes.AKS.PublicLoadBalancer' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Kubernetes.AKS.PublicLoadBalancer' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -Be 'service-B';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -Be 'service-A';
        }
    }
}
