<#
.Synopsis
Updates an outbound MFA Policy.
.Description
Updates an outbound MFA Policy.

.Link
https://github.com/zeronetworks/zn.api/update-znmfaoutboundpolicy
#>
function Update-ZNMfaOutboundPolicy {
    [OutputType([ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicy])]
    [CmdletBinding(DefaultParameterSetName = 'UpdateExpanded', PositionalBinding = $false, SupportsShouldProcess, ConfirmImpact = 'Medium')]
    param(
        [Parameter(ParameterSetName = 'UpdateExpanded', Mandatory)]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Path')]
        [System.String]
        # policy Id
        ${ReactivePolicyId},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem[]]
        # extra ports to open.
        ${AdditionalPortsList},

        #[Parameter(ParameterSetName = 'UpdateExpanded')]
        #[ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        #[System.String]
        # destination asset(s).
        #${DstEntityInfoId},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [System.String]
        # destination ports.
        ${DstPort},

        #[Parameter(ParameterSetName = 'UpdateExpanded')]
        #[ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        #[System.String[]]
        # source processes.
        #${dstProcessNames},
        
        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [System.Management.Automation.SwitchParameter]
        # fallback to logged on user enable/disable.
        ${FallbackToLoggedOnUser},
         
        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [int[]]
        # MFA methods.
        ${MfaMethods},
        
        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [int]
        # protocol 6 for TCP, 17 for UDP.
        ${ProtocolType},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [int]
        # the rule expiration.
        ${RuleDuration},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyOutboundBodySrcEntityInfosItem[]]
        # source asset(s).
        ${SrcEntityInfos},
        
        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [System.String[]]
        # source processes.
        ${SrcProcessNames},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyOutboundBodySrcUserInfosItem[]]
        # source user(s).
        ${SrcUserInfos},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [int]
        # the policy state.
        ${State},
        
        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [System.String]
        # the policy description.
        ${Description},

        [Parameter()]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command as a job
        ${AsJob},

        [Parameter(DontShow)]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},

        [Parameter()]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command asynchronously
        ${NoWait},

        [Parameter(DontShow)]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},

        [Parameter(DontShow)]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
    )

    process {
        try {
            #Handle Get
            $policyId = $PSBoundParameters['ReactivePolicyId'].ToString()
            $policy = ZN.Api\Get-ZNMfaOutboundPolicy -ReactivePolicyId $policyId

            $updatedPolicy = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyOutboundBody]::new()
            
            if($PSBoundParameters['AdditionalPortsList']){
                $updatedPolicy.AdditionalPortsList = $PSBoundParameters['AdditionalPortsList']
                $null = $PSBoundParameters.Remove('AdditionalPortsList')
            }
            else{
                $updatedPolicy.AdditionalPortsList = $policy.ItemAdditionalPortsList
                $null = $PSBoundParameters.Remove('AdditionalPortsList')
            }
            
            $updatedPolicy.DstEntityInfoId = $policy.DstEntityInfoId
        
            if($PSBoundParameters['DstPort']){
                $updatedPolicy.DstPort = $PSBoundParameters['DstPort']
                $null = $PSBoundParameters.Remove('DstPort')
            }
            else{
                $updatedPolicy.DstPort = $policy.ItemDstPort
                $null = $PSBoundParameters.Remove('DstPort')
            }
            
            #$updatedPolicy.DstProcessNames = $policy.ItemDstProcessNames

            if($PSBoundParameters['FallbackToLoggedOnUser']){
                $updatedPolicy.FallbackToLoggedOnUser = $PSBoundParameters['FallbackToLoggedOnUser']
                $null = $PSBoundParameters.Remove('FallbackToLoggedOnUser')
            }
            else{
                $updatedPolicy.FallbackToLoggedOnUser = $policy.ItemFallbackToLoggedOnUser
                $null = $PSBoundParameters.Remove('FallbackToLoggedOnUser')
            }
        
            if($PSBoundParameters['MfaMethods']){
                $updatedPolicy.MfaMethods = $PSBoundParameters['MfaMethods']
                $null = $PSBoundParameters.Remove('MfaMethods')
            }
            else{
                $updatedPolicy.MfaMethods = $policy.ItemMfaMethods
                $null = $PSBoundParameters.Remove('MfaMethods')
            }      
        
            if($PSBoundParameters['ProtocolType']){
                $updatedPolicy.ProtocolType = $PSBoundParameters['ProtocolType']
                $null = $PSBoundParameters.Remove('ProtocolType')
            }
            else{
                $updatedPolicy.ProtocolType = $policy.ItemProtocolType
                $null = $PSBoundParameters.Remove('ProtocolType')
            }
        
            if($PSBoundParameters['RuleDuration']){
                $updatedPolicy.RuleDuration = $PSBoundParameters['RuleDuration']
                $null = $PSBoundParameters.Remove('RuleDuration')
            }
            else{
                $updatedPolicy.RuleDuration = $policy.ItemRuleDuration
                $null = $PSBoundParameters.Remove('RuleDuration')
            }
            
            if($PSBoundParameters['SrcEntityInfos']){
                $updatedPolicy.SrcEntityInfos = $PSBoundParameters['SrcEntityInfos']
                $null = $PSBoundParameters.Remove('SrcEntityInfos')
            }
            else{
                $updatedPolicy.SrcEntityInfos = $policy.ItemSrcEntityInfos
                $null = $PSBoundParameters.Remove('SrcEntityInfos')
            }
            
            if($PSBoundParameters['SrcProcessNames']){
                $updatedPolicy.SrcProcessNames = $PSBoundParameters['SrcProcessNames']
                $null = $PSBoundParameters.Remove('SrcProcessNames')
            }
            else{
                $updatedPolicy.SrcProcessNames = $policy.ItemSrcProcessNames
                $null = $PSBoundParameters.Remove('SrcProcessNames')
            }

            if($PSBoundParameters['SrcUserInfos']){
                $updatedPolicy.SrcUserInfos = $PSBoundParameters['SrcUserInfos']
                $null = $PSBoundParameters.Remove('SrcUserInfos')
            }
            else{
                $updatedPolicy.SrcUserInfos = $policy.ItemSrcUserInfos
                $null = $PSBoundParameters.Remove('SrcUserInfos')
            }
            
            if($PSBoundParameters['State']){
                $updatedPolicy.State = $PSBoundParameters['State']
                $null = $PSBoundParameters.Remove('State')
            }
            else{
                $updatedPolicy.State = $policy.ItemState
                $null = $PSBoundParameters.Remove('State')
            }

            if($PSBoundParameters['Description']){
                $updatedPolicy.Description = $PSBoundParameters['Description']
                $null = $PSBoundParameters.Remove('Description')
            }
            else{
                $updatedPolicy.Description = $policy.ItemDescription
                $null = $PSBoundParameters.Remove('Description')
            }
            
            $null = $PSBoundParameters.Add('Body', $updatedPolicy)
            ZN.Api.internal\Update-ZNMfaOutboundPolicy @PSBoundParameters
        }
        catch {
            throw
        }
    }
}