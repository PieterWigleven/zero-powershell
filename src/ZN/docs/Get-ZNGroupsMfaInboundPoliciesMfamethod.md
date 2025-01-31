---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworkszeronetworks/get-zngroupsmfainboundpoliciesmfamethod
schema: 2.0.0
---

# Get-ZNGroupsMfaInboundPoliciesMfamethod

## SYNOPSIS
Returns a list of MFA methods for inbound MFA policies.

## SYNTAX

```
Get-ZNGroupsMfaInboundPoliciesMfamethod -GroupId <String> -GroupType <String> [<CommonParameters>]
```

## DESCRIPTION
Returns a list of MFA methods for inbound MFA policies.

## EXAMPLES

### Example 1: Get MFA methods for a MFA policy for a group
```powershell
$group = Get-ZNGroup -Search "Domain controllers" | where {$_.Domain -eq "tag"}
Get-ZNGroupsMfaInboundPoliciesMfamethod -Groupid $group.id -GroupType tag        
2
4
5
1
```

This cmdlet returns possible MFA methods for a MFA policy for a group.

## PARAMETERS

### -GroupId
groupId to filter on

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupType
group type to filter on

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Int32

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

