# if ($args.Length -eq 0) { write-host "help" } 
param (
	[Parameter()]
	[ValidateNotNullOrEmpty()]
	[string]$server=$(throw "-server <server_hostname_or_ip> is mandatory, please provide a value."),
	$target = $(throw "-target <install_path> is mandatory, please provide a value."),
	$dsn = "tibero",
	$sid = "tibero",
	$port = 8629,
	$user = "tibero",
	$pass = "tmax",
	$bit = 64
)

If ("32","64" -NotContains $bit) { Throw “-bit $($bit) is not valid. Please use -bit 32 or -bit 64” } 

if ($32bit -eq $true) {$bit = "32"}
write-host "<-target install_path>" $target
write-host "<-server tibero_server_hostname_or_ip>" $server
write-host "[-dsn System_DSN]" $dsn
write-host "[-sid Tibero_SID]" $sid
write-host "[-port Tibero_Port]" $port
write-host "[-user Tibero_username]" $user
write-host "[-pass Tibero_password]" $pass
write-host "[-bit 32/64]" $bit

# Copy Driver DLL to Target Directory
New-Item $target"\\win$($bit)\\lib" -ItemType Directory -ea 0
copy-item "win$($bit)\\lib\\libtbcli.dll" "$($target)\\win$($bit)\\lib"

# Prepare Registry File
(Get-Content -path "Tibero_ODBC$($bit).reg" -Raw) | Foreach-Object {
    $_ -replace 'C:\\\\opt\\\\tibero6', ($target -replace '\\','\\') `
       -replace 'tibero_dsn', $dsn `
       -replace 'tibero_sid', $sid `
       -replace 'tibero_username', $user `
       -replace 'tibero_password', $pass `
       -replace 'tibero_server', $server `
       -replace '8629', $port `
#      -replace 'aaa', 'bbb'
    } | Set-Content -Path Tibero_ODBC_Install.reg

# Import Modified Registry File
reg import .\Tibero_ODBC_Install.reg
