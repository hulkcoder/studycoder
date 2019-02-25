$config = [xml] (get-content  "ats.xml")
$o = $config.ApplicationConfig.key | Where-Object {$_.name -eq "DatabaseConnection"}
[string]$os = $o.value
if ($os -ne "") {
    Write-Host "DatabaseConnection:$os"
    $o.value = "Server=localhost;Database=xadmdb;Trusted_Connection=yes."
}
$config.save("ats.xml")
