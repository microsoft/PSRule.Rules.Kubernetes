#
# Validation rules for Kubernetes metadata requirements
#

# Synopsis: Use recommended labels
Rule 'Kubernetes.Metadata' -Type 'Deployment', 'Service', 'ReplicaSet', 'Pod' -Tag @{ group = 'core' } {
    Exists 'metadata.labels.''app.kubernetes.io/name''' -Reason ($LocalizedData.RecommendLabel -f 'app.kubernetes.io/name')
    Exists 'metadata.labels.''app.kubernetes.io/instance''' -Reason ($LocalizedData.RecommendLabel -f 'app.kubernetes.io/instance')
    Exists 'metadata.labels.''app.kubernetes.io/version''' -Reason ($LocalizedData.RecommendLabel -f 'app.kubernetes.io/version')
    Exists 'metadata.labels.''app.kubernetes.io/component''' -Reason ($LocalizedData.RecommendLabel -f 'app.kubernetes.io/component')
    Exists 'metadata.labels.''app.kubernetes.io/part-of''' -Reason ($LocalizedData.RecommendLabel -f 'app.kubernetes.io/part-of')
    Exists 'metadata.labels.''app.kubernetes.io/managed-by''' -Reason ($LocalizedData.RecommendLabel -f 'app.kubernetes.io/managed-by')
}
