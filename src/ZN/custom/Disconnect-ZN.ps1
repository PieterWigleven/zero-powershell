
<#
.Synopsis
Logout of Zero Networks
.Description
Logout of Zero Networks

#.Link
https://github.com/zeronetworks/zero-powershell/Disconnect-zn
#>
function Disconnect-ZN {
    [CmdletBinding(PositionalBinding = $false, SupportsShouldProcess, ConfirmImpact = 'Low')]
    param(

    )

    process {
        try {
            $env:ZNApiKey = ""
        }
        catch {
            throw
        }
    }
}