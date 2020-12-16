# parameters
    [CmdletBinding()]
    param(
        $rgName,
        $databricksWorkspace
    )

    Write-Host $rgName
    Write-Host $databricksWorkspace

# variables
    $resourceType = 'Microsoft.Databricks/workspaces'

# extension(s)
    az extension add --name databricks
    
# create if not exists
    $resourceExists = az resource list --query "[?type == '$resourceType' && name == '$databricksWorkspace'].{Name:name}" --output tsv

    if (!$resourceExists) {
        Write-Host "Resource does not exist. Welcome the Creator!"
        az databricks workspace --resource-group $rgName --name $databricksWorkspace
    } else {
        Write-Host "Resource already exists I sit tight."
    }
