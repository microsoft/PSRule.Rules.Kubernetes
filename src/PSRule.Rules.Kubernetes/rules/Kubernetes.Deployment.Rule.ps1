#
# Validation rules for Kubernetes deployments
#

# Description: Containers should deny privilege escalation
Rule 'Kubernetes.Deployment.PrivilegeEscalation' -Type Deployment -Tag @{ category = 'Pod security'; severity = 'Critical'; } {
    foreach ($container in $TargetObject.spec.template.spec.containers) {
        $container | Exists 'securityContext.allowPrivilegeEscalation'
        $container.securityContext.allowPrivilegeEscalation -eq $False
    }
}

# Description: Containers should use specific tags instead of latest
Rule 'Kubernetes.Deployment.NotLatestImage' -Type Deployment -Tag @{ category = 'Pod security'; severity = 'Important' } {
    foreach ($container in $TargetObject.spec.template.spec.containers) {
        $container.image -like '*:*' -and 
        $container.image -notlike '*:latest'
    }
}

# Description: Resource requirements are set for each container
Rule 'Kubernetes.Deployment.ResourcesSet' -Type Deployment -Tag @{ category = 'Resource management'; severity = 'Important' } {
    foreach ($container in $TargetObject.spec.template.spec.containers) {
        $container | Exists 'resources.requests.cpu'
        $container | Exists 'resources.requests.memory'
        $container | Exists 'resources.limits.cpu'
        $container | Exists 'resources.limits.memory'
    }
}
