---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworkszeronetworks/get-znsettingsconnectserver
schema: 2.0.0
---

# Get-ZNSettingsConnectServer

## SYNOPSIS
List Connect Servers in Settings

## SYNTAX

```
Get-ZNSettingsConnectServer [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>] [<CommonParameters>]
```

## DESCRIPTION
List Connect Servers in Settings

## EXAMPLES

### Example 1: List Connect servers
```powershell
Get-ZNSettingsConnectServer
AssemblyVersion ClientsDnsServerIPs ConnectionState ExternalIPAddress Fqdn            Id           InstalledAt   InternalIPAddress Name Port
--------------- ------------------- --------------- ----------------- ----            --           -----------   ----------------- ---- ----
1.0.12.0        {10.1.0.5}          1               13.90.119.130     CS01.posh.local y:a:jUDZuhXU 1685619874429 10.1.0.9          CS01 52000
```

This cmdlet lists Connect servers under settings.

## PARAMETERS

### -Filters
JSON string URI encoded set of fiters

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IConnectServer

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

