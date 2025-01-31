---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworkszeronetworks/get-znmfaoutboundpoliciessimulatesourceusercandidate
schema: 2.0.0
---

# Get-ZNMfaOutboundPoliciesSimulateSourceUserCandidate

## SYNOPSIS
Returns a list of source users candidates on outbound MFA simulation.

## SYNTAX

```
Get-ZNMfaOutboundPoliciesSimulateSourceUserCandidate [-Limit <Int32>] [-Offset <Int32>] [-Search <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Returns a list of source users candidates on outbound MFA simulation.

## EXAMPLES

### Example 1: Get possible source users for outbound MFA Policy simulation
```powershell
(Get-ZNMfaOutboundPoliciesSimulateSourceUserCandidate).Items
Domain Id           Name
------ --           ----
       u:a:r6ZkL5Y0 Guest
       u:a:IiObBkVQ krbtgt
       u:a:w27loY5p nicholas
       u:a:Tolw5kf6 test
       u:a:RVVXGo4w zero
       u:a:V61t0gZB ZNRemoteManagement
```

This cmdlet will return possbile candidates for source users in an outbound MFA policy simulation.

### Example 2: Search for a candidate
```powershell
(Get-ZNMfaOutboundPoliciesSimulateSourceUserCandidate -Search zero).Items
Domain Id           Name
------ --           ----
       u:a:RVVXGo4w zero
```

To find a specific candidate use the search parameter with the Name to be searched.

## PARAMETERS

### -Limit
Limit the return results

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 10
Accept pipeline input: False
Accept wildcard characters: False
```

### -Offset
Used to page through results

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Search
Test to search for

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISrcUserCandidatesList

## NOTES

## RELATED LINKS

