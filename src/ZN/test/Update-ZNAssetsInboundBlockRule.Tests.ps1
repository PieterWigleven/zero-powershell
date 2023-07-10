$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)
$TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNAssetsInboundBlockRule.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Update-ZNAssetsInboundBlockRule' {
    It 'UpdateExpanded' {
        $asset = Search-ZNAsset -fqdn linux0.posh.local
        [string]$ports = Get-Random -Minimum 1 -Maximum 65000
        $portsList = New-ZNPortsList -Protocol TCP -Ports $ports
        $source = Invoke-ZNEncodeEntityIP -Ip 1.1.1.1
        $expiresAt = [DateTimeOffset]::UtcNow.AddHours(1).ToUnixTimeMilliseconds()
        $rule = New-ZNInboundBlockRule -LocalEntityId $asset -LocalProcessesList @("*") -PortsList $portsList -RemoteEntityIdsList @($source) -State 1 -ExpiresAt $expiresAt
        
        $newdescription = "new description " + (Get-Random -Minimum 1 -Maximum 100)
        Update-ZNAssetsInboundBlockRule -AssetId $asset -RuleId $rule.ItemId -Description $newdescription
        $updatedRule = Get-ZNAssetsInboundBlockRule -AssetId $asset -RuleId $rule.ItemId
        $updatedRule.ItemDescription | Should -Be $newdescription
        Remove-ZNInboundAllowRule -RuleId $rule.ItemId
    }
}
