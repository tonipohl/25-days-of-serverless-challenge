# https://github.com/microsoft/25-days-of-serverless/blob/master/week-1/challenge-1/README.md
# challenge-1 by @atwork using PowerShell 6.2 on Azure Functions v2.0
using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "Serverless Dreidel!"

# returns נ (Nun), ג (Gimmel), ה (Hay), or ש (Shin)
$result = "נ", "ג", "ה", "ש" | Get-Random
Write-Host $result

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = $result
})
