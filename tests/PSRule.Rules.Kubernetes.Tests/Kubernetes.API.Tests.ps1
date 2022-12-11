# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#
# Unit tests for Kubernetes resource rules
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

Describe 'Kubernetes.API' {
    BeforeAll {
        $testParams = @{
            Module = 'PSRule.Rules.Kubernetes'
            Option = Join-Path -Path $here -ChildPath ps-rule.yaml
            InputPath = Join-Path -Path $here -ChildPath Resources.API.yaml
        }

        $result = Invoke-PSRule @testParams -WarningAction Ignore;
    }

    Context 'API' {
        It 'Kubernetes.API.v1.16' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Kubernetes.API.v1.16' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -Be 'Deployment/deployment-B';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -Be 'Deployment/deployment-A';
        }

        It 'Kubernetes.API.v1.17' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Kubernetes.API.v1.17' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -Be 'PriorityClass/priority-B';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -Be 'PriorityClass/priority-A';
        }

        It 'Kubernetes.API.v1.20' {
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'Kubernetes.API.v1.20' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 5;
            $ruleResult.TargetName | Should -BeIn 'Ingress/ingress-A', 'ClusterRole/clusterRole-B', 'Role/role-B', 'ClusterRoleBinding/clusterRoleBinding-B', 'RoleBinding/roleBinding-B';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 5;
            $ruleResult.TargetName | Should -BeIn 'Ingress/ingress-B', 'ClusterRole/clusterRole-A', 'Role/role-A', 'ClusterRoleBinding/clusterRoleBinding-A', 'RoleBinding/roleBinding-A';
        }
    }
}
