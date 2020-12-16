# parameters
    [CmdletBinding()]
    param(
        $rgName,
        $defaultLocation,
        $databricksWorkspace,
        $databricksSKU
    )

    Write-Host $rgName
    Write-Host $defaultLocation
    Write-Host $databricksWorkspace
    Write-Host $databricksSKU

# variables
    $resourceType = 'Microsoft.Databricks/workspaces'

# extension(s)
    az extension add --name databricks
    
# create if not exists
    $resourceExists = az resource list --query "[?type == '$resourceType' && name == '$databricksWorkspace'].{Name:name}" --output tsv

    if (!$resourceExists) {
        Write-Host "Resource does not exist. Welcome the Creator!"
        az databricks workspace create --resource-group $rgName --location $defaultLocation --name $databricksWorkspace --sku $databricksSKU
    } else {
        Write-Host "Resource already exists I sit tight."
    }
