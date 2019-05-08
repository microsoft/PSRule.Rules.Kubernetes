
Document 'Kubernetes' {
    Title 'Kubernetes rules'

    Metadata @{
        'generated-by' = 'PSDocs'
    }

    Get-PSRule | Table -Property RuleName, Description
}
