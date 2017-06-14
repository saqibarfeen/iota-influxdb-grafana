notice('fuel-plugin-elasticsearch-kibana: elasticsearch.pp')


hiera_custom_source { "plugins/elasticsearch_kibana":
    ensure => present ,
}


# Java
$java = $::operatingsystem ? {
  CentOS => 'java-1.8.0-openjdk-headless',
  Ubuntu => 'openjdk-7-jre-headless'
}

# Ensure that java is installed
package { $java:
  ensure => installed,
}

class { 'lma_logging_analytics::elasticsearch':
  listen_address       => hiera('lma::elasticsearch::listen_address'),
  node_name            => hiera('lma::elasticsearch::node_name'),
  nodes                => hiera('lma::elasticsearch::nodes'),
  data_dir             => hiera('lma::elasticsearch::data_dir'),
  instance_name        => hiera('lma::elasticsearch::instance_name'),
  heap_size            => hiera('lma::elasticsearch::jvm_size'),
  cluster_name         => hiera('lma::elasticsearch::cluster_name'),
  logs_dir             => hiera('lma::elasticsearch::logs_dir'),
  minimum_master_nodes => hiera('lma::elasticsearch::minimum_master_nodes'),
  recover_after_time   => hiera('lma::elasticsearch::recover_after_time'),
  recover_after_nodes  => hiera('lma::elasticsearch::recover_after_nodes'),
# The Telemetry plugin creates values for 'script_inline' and 'script_indexed' in hiera if enabled
# default value is 'sandbox';
# related documentation:
# https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-scripting.html#enable-dynamic-scripting
#  script_inline        => hiera('lma::elasticsearch::script_inline', 'sandbox'),
#  script_indexed       => hiera('lma::elasticsearch::script_indexed', 'sandbox'),
  version              => '5.4.0',
  require              => Package[$java],
}
