### Example 1: Get MFA authentication settings
 settings
```powershell
Get-ZNSettingsMfaAuthentication

ItemIsRequiresAuth ItemIsSsoForceAuth ItemTokenTtl
------------------ ------------------ ------------
              True              False           60
```

This cmdlet returns the MFA settings settings.
