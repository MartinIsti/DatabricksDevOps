# Create a Resource Group if needed:
    $rgName = 'RG-Test' #to be parameterised

    az group create --name $rgName --location 'australiaeast'
