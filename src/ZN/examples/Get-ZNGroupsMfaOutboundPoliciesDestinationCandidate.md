### Example 1: Get destination candidates for a MFA policy for a group
```powershell
$group = Get-ZNGroup -Search "Domain controllers" | where {$_.Domain -eq "tag"}
(Get-ZNGroupsMfaOutboundPoliciesDestinationCandidate -Groupid $group.id -GroupType tag).Items                 
       
Domain HasProtectionPolicy Id           Name
------ ------------------- --           ----
                           g:s:17445453 Segmented OT/IoT devices
OT/IoT False               g:o:0T445453 Biometric entry systems
OT/IoT False               g:o:04445453 Cameras
OT/IoT False               g:o:0A445453 Card readers
OT/IoT False               g:o:0S445453 Door locks
OT/IoT False               g:o:06445453 Factory controllers
OT/IoT False               g:o:0L445453 Fire alarms
OT/IoT False               g:o:0P445453 Firewall appliance
OT/IoT False               g:o:0K445453 Game consoles
OT/IoT False               g:o:0J445453 Historians
OT/IoT False               g:o:0E445453 HMIs
                           a:t:OeG7qsVV ot1777
                           a:t:u7QxbAUn ot1933845
                           a:t:Mid11kmS ot20245
                           a:t:cC6njhiS ot202879
                           a:t:4bNJaK7P ot261406
                           a:t:m9m4JIHj ot274123
                           a:t:e9z4KHtm ot285039
                           a:t:gVwo8dSe ot302331
                           a:t:LLkiZLdF ot357111
                           a:t:79SpShM5 ot382777
```

This cmdlet returns possible destination candidates for a MFA policy for a group.
