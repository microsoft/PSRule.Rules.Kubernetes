---
severity: Critical
category: Security
online version: https://github.com/Microsoft/PSRule.Rules.Kubernetes/blob/master/docs/rules/en/Kubernetes.Pod.PriviledgeEscalation.md
---

# Deny privilege escalation

## SYNOPSIS

Containers should deny privilege escalation.

## DESCRIPTION

In the default configuration, container processes are permitted to change the effective user ID through the _setuid_ binary.
Changing the effective user ID could allow a malicious or vulnerable process to gain a higher level of permission then intended.
To prevent this, explicitly set the `securityContext.allowPrivilegeEscalation` option to `false` on pod containers.

## RECOMMENDATION

Consider explicitly setting the `securityContext.allowPrivilegeEscalation` option to `false` on pod containers.

## LINKS

- [Secure container access to resources](https://docs.microsoft.com/en-us/azure/aks/operator-best-practices-cluster-security#secure-container-access-to-resources)
- [Set the security context for a Container](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-container)
- [Privilege Escalation](https://kubernetes.io/docs/concepts/policy/pod-security-policy/#privilege-escalation)
