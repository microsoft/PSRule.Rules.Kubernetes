---
severity: Important
category: Performance
online version: https://github.com/BernieWhite/PSRule.Rules.Kubernetes/blob/master/docs/rules/en/Kubernetes.Pod.Resources.md
---

# Set compute resource requirements

## SYNOPSIS

Set CPU and memory requirements for each container.

## DESCRIPTION

The default scheduler uses container compute resource configuration to select a node for scheduling the pod.
If compute resources values are not provided, Kubernetes can't take these into account when making scheduling decisions.

Compute resources is not the only factor to determine pod placement.
However, if the scheduler places a pod on a host with insufficient resources, pod performance may be impacted.

If the Kubernetes cluster uses resource quotas, pods that don't specify compute resources may be rejected.

Compute resources for a container are set within the pod specification by defining `requests` and `limits`.

## RECOMMENDATION

Consider configuring CPU and memory resource requirements for each container.

## LINKS

- [Define pod resource requests and limits](https://docs.microsoft.com/en-us/azure/aks/developer-best-practices-resource-management#define-pod-resource-requests-and-limits)
- [Managing Compute Resources for Containers](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/#resource-types)
