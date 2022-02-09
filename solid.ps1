Get-PnpDevice -FriendlyName "*1050*" | Disable-PnpDevice -confirm:$false
Start-Sleep -Seconds 1
Start-Process "D:\Solidworks2018\SOLIDWORKS\SLDWORKS.exe"
Start-Sleep -Seconds 60
Get-PnpDevice -FriendlyName "*1050*" | Enable-PnpDevice -confirm:$false
