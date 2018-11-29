$PropObj=Get-ItemProperty -Path "HKLM:SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" -name "Release"
Write-Host "Release Version DWORD=" $PropObj."Release"
$releaseversion = switch ( $PropObj."Release" )
{
	378389 { '.NET Framework 4.5' }
	378675 { '.NET Framework 4.5.1 installed with Windows 8.1' }
	378758 { '.NET Framework 4.5.1 installed on Windows 8, Windows 7 SP1, or Windows Vista SP2' }
	379893 { '.NET Framework 4.5.2' }
	393295 { '.NET Framework 4.6 installed with Windows 10' }
	393297 { '.NET Framework 4.6 installed on all other Windows OS versions' }
	394254 { '.NET Framework 4.6.1 installed on Windows 10' }
	394271 { '.NET Framework 4.6.1 installed on all other Windows OS versions' }
	394802 { '.NET Framework 4.6.2 installed on Windows 10 Anniversary Update' }
	394806 { '.NET Framework 4.6.2 installed on all other Windows OS versions' }
	460798 { '.NET Framework 4.7 installed on Windows 10 Creators Update' }
	460805 { '.NET Framework 4.7 installed on all other Windows OS versions' }
	461308 { '.NET Framework 4.7.1 installed on Windows 10 Fall Creators Update' }
	461310 { '.NET Framework 4.7.1 installed on all other Windows OS versions' }
	461808 { '.NET Framework 4.7.2 installed on Windows 10 April 2018 Update' }        
    461814 { '.NET Framework 4.7.2 installed on all other Windows OS versions' }
    default { 'No .NET Framework' }
}
Write-Host "Release Version=" $releaseversion
$PropObj=Get-ItemProperty -Path "HKLM:SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" -name "InstallPath"
Write-Host "InstallPath=" $PropObj."InstallPath"
#$MSBuildObj=Get-ItemProperty "$($PropObj.InstallPath)\MSBuild.exe" -name "Length"
#$MSBuildObj=(Get-Item "$($PropObj.InstallPath)\MSBuild.exe")
#'dir' is an alias for Get-ChildItem which will return back a System.IO.FileInfo class when you're calling it from the filesystem which has VersionInfo as a property.
$MSBuildObj=(dir "$($PropObj.InstallPath)\MSBuild.exe").VersionInfo
Write-Host "MSBuild.exe Product Version=" $MSBuildObj.ProductVersion
