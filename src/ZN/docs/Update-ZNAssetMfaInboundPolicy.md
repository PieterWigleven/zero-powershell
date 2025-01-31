---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/update-znassetmfainboundpolicy
schema: 2.0.0
---

# Update-ZNAssetMfaInboundPolicy

## SYNOPSIS
Updates an inbound MFA Policy.

## SYNTAX

```
Update-ZNAssetMfaInboundPolicy -AssetId <String> -ReactivePolicyId <String>
 [-AdditionalPortsList <IPortsListItem[]>] [-Description <String>] [-DstPort <String>]
 [-DstProcessNames <String[]>] [-ExcludedSrcEntityInfos <String[]>] [-ExcludedSrcProcesses <String[]>]
 [-FallbackToLoggedOnUser] [-MfaMethods <Int32[]>] [-OverrideBuiltins] [-ProtocolType <Int32>]
 [-RuleDuration <Int32>] [-SrcEntityInfos <ReactivePolicyInboundBodySrcEntityInfosItem[]>]
 [-SrcProcessNames <String[]>] [-SrcUserInfos <ReactivePolicyInboundBodySrcUserInfosItem[]>] [-State <Int32>]
 [-AsJob] [-NoWait] [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Updates an inbound MFA Policy.

## EXAMPLES

### Example 1: Update inbound MFA policy for an asset
```powershell
$asset = Search-ZNAsset -fqdn wc01.posh.local
$mfaPolicy = Get-ZNAssetMfaInboundPolicy -AssetId $asset -ReactivePolicyId d6e8392a-b1c8-4fa2-ae36-8093b86b0860
$mfaPolicy.ItemDstPort = $mfaPolicy.ItemDstPort+,",24"
Update-ZNAssetMfaInboundPolicy -AssetId $asset -ReactivePolicyId $mfaPolicy.ItemId -DstPort $mfaPolicy.ItemDstPort

DstEntityInfoAssetStatus     : 7
DstEntityInfoAssetType       : 1
DstEntityInfoDomain          : posh.local
DstEntityInfoFqdn            : WC01.posh.local
DstEntityInfoId              : a:a:OtfLGUBq
DstEntityInfoIpv4Addresses   : {10.1.0.8}
DstEntityInfoIpv6Addresses   : {}
DstEntityInfoName            : WC01
DstEntityInfoOperatingSystem : Windows 11 Enterprise
DstEntityInfoProtectionState : 1
DstEntityInfoSource          : 3
ItemAdditionalPortsList      : {}
ItemCreatedAt                : 1695053153799
ItemCreatedBy                : u:a:w27loY5p
ItemCreatedByName            : nicholas
ItemDescription              : 
ItemDstPort                  : 24,123
ItemDstProcessNames          : {*}
ItemEnforcementSource        : 6
ItemExcludedSrcEntityInfos   : {}
ItemExcludedSrcProcesses     : {}
ItemFallbackToLoggedOnUser   : False
ItemId                       : d6e8392a-b1c8-4fa2-ae36-8093b86b0860
ItemMfaMethods               : {4}
ItemOverrideBuiltins         : False
ItemProtocolType             : 6
ItemRuleDuration             : 6
ItemSrcEntityInfos           : {Any asset}
ItemSrcProcessNames          : {*}
ItemSrcUserInfos             : {Any user}
ItemState                    : 1
ItemUpdatedAt                : 1695053185370
StateAssetId                 : a:a:OtfLGUBq
StateIsAssetConnected        : True
StateLasDisconnectedAt       : 
StateProtectAt               : 
StateProtectionState         : 1
```

This cmdlet updates an inbound MFA policy for an asset.

## PARAMETERS

### -AdditionalPortsList
extra ports to open.
To construct, see NOTES section for ADDITIONALPORTSLIST properties and create a hash table.

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.IPortsListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AsJob
Run the command as a job

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AssetId
Asset Id

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

### -Description
the policy description.

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

### -DstPort
[Parameter(ParameterSetName = 'UpdateExpanded')]
[ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
[System.String]
 destination asset(s).
${DstEntityInfoId},
 destination ports.

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

### -DstProcessNames
destination processes.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludedSrcEntityInfos
excluded source assets

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludedSrcProcesses
Excluded source processes

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FallbackToLoggedOnUser
fallback to logged on user enable/disable.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MfaMethods
MFA methods.

```yaml
Type: System.Int32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoWait
Run the command asynchronously

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OverrideBuiltins
Override built in MFA policies

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProtocolType
protocol 6 for TCP, 17 for UDP.

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

### -ReactivePolicyId
policy Id

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

### -RuleDuration
the rule expiration.

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

### -SrcEntityInfos
source asset(s).
To construct, see NOTES section for SRCENTITYINFOS properties and create a hash table.

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcEntityInfosItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SrcProcessNames
source processes.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SrcUserInfos
source user(s).
To construct, see NOTES section for SRCUSERINFOS properties and create a hash table.

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcUserInfosItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -State
the policy state.

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicy

## NOTES

COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.


`ADDITIONALPORTSLIST <IPortsListItem[]>`: extra ports to open.
  - `[Ports <String>]`: 
  - `[ProtocolType <Int32?>]`: 

`SRCENTITYINFOS <ReactivePolicyInboundBodySrcEntityInfosItem[]>`: source asset(s).
  - `Id <String>`: 

`SRCUSERINFOS <ReactivePolicyInboundBodySrcUserInfosItem[]>`: source user(s).
  - `Id <String>`: 

## RELATED LINKS

