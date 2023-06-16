# Terraform folder path
$TFPath = "C:\ProgramData\Terraform"

# Ensure $TFPath exists
if (!(Test-Path $TFPath)) {
    New-Item -ItemType Directory -Path $TFPath
}

# Default to latest version
Set-Alias -Scope "Global" tf "$TFPath\terraform-1.5.0.exe"

function Set-TFVersion {
    param (
        [Parameter(Mandatory=$true)]
        [ValidateSet("1.5.0","1.4.6","1.3.9","1.2.9","1.1.9","1.0.11","0.15.5","0.14.11","0.13.7","0.12.31","0.11.15")]
        [String]
        $Version
    )

    switch ($Version) {
        $Version {
            # Check if we have $Version installed
            if (Test-Path $TFPath\terraform-$Version.exe) {
                # $Version is already installed so set alias
                Set-Alias -Scope "Global" tf "$TFPath\terraform-$Version.exe"
            } else {
                # $Version is not installed so install it and set the alias
                Write-Host "Terraform $Version is not installed, downloading..."
                $URL = "https://releases.hashicorp.com/terraform/$Version/terraform_" + $Version + "_windows_amd64.zip"
                Start-BitsTransfer $URL $TFPath\$Version.zip
                Expand-Archive $TFPath\$Version.zip $TFPath
                Move-Item $TFPath\terraform.exe $TFPath\terraform-$Version.exe
                Remove-Item -Force $TFPath\$Version.zip
                Set-Alias -Scope "Global" tf "$TFPath\terraform-$Version.exe"
            }
            Write-Host "Set tf to version $Version"
        }
    }
}
