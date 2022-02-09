Get-PnpDevice -FriendlyName "*1050*" | Disable-PnpDevice -confirm:$false
Start-Process "D:\Solidworks2018\SOLIDWORKS\SLDWORKS.exe"
Get-PnpDevice -FriendlyName "*1050*" | Enable-PnpDevice -confirm:$false
