# parameters
    [CmdletBinding()]
    param(
        $rgName,
        $ADFName
    )

    Write-Host $rgName
    Write-Host $ADFName

# variables
    $resourceType = 'Microsoft.DataFactory/factories'
   
# create if not exists
    $resourceExists = az resource list --query "[?type == '$resourceType' && name == '$ADFName'].{Name:name}" --output tsv

    if (!$resourceExists) {
        Write-Host "Resource does not exist. Welcome the Creator!"
        az keyvault create --resource-group $rgName --name $ADFName
    } else {
        Write-Host "Resource already exists I sit tight."
    }
