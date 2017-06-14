notice('fuel-plugin-elasticsearch-kibana: elasticsearch.pp')

# Java
$java = $::operatingsystem ? {
  CentOS => 'java-1.8.0-openjdk-headless',
  Ubuntu => 'openjdk-7-jre-headless'
}

# Ensure that java is installed
package { 'java-1.8.0-openjdk-headless':
  ensure => installed,
}

