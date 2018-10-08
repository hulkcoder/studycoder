$servers = [ordered]@{}
$port = 25
Clear-Content "test-report.txt"
foreach($server in $servers.keys)
{
    Write-Output "Telnet Port: $server $port"
    #Test-NetConnection -ComputerName $servers.$server -Port $port #Windows 2012 R
	#(new-object Net.Sockets.TcpClient).Connect($servers.$server, $port) | Out-File "test-report.txt"
	$client = New-Object Net.Sockets.TcpClient
    try {
        $client.Connect($servers.$server, $port)
        #"Telnet Port: $server $port allowed." | Out-File "test-report.txt" -Append
    } catch {        
		"Telnet Port: $server $port refused." | Out-File "test-report.txt" -Append
    } finally {
        $client.Dispose()
    }	
}
