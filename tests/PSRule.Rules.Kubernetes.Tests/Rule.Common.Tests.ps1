# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#
# Unit tests for PSRule rule quality
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

Describe 'Rule quality' {
    BeforeDiscovery {
        $rules = Get-PSRule -Module PSRule.Rules.Kubernetes -WarningAction Ignore;
    }

    Context 'Naming' {
        It '<_.RuleName>' -ForEach $rules {
            $_.RuleName.Length -le 35 | Should -Be $True;
        }
    }

    Context 'Metadata' {
        It '<_.RuleName>' -ForEach $rules {
            $_.Synopsis | Should -Not -BeNullOrEmpty;
            $_.Description | Should -Not -BeNullOrEmpty;
            $_.Info.Annotations.category | Should -Not -BeNullOrEmpty;
            $_.Info.Annotations.severity | Should -Not -BeNullOrEmpty;
            $_.Info.Annotations.'online version' | Should -Not -BeNullOrEmpty;
        }
    }
}
