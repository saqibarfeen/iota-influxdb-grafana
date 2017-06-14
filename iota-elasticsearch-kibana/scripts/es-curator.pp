notice('elasticsearch curator i.e delete indices automacally')
$host_address='10.20.30.30'

package { 'python-elasticsearch':
 ensure => 'installed',
}


# The curator is installed on all the nodes but by configuration, it will only
# be executed on the ES cluster master node
class { 'lma_logging_analytics::curator':
  host             => $host_address, 
  port             => '9200',
  retention_period => '30',
  prefixes         => ['log', 'notification'],
#  package_version  => '4.0.6',
  require          => Package['python-elasticsearch'],
}



