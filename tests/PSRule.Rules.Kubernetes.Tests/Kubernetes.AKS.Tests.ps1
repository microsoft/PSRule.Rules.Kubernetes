# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#
# Unit tests for Kubernetes AKS rules
#

[CmdletBinding()]
param ()

BeforeAll {
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
}

Describe 'Kubernetes.AKS' {
    BeforeAll {
        $testParams = @{
            Module = 'PSRule.Rules.Kubernetes'
            InputPath = Join-Path -Path $here -ChildPath Resources.AKS.yaml
            Baseline = 'AKS'
        }

        $result = Invoke-PSRule @testParams -WarningAction Ignore;
    }

    Context 'Security' {
        It 'Kubernetes.AKS.PublicLB' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Kubernetes.AKS.PublicLB' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -Be 'service/service-B';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 2;
            $ruleResult.TargetName | Should -BeIn 'service/service-A', 'service/service-C';
        }
    }
}
