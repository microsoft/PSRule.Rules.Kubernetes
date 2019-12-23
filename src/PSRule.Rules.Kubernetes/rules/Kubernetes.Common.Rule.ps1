

function global:GetPodSpec {
    [CmdletBinding()]
    param ()
    process {
        if ($PSRule.TargetType -eq 'Deployment' -or $PSRule.TargetType -eq 'ReplicaSet') {
            return $TargetObject.spec.template.spec;
        }
        elseif ($PSRule.TargetType -eq 'Pod') {
            return $TargetObject.spec;
        }
    }
}

function global:GetContainerSpec {
    [CmdletBinding()]
    param ()
    process {
        (GetPodSpec).containers | Where-Object -FilterScript {
            $_.name -notin @('istio-proxy') # Exclude sidecar container
        }
    }
}

function global:HasContainerSpec {
    [CmdletBinding()]
    param ()
    process {
        # Only include pod specs that are standalone. i.e. not already included in a deployment or replicaset
        if ($PSRule.TargetType -eq 'Pod' -or $PSRule.TargetType -eq 'ReplicaSet') {
            if ($Null -ne $TargetObject.metadata.ownerReferences) {
                return $False;
            }
        }
        return @(GetContainerSpec).Length -ge 1;
    }
}
