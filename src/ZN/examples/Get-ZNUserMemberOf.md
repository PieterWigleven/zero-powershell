### Example 1: Get users groups
```powershell
Get-ZNUserMemberOf -UserId u:a:E6iXCia4
CreatedAt     Description DirectMembersCount Domain    Guid                                 HasProtectionPolicy Id           Name
---------     ----------- ------------------ ------    ----                                 ------------------- --           ----     
1648475326021             0                  zero.labs 3bcfa592-7310-4f1e-9b76-5fc1c6ac4ee9 False               g:a:04fLbS1I DUO      
1646147849661             0                  zero.labs c10ea51c-3f3d-4bcc-a34c-ce1f8c667dc6 False               g:a:mn0S6UED Denied R…
1646147849590             0                  zero.labs 3da4c11a-6a89-49db-9edc-446624794a89 False               g:a:KP9w8f2B Domain A…
1646147849770             0                  zero.labs 84d2ad0c-b06f-44fd-a043-3c1549945246 False               g:a:ukYAIg2J Administ…
```

This cmdlet gets the groups a user is a member of.
