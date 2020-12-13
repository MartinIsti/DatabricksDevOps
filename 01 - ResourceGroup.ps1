# Create a Resource Group if needed:
    $rgName = 'RG-Test' #to be parameterised
    $defaultLocation = 'australiaeast'

    $rgExists = (az group exists --name $rgName)

    if (-not $rgExists) then {az group create --name $rgName --location $defaultLocation}
    
