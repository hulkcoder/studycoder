$iis_features = ['Web-WebServer','Web-Mgmt-Tools','Web-Asp-Net45']

iis_feature { $iis_features:
  ensure => 'present',
}

dsc_xwebsite {'Start DefaultSite':
	dsc_ensure       => 'present',
    dsc_name         => 'Default Web Site',
    dsc_state        => 'Started',
    dsc_physicalpath => 'C:\\inetpub\\wwwroot',
}

file { 'C:\inetpub\complete_vdir':
	ensure => 'directory'
}

acl { 'C:\inetpub\complete_vdir':
  permissions => [
    {'identity' => 'IIS_IUSRS', 'rights' => ['read', 'execute']},
  ],
}

iis_virtual_directory { 'vdir':
	ensure       => 'present',
	sitename     => 'Default Web Site',
	physicalpath => 'C:\inetpub\complete_vdir',
	require      => File['C:\inetpub\complete_vdir'],
}


file { 'C:\inetpub\complete_webapp':
	ensure => 'directory'
}

acl { 'C:\inetpub\complete_webapp':
  permissions => [
    {'identity' => 'IIS_IUSRS', 'rights' => ['read', 'execute']},
  ],
}

iis_application { 'myapp':
	ensure             => 'absent',
	sitename           => 'Default Web Site',
	physicalpath       => 'C:\inetpub\complete_webapp',
	authenticationinfo => {
		'basic'     => true,
		'anonymous' => false,
	},
}
