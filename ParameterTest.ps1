[CmdletBinding()]
param(
  $paramDefaultLocation
)

az upgrade

Write-Host "Value of default location is $paramDefaultLocation"
