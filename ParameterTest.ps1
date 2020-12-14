[CmdletBinding()]
param(
  $rgName
)

$rgExists = (az group exists --name $rgName)

if ($rgExists -eq 'false') {
#if (-not $rgExists) {
    az group create --name $rgName --location $defaultLocation
}
