$token = [System.Security.Principal.WindowsIdentity]::GetCurrent() 
ForEach($group in $token.Groups){
    $group.Translate([System.Security.Principal.NTAccount])
}
