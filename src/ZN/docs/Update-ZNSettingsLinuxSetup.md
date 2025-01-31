---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworkszeronetworks/update-znsettingslinuxsetup
schema: 2.0.0
---

# Update-ZNSettingsLinuxSetup

## SYNOPSIS
Update the linux setup settings in Asset Managment

## SYNTAX

```
Update-ZNSettingsLinuxSetup -AllowInstallPackages [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Update the linux setup settings in Asset Managment

## EXAMPLES

### Example 1: Update AI learning config
```powershell
Update-ZNSettingsLinuxSetup -AllowInstallPackages:$false

```

This cmdlet updates the AI learning settings.

## PARAMETERS

### -AllowInstallPackages
.

```yaml
Type: System.Management.Automation.SwitchParameter
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

### System.Boolean

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

