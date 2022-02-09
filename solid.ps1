param([switch]$Elevated)

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) {
        # tried to elevate, did not work, aborting
    } else {
		Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
		#Set-ExecutionPolicy RemoteSigned
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
		Set-ExecutionPolicy Restricted
	}
    exit
}

Get-PnpDevice -FriendlyName "*1050*" | Disable-PnpDevice -confirm:$false
Start-Sleep -Seconds 1
Start-Process "D:\Solidworks2018\SOLIDWORKS\SLDWORKS.exe"
Start-Sleep -Seconds 60
Get-PnpDevice -FriendlyName "*1050*" | Enable-PnpDevice -confirm:$false

exit