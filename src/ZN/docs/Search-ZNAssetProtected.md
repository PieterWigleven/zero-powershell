---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworkszeronetworks/search-znassetprotected
schema: 2.0.0
---

# Search-ZNAssetProtected

## SYNOPSIS
Given fqdn, returns assetId, if asset is found and is protected

## SYNTAX

```
Search-ZNAssetProtected [-Fqdn <String>] [<CommonParameters>]
```

## DESCRIPTION
Given fqdn, returns assetId, if asset is found and is protected

## EXAMPLES

### Example 1: Find a segmented asset by FQDN
```powershell
Search-ZNAssetProtected -Fqdn dc1.zero.labs

a:a:ZgBWOMyc
```

This cmdlet will search the assets using FQDN to return the assetId.

## PARAMETERS

### -Fqdn
fully qualifed domain name

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

### System.String

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

