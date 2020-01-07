# PSRule for Kubernetes

A suite of rules to validate Kubernetes resources using PSRule.

![ci-badge]

## Disclaimer

This project is to be considered a **proof-of-concept** and **not a supported product**.

For issues with rules and documentation please check our GitHub [issues](https://github.com/Microsoft/PSRule.Rules.Kubernetes/issues) page.
If you do not see your problem captured, please file a new issue and follow the provided template.

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

Kubernetes resources can be validated within a YAML manifest file.
To validate Kubernetes resources use the `Invoke-PSRule` cmdlet.
PSRule natively supports reading objects from YAML files using the `-InputPath` parameter.
The `-InputPath` parameter can be abbreviated to `-f`.

For example:

```powershell
Invoke-PSRule -f service.yaml -Module PSRule.Rules.Kubernetes;
```

The input path can be also be a URL to a YAML file. For example:

```powershell
$sourceUrl = 'https://raw.githubusercontent.com/Azure-Samples/azure-voting-app-redis/master/azure-vote-all-in-one-redis.yaml';
Invoke-PSRule -f $sourceUrl -Module PSRule.Rules.Kubernetes;
```

The output of this example is:

```text
   TargetName: azure-vote-back

RuleName                            Outcome    Recommendation
--------                            -------    --------------
Kubernetes.API.Removal              Fail       Consider updating resource deployments to use newer API endpoints prior…
Kubernetes.Metadata                 Fail       Consider applying recommended labels defined by Kubernetes.…
Kubernetes.Pod.PrivilegeEscalation  Fail       Containers should deny privilege escalation.
Kubernetes.Pod.Latest               Fail       Deployments or pods should identify a specific tag to use for container…
Kubernetes.Pod.Resources            Fail       Resource requirements are set for each container.
Kubernetes.Pod.Secrets              Pass       Use Kubernetes secrets to store information such as passwords or connec…
Kubernetes.Pod.Health               Fail       Containers should use liveness and readiness probes.
Kubernetes.Pod.Replicas             Fail       Consider increasing replicas to two or more to provide high availabilit…
Kubernetes.Metadata                 Fail       Consider applying recommended labels defined by Kubernetes.…

   TargetName: azure-vote-front

RuleName                            Outcome    Recommendation
--------                            -------    --------------
Kubernetes.API.Removal              Fail       Consider updating resource deployments to use newer API endpoints prior…
Kubernetes.Metadata                 Fail       Consider applying recommended labels defined by Kubernetes.…
Kubernetes.Pod.PrivilegeEscalation  Fail       Containers should deny privilege escalation.
Kubernetes.Pod.Latest               Pass       Deployments or pods should identify a specific tag to use for container…
Kubernetes.Pod.Resources            Fail       Resource requirements are set for each container.
Kubernetes.Pod.Secrets              Pass       Use Kubernetes secrets to store information such as passwords or connec…
Kubernetes.Pod.Health               Fail       Containers should use liveness and readiness probes.
Kubernetes.Pod.Replicas             Fail       Consider increasing replicas to two or more to provide high availabilit…
Kubernetes.Metadata                 Fail       Consider applying recommended labels defined by Kubernetes.…
```

### Online with kubectl

Kubernetes resources can be validated directly from a cluster using the output from `kubectl`.
To validate resources using `kubectl`, return the output as YAML with the `-o yaml` parameter.

For example:

```powershell
kubectl get services -o yaml | Out-String | Invoke-PSRule -Format Yaml -ObjectPath items -Module PSRule.Rules.Kubernetes;
```

In the example above:

- `Out-String` - is used to concatenate the output into a single string object.
- `-Format Yaml` - indicates that the input is YAML.
- `-ObjectPath items` - indicates that the input nests objects to evaluate under the `items` property.

### Using baselines

PSRule for Kubernetes comes with the following baselines:

- `Kubernetes` - Includes common Kubernetes rules. This is the default.
- `AKS` - Includes all the rules from `Kubernetes` plus additional Azure Kubernetes Service (AKS) specific rules.

To use the `AKS` baseline instead of the default use `Invoke-PSRule -Baseline AKS`.

For example:

```powershell
Invoke-PSRule -f $sourceUrl -Module 'PSRule.Rules.Kubernetes' -Baseline AKS;
```

If `-Baseline AKS` is not specified, the default baseline `Kubernetes` will be used.

### Additional options

To filter results to only failed rules, use `Invoke-PSRule -Outcome Fail`.
Passed, failed and error results are shown by default.

For example:

```powershell
# Only show failed results
Invoke-PSRule -f $sourceUrl -Module 'PSRule.Rules.Kubernetes' -Outcome Fail;
```

A summary of results can be displayed by using `Invoke-PSRule -As Summary`.

For example:

```powershell
# Display as summary results
Invoke-PSRule -f $sourceUrl -Module 'PSRule.Rules.Kubernetes' -As Summary;
```

The output of this example is:

```text
RuleName                            Pass  Fail  Outcome
--------                            ----  ----  -------
Kubernetes.API.Removal              0     2     Fail
Kubernetes.Metadata                 0     4     Fail
Kubernetes.Pod.PrivilegeEscalation  0     2     Fail
Kubernetes.Pod.Latest               1     1     Fail
Kubernetes.Pod.Resources            0     2     Fail
Kubernetes.Pod.Secrets              2     0     Pass
Kubernetes.Pod.Health               0     2     Fail
Kubernetes.Pod.Replicas             0     2     Fail
```

## Rule reference

For a list of rules included in the `PSRule.Rules.Kubernetes` module see:

- [Module rule reference](docs/rules/en/module.md)

## Changes and versioning

Modules in this repository will use the [semantic versioning](http://semver.org/) model to declare breaking changes from v1.0.0.
Prior to v1.0.0, breaking changes may be introduced in minor (0.x.0) version increments.
For a list of module changes please see the [change log](CHANGELOG.md).

> Pre-release module versions are created on major commits and can be installed from the PowerShell Gallery.
> Pre-release versions should be considered experimental.
> Modules and change log details for pre-releases will be removed as standard releases are made available.

## Contributing

This project welcomes contributions and suggestions.
If you are ready to contribute, please visit the [contribution guide](CONTRIBUTING.md).

## Code of Conduct

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/)
or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Maintainers

- [Bernie White](https://github.com/BernieWhite)

## License

This project is [licensed under the MIT License](LICENSE).

[install]: docs/scenarios/install-instructions.md
[ci-badge]: https://dev.azure.com/bewhite/PSRule.Rules.Kubernetes/_apis/build/status/PSRule.Rules.Kubernetes-CI?branchName=master
[module]: https://www.powershellgallery.com/packages/PSRule.Rules.Kubernetes
[project]: https://github.com/Microsoft/PSRule
