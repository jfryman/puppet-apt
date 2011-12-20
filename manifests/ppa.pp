define apt::ppa {
  include apt

  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin',
  }

  $created_file = expand_ppa_line($name, $::lsbdistcodename)

  exec { "apt-add-repositories ${name}":
    command => "add-apt-repository ${name}",
    creates => "${created_file}",
    require => Class['apt::package'],
    notify  => Exec['apt-get update'],
  }
}
