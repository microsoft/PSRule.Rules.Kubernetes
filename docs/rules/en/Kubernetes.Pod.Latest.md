---
severity: Important
category: Security
online version: https://github.com/BernieWhite/PSRule.Rules.Kubernetes/blob/master/docs/rules/en/Kubernetes.Pod.Latest.md
---

# Use specific tags

## SYNOPSIS

Containers should use specific tags instead of latest.

## DESCRIPTION

Containers should use specific tags instead of latest.

## RECOMMENDATION

Deployments or pods should identify a specific tag to use for container images instead of latest.
When latest is used it may be hard to determine which version of the image is running.

When using variable tags such as v1.0 (which may refer to v1.0.0 or v1.0.1) consider using `imagePullPolicy: Always` to ensure that the an out-of-date cached image is not used.

The latest tag automatically uses `imagePullPolicy: Always` instead of the default `imagePullPolicy: IfNotPresent`.
