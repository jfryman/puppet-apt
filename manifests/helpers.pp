class apt::helpers {
  Exec {
    path => '/bin:/usr/bin:/sbin:/usr/sbin',
  }

  exec { 'apt-get update': 
    command     => 'apt-get update',
    refreshonly => 'true',
  }
}
