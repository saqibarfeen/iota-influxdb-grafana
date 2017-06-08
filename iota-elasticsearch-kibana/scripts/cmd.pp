package{'daemonize':
ensure => installed,
}
package{'git':
ensure => installed ,
}
exec{'script1':
#cwd => '/root' ,
command => "/bin/bash /root/workspace/script1.sh" ,
#notify => "Executing script1 .." ,
require => Package['daemonize' ,'git'] ,
}

exec{'script2':
#cwd => '/root' ,
command => "/bin/bash /root/workspace/script2.sh" ,
#notify => "Executing script 2..." ,
require =>  Exec["script1"],
}



exec{'mirantis-lma_collector':
command => "/usr/bin/puppet module install /tmp/lma_collector/mirantis-lma_collector-1.0.0.tar.gz",
require => Exec["script1","script2"] ,
}
exec{'mirantis-heka-lma':
command => "/usr/bin/puppet module install /tmp/lma_collector/mirantis-heka-1.0.0.tar.gz",
require => Exec["script1","script2"] ,
}

exec{'mirantis_fuel_lma':
command => "/usr/bin/puppet module install /tmp/lma_collector/mirantis-fuel_lma_collector-1.0.0.tar.gz",
require => Exec["script1","script2"] ,
}
