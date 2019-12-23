
Document 'module' {
    Title 'Module rules'

    Import-Module .\out\modules\PSRule.Rules.Kubernetes
    $rules = Get-PSRule -Module PSRule.Rules.Kubernetes -WarningAction SilentlyContinue

    Section 'Baselines' {
        # 'The following baselines are included in `PSRule.Rules.Kubernetes`.'
    }

    Section 'Rules' {
        'The following rules are included in `PSRule.Rules.Kubernetes`.'

        $rules | Table -Property @{ Name = 'RuleName'; Expression = {
            "[$($_.RuleName)]($($_.RuleName).md)"
        }}, Description, @{ Name = 'Category'; Expression = {
            $_.Tag.category
        }}
    }
}
