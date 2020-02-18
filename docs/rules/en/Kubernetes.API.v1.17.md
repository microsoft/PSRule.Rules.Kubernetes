---
severity: Important
category: API
online version: https://github.com/microsoft/PSRule.Rules.Kubernetes/blob/master/docs/rules/en/Kubernetes.API.v1.17.md
---

# Use APIs supported in v1.17

## SYNOPSIS

Avoid using legacy API endpoints not served by Kubernetes v1.17.

## DESCRIPTION

In Kubernetes v1.17.0 previously deprecated API endpoints are no longer served.
These endpoints will no longer work for new deployments after upgrading to Kubernetes v1.17.0 or greater.

To prevent deployment issues use the newer API endpoints for these resources.

- PriorityClass should use `scheduling.k8s.io/v1`.

## RECOMMENDATION

Consider updating resource deployments to use newer API endpoints prior to upgrading to Kubernetes >= v1.17.0.

## LINKS

- [Kubernetes v1.16.0 deprecations and removals](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.16.md#deprecations-and-removals)
- [Kubernetes Deprecation Policy](https://kubernetes.io/docs/reference/using-api/deprecation-policy/)
