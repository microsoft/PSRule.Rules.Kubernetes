#
# Validation rules for Azure Kubernetes Service (AKS)
#

# Description: Services should not include a public load balancer
Rule 'Kubernetes.AKS.PublicLoadBalancer' -Type Service -Tag @{ category = 'Service exposure'; severity = 'Critical'; } -If { $Rule.TargetName -ne 'addon-http-application-routing-nginx-ingress' } {
    AnyOf {
        Exists 'spec.type' -Not
        $TargetObject.spec.type -ne 'LoadBalancer'
    }
}
