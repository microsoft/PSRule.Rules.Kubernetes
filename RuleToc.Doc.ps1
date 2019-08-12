
Document 'Kubernetes' {
    Title 'Kubernetes rules'

    Get-PSRule -WarningAction SilentlyContinue | Table -Property @{ Name = 'RuleName'; Expression = {
        "[$($_.RuleName)]($($_.RuleName).md)"
    }}, Description
}
