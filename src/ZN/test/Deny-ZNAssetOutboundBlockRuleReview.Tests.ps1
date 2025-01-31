$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)
$TestRecordingFile = Join-Path $PSScriptRoot 'Deny-ZNAssetOutboundBlockRuleReview.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Deny-ZNAssetOutboundBlockRuleReview' {
    It 'DenyExpanded' {
        $asset = Search-ZNAsset -Fqdn linux0.posh.local
        $rule = Get-ZNAssetOutboundBlockRule -AssetId $asset | where {$_.State -eq 4} | Select-Object -First 1
        { Deny-ZNAssetOutboundBlockRuleReview -AssetId $asset -RuleId $rule.id -Reason MissingPortOrProcess } | Should -Not -Throw
    }
}
