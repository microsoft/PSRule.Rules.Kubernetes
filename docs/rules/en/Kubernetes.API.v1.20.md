---
severity: Important
category: API
online version: https://github.com/microsoft/PSRule.Rules.Kubernetes/blob/master/docs/rules/en/Kubernetes.API.v1.20.md
---

# Use APIs supported in v1.20

## SYNOPSIS

Avoid using legacy API endpoints not served by Kubernetes v1.20.

## DESCRIPTION

In Kubernetes v1.20.0 a number of previously deprecated API endpoints are planned to be no longer served.
These endpoints will no longer work for new deployments after upgrading to Kubernetes v1.20.0 or greater.

To prevent deployment issues use the newer API endpoints for these resources.

- Ingress should use `networking.k8s.io/v1beta1`.
- Role, RoleBinding, ClusterRoleBinding and ClusterRole should use `rbac.authorization.k8s.io/v1`.

## RECOMMENDATION

Consider updating resource deployments to use newer API endpoints prior to upgrading to Kubernetes >= v1.20.0.

## LINKS

- [Kubernetes v1.15.0 deprecations and removals](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.15.md#deprecations-and-removals)
- [Kubernetes v1.17.0 deprecations and removals](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.17.md#deprecations-and-removals)
- [Kubernetes Deprecation Policy](https://kubernetes.io/docs/reference/using-api/deprecation-policy/)
