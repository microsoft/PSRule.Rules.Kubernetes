---
severity: Critical
category: Security
online version: https://github.com/Microsoft/PSRule.Rules.Kubernetes/blob/master/docs/rules/en/Kubernetes.AKS.PublicLB.md
---

# Use internal load balancer

## SYNOPSIS

Use internal Azure load balancers.

## DESCRIPTION

When creating a load balanced service, by default AKS will create and attach an Azure load balancer with a public IP address.
Creating a load balancer with a public IP address may allow Internet clients to connect to applications running on AKS.

To create a load balanced service with an internal load balancer use the annotation `service.beta.kubernetes.io/azure-load-balancer-internal: "true"`.
When this annotation is used on a load balanced service, the Azure load balancer will only be assigned a private IP address.

## RECOMMENDATION

Consider creating services with an internal load balancer instead of a public load balancer.

## LINKS

- [Use an internal load balancer with Azure Kubernetes Service (AKS)](https://docs.microsoft.com/en-us/azure/aks/internal-lb#create-an-internal-load-balancer)
