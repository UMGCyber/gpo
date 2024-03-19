Get-Service -DisplayName 'Bluetooth Audio Gateway Service','Bluetooth Support Service','Downloaded Maps Manager','Geolocation Service','Infrared monitor service','Internet Connection Sharing (ICS)','Link-Layer Topology Discovery Mapper',`
'LxssManager','Microsoft iSCSI Initiator Service','OpenSSH Authentication Agent','Link-Layer Topology Discovery Mapper','LxssManager','Microsoft iSCSI Initiator Service','OpenSSH Authentication Agent','OpenSSH SSH Server',`
'Peer Name Resolution Protocol','Peer Networking Grouping','Peer Networking Identity Manager','PNRP Machine Name Publication Service','Problem Reports Control Panel Support','Remote Access Auto Connection Manager',`
'Remote Desktop Services UserMode Port Redirector','Remote Procedure Call (RPC) Locator','Remote Registry','Routing and Remote Access','Simple TCP/IP Services','SNMP Service','SNMP Trap','Special Administration Console Helper',`
'SSDP Discovery','UPnP Device Host','Windows Error Reporting Service','Windows Event Collector','Windows Media Player Network Sharing Service','Windows Mobile Hotspot Service','Windows Push Notifications System Service',`
'Windows PushToInstall Service','Windows Remote Management (WS-Management)','Xbox Accessory Management Service','Xbox Live Auth Manager','Xbox Live Game Save','Xbox Live Networking Service' | Set-Service -StartupType Disabled -Status Stopped

Get-Service -DisplayName 'Bluetooth Audio Gateway Service','Bluetooth Support Service','Downloaded Maps Manager','Geolocation Service','Infrared Monitor Service','Internet Connection Sharing (ICS)','Link-Layer Topology Discovery Mapper',`
'LxssManager','Microsoft iSCSI Initiator Service','OpenSSH Authentication Agent','Link-Layer Topology Discovery Mapper','LxssManager','Microsoft iSCSI Initiator Service','OpenSSH Authentication Agent','OpenSSH SSH Server',`
'Peer Name Resolution Protocol','Peer Networking Grouping','Peer Networking Identity Manager','PNRP Machine Name Publication Service','Problem Reports Control Panel Support','Remote Access Auto Connection Manager',`
'Remote Desktop Services UserMode Port Redirector','Remote Procedure Call (RPC) Locator','Remote Registry','Routing and Remote Access','Simple TCP/IP Services','SNMP Service','SNMP Trap','Special Administration Console Helper',`
'SSDP Discovery','UPnP Device Host','Windows Error Reporting Service','Windows Event Collector','Windows Media Player Network Sharing Service','Windows Mobile Hotspot Service','Windows Push Notifications System Service',`
'Windows PushToInstall Service','Windows Remote Management (WS-Management)','Xbox Accessory Management Service','Xbox Live Auth Manager','Xbox Live Game Save','Xbox Live Networking Service' | Stop-Service -PassThru -Verbose -Force

$Answer = Read-Host -Prompt 'Is this an IIS FTP Server? Y/N:'
if ($Answer -eq 'N' -or $Answer -eq 'No')
{
    Get-Service -DisplayName 'Microsoft FTP Service' | Set-Service -StartupType Disabled -Status Stopped
    Stop-Service -DisplayName 'Microsoft FTP Service' -Force -PassThru -Verbose

    $Answer = Read-Host -Prompt 'Is this an IIS Web Server? Y/N:'
    if ($Answer -eq 'N' -or $Answer -eq 'No')
    {
        Get-Service -DisplayName 'IIS Admin Service','World Wide Web Publishing Service' | Set-Service -StartupType Disabled -Status Stopped
        Stop-Service -DisplayName 'IIS Admin Service','World Wide Web Publishing Service' -Force -PassThru -Verbose
    }
}
$Answer = Read-Host -Prompt 'Is this a Print Server? Y/N:'
if ($Answer -eq 'N' -or $Answer -eq 'No')
{
    Get-Service -DisplayName 'Print Spooler' | Set-Service -StartupType Disabled -Status Stopped
    Stop-Service -DisplayName 'Print Spooler' -Force -PassThru -Verbose

    $Answer = Read-Host -Prompt 'Is this a File Server or Domain Controller? Y/N:'
    if ($Answer -eq 'N' -or $Answer -eq 'No')
    {
        Get-Service -DisplayName Server | Set-Service -StartupType Disabled -Status Stopped
        Stop-Service -DisplayName Server -Force -PassThru -Verbose
    }
}
$Answer = Read-Host -Prompt 'Does this require Remote Desktop Protocol (RDP) for any reason? Y/N:'
if ($Answer -eq 'N' -or $Answer -eq 'No')
{
    Get-Service -DisplayName 'Remote Desktop Configuration' | Set-Service -StartupType Disabled -Status Stopped
    Get-Service -DisplayName 'Remote Desktop Services' | Set-Service -StartupType Disabled -Status Stopped
    Stop-Service -DisplayName 'Remote Desktop Configuration' -Force -PassThru -Verbose
    Stop-Service -DisplayName 'Remote Desktop Services' -Force -PassThru -Verbose
}