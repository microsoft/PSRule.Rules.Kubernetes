# Module rules

## Rules

The following rules are included in `PSRule.Rules.Kubernetes`.

RuleName | Description | Category
-------- | ----------- | --------
[Kubernetes.AKS.PublicLB](Kubernetes.AKS.PublicLB.md) | Use internal Azure load balancers. | Pod security
[Kubernetes.API.Removal](Kubernetes.API.Removal.md) | Avoid using legacy API endpoints. | API
[Kubernetes.Metadata](Kubernetes.Metadata.md) | Use Kubernetes common labels. | Resource management
[Kubernetes.Pod.PrivilegeEscalation](Kubernetes.Pod.PrivilegeEscalation.md) | Containers should deny privilege escalation. | Pod security
[Kubernetes.Pod.Latest](Kubernetes.Pod.Latest.md) | Containers should use specific tags instead of latest. | Pod security
[Kubernetes.Pod.Resources](Kubernetes.Pod.Resources.md) | Resource requirements are set for each container. | Resource management
[Kubernetes.Pod.Secrets](Kubernetes.Pod.Secrets.md) | Sensitive environment variables should be referenced as a secret. | Pod security
[Kubernetes.Pod.Health](Kubernetes.Pod.Health.md) | Containers should use liveness and readiness probes. | Reliability
[Kubernetes.Pod.Replicas](Kubernetes.Pod.Replicas.md) | Use two or more replicas. | Reliability
