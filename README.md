# PSRule for Kubernetes

A suite of rules to validate Kubernetes resources using PSRule.

![ci-badge]

## Disclaimer

This project is to be considered a **proof-of-concept** and **not a supported product**.

For issues with rules and documentation please check our GitHub [issues](https://github.com/BernieWhite/PSRule.Rules.Kubernetes/issues) page. If you do not see your problem captured, please file a new issue and follow the provided template.

If you have any problems with the [PSRule][project] engine, please check the project GitHub [issues](https://github.com/Microsoft/PSRule/issues) page instead.

## Getting the modules

This project requires the `PSRule` PowerShell module.

You can download and install these modules from the PowerShell Gallery.

Module                  | Description | Downloads / instructions
------                  | ----------- | ------------------------
PSRule.Rules.Kubernetes | Validate Kubernetes resources | [latest][module] / [instructions][install]

## Getting started

PSRule for Kubernetes provides two methods for analyzing Kubernetes resources:

- _Pre-flight_ - Before resources are deployed from a YAML manifest file.
- _In-flight_ - After resources are deployed to a Kubernetes cluster.

### Offline with a manifest

Kubernetes resources can be evaluated within a YAML manifest file.
PSRule natively supports reading objects from YAML files using the `-InputPath` parameter.
The `-InputPath` parameter can be abbreviated to `-f`.

For example:

```powershell
Invoke-PSRule -f service.yaml -Module PSRule.Rules.Kubernetes;
```

### Online with kubectl

Kubernetes resources can be evaluated directly from a cluster using the output from `kubectl`.
To evaluate resources using `kubectl`, return the output as YAML with the `-o yaml` parameter.

For example:

```powershell
kubectl get services -o yaml | Out-String | Invoke-PSRule -Format Yaml -ObjectPath items -Module PSRule.Rules.Kubernetes;
```

In the example above:

- `Out-String` - is used to concatenate the output into a single string object.
- `-Format Yaml` - indicates that the input is YAML.
- `-ObjectPath items` - indicates that the output nests objects to evaluate under the `items` property.

## Rule reference

For a list of rules included in the `PSRule.Rules.Kubernetes` module see:

- [Module rule reference](docs/rules/en-US/module.md)

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
[project]: https://github.com/Microsoft/PSRule
