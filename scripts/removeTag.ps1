param (
    [string]$rgName,
    [string]$tagName
)

$resources = @()

$resources += get-azresourcegroup -ResourceGroupName $rgName

foreach ($resource in $resources) {
    try {
        $resource | % {$_.Tags.Remove($tagName)} -ErrorAction SilentlyContinue
        $resource | Set-AzResource -Force -ErrorAction SilentlyContinue
    } catch {
        write-host ("Could not remove tag because it either doesn't exist or some other reason unknown")
    }
    Write-Host("Removed Tag from Resource: " + $resource.Name)
}