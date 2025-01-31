---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworkszeronetworks/get-zninboundblockrulesexcludeddestinationcandidate
schema: 2.0.0
---

# Get-ZNInboundBlockRulesExcludedDestinationCandidate

## SYNOPSIS
Returns a list of excluded destination candidates for Inbound Block rules.

## SYNTAX

```
Get-ZNInboundBlockRulesExcludedDestinationCandidate [-Cursor <Int64>] [-Limit <Int32>] [-Search <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Returns a list of excluded destination candidates for Inbound Block rules.

## EXAMPLES

### Example 1: Get possible excluded destinations for inbound block rule
```powershell
(Get-ZNInboundBlockRulesExcludedDestinationCandidate).Items
AssetType Domain    Id           Name                                    ProtectionState
--------- ------    --           ----                                    ---------------
                    b:110002     All protected assets                    
                    b:110004     All protected servers                   
                    b:110005     All protected clients                   
          zero.labs g:a:yu1gHyge Access Control Assistance Operators     
          zero.labs g:a:LXwCiIyG Account Operators                       
          tag       g:t:32276c2c Acronis backup                          
          zero.labs g:a:ukYAIg2J Administrators                          
          zero.labs g:a:zpYqGY8G Allowed RODC Password Replication Group 
          tag       g:t:10276c2c Asset management                        
          zero.labs g:a:GqUGqkiM Backup Operators                        
          tag       g:t:23276c2c Backup servers                          
          tag       g:t:37276c2c Certificate Authority                   
          zero.labs g:a:zobH4QmN Certificate Service DCOM Access         
2         zero.labs a:a:ZgBWOMyc DC1                                     5
2         zero.labs a:a:GnyWAsYs FS1                                     3
2         zero.labs a:a:EP2KKITZ TRUST1                                  3
1         zero.labs a:a:6BokfBbU WIN10-1                                 3
1         zero.labs a:a:HYZhxRzI WIN10-2                                 3
1         zero.labs a:a:qnRgyRA9 WIN10-3                                 3
1         zero.labs a:a:5wiknOhs WIN7                                    3
1         zero.labs a:a:cxIJepiA win8-1                                  3
```

This cmdlet will return possbile candidates for destinations in an inbound block rule.

### Example 2: Search for a candidate
```powershell
(Get-ZNInboundBlockRulesExcludedDestinationCandidate -Search DC1).Items
AssetType Domain    Id           Name ProtectionState
--------- ------    --           ---- ---------------
2         zero.labs a:a:ZgBWOMyc DC1  5
```

To find a specific candidate use the search parameter with the Name to be searched.

## PARAMETERS

### -Cursor
cursor position to start at

```yaml
Type: System.Int64
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ICandidatesList

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

