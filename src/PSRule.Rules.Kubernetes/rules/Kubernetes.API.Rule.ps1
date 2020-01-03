#
# Validation rules for Kubernetes resource requirements
#

# Synopsis: Avoid using legacy API endpoints
Rule 'Kubernetes.API.Removal' -Type DaemonSet, Deployment, StatefulSet, ReplicaSet, NetworkPolicy, PodSecurityPolicy -Tag @{ group = 'core' } {
    if ($PSRule.TargetType -in 'DaemonSet', 'Deployment', 'StatefulSet', 'ReplicaSet') {
        $TargetObject.apiVersion -eq 'apps/v1'
    }
    elseif ($PSRule.TargetType -eq 'NetworkPolicy') {
        $TargetObject.apiVersion -eq 'networking.k8s.io/v1'
    }
    elseif ($PSRule.TargetType -eq 'PodSecurityPolicy') {
        $TargetObject.apiVersion -eq 'policy/v1beta1'
    }
}
