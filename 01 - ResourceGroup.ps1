# Create a Resource Group if needed:
    $rgName = 'RG-Test' #to be parameterised
    $defaultLocation = 'australiaeast'

    $rgExists = (az group exists --name $rgName)
    $rgExists

    if ($rgExists -eq 'false') {
    #if (-not $rgExists) {
        az group create --name $rgName --location $defaultLocation
    }
