$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)
$TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNAssetsInboundBlockRulesSourceCandidate.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Get-ZNAssetsInboundBlockRulesSourceCandidate' {
    It 'List' {
        $asset = (Get-ZNAssetsMonitored -Limit 400).Items | where {$_.Fqdn -eq "DC01.posh.local"}
        Get-ZNAssetsInboundBlockRulesSourceCandidate -AssetId $asset.id | Should -Not -Be $null
    }
}
