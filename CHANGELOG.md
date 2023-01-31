# Change log

## Unreleased

What's changed since v0.2.0:

- Engineering:
  - Bump PSRule dependency to v2.7.0.
    [#78](https://github.com/microsoft/PSRule.Rules.Kubernetes/issues/78)
  - Bump Pester to v5.4.0.
    [#78](https://github.com/microsoft/PSRule.Rules.Kubernetes/issues/78)

## v0.2.0

What's changed since v0.1.0:

- New rules:
  - API deprecation removals:
    - Check for planned Kubernetes v1.17.0 API deprecation removals.
      [#38](https://github.com/Microsoft/PSRule.Rules.Kubernetes/issues/38)
    - Check for planned Kubernetes v1.20.0 API deprecation removals.
      [#39](https://github.com/Microsoft/PSRule.Rules.Kubernetes/issues/39)
- General improvements:
  - **Breaking change**: Use qualified target names.
    [#36](https://github.com/Microsoft/PSRule.Rules.Kubernetes/issues/36)
    - If using suppression, update suppressed target name with qualified name.
  - **Breaking change**: Renamed `Kubernetes.API.Removal` to handle future API deprecations.
    [#40](https://github.com/Microsoft/PSRule.Rules.Kubernetes/issues/40)
    - The rule `Kubernetes.API.Removal` is now `Kubernetes.API.v1.16`.

What's changed since pre-release v0.2.0-B2002005:

- No additional changes.

## v0.2.0-B2002005 (pre-release)

- Added new rules for API deprecation removals:
  - Planned Kubernetes v1.17.0 deprecation removals. [#38](https://github.com/Microsoft/PSRule.Rules.Kubernetes/issues/38)
  - Planned Kubernetes v1.20.0 deprecation removals. [#39](https://github.com/Microsoft/PSRule.Rules.Kubernetes/issues/39)
- **Breaking change**: Use qualified target names. [#36](https://github.com/Microsoft/PSRule.Rules.Kubernetes/issues/36)
  - If using suppression, update suppressed target name with qualified name.
- **Breaking change**: Renamed `Kubernetes.API.Removal` to handle future API deprecations.
  [#40](https://github.com/Microsoft/PSRule.Rules.Kubernetes/issues/40)
  - The rule `Kubernetes.API.Removal` is now `Kubernetes.API.v1.16`.

## v0.1.0

- Initial release.

What's changed since pre-release v0.1.0-B2001007:

- Updated documentation to use parent culture `en`.
  [#30](https://github.com/Microsoft/PSRule.Rules.Kubernetes/issues/30)

## v0.1.0-B2001007 (pre-release)

- **Breaking change**: Updated and renamed baselines make them easier to use.
  [#27](https://github.com/Microsoft/PSRule.Rules.Kubernetes/issues/27)
  - `KubeBaseline` is now `Kubernetes`, the default baseline.
  - `AKSBaseline` is now `AKS`.
  - The `Kubernetes` baseline include common Kubernetes rules.
  - The `AKS` baseline include all of `Kubernetes` plus additional AKS specific rules.

## v0.1.0-B1912003 (pre-release)

- Fixed `Kubernetes.AKS.PublicLB` handling of internal LB annotation.
  [#17](https://github.com/Microsoft/PSRule.Rules.Kubernetes/issues/17)
- Updated metadata rule to align to recommended labels.
  [#14](https://github.com/Microsoft/PSRule.Rules.Kubernetes/issues/14)
- Expanded deployment rules to include pods and replica sets.
  [#13](https://github.com/Microsoft/PSRule.Rules.Kubernetes/issues/13)
- Added rule documentation.
  [#5](https://github.com/Microsoft/PSRule.Rules.Kubernetes/issues/5)
- Added new rule `Kubernetes.API.Removal` to check for use of removed APIs.
  [#18](https://github.com/Microsoft/PSRule.Rules.Kubernetes/issues/18)
- Added new rule `Kubernetes.Pod.Secrets` to check if sensitive environment variables are used.
  [#19](https://github.com/Microsoft/PSRule.Rules.Kubernetes/issues/19)
- Added new rule `Kubernetes.Pod.Health` to check health probes are used.
  [#20](https://github.com/Microsoft/PSRule.Rules.Kubernetes/issues/20)
- Added new rule `Kubernetes.Pod.Replicas` to check if more then one replica is used.
  [#21](https://github.com/Microsoft/PSRule.Rules.Kubernetes/issues/21)
- **Breaking change**: Renamed deployment rules to relate to pods.
  [#12](https://github.com/Microsoft/PSRule.Rules.Kubernetes/issues/12)

## v0.1.0-B190521 (pre-release)

- Initial pre-release.
