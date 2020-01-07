---
severity: Important
category: API
online version: https://github.com/Microsoft/PSRule.Rules.Kubernetes/blob/master/docs/rules/en/Kubernetes.API.Removal.md
---

# Use supported APIs

## SYNOPSIS

Avoid using legacy API endpoints.

## DESCRIPTION

In Kubernetes v1.16.0 a number of previously deprecated API endpoints have been removed.
These removed endpoints will no longer work for new deployments after upgrading to Kubernetes v1.16.0 or greater.

To prevent deployment issues use the newer API endpoints for these resources.

- NetworkPolicy should use `networking.k8s.io/v1`.
- PodSecurityPolicy should use `policy/v1beta1`.
- DaemonSet, Deployment, StatefulSet, and ReplicaSet should use `apps/v1`.

## RECOMMENDATION

Consider updating resource deployments to use newer API endpoints prior to upgrading to Kubernetes >= v1.16.0.

## LINKS

- [Kubernetes v1.15.0 deprecations and removals](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.15.md#deprecations-and-removals)
