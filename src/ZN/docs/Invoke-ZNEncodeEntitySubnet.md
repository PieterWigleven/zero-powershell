---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworkszeronetworks/invoke-znencodeentitysubnet
schema: 2.0.0
---

# Invoke-ZNEncodeEntitySubnet

## SYNOPSIS
Returns the assetId after encoding the IP subnet.

## SYNTAX

```
Invoke-ZNEncodeEntitySubnet -Subnet <String> [<CommonParameters>]
```

## DESCRIPTION
Returns the assetId after encoding the IP subnet.

## EXAMPLES

### Example 1: Encode an IP subnet range
```powershell
Invoke-ZNEncodeEntitySubnet -Subnet 1.1.1.0/24 
b:120101010018
```

This cmdlet encodes an IP subnet to ZNSegement entityId for use in rules and policies.

## PARAMETERS

### -Subnet
IP Subnet

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

### System.String

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

