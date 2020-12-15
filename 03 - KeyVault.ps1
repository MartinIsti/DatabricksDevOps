# parameters
    [CmdletBinding()]
    param(
        $rgName,
        $keyVaultName
    )

    Write-Host $rgName
    Write-Host $keyVaultName

# variables
    $resourceType = 'Microsoft.KeyVault/vaults'
       
# create if not exists
    $resourceExists = az resource list --query "[?type == '$resourceType' && name == '$keyVaultName'].{Name:name}" --output tsv

    if (!$resourceExists) {
        Write-Host "Resource does not exist. Welcome the Creator!"
        az keyvault create --resource-group $rgName --name $keyVaultName
    } else {
        Write-Host "Resource already exists I sit tight."
    }
