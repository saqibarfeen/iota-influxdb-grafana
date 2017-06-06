grafana_datasource { 'lma':
  grafana_url       => 'http://localhost:3000',
  grafana_user      => 'admin',
  grafana_password  => 'admin',
  type              => 'influxdb',
  url               => 'http://localhost:8086',
  user              => 'admin',
  password          => 'admin',
  database          => 'lma',
  access_mode       => 'proxy',
  is_default        => true,
}
class {'lma_monitoring_analytics::grafana_dashboards':
  admin_username       => 'admin',
  admin_password       => 'admin',
  protocol             => 'http',
  host                 => '172.31.1.58',
  port                 => '3000', 
  import_elasticsearch =>  false ,
  import_influxdb      =>  false ,
 require              => Grafana_datasource['lma'],
}
