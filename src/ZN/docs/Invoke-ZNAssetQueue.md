---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworkszeronetworks/invoke-znassetqueue
schema: 2.0.0
---

# Invoke-ZNAssetQueue

## SYNOPSIS
Returns and empty object.

## SYNTAX

### QueueExpanded (Default)
```
Invoke-ZNAssetQueue -Items <String[]> -QueueDays <Int32> [-Confirm] [-WhatIf] [<CommonParameters>]
```

### QueueExpanded1
```
Invoke-ZNAssetQueue -AssetId <String> -QueueDays <Int32> [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Returns and empty object.

## EXAMPLES

### Example 1: Add an asset to learning
```powershell
$asset = Search-ZNAsset -Fqdn wc01.posh.local
Invoke-ZNAssetQueue -AssetId $asset -QueueDays 30
```

This cmdlet will add an asset to learning.

## PARAMETERS

### -AssetId
assetId to filter on

```yaml
Type: System.String
Parameter Sets: QueueExpanded1
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
Parameter Sets: QueueExpanded
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -QueueDays
number of days

```yaml
Type: System.Int32
Parameter Sets: (All)
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

