if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNSettingsAdSecondary'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNSettingsAdSecondary.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNSettingsAdSecondary' {
    It 'Delete' {
        New-ZNSettingsAd -ActiveDirectoryInfoDomainControllerFqdn dc.test.local -ActiveDirectoryInfoDomainName test.local -ActiveDirectoryInfoUseLdaps -ActiveDirectoryInfoUsername ZNRemoteManagement -PasswordCleartext "zero@1313"
        $forest = Get-ZNSettingsAd | where {$_.ActiveDirectoryInfoDomainName -eq "test.local"}
        New-ZNSettingsAdSecondary -ForestId $forest.ForestId -Dc "dc.child.test.local" -Domain "child.test.local"
        { Remove-ZNSettingsAdSecondary -DomainId "child.test.local" -ForestId $forest.ForestId } | Should -Not -Throw
        Remove-ZNSettingsAd -ForestId $forest.ForestId
    }
}
