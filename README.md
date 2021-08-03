# Tibero ODBC Driver and DNS Configuration for Windows Platform

    Replace win32/lib/libtbcli.dll and win64/lib/libtbcli.dll from Tibero server $TB_HOME/client  

    Start PowerShell and run .\install_tibero_driver.ps1 -server <tibero_server_hostname_or_ip> -target <installation_target_directory> [[-dsn] (default:tibero)] [[-sid] (default:tibero)] [[-port] (default:8629)] [[-user] (default:tibero)] [[-pass] (default:tmax)] [[-bit] (default:64)]
    For example: .\install_tibero_driver.ps1 -target C:\tibero_client -server tbserver1

