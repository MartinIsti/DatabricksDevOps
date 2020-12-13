# Parameters
    $subscriptionName = 'Microsoft Azure Enterprise'
    $subscriptionId = '88ac0d8e-21ae-4e09-bc04-fcc13e4bcec8'
    $tenantId = '4c5789e1-0364-48a8-88ba-09202a830218'
    $orgName = 'istvanmartinka2'
    $gitHubRepoUrl = "https://github.com/$orgName/<repo name>"

    $rgName = 'RG-Test' #to be parameterised
    $defaultLocation = 'australiaeast'

# Login
    az login
    az account set --subscription $subscriptionName
    az devops configure --defaults organization=https://dev.azure.com/$orgName

# Create a Resource Group if needed:

    $rgExists = (az group exists --name $rgName)
    $rgExists

    if ($rgExists -eq 'false') {
    #if (-not $rgExists) {
        az group create --name $rgName --location $defaultLocation
    }
