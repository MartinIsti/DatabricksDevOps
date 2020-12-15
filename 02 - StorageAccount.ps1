# parameters
    [CmdletBinding()]
    param(
      $rgName,
      $storageAccountName
    )

# variables
    $rawContainer = 'rawStorage'
    $stageContainer = 'stageStorage'
    $processContainer = 'processedStorage'

# check storage account existence
    $storageNameAvailable = az storage account check-name --name 'datacicd88922' --query nameAvailable

    if ($storageNameAvailable -eq 'true') {
        # storage account
        az storage account create --name $storageAccountName --resource-group $rgName --sku Standard_RAGRS --kind StorageV2

        # containers
        az storage container create -n $rawContainer     --account-name $storageAccountName
        az storage container create -n $stageContainer   --account-name $storageAccountName
        az storage container create -n $processContainer --account-name $storageAccountName
    }
