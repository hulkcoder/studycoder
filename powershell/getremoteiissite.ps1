$Username = 'username'
$Password = 'password'
$pass = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object System.Management.Automation.PSCredential -ArgumentList $Username,$pass
$servers = @("Server1","Server2","Server3")
$servers |foreach {	
	Write-Host "Hostname:$_"
    Invoke-Command  -ComputerName $_ -Credential $Cred -ScriptBlock {Import-Module WebAdministration; Get-ChildItem -path "IIS:\Sites" | Format-Table}
    #Invoke-Command  -ComputerName $_ -Credential $Cred -ScriptBlock {Hostname} 
}
