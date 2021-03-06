---
severity: Important
category: API
online version: https://github.com/microsoft/PSRule.Rules.Kubernetes/blob/main/docs/rules/en/Kubernetes.API.v1.16.md
---

# Use APIs supported in v1.16

## SYNOPSIS

Avoid using legacy API endpoints not served by Kubernetes v1.16.

## DESCRIPTION

In Kubernetes v1.16.0 a number of previously deprecated API endpoints are no longer served.
These endpoints will no longer work for new deployments after upgrading to Kubernetes v1.16.0 or greater.

To prevent deployment issues use the newer API endpoints for these resources.

- NetworkPolicy should use `networking.k8s.io/v1`.
- PodSecurityPolicy should use `policy/v1beta1`.
- DaemonSet, Deployment, StatefulSet and ReplicaSet should use `apps/v1`.

## RECOMMENDATION

Consider updating resource deployments to use newer API endpoints prior to upgrading to Kubernetes >= v1.16.0.

## LINKS

- [Kubernetes v1.15.0 deprecations and removals](https://github.com/kubernetes/kubernetes/blob/main/CHANGELOG/CHANGELOG-1.15.md#deprecations-and-removals)
- [Kubernetes Deprecation Policy](https://kubernetes.io/docs/reference/using-api/deprecation-policy/)
