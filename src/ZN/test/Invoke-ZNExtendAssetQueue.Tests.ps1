$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)
$TestRecordingFile = Join-Path $PSScriptRoot 'Invoke-ZNExtendAssetQueue.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Invoke-ZNExtendAssetQueue' {
    It 'ExtendExpanded' {
        $assetId = Search-ZNAsset -Fqdn ls01.posh.local
        Invoke-ZNAssetsQueueAsset -AssetId $assetId -QueueDays 14
        $asset = (Get-ZNAssetsQueued).Items | where {$_.Fqdn -eq 'ls01.posh.local'}
        Invoke-ZNExtendAssetQueue -Items @($assetId) -ExtendByDays 14
        $updatedAsset = (Get-ZNAssetsQueued).Items | where {$_.Fqdn -eq 'ls01.posh.local'}
        $updatedAsset.StateProtectAt | Should -BeGreaterThan $asset.StateProtectAt
        Unprotect-ZNAsset -Items @($assetId)
    }
}
