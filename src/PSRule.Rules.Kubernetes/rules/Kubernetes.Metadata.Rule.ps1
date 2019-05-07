#
# Validation rules for Kubernetes metadata requirements
#

# Description: Must have the app.kubernetes.io/name label
Rule 'Kubernetes.Metadata' -Type 'Deployment', 'Service' -Tag @{ category = 'Resource management'; severity = 'Important' } {
    Exists 'metadata.labels.''app.kubernetes.io/name'''
    Exists 'metadata.labels.''app.kubernetes.io/version'''
    Exists 'metadata.labels.''app.kubernetes.io/component'''
}
