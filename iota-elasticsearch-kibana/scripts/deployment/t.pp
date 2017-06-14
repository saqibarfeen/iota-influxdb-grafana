
firewall {'020 ssh':
  port   => 22,
  proto  => 'tcp',
  action => 'accept',
}
