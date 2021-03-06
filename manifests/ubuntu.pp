define cobbler::ubuntu($arch = "x86_64") { 
    exec { "cobbler-import-$name":
        command => "if cobbler profile list | grep ${name}-${arch}; then cobbler-ubuntu-import -u ${name}-${arch}; else cobbler-ubuntu-import ${name}-${arch}; fi",
        provider => shell,
        path => "/usr/bin:/bin",
        require => Package[cobbler],
        before => Exec["restart-cobbler"]
    }
}
