$atsfile = [xml](Get-Content "content.xml")
$atsfile.ApplicationConfig.key | Where-Object {$_.name -eq "abc"}

$servers = @("aserver", "bserver", "cserver","dserver","eserver")
$servers |foreach {	
	Write-Host "Hostname:$_"
	$dmsfile = [xml](Get-Content "\\$_\x$\config\web\ms.xml")
	$o = $dmsfile.ApplicationConfig.key | Where-Object {$_.name -eq "abc"}	 
	[string]$os = $o.value
	if ($os -ne "") {
		Write-Host "abc:$os"
	}
	$o = $dmsfile.ApplicationConfig.key | Where-Object {$_.name -eq "def"}
	[string]$os = $o.value
	if ($os -ne "") {
		Write-Host "def:$os"
	}
}
