$p = ConvertTo-SecureString -String "pwd" -AsPlainText -Force
$c = New-Object System.Management.Automation.PSCredential -ArgumentList "domain\username", $p
$x = Join-Path -Path "D:\\app1\\config\\" -ChildPath $env:ConfigFile
Write-Host $env:Host
Write-Host $x
Invoke-Command -ComputerName $env:Host -Credential $c -ScriptBlock { param($x) Get-Content $x } -ArgumentList $x
