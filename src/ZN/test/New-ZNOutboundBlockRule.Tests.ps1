if(($null -eq $TestName) -or ($TestName -contains 'New-ZNOutboundBlockRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'New-ZNOutboundBlockRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'New-ZNOutboundBlockRule' {
    It 'CreateExpanded' {
        $portsList = New-ZNPortsList -Protocol TCP -Ports (Get-Random -Minimum 1 -Maximum 1024)
        $source = (Get-ZNOutboundAllowRulesSourceCandidate -search "all segmented assets").Items
        $destination = Invoke-ZNEncodeEntityIp -IP 1.2.3.4
        $expiresAt = [DateTimeOffset]::UtcNow.AddHours(1).ToUnixTimeMilliseconds()
        $rule = New-ZNOutboundBlockRule -LocalEntityId $source.Id -LocalProcessesList @("*") -PortsList $portsList -RemoteEntityIdsList @($destination) -State 1 -ExpiresAt $expiresAt
        $rule.id | Should -Not -Be $null
    }
}
