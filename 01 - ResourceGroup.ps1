# parameters
[CmdletBinding()]
param(
  $rgName,
  $defaultLocation
)

  Write-Host $rgName
  Write-Host $defaultLocation

# check if resource group exists
$rgExists = (az group exists --name $rgName)

# create if not exists
if ($rgExists -eq 'false') {
    az group create --name $rgName --location $defaultLocation
}
