# Module rules

## Rules

The following rules are included within `PSRule.Rules.Kubernetes`.

### API

Name | Synopsis | Severity
---- | -------- | --------
[Kubernetes.API.Removal](Kubernetes.API.Removal.md) | Avoid using legacy API endpoints. | Important

### Management

Name | Synopsis | Severity
---- | -------- | --------
[Kubernetes.Metadata](Kubernetes.Metadata.md) | Use Kubernetes common labels. | Awareness

### Performance

Name | Synopsis | Severity
---- | -------- | --------
[Kubernetes.Pod.Resources](Kubernetes.Pod.Resources.md) | Set CPU and memory requirements for each container. | Important

### Reliability

Name | Synopsis | Severity
---- | -------- | --------
[Kubernetes.Pod.Health](Kubernetes.Pod.Health.md) | Containers should use liveness and readiness probes. | Important
[Kubernetes.Pod.Replicas](Kubernetes.Pod.Replicas.md) | Use two or more replicas. | Important

### Security

Name | Synopsis | Severity
---- | -------- | --------
[Kubernetes.AKS.PublicLB](Kubernetes.AKS.PublicLB.md) | Use internal Azure load balancers. | Critical
[Kubernetes.Pod.Latest](Kubernetes.Pod.Latest.md) | Containers should use specific tags instead of latest. | Important
[Kubernetes.Pod.PrivilegeEscalation](Kubernetes.Pod.PrivilegeEscalation.md) | Containers should deny privilege escalation. | Critical
[Kubernetes.Pod.Secrets](Kubernetes.Pod.Secrets.md) | Sensitive environment variables should be referenced as a secret. | Critical
