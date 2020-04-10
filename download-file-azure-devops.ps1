# Repo Information
$organization= "<Organization-Nama>"
$projectName = "<Project-Name>"
$repoName= "<Repository-Name>"
$filePath= "<File-Path>"
$token = "<Personal-Access-Token>"

# Encode the Personal Access Token (PAT) to Base64 String
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f "",$token)))

# Construct the download URL
$url = "https://dev.azure.com/$organization/$projectName/_apis/git/repositories/$repoName/items?path=$filePath&download=true&api-version=5.0"

# Download the file
$result = Invoke-RestMethod -Uri $url -Method Get -ContentType "application/text" -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)} | Out-File $filePath
