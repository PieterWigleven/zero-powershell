---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworkszeronetworks/unprotect-znassetidentity
schema: 2.0.0
---

# Unprotect-ZNAssetIdentity

## SYNOPSIS
Returns an empty object.

## SYNTAX

### Unprotect1 (Default)
```
Unprotect-ZNAssetIdentity -AssetId <String> [-Confirm] [-WhatIf] [<CommonParameters>]
```

### UnprotectExpanded
```
Unprotect-ZNAssetIdentity -Items <String[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Returns an empty object.

## EXAMPLES

### Example 1: Remove an asset from identity segmentation
```powershell
$asset = Search-ZNAsset -Fqdn dc01.posh.local                      
Unprotect-ZNAssetIdentity -AssetId $asset

```

This cmdlet removes an asset from identity segmentation.

### Example 2: Remove multiple assets from identity segmentation
```powershell
Unprotect-ZNAssetIdentity -Items @("assetid","assetId")

```

This cmdlet removes multiple assets from identity segmentation.

## PARAMETERS

### -AssetId
assetId to filter on

```yaml
Type: System.String
Parameter Sets: Unprotect1
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Items
.

```yaml
Type: System.String[]
Parameter Sets: UnprotectExpanded
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: wi

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IAny

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

