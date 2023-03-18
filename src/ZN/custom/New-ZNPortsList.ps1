    <#
    .Synopsis
    Create a in-memory object for PortsList
    .Description
    Create a in-memory object for PortsList

    .Outputs
    ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem
    .Link
    https://github.com/zeronetworks/zero-powershell/new-znportslist
    #>
    function New-ZNPortsList {
        [OutputType([ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem])]
        [CmdletBinding(PositionalBinding=$false)]
        Param(
    
            [Parameter(HelpMessage="List of port numbers", ParameterSetName = 'Protocol')]
            [string]
            $Ports,

            [Parameter(Mandatory, HelpMessage="Protocol", ParameterSetName = 'Protocol')]
            [ValidateSet("Any","TCP","UDP","ICMP")]
            [string]
            $Protocol,

            [Parameter(Mandatory, HelpMessage="Empty port list", ParameterSetName = 'Empty')]
            [switch]
            $Empty
        )

        process {
            $Object = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem]::New()

            if ($PSBoundParameters['Protocol'] -eq 'Any'){
                $Object.ProtocolType = 256
                $Object.Ports = ""
            }
            if ($PSBoundParameters['Protocol'] -eq 'TCP'){
                $Object.ProtocolType = 6
                $Object.Ports = $PSBoundParameters['Ports']
            }
            if ($PSBoundParameters['Protocol'] -eq 'UDP'){
                $Object.ProtocolType = 17
                $Object.Ports = $PSBoundParameters['Ports']
            }
            if ($PSBoundParameters['Protocol'] -eq 'ICMP'){
                $Object.ProtocolType = 1
                $Object.Ports = ""
            }
            return $Object
        }
    }
    
