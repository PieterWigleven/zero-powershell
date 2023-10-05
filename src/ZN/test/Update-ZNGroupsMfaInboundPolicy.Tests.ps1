if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNGroupsMfaInboundPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNGroupsMfaInboundPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNGroupsMfaInboundPolicy' {
    It 'UpdateExpanded' -skip {
        $group = Get-ZNGroup -Search "domain controllers" | where {$_.id -like "g:t:*"}
        $source = (Get-ZNMfaInboundPoliciesSourceCandidate -search "Any Asset").Items
        $sourceEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcEntityInfosItem]::new()
        $sourceEntity.Id = $source.Id
        $sourceUser = (Get-ZNMfaInboundPoliciesSourceUserCandidate -search "Any User").Items
        $sourceUserEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcUserInfosItem]::new()
        $sourceUserEntity.Id = $sourceUser.Id
        [string]$dstPorts = Get-Random -Minimum 1 -Maximum 65000
        $portsList = New-ZNPortsList -Empty
        $policy = New-ZNMfaInboundPolicy -AdditionalPortsList $portsList -DstEntityInfoId $group.Id -DstPort $dstPorts -DstProcessNames @("*") -FallbackToLoggedOnUser -MfaMethods @(4) -ProtocolType 6 -RuleDuration 6 -SrcEntityInfos @($sourceEntity) -SrcProcessNames @("*") -SrcUserInfos @($sourceUserEntity) -State 1 -OverrideBuiltins:$false
        
        $newdescription = "new description " + (Get-Random -Minimum 1 -Maximum 100)
        Update-ZNGroupsMfaInboundPolicy -GroupId $group.id -GroupType tag -ReactivePolicyId $policy.ItemId -Description $newdescription
        $updatedPolicy = Get-ZNGroupsMfaInboundPolicy -GroupId $group.id -GroupType tag -ReactivePolicyId $policy.ItemId
        $updatedPolicy.ItemDescription | Should -Be $newdescription
        Remove-ZNMfaInboundPolicy -ReactivePolicyId $policy.ItemId
    }
}
