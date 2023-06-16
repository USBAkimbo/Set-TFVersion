# What is this?
- This repo is dedicated to `Set-TFVersion`, the Terraform version changer for Windows
- This simply sets the command `tf` to use whichever version of Terraform you specify

# Requirements
- PowerShell
- See `Set-TFVersion.psm1` for further details

# Usage
- This module is best used in your PowerShell profiles
- You can find these under your `Documents\WindowsPowerShell` folder
- In here, you should see `Microsoft.PowerShell_profile.ps1` and `Microsoft.PowerShellISE_profile.ps1`
- If you don't, create the `WindowsPowerShell` folder and create both `Microsoft.PowerShell_profile.ps1` and `Microsoft.PowerShellISE_profile.ps1`
- Copy and paste the below into both `Microsoft.PowerShell_profile.ps1` and `Microsoft.PowerShellISE_profile.ps1` and modify accordingly to your environment

```
Write-Host -ForegroundColor Yellow "====================================="
Write-Host -ForegroundColor Yellow "Loading Custom PowerShell Environment"
Write-Host -ForegroundColor Yellow "====================================="

# Scripts directory
$Modules = "C:\Path\To\Modules\Folder"

# Load all modules
gci $Modules | % {Import-Module $Modules\$_}

Write-Host -ForegroundColor Green "====================================="
Write-Host -ForegroundColor Green "Custom PowerShell Environment Loaded"
Write-Host -ForegroundColor Green "====================================="
```

- Once you've done this, create a modules folder somewhere on your system as specified above in the `$Modules` variable
- Then drop `Set-TFVersion.psm1` into your modules folder and open a new PowerShell window
- Run `Set-TFVersion` and hit `tab` to confirm that the module is loaded
- Select the version of Terraform that you want (if one is missing, edit the script and add it in)
- Use Terraform with `tf` instead of `terraform`
- Enjoy!
