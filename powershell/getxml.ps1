$atsfile = [xml](Get-Content "content.xml")
$atsfile.ApplicationConfig.key | Where-Object {$_.name -eq "abc"}
