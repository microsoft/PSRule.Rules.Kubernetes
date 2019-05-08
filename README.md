# PSRule for Kubernetes

A suite of rules to validate Kubernetes resources using PSRule.

![ci-badge]

## Disclaimer

This project is to be considered a **proof-of-concept** and **not a supported product**.

For issues with rules and documentation please check our GitHub [issues](https://github.com/BernieWhite/PSRule.Rules.Kubernetes/issues) page. If you do not see your problem captured, please file a new issue and follow the provided template.

If you have any problems with the [PSRule][project] engine, please check the project GitHub [issues](https://github.com/BernieWhite/PSRule/issues) page instead.

## Getting the modules

This project requires the PowerShell module PSRule.

You can download and install these modules from the PowerShell Gallery.

Module                  | Description | Downloads / instructions
------                  | ----------- | ------------------------
PSRule.Rules.Kubernetes | Validate Kubernetes resources | [latest][module] / [instructions][install]

## Getting started

### Offline with a manifest

Kubernetes resources can be evaluated within a YAML manifest file.

```powershell
Invoke-PSRule -Module PSRule.Rules.Kubernetes -InputPath .\service.yaml;
```

### Online with kubectl

```powershell
Invoke-PSRule -Module PSRule.Rules.Kubernetes -InputObject (kubectl get services -o yaml | Out-String) -Format Yaml -ObjectPath items;
```

## Rule reference

The following rules are included in the `PSRule.Rules.Kubernetes` module:

- [PSRule.Rules.Kubernetes](docs/rules/en-US/Kubernetes.md)

## Changes and versioning

Modules in this repository will use the [semantic versioning](http://semver.org/) model to declare breaking changes from v1.0.0. Prior to v1.0.0, breaking changes may be introduced in minor (0.x.0) version increments. For a list of module changes please see the [change log](CHANGELOG.md).

> Pre-release module versions are created on major commits and can be installed from the PowerShell Gallery. Pre-release versions should be considered experimental. Modules and change log details for pre-releases will be removed as standard releases are made available.

## Maintainers

- [Bernie White](https://github.com/BernieWhite)

## License

This project is [licensed under the MIT License](LICENSE).

[install]: docs/scenarios/install-instructions.md
[ci-badge]: https://dev.azure.com/bewhite/PSRule.Rules.Kubernetes/_apis/build/status/PSRule.Rules.Kubernetes-CI?branchName=master
[module]: https://www.powershellgallery.com/packages/PSRule.Rules.Kubernetes
[project]: https://github.com/BernieWhite/PSRule
