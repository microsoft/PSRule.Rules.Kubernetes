#
# Validation rules for Azure Kubernetes Service (AKS)
#

# Synopsis: Services should not include a public load balancer
Rule 'Kubernetes.AKS.PublicLB' -Type Service -Tag @{ category = 'Service exposure'; severity = 'Critical'; } -If { $PSRule.TargetName -ne 'addon-http-application-routing-nginx-ingress' } {
    if ($Assert.HasFieldValue($TargetObject, 'spec.type', 'LoadBalancer').Result) {
        Within 'metadata.annotations.''service.beta.kubernetes.io/azure-load-balancer-internal''' 'true'
    }
    else {
        return $True;
    }
}
