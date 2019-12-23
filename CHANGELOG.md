# Change log

## Unreleased

- Fixed `Kubernetes.AKS.PublicLB` handling of internal LB annotation. [#17](https://github.com/BernieWhite/PSRule.Rules.Kubernetes/issues/17)
- Updated metadata rule to align to recommended labels. [#14](https://github.com/BernieWhite/PSRule.Rules.Kubernetes/issues/14)
- Expanded deployment rules to include pods and replica sets. [#13](https://github.com/BernieWhite/PSRule.Rules.Kubernetes/issues/13)
- Added rule documentation. [#5](https://github.com/BernieWhite/PSRule.Rules.Kubernetes/issues/5)
- Added new rule `Kubernetes.API.Removal` to check for use of removed APIs. [#18](https://github.com/BernieWhite/PSRule.Rules.Kubernetes/issues/18)
- Added new rule `Kubernetes.Pod.Secrets` to check if sensitive environment variables are used. [#19](https://github.com/BernieWhite/PSRule.Rules.Kubernetes/issues/19)
- Added new rule `Kubernetes.Pod.Health` to check health probes are used. [#20](https://github.com/BernieWhite/PSRule.Rules.Kubernetes/issues/20)
- Added new rule `Kubernetes.Pod.Replicas` to check if more then one replica is used. [#21](https://github.com/BernieWhite/PSRule.Rules.Kubernetes/issues/21)
- **Breaking change**: Renamed deployment rules to relate to pods. [#12](https://github.com/BernieWhite/PSRule.Rules.Kubernetes/issues/12)

## v0.1.0-B190521 (pre-release)

- Initial pre-release
