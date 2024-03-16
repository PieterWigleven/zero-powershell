if(($null -eq $TestName) -or ($TestName -contains 'Test-ZNAssetNetworkSegment'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Test-ZNAssetNetworkSegment.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Test-ZNAssetNetworkSegment' {
    It 'Validate' {
        $asset = (Search-ZNAsset -Fqdn ls01.posh.local).AssetId
        { Test-ZNAssetNetworkSegment -Items @($asset) } | Should -Not -Throw
    }

    It 'ValidateExpanded' {
        $asset = (Search-ZNAsset -Fqdn ls01.posh.local).AssetId
        { Test-ZNAssetNetworkSegment -AssetId $asset } | Should -Not -Throw
    }
}
