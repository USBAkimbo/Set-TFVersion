# Requires Chocolately - The package manager for Windows
# Run the below to install it in PowerShell as admin
# https://chocolatey.org/install
# Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Then install the latest version of Terraform (again as admin in PowerShell)
# choco install terraform -y

# And install the other versions (again as admin in PowerShell)
# choco install terraform --version 1.2.9 --side-by-side -y
# choco install terraform --version 1.1.9 --side-by-side -y
# choco install terraform --version 1.0.11 --side-by-side -y
# choco install terraform --version 0.15.5 --side-by-side -y
# choco install terraform --version 0.14.11 --side-by-side -y
# choco install terraform --version 0.13.7 --side-by-side -y
# choco install terraform --version 0.12.31 --side-by-side -y
# choco install terraform --version 0.11.15 --side-by-side -y

# Default to latest version
Set-Alias -Scope "Global" tf "C:\ProgramData\chocolatey\lib\terraform\tools\terraform.exe"

function Set-TFVersion {
    param (
        [Parameter(Mandatory=$true)]
        [ValidateSet("Latest","1.2.9","1.1.9","1.0.11","0.15.5","0.14.11","0.13.7","0.12.31","0.11.15")]
        [String]
        $Version
    )

    switch ($Version) {
        $Version {
            if ($Version -eq "Latest") {
                Set-Alias -Scope "Global" tf "C:\ProgramData\chocolatey\lib\terraform\tools\terraform.exe"
                Write-Host "Set tf to latest version"
            } else {
                Set-Alias -Scope "Global" tf "C:\ProgramData\chocolatey\lib\terraform.$Version\tools\terraform.exe"
                Write-Host "Set tf to version $Version"
            }
		}
	}
}