---
severity: Critical
category: Security
online version: https://github.com/BernieWhite/PSRule.Rules.Kubernetes/blob/master/docs/rules/en/Kubernetes.Pod.Secrets.md
---

# Use secret references

## SYNOPSIS

Sensitive environment variables should be referenced as a secret.

## DESCRIPTION

When defining pods, environment variables may be used to configure containers.
Environment variables can be included as plain text value or reference a Kubernetes secret.

Environment variables that are specified as plain text can be read by anyone with permissions read the resource.
Additionally Kubernetes resource manifests are commonly stored in source control.

## RECOMMENDATION

Use Kubernetes secrets to store information such as passwords or connection strings that contain sensitive data instead of plain text.
Access to read secrets can be provided using role-based access control on an as needed basis separate from reading other resources.
