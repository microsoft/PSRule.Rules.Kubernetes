#
# Validation rules for Kubernetes deployments
#

# Synopsis: Containers should deny privilege escalation
Rule 'Kubernetes.Pod.PrivilegeEscalation' -Type Deployment, Pod, ReplicaSet -If { (HasContainerSpec) } -Tag @{ group = 'core' } {
    foreach ($container in (GetContainerSpec)) {
        $container | Exists 'securityContext.allowPrivilegeEscalation'
        $container.securityContext.allowPrivilegeEscalation -eq $False
    }
}

# Synopsis: Containers should use specific tags instead of latest
Rule 'Kubernetes.Pod.Latest' -Type Deployment, Pod, ReplicaSet -If { (HasContainerSpec) } -Tag @{ group = 'core' } {
    foreach ($container in (GetContainerSpec)) {
        $container.image -like '*:*' -and 
        $container.image -notlike '*:latest'
    }
}

# Synopsis: Resource requirements are set for each container
Rule 'Kubernetes.Pod.Resources' -Type Deployment, Pod, ReplicaSet -If { (HasContainerSpec) } -Tag @{ group = 'core' } {
    foreach ($container in (GetContainerSpec)) {
        $container | Exists 'resources.requests.cpu' -Reason $LocalizedData.PodCPURequest
        $container | Exists 'resources.requests.memory' -Reason $LocalizedData.PodMemRequest
        $container | Exists 'resources.limits.cpu' -Reason $LocalizedData.PodCPULimit
        $container | Exists 'resources.limits.memory' -Reason $LocalizedData.PodMemLimit
    }
}

# Synopsis: Sensitive environment variables should be secured
Rule 'Kubernetes.Pod.Secrets' -Type Deployment, Pod, ReplicaSet -If { (HasContainerSpec) } -Tag @{ group = 'core' } {
    foreach ($container in (GetContainerSpec)) {
        if ($Assert.HasField($container, 'env').Result) {
            foreach ($variable in $container.env) {
                if ($variable.name -like "*secret*" -or $variable.name -like "*password*" -or $variable.name -like "*pwd*" -or $variable.name -like "*key" -or $variable.name -like "*connectionstring") {
                    $variable | Exists -Not -Field 'value'
                }
                else {
                    $True
                }
            }
        }
        else {
            $True
        }
    }
}

# Synopsis: Containers should use liveness and readiness probes
Rule 'Kubernetes.Pod.Health' -Type Deployment, Pod, ReplicaSet -If { (HasContainerSpec) } -Tag @{ group = 'core' } {
    foreach ($container in (GetContainerSpec)) {
        $container | Exists 'livenessProbe' -Reason ($LocalizedData.LivenessProbe -f $container.name)
    }
    foreach ($container in (GetContainerSpec)) {
        $container | Exists 'readinessProbe' -Reason ($LocalizedData.ReadinessProbe -f $container.name)
    }
}

# Synopsis: Use two or more replicas
Rule 'Kubernetes.Pod.Replicas' -Type Deployment, ReplicaSet, StatefulSet -Tag @{ group = 'core' } {
    Exists 'spec.replicas'
    $TargetObject.spec.replicas -ge 2
}
