# parameters
    [CmdletBinding()]
    param(
        $rgName
    )

    Write-Host $rgName

# variables

# tear down all resource group
    az group delete --resource-group $rgName --yes