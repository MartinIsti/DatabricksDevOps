[CmdletBinding()]
param(
  $rgName
)

$rgExists = (az group exists --name $rgName)

Write-Host "Does RG exist? Hmm. The answer is: $rgExists"
