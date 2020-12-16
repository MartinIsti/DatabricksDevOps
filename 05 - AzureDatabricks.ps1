# parameters
    [CmdletBinding()]
    param(
        $rgName,
        $databricksWorkspaceName
    )

    Write-Host $rgName
    Write-Host $databricksWorkspaceName

# variables
    $resourceType = 'Microsoft.Databricks/workspaces'
    
# create if not exists
    $resourceExists = az resource list --query "[?type == '$resourceType' && name == '$databricksWorkspaceName'].{Name:name}" --output tsv

    if (!$resourceExists) {
        Write-Host "Resource does not exist. Welcome the Creator!"
        az keyvault create --resource-group $rgName --name $databricksWorkspaceName
    } else {
        Write-Host "Resource already exists I sit tight."
    }
