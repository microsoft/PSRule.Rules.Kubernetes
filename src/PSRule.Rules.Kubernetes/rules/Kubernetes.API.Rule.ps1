# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#
# Validation rules for Kubernetes resource requirements
#

# Synopsis: Avoid using legacy API endpoints for v1.16.0
Rule 'Kubernetes.API.v1.16' -Type DaemonSet, Deployment, StatefulSet, ReplicaSet, NetworkPolicy, PodSecurityPolicy -Tag @{ group = 'core' } {
    if ($PSRule.TargetType -eq 'ReplicaSet') {
        # Use apps/v1
        $TargetObject.apiVersion -notin 'extensions/v1beta1', 'apps/v1beta1', 'apps/v1beta2'
    }
    elseif ($PSRule.TargetType -eq 'StatefulSet') {
        # Use apps/v1
        $TargetObject.apiVersion -notin 'apps/v1beta1', 'apps/v1beta2'
    }
    elseif ($PSRule.TargetType -eq 'Deployment') {
        # Use apps/v1
        $TargetObject.apiVersion -notin 'extensions/v1beta1', 'apps/v1beta1', 'apps/v1beta2'
    }
    elseif ($PSRule.TargetType -eq 'DaemonSet') {
        # Use apps/v1
        $TargetObject.apiVersion -notin 'extensions/v1beta1', 'apps/v1beta2'
    }
    elseif ($PSRule.TargetType -eq 'NetworkPolicy') {
        # Use networking.k8s.io/v1
        $TargetObject.apiVersion -notin 'extensions/v1beta1'
    }
    elseif ($PSRule.TargetType -eq 'PodSecurityPolicy') {
        # Use policy/v1beta1
        $TargetObject.apiVersion -notin 'extensions/v1beta1'
    }
}

# Synopsis: Avoid using legacy API endpoints for v1.17.0
Rule 'Kubernetes.API.v1.17' -Type PriorityClass -Tag @{ group = 'core' } {
    if ($PSRule.TargetType -eq 'PriorityClass') {
        # Use scheduling.k8s.io/v1
        $TargetObject.apiVersion -notin 'scheduling.k8s.io/v1beta1', 'scheduling.k8s.io/v1alpha1'
    }
}

# Synopsis: Avoid using legacy API endpoints for v1.20.0
Rule 'Kubernetes.API.v1.20' -Type Ingress, Role, RoleBinding, ClusterRoleBinding, ClusterRole -Tag @{ group = 'core' } {
    if ($PSRule.TargetType -eq 'Ingress') {
        # Use networking.k8s.io/v1beta1
        $TargetObject.apiVersion -notin 'extensions/v1beta1'
    }
    elseif ($PSRule.TargetType -in 'Role', 'RoleBinding', 'ClusterRoleBinding', 'ClusterRole') {
        # Use rbac.authorization.k8s.io/v1
        $TargetObject.apiVersion -notin 'rbac.authorization.k8s.io/v1alpha1', 'rbac.authorization.k8s.io/v1beta1'
    }
}
