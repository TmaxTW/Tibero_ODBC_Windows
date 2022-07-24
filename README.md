# Tibero ODBC Driver and DSN Configuration for Windows Platform

* Copy win64/lib/libtbcli.dll and win32/lib/libtbcli.dll from Tibero server $TB_HOME/client
* 從 Tibero 安裝目錄中的 $TB_HOME/client 取得 win64/lib/libtbcli.dll 和 win32/lib/libtbcli.dll
* Start PowerShell as Administrator and run
* 用管理者權限啟動 PowerShell 並執行以下指令
```powershell
.\install_tibero_driver.ps1 
    -server <tibero_server_hostname_or_ip> 
    -target <installation_target_directory> 
    [[-dsn] (default:tibero)] 
    [[-sid] (default:tibero)] 
    [[-port] (default:8629)] 
    [[-user] (default:tibero)] 
    [[-pass] (default:tmax)] 
    [[-bit] (default:64)]
```
* For example:
* 例如：
```powershell
.\install_tibero_driver.ps1 -target C:\tibero_client -server tbserver1
```
