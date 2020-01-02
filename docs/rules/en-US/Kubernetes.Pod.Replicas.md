---
severity: Important
category: Reliability
online version: https://github.com/BernieWhite/PSRule.Rules.Kubernetes/blob/master/docs/rules/en-US/Kubernetes.Pod.Replicas.md
---

# Use two or more replicas

## SYNOPSIS

Use two or more replicas.

## DESCRIPTION

Deployments, ReplicaSets and StatefulSets are Kubernetes resources that orchestrate the life-cycle management of pods.
These resources can specify a number of replicas pods to create.

By specifying more than one replica, Kubernetes will maintain additional copies of a pods, removing a pod as a single point of failure.

## RECOMMENDATION

Consider increasing replicas to two or more to provide high availability of pod.

## LINKS

- [Replication controller](https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/)
- [Creating a deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#creating-a-deployment)
