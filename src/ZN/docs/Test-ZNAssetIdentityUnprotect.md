---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworkszeronetworks/test-znassetidentityunprotect
schema: 2.0.0
---

# Test-ZNAssetIdentityUnprotect

## SYNOPSIS
Returns a number of assets that are valid to unprotect.

## SYNTAX

### Validate1 (Default)
```
Test-ZNAssetIdentityUnprotect -AssetId <String> [-Confirm] [-WhatIf] [<CommonParameters>]
```

### ValidateExpanded
```
Test-ZNAssetIdentityUnprotect -Items <String[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Returns a number of assets that are valid to unprotect.

## EXAMPLES

### Example 1: Test an asset for removal from identity segmentation
```powershell
$asset = Search-ZNAsset -Fqdn dc01.posh.local                      
Test-ZNAssetIdentityUnprotect -AssetId $asset

```

This cmdlet tests an asset for removal from identity segmentation.
0 = Not suitable, 1 = Suitable

### Example 2: Test multiple assets for removal from identity segmentation
```powershell
Test-ZNAssetIdentityUnprotect -Items @("assetid","assetId")

```

This cmdlet tests multiple assets for removal from identity segmentation.

## PARAMETERS

### -AssetId
assetId to filter on

```yaml
Type: System.String
Parameter Sets: Validate1
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
Parameter Sets: ValidateExpanded
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

### System.Int32

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

