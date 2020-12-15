# parameters
    [CmdletBinding()]
    param(
        $rgName,
        $storageAccountName
    )

    Write-Host $rgName
    Write-Host $storageAccountName

# variables
    $rawContainer = 'raw-storage'
    $stageContainer = 'stage-storage'
    $processContainer = 'processed-storage'
    
    $storageAccountName2 = 'storageacc20201215'
    
# check storage account existence
    #$storageNameAvailable = 
    az storage account check-name --name $storageAccountName2 --query nameAvailable 
    
    # Write-Host $storageNameAvailable

    # if ($storageNameAvailable -eq 'true') {
        # storage account
        # az storage account create --name $storageAccountName2 --resource-group $rgName --sku Standard_RAGRS --kind StorageV2

        # connection string to avoid permission warnings
        # $connectionString=az storage account show-connection-string --name $storageAccountName2 --query connectionString -o tsv

        # containers
        # az storage container create --name $rawContainer     --connection-string $connectionString
        # az storage container create --name $stageContainer   --connection-string $connectionString
        # az storage container create --name $processContainer --connection-string $connectionString
    # }
