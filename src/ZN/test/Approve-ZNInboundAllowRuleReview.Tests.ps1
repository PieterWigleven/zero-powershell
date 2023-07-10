$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)
$TestRecordingFile = Join-Path $PSScriptRoot 'Approve-ZNInboundAllowRuleReview.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Approve-ZNInboundAllowRuleReview' {
    It 'ApproveExpanded' {
        $asset = Search-ZNAsset -Fqdn linux0.posh.local
        $rule = Get-ZNInboundAllowRule | where {$_.State -eq 4} | Select-Object -First 1
        Approve-ZNInboundAllowRuleReview -RuleId $rule.id
        $updatedRule = Get-ZNInboundAllowRule | where {$_.Id -eq $rule.id}
        $updatedRule.State | Should -Be 1
        Remove-ZNOutboundAllowRule -RuleId $updatedRule.id
    }

    It 'ApproveWithChangesExpanded' {
        $asset = Search-ZNAsset -Fqdn linux0.posh.local
        $rule = Get-ZNInboundAllowRule | where {$_.State -eq 4} | Select-Object -First 1
        Approve-ZNInboundAllowRuleReview -RuleId $rule.id -Description "updatedapproval" -Reason MissingPortOrProcess
        $updatedRule = Get-ZNInboundAllowRule | where {$_.Id -eq $rule.id}
        $updatedRule.State | Should -Be 1
        Remove-ZNInboundAllowRule -RuleId $updatedRule.id
    }
}
