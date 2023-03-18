if(($null -eq $TestName) -or ($TestName -contains 'Invoke-ZNExtendAssetQueue'))
{
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
}

Describe 'Invoke-ZNExtendAssetQueue' {
    It 'ExtendExpanded' {
        $asset = (Get-ZNAsset).Items | where {$_.ProtectionState -eq 3} | Select-Object -first 1
        { Invoke-ZNExtendAssetQueue -Items @($asset.Id) -ExtendByDays 30 } | Should -Not -Be $null
    }
}
